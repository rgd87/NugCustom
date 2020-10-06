local addonName, addon = ...


local isClassic = select(4,GetBuildInfo()) <= 19999
if isClassic then return end

local macroTable = {}
addon.macroTable = macroTable

local function AddMacro(class, name, icon, body)
    local tbl = macroTable[class]
    if not tbl then
        macroTable[class] = {}
        tbl = macroTable[class]
    end
    if body then
        tbl[name] = { name, icon, body }
    end
end
addon.AddMacro = AddMacro


local templateUseTrinketTOP = "/use 13\n"
local templateUseTrinketBOTTOM = "/use 14\n"
local templateMouseoverCQS = [[
/cqs
/cast [@mouseover,help][help][@player] %s
]]
local templateCQS = [[
/cqs
/cast %s
]]
local templateStartAttack = [[
/startattack
/cast %s
]]
local templateMouseover = [[
/cast [@mouseover,help][help][@player] %s
]]
local templateMOTarget = [[
/cast [@mouseovertarget,exists,harm][@target,exists,harm][@targettarget,harm] %s
]]
local templateAtPlayer = [[
/cast [@player] %s
]]
local function MacroTemplate(template, spellID, ...)
    local spellName = GetSpellInfo(spellID)
    if not spellName then return print("[NugCustom] Spell",spellID,"does not exist") end
    local macro = string.format("#showtooltip %s\n", spellName)
    local numArgs = select("#", ...)
    for i=1, numArgs do
        local mixin = select(i, ...)
        macro = macro..mixin
    end
    macro = macro..string.format(template, spellName)
    return macro
end

local function CQSSpell(spellID, ...)
    return MacroTemplate(templateCQS, spellID, ...)
end
local function MouseoverCQSSpell(spellID, ...)
    return MacroTemplate(templateMouseoverCQS, spellID, ...)
end
local function MouseoverSpell(spellID, ...)
    return MacroTemplate(templateMouseover, spellID, ...)
end
local function TargetOfTargetMouseoverSpell(spellID, ...)
    return MacroTemplate(templateMOTarget, spellID, ...)
end
local function StartAttackSpell(spellID, ...)
    return MacroTemplate(templateStartAttack, spellID, ...)
end


function EnsureMacros()
    local _, class = UnitClass("player")
    local tabs = { "GENERAL", class }

    for i, tab in ipairs(tabs) do
        local perCharacter = tab ~= "GENERAL"
        local tbl = macroTable[tab]
        for name,macroData in pairs(tbl) do
            local _, icon, rawBody = unpack(macroData)
            local localizedBody = string.gsub(rawBody, "spell:(%d+)", function(c)
                local spellName = GetSpellInfo(tonumber(c))
                if not spellName then print("[NugCustom] Spell",c,"does not exist") end
                return spellName
            end)

            local currentIndex = GetMacroIndexByName(name)
            if currentIndex == 0 then
                currentIndex = CreateMacro(name, icon, localizedBody, perCharacter)
                if not currentIndex or currentIndex == 0 then return end
                print("Created", name)
            else
                EditMacro(currentIndex, nil, icon, localizedBody)
                print("Updated", name)
            end
        end
    end
end


function DumpAllMacros()
    for id=121,138,1 do
        local name, icon, body, isLocal = GetMacroInfo(id)
        local _, class = UnitClass("player")
        print(string.format('AddMacro("%s", "%s", %d,\n[[\n%s\n]])', class, name,icon,body))
    end
end

function GetMouseOverSpellID()
    local slot, slotType = SpellBook_GetSpellBookSlot(GetMouseFocus());
    local slotType, spellID = GetSpellBookItemInfo(slot, SpellBookFrame.bookType);
    print(spellID, GetSpellInfo(spellID))
end

local questionMark = "INV_MISC_QUESTIONMARK" -- 134400

local _, playerClass = UnitClass("player")

AddMacro("GENERAL", "AurasSelf", 136094, "/nrun listauras player")
AddMacro("GENERAL", "AurasTarget", 136225, "/nrun listauras target")
AddMacro("GENERAL", "deleter", 136133, "/script DeleteCursorItem()")



if playerClass == "MONK" then

AddMacro("MONK", "detox", questionMark, MouseoverCQSSpell(115450))
AddMacro("MONK", "envm", questionMark, MouseoverSpell(124682))
AddMacro("MONK", "expel", questionMark, MouseoverSpell(115072))
AddMacro("MONK", "lifecocoon", questionMark, MouseoverCQSSpell(116849))
AddMacro("MONK", "sm", questionMark, MouseoverSpell(115175))
AddMacro("MONK", "surg", questionMark, MouseoverSpell(227344))
AddMacro("MONK", "uplift", questionMark, MouseoverSpell(116670))
AddMacro("MONK", "molust", questionMark, MouseoverSpell(116841))

