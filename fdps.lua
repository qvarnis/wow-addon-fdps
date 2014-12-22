local FDPS = ...

local name = 'FDPS'
local macroName = 'FDPSMACRO'
local function UpdateIcon(self)
    local comboPoints = GetComboPoints("player", "target")
    print('|cffff0000' .. FDPS .. ':|r Combopoints = ', comboPoints)
    macroIndex = GetMacroIndexByName(macroName)
    EditMacro(macroIndex, nil, nil, '#showtooltip\n/say buhu ')
    self.SetAttribute('type', 'macro')
    self.SetAttribute('macro',macroName)
end

local button = CreateFrame('Button', name, nil, 'SecureActionButtonTemplate,SecureHandlerBaseTemplate')
button:SetAttribute('type', 'macro')
button:SetAttribute('macro',macroName)
button:SetScript("PostClick",UpdateIcon)

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