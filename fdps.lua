local FDPS = ...

local name = 'FDPS'
local macroName = 'FDPSMACRO'

local function setMacro(arg)
    macroIndex = GetMacroIndexByName(macroName)
    EditMacro(macroIndex, nil, nil, '#showtooltip\n' .. arg.cmd)
    --self.SetAttribute('type', 'macro')
    --self.SetAttribute('macro', macroName)
end

local function castShred()
    setMacro{cmd = '/Cast Shred'}
end

local function castRake()
    setMacro{cmd = '/Cast Rake'}
end

local function castSavageRoar()
    setMacro{cmd = '/Cast Savage Roar'}
end

local function generateComboPoint(arg)
    _, _, _, _, _, _, rake, caster, _ = UnitDebuff("target", "Rake Debuff")
    if rake ~= nil then
        rake = rake - arg.currentTime
        if rake < 4.5 then
            castRake()
        else
            castShred()
        end
        print('|cffff0000' .. FDPS .. ':|r rake = ', rake, ' Sec')
    else
        castRake()
    end

end

local function checkComboPoints()
    return GetComboPoints("player", "target")
end

local function checkSavageRoar(arg)
    local _, _, _, _, _, _, savageRoar, _, _ = UnitAura("player", "Savage Roar")
    if savageRoar ~= nil then
        savageRoar = savageRoar - arg.currentTime
        print('|cffff0000' .. FDPS .. ':|r savageRoar = ', savageRoar, ' Sec')
    else
        local comboPoints = checkComboPoints()
        print('|cffff0000' .. FDPS .. ':|r combopoints = ', comboPoints)
        if comboPoints > 0 then
            print('|cffff0000' .. FDPS .. ':|r before savageroar')
            castSavageRoar()
        else
            generateComboPoint{currentTime = arg.currentTime}
        end
    end
end

local function mainRotation(self)
    local currentTime = GetTime()
    local comboPoints = GetComboPoints("player", "target")
    local energy = UnitPower("player", 3)


    checkSavageRoar { self = self, currentTime = currentTime }

    print('|cffff0000' .. FDPS .. ':|r Combopoints = ', comboPoints, ', Energy = ', energy)
end

local button = CreateFrame('Button', name, nil, 'SecureActionButtonTemplate,SecureHandlerBaseTemplate')
button:SetAttribute('type', 'macro')
button:SetAttribute('macro', macroName)
button:SetScript("PostClick", mainRotation)

-- local frame = CreateFrame("Frame", "TestFrame", UIParent)
local frame = CreateFrame('Button', "TestFrame", UIParent,'SecureActionButtonTemplate,SecureHandlerBaseTemplate')
local background = frame:CreateTexture("TestFrameBackground", "BACKGROUND")
background:SetTexture(1, 1, 1, 0.25)
background:SetAllPoints()

-- Set the top left corner 5px to the right and 15px above UIParent's top left corner
frame:SetPoint("TOPLEFT", 5, 15)

-- Set the bottom edge to be 10px below WorldFrame's center
frame:SetPoint("BOTTOM", WorldFrame, "CENTER", 0, -10)

-- Set the right edge to be 20px to the left of WorldFrame's right edge
frame:SetPoint("RIGHT", WorldFrame, -20, 0)

frame:SetAttribute('type', 'macro')
frame:SetAttribute('macro',macroName)