AddMacro("MONK", "oxstatue", 459026,
[[
#show spell:115315
/click TotemFrameTotem1 RightButton
]])

AddMacro("MONK", "oxtaunt", 607852,
[[
#show Вызов
/target Статуя Черного Быка
/cast Вызов
/targetlasttarget
]])

AddMacro("MONK", "palmatk", questionMark, StartAttackSpell(100780))
AddMacro("MONK", "renm", questionMark, MouseoverSpell(115151, templateUseTrinketTOP))

AddMacro("MONK", "rop", questionMark,
[[
#showtooltip
/cast [@player] spell:116844
]])

AddMacro("MONK", "slflust", questionMark, MacroTemplate(templateAtPlayer, 116841))
AddMacro("MONK", "TrinRSK", questionMark, StartAttackSpell(107428, templateUseTrinketBOTTOM, templateUseTrinketTOP))

AddMacro("MONK", "xuen", questionMark,
[[
#showtooltip spell:123904
/cast [nopet] spell:123904
/petattack [pet]
]])

end

if playerClass == "ROGUE" then

AddMacro("ROGUE", "cancelflurry", 132340,
[[
/cancelaura spell:13877
]])

AddMacro("ROGUE", "MU", questionMark, StartAttackSpell(1329, templateUseTrinketBOTTOM, templateUseTrinketTOP))
AddMacro("ROGUE", "Pickpocket", questionMark,
[[
/cleartarget
/targetenemy
/stopmacro [noexists]
/cast spell:921
]])

AddMacro("ROGUE", "SS", questionMark, StartAttackSpell(193315, templateUseTrinketBOTTOM, templateUseTrinketTOP))
AddMacro("ROGUE", "stealth", 132299,
[[
#showtooltip
#show spell:1784
/dismount
/cast !spell:1784;
/script DismissCompanion("CRITTER")
]])

AddMacro("ROGUE", "trix", questionMark,
[[
/cast [target=mouseover] spell:57934
]])

AddMacro("ROGUE", "unstealth", 136116,
[[
/cast [stealth] spell:1784
]])
end

if playerClass == "WARRIOR" then

AddMacro("WARRIOR", "MS-Slam", questionMark, StartAttackSpell(12294, templateUseTrinketBOTTOM, templateUseTrinketTOP))
AddMacro("WARRIOR", "BT", questionMark, StartAttackSpell(2388, templateUseTrinketBOTTOM, templateUseTrinketTOP1))
AddMacro("WARRIOR", "raging", questionMark, StartAttackSpell(85288))
AddMacro("WARRIOR", "revenge", questionMark, StartAttackSpell(6572))
AddMacro("WARRIOR", "ShieldSlam", questionMark, StartAttackSpell(23922))
AddMacro("WARRIOR", "slamTaunt", questionMark, StartAttackSpell(1464))
AddMacro("WARRIOR", "dvst", questionMark, StartAttackSpell(20243))

AddMacro("WARRIOR", "inter", questionMark,
[[
#show spell:198304
/cast [help] spell:198304; [target=targettarget, help] spell:198304
]])

end

if playerClass == "PRIEST" then

AddMacro("PRIEST", "bind", questionMark, MouseoverSpell(32546))
AddMacro("PRIEST", "coh", questionMark, MouseoverSpell(204883))
AddMacro("PRIEST", "Fiend", questionMark,
[[
#showtooltip spell:34433
/petattack [pet]
/cast [nopet] spell:34433
]])
AddMacro("PRIEST", "flash", questionMark, MouseoverSpell(2061))
AddMacro("PRIEST", "guardian", questionMark, MouseoverCQSSpell(47788))
AddMacro("PRIEST", "heal", questionMark, MouseoverSpell(2060))
AddMacro("PRIEST", "lifegr", questionMark, MouseoverCQSSpell(73325))
AddMacro("PRIEST", "mend", questionMark, MouseoverSpell(33076))
AddMacro("PRIEST", "moDispel", questionMark, MouseoverCQSSpell(527))
AddMacro("PRIEST", "mopws", questionMark, MouseoverSpell(17))
AddMacro("PRIEST", "penance", questionMark, MouseoverSpell(47540))
AddMacro("PRIEST", "poh", questionMark, MouseoverSpell(596))
AddMacro("PRIEST", "psup", questionMark, MouseoverCQSSpell(33206))
AddMacro("PRIEST", "renew", questionMark, MouseoverSpell(139))
AddMacro("PRIEST", "selfpws", questionMark,
[[
#showtooltip
/cast [@player] spell:17
]])
AddMacro("PRIEST", "serenity", questionMark, MouseoverCQSSpell(2050))
AddMacro("PRIEST", "sila", questionMark, MouseoverCQSSpell(204263))

