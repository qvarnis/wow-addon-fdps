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