AddMacro("GENERAL", "cleans", questionMark, MouseoverSpell(213634)) -- Purify Disease
AddMacro("GENERAL", "Siyanie", questionMark, MouseoverSpell(194509)) -- Radiance
AddMacro("GENERAL", "tot_hf", questionMark, TargetOfTargetMouseoverSpell(14914))
AddMacro("GENERAL", "tot_smite", questionMark, TargetOfTargetMouseoverSpell(585))
AddMacro("GENERAL", "tot_penance", "Spell_Arcane_Invocation", TargetOfTargetMouseoverSpell(47540))


end


if playerClass == "DRUID" then

AddMacro("DRUID", "bearform", questionMark,
[[
#showtooltip spell:5487
/cast [noform:1] spell:5487
/cast [form:1] spell:22842
]])

AddMacro("DRUID", "cancelform", 136116,
[[
/cancelform
]])

AddMacro("DRUID", "decurse", questionMark, MouseoverCQSSpell(2782))
AddMacro("DRUID", "dispel", questionMark, MouseoverCQSSpell(88423))
AddMacro("DRUID", "ironbark", questionMark, MouseoverCQSSpell(102342))
AddMacro("DRUID", "lblom", questionMark, MouseoverSpell(33763))
AddMacro("DRUID", "swiftmend", questionMark, MouseoverCQSSpell(18562))
AddMacro("DRUID", "wgrowth", questionMark, MouseoverSpell(48438))
AddMacro("DRUID", "regrowth", questionMark, MouseoverSpell(8936))
AddMacro("DRUID", "Rebirth", questionMark, MouseoverSpell(20484))
AddMacro("DRUID", "Rej", questionMark, MouseoverSpell(774))
AddMacro("DRUID", "shield", questionMark, MouseoverSpell(102351))

AddMacro("DRUID", "stealth", 132299,
[[
#showtooltip
#show spell:5215
/dismount
/cast [noform:2] !spell:768
/cast [modifier:shift] spell:5215
/cast [form:2, nostealth] spell:5215
]])
--5215 - prowl
--768 - cat form

AddMacro("DRUID", "mangle", questionMark,
[[
/dismount [mounted]
/cast Походный облик
]])

end

if playerClass == "PALADIN" then
AddMacro("PALADIN", "beac", questionMark, MouseoverSpell(53563))
AddMacro("PALADIN", "bestow", questionMark, MouseoverSpell(223306))
AddMacro("PALADIN", "bop", questionMark, MouseoverSpell(1022))
AddMacro("PALADIN", "Cleanse", questionMark, MouseoverSpell(4987))
AddMacro("PALADIN", "CnRet", questionMark, MouseoverSpell(213644))
AddMacro("PALADIN", "FoL", questionMark, MouseoverSpell(19750))
AddMacro("PALADIN", "glory", questionMark, MouseoverSpell(85673))
AddMacro("PALADIN", "HL", questionMark, MouseoverSpell(82326))
AddMacro("PALADIN", "prism", questionMark, MouseoverSpell(114165))
AddMacro("PALADIN", "sacrifice", questionMark, MouseoverSpell(6940))
AddMacro("PALADIN", "sh", questionMark, MouseoverSpell(20473))
AddMacro("PALADIN", "martyr", questionMark, MouseoverSpell(183998))
AddMacro("PALADIN", "ofShock", 1373912, "#showtooltip\n/cast [@target,harm] spell:20473")
end

-- /dump string.match("/cast [@player][@mouse] Dead n Decay", "/cast %[.+%] (.+)")
if playerClass == "DEATHKNIGHT" then
AddMacro("DEATHKNIGHT", "bres", questionMark, MouseoverCQSSpell(61999))
AddMacro("DEATHKNIGHT", "dndself", questionMark, MacroTemplate(templateAtPlayer, 43265))
AddMacro("DEATHKNIGHT", "graspself", questionMark, MacroTemplate(templateAtPlayer, 108199))
end

if playerClass == "HUNTER" then
AddMacro("HUNTER", "misd", questionMark, "#showtooltip\n/cast [@mouseover] spell:34477")
end

if playerClass == "WARLOCK" then
AddMacro("WARLOCK", "SS", questionMark, MouseoverSpell(20707))
end

if playerClass == "SHAMAN" then
AddMacro("SHAMAN", "cleanse", questionMark, MouseoverCQSSpell(51886))
AddMacro("SHAMAN", "purify", questionMark, MouseoverCQSSpell(77130))
AddMacro("SHAMAN", "surge", questionMark, MouseoverSpell(8004))
AddMacro("SHAMAN", "splink", questionMark, MouseoverCQSSpell(98008))
AddMacro("SHAMAN", "cheal", questionMark, MouseoverSpell(1064))
AddMacro("SHAMAN", "hwave", questionMark, MouseoverSpell(77472))
AddMacro("SHAMAN", "riptide", questionMark, MouseoverSpell(61295))
AddMacro("SHAMAN", "unleash", questionMark, MouseoverSpell(73685))
AddMacro("SHAMAN", "eshield", questionMark, MouseoverSpell(974))
end