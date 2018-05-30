local addonName, addon = ...

local d87add = CreateFrame("Frame", "d87add")


local LSM = LibStub("LibSharedMedia-3.0")

LSM:Register("font", "Enigma", [[Interface\AddOns\NugCustom\Enigma__2.ttf]], 15)
LSM:Register("font", "ClearFont", [[Interface\AddOns\NugCustom\ClearFont.ttf]], 15)
LSM:Register("font", "ClearFontBold", [[Interface\AddOns\NugCustom\ClearFontBold.ttf]], 15)

_G.BINDING_NAME_D87ADD_CHANNELKEY1 = "Open /5 channel"
_G.BINDING_NAME_D87ADD_OBJECTIVE_TOGGLE = "Toggle Objective Tracker"
_G.BINDING_HEADER_D87ADD = addonName

-- local f = CreateFrame"Frame"
-- f:SetScript("OnEvent", function(self, event, ...)
--     return self[event](self, event, ...)
-- end)


--
-- local CreateCircleFrame = function()
--     local f = CreateFrame("Cooldown", "CircleFrame", UIParent)
--     f:SetHeight(37);
--     f:SetWidth(37);
--     f:SetSwipeTexture([[Interface\AddOns\NugComboBar\tex\SwipeCircle.tga]])
--     f:SetSwipeColor(1,0,0)
--     f:SetReverse(true)
--     f:SetPoint("CENTER", UIParent, "CENTER", -300, 0)
--     -- f:SetCooldownUNIX(GetTime(), 20)
--     f:SetCooldown(GetTime(), 20)
--
--     f:SetBackdrop{
--         bgFile = "Interface\\Addons\\Aptechka\\white", tile = true, tileSize = 0,
--         insets = {left = -2, right = -2, top = -2, bottom = -2},
--     }
--     f:SetBackdropColor(0, 0, 0, 0.1)
--
--     f:Show()
--     return f
-- end
--
-- local circle = CreateCircleFrame()


CHAT_FRAME_TAB_SELECTED_NOMOUSE_ALPHA = 0;
CHAT_FRAME_FADE_OUT_TIME = 0.5;

-- function OldChat()
--     CHAT_FRAME_TAB_NORMAL_NOMOUSE_ALPHA = 0;
--     DEFAULT_CHATFRAME_ALPHA = 0;
-- 	ChatFrame1EditBox.focusLeft:Hide();
--     ChatFrame1EditBox.focusLeft.Show = ChatFrame1EditBox.focusLeft.Hide
-- 	ChatFrame1EditBox.focusRight:Hide();
--     ChatFrame1EditBox.focusRight.Show = ChatFrame1EditBox.focusRight.Hide
-- 	ChatFrame1EditBox.focusMid:Hide();
--     ChatFrame1EditBox.focusMid.Show = ChatFrame1EditBox.focusMid.Hide
--     -- FriendsMicroButton:Hide()
--     ChatFrame1:SetClampedToScreen(false)
--     ChatFrame2:SetClampedToScreen(false)
--     ChatFrame3:SetClampedToScreen(false)
-- end

----------------
-- Timestamps
----------------
local hooks = {}
local timeFmt = "%H:%M:%S"

local function InsertTimeStamp(text, cf)
    if type(text) == "string" then
        local space = true
        local timeString = date(timeFmt)

        text = timeString .. "|c00000000|r" .. (space and " " or "") .. text
    end

    return text
end

local newAddMessage = function(frame, text, ...)
    text = text and InsertTimeStamp(text, frame)
    hooks[frame].AddMessage(frame, text, ...)
end

local function AddTimestamps(chatframe)
    if not hooks[chatframe] then
        hooks[chatframe] = {
            AddMessage = chatframe.AddMessage
        }
        chatframe.AddMessage = newAddMessage
    end
end

local function SetupTimestamps()
    SetCVar("showTimestamps", "none")
    InterfaceOptionsSocialPanelTimestamps.cvar = "none"

    local frames = { ChatFrame1 }
    for _, cf in ipairs(frames) do
        AddTimestamps(cf)
    end
end
---------------------

function addon:KuiProfileSwapper()
    local _,class = UnitClass("player")
    local specTracker = CreateFrame("Frame")
    specTracker:RegisterEvent("SPELLS_CHANGED")
    specTracker:SetScript("OnEvent", function(self, event)
        if not KuiNameplatesCore then
            self:UnregisterAllEvents()
            return
        end
        local kuiconfig = KuiNameplatesCore.config
        if not kuiconfig then return end
        local current_profile = _G[kuiconfig.csv_name].profile
        local spec = GetSpecialization()

        if class == "WARLOCK" then
            if current_profile ~= "dots" then kuiconfig:SetProfile("dots") end
        elseif class == "PRIEST" and spec == 3 then
            if current_profile ~= "dots" then kuiconfig:SetProfile("dots") end
        elseif class == "DRUID" and (spec == 2 or spec == 1) then
            if current_profile ~= "dots" then kuiconfig:SetProfile("dots") end
        else
            if current_profile ~= "default" then kuiconfig:SetProfile("default") end
        end
    end)
end


function addon:DoMain()
    -- SetCVar("CombatHealing", "1");
    -- SetCVar("violencelevel", 5)	-- [1]
	-- SetCVar("screenshotQuality", 12)	-- [2]
    -- SetCVar("screenshotFormat", "jpeg")	-- [3]
    -- SetCVar("nameplateMaxDistance", 70)
    -- SetCVar("WeatherDensity", 3)

    -- SetupTimestamps()
    addon:KuiProfileSwapper()

    C_Timer.After(3, function()
        ChatFrame1:SetUserPlaced(false);
        ChatFrame1:ClearAllPoints()
        ChatFrame1:SetWidth(436);
        ChatFrame1:SetHeight(408);
        ChatFrame1:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 5, 97)

        ChatFrame1.isInitialized = 1;
        FCF_SetWindowColor(ChatFrame1, 0,0,0);
        FCF_SetWindowAlpha(ChatFrame1, 0);
    end)

    -- local spells = {
    --     purple1 = { model = "spells\\seedofcorruption_state.mdx", scale = 1 },
    --     purple2 = { model = "spells\\gouge_precast_state_hand.mdx", scale = 3 }, -- good, warlock, rogue

    --     funnel1 = { model = "spells\\manafunnel_impact_chest.mdx", scale = 1.8 }, -- monk
    --     funnel2 = { model = "spells\\lifetap_state_chest.mdx", scale = 1.8 },
    --     funnel3 = { model = "spells\\soulfunnel_impact_chest.mdx", scale = 3 },
    --     funnel4 = { model = "spells\\healrag_state_chest.mdx", scale = 1.8 },

    --     green1 = { model = "spells\\nature_precast_chest.mdx", scale = 2.5 },
    --     spark1 = { model = "spells\\dispel_low_recursive.mdx", scale = 30 },
    --     spark2 = { model = "spells\\detectmagic_recursive.mdx", scale = 30 },
    --     fire1 = { model = "spells\\fire_blue_precast_uber_hand.mdx", scale = 5 }, --blue
    --     fire2 = { model = "spells\\fire_precast_uber_hand.mdx", scale = 5 }, --orange
    --     fire3 = { model = "spells\\fel_fire_precast_hand.mdx", scale = 5 }, --green

    --     electric1 = { model = "spells\\lightningboltivus_missile.mdx", scale = .3 }, --blue long
    --     electric2 = { model = "spells\\lightning_precast_low_hand.mdx", scale = 6 }, --blue
    --     electric3 = { model = "spells\\lightning_fel_precast_low_hand.mdx", scale = 6 }, --green
    --     electric4 = { model = "spells\\wrath_precast_hand.mdx", scale = 6 }, --green long

    --     spin1 = { model = "spells\\blessingoffreedom_state.mdx", scale = 1 }, --paladin

    --     shadow1 = { model = "spells\\shadow_precast_uber_hand.mdx", scale = 4 }, -- priest?

    --     rejuv = { model = "spells\\rejuvenation_impact_base.mdx", scale = 2 }, --bad

    --     --also bad
    --     swirl1 = { model = "spells\\banish_chest.mdx", scale = 1 },
    --     swirl2 = { model = "spells\\banish_chest_blue.mdx", scale = 1 },
    --     swirl3 = { model = "spells\\banish_chest_purple.mdx", scale = 1 },
    --     swirl4 = { model = "spells\\banish_chest_dark.mdx", scale = 1 },
    --     swirl5 = { model = "spells\\banish_chest_white.mdx", scale = 1 },
    --     swirl6 = { model = "spells\\banish_chest_yellow.mdx", scale = 1 },
    -- }

    --[[new effects

    Arcane_fire_weapon_effect.m2
    Arcanepower_state_chest.m2
    Blackmagic_precast_base
    Blink_impact_chest
    Bloodboil_impact_chest
    ]]
    -- local f = CreateFrame("Frame", "ScouterText", UIParent)
    -- local width = 100
    -- local height = 30
    -- f:SetWidth(width)
    -- f:SetHeight(height)

    -- local font = [[Interface\AddOns\NugEnergy\Emblem.ttf]]
    -- local fontSize = 25
    -- local text = f:CreateFontString(nil, "OVERLAY")
    -- text:SetFont(font,fontSize, textoutline and "OUTLINE")
    --     text:SetPoint("TOPLEFT",f,"TOPLEFT",0,0)
    --     text:SetPoint("BOTTOMRIGHT",f,"BOTTOMRIGHT",-10,0)
    --     text:SetJustifyH("RIGHT")
    -- text:SetTextColor(1,1,1)
    -- f.text = text

    -- f:SetPoint("CENTER", 200, -200)


    -- local scouter = LibStub("LibScouter")
    -- scouter.RegisterCallback(f, "POWER_LEVEL_CHANGED", function(event, plevel)
        -- f.text:SetText(plevel)
    -- end)






    local _, class = UnitClass("player")
    -- if class == "WARLOCK" 

    
        -- local f = CreateFrame("Model", "FnB_Frame", UIParent)
        -- local f = CreateFrame("PlayerModel", "FnB_Frame", UIParent)
        -- f:SetWidth(500)
        -- f:SetHeight(500)

        -- -- f:SetModel("SPELLS/Monk_ForceSpere_Orb.m2")
        -- -- f:SetDisplayInfo(62059)
        -- -- f:SetCamera(0)
        -- -- , true, 0.018, 1.4, 0, 1.4
        -- -- f:SetModelScale(0.07)
        -- f:SetModelScale(1)


        -- f:SetPosition(0,0,0)

        -- f:SetAlpha(1)
        -- f:SetPoint("CENTER",50, 0)

        -- f:Show()

        -- f.Break = function(self)
        --     self:Hide()
        --     self:SetModelScale(1)
        --     self:SetPosition(0,0,0)
        -- end

        -- f.Fix = function(self)
        --     self:SetModel("spells\\gouge_precast_state_hand.m2")--"SPELLS/Assassinate_Impact.m2")
        --     self:SetModelScale(0.1)
        --     self:SetPosition(1.4,1.4,0)
        --     self:SetCamera(0)

        -- end

        -- f:RegisterUnitEvent("UNIT_AURA", "player")
        -- f:Hide()
        -- local fnb_name = GetSpellInfo(108683)
        -- f:SetScript("OnEvent", function(self)
        --     local name = UnitAura("player", fnb_name, nil, "HELPFUL")
        --     if name then
        --         self:Show()
        --     else
        --         self:Hide()
        --     end
        -- end)
    -- end
    if class == "MONK" then -- healing spheres display

        -- local unsheather = CreateFrame("Frame")
        -- local ticker = C_Timer.NewTicker(10, function()
            -- if GetSheathState() ~= 2 then
            --     ToggleSheath()
            -- end
        -- end)





        local f = CreateFrame("Model", "ChiSphere_Frame", UIParent)
        f:SetWidth(400)
        f:SetHeight(400)

        -- /script ChiSphere_Frame:Show(); ChiSphere_Frame.blink:Play()
        f:SetModel("SPELLS/Monk_ForceSpere_Orb.m2")
        f:SetModelScale(.05)
        f:SetPosition(0.16,0.16,0)

        f:SetAlpha(0.8)
        f:SetPoint("CENTER",100,-190)

        f:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
        f:SetAlpha(0)

        local ag = f:CreateAnimationGroup()
        local a1 = ag:CreateAnimation("Alpha")
        a1:SetDuration(0.1)
        a1:SetOrder(1)
        a1:SetFromAlpha(0)
        a1:SetToAlpha(1)
        local a2 = ag:CreateAnimation("Alpha")
        a2:SetDuration(3)
        a2:SetOrder(2)
        a2:SetFromAlpha(1)
        a2:SetToAlpha(0)

        ag.parent = f
        f.blink = ag

        ag:SetScript("OnFinished", function(self)
                self.parent:Hide()
            end)
        f:Hide()
        local fnb_name = GetSpellInfo(108683)
        local bit_band = bit.band
        local COMBATLOG_OBJECT_AFFILIATION_MINE = COMBATLOG_OBJECT_AFFILIATION_MINE
        f:SetScript("OnEvent", function( self, event, timestamp, eventType, hideCaster,
                srcGUID, srcName, srcFlags, srcFlags2,
                dstGUID, dstName, dstFlags, dstFlags2,
                spellID, spellName, spellSchool, auraType, amount)
            -- local name = UnitAura("player", fnb_name, nil, "HELPFUL")
            local isSrcPlayer = (bit_band(srcFlags, COMBATLOG_OBJECT_AFFILIATION_MINE) == COMBATLOG_OBJECT_AFFILIATION_MINE)
            if isSrcPlayer and eventType == "SPELL_CAST_SUCCESS" and spellID == 124506 or spellID == 124503 then
                if not self.blink:IsPlaying() then
                    -- self.blink:Stop()
                    self:Show()
                    self.blink:Play()
                end
            -- else
                -- self:Hide()
            end
        end)
    end
    -- local effect = { model = "spells\\healrag_state_chest.mdx", scale = 5.8 }
    -- f:SetLight( 1, 0, 0, 1, 0, 1, 0.69999, 0.69999, 0.69999, 1, 0.8, 0.8, 0.63999 );
    -- f:SetFacing(0)
    -- -- f:SetScale(3)

    -- local backdrop = {
        -- bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
        -- tile = true, tileSize = 0,
        -- insets = {left = 0, right = 0, top = 0, bottom = 0},
    -- }
    -- f:SetBackdrop(backdrop)
    -- f:SetBackdropColor(0, 0, 0, 0.7)

    -- local f = CreateFrame("Button", "DUP", UIParent, "OptionsListButtonTemplate")
    -- f:SetWidth(100)
    -- f:SetHeight(30)
    -- f:SetPoint("CENTER", 0,0)





    -- local f = CreateFrame("Frame", "LineFrame", UIParent)
    -- f:SetWidth(500)
    -- f:SetHeight(500)
    -- f:SetPoint("CENTER", 0,0)

    -- local line = f:CreateLine("MyLine","BACKGROUND", -2)
    -- line:SetTexture("Interface\\AddOns\\NugRunning\\white")
    -- -- line:SetTexture("_UI-Taxi-Line-horizontal")
    -- line:SetStartPoint("CENTER", UIParent, -100,0)
    -- line:SetEndPoint("CENTER", UIParent, 100,200)
    -- line:SetThickness(0.5)
    -- -- line:DrawLine()


    -- local LibCLH = LibStub("LibCLHealth-1.0")
    -- LibCLH.RegisterCallback(d87add, "COMBAT_LOG_HEALTH", function(event, unit, health)
    --     print(event, unit, health)
    -- end)

    d87add.dump = function(msg)
        UIParentLoadAddOn("Blizzard_DebugTools");
        DevTools_DumpCommand(msg);
    end

    -- AchievementMicroButton_Update = function() end -- fix for blizzard bug


    -- local f = CreateFrame("Frame",nil,UIParent)
    -- f:SetScript("OnEvent", function(self, event, ...)
    --     self[event](self, event, ...)
    -- end)
    -- f:RegisterEvent("UNIT_SPELLCAST_SENT")
    -- f.UNIT_SPELLCAST_SENT = function(self, event,
    --             unit, spell, rank, target, lineID)

    --     print(GetTime(), event, unit, spell, rank, target, lineID)
    -- end
    -- f:RegisterEvent("UNIT_SPELLCAST_START")

    -- f:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
    -- f.COMBAT_LOG_EVENT_UNFILTERED = function( self, event,
    --             timestamp, eventType, hideCaster,
    --             srcGUID, srcName, srcFlags, srcFlags2,
    --             dstGUID, dstName, dstFlags, dstFlags2,
    --             spellID, spellName, spellSchool, auraType, amount)


    --     if eventType == "SPELL_CAST_START" or eventType == "SPELL_CAST_SUCCESS" or eventType == "SPELL_CAST_FAILED" then
    --         print (GetTime(),eventType, spellName, srcGUID, dstGUID, auraType)
    --     end
    -- end


-- 
    -- if select(2,UnitClass("player")) == "WARLOCK" then
        -- SPM = CreateFrame("Button","SPM",UIParent,"SecureActionButtonTemplate")
        -- SPM:SetAttribute("type1","macro")
        -- SPM:SetAttribute("macrotext1","/cast [spec:1] Призыв стража скверны; [spec:2] Призыв охотника скверны")
--~         local Q_Macro = [[
--~ /cast [nopet,spec:2] Призыв беса [nopet,spec:1] Призыв охотника Скверны; [pet:бес] Бегство; [pet:охотник скверны] Запрет чар; [pet:страж скверны] Перехват; [pet:демон бездны] Жертвоприношение; [pet:суккуб] Соблазн
--~ ]]
--~
--~         local AltQ_Macro = [[
--~ /cast [nopet,spec:2] Призыв беса [nopet,spec:1] Призыв охотника Скверны; [pet:бес,target=mouseover,exists,nodead,help] Жгучая магия; [pet:бес,target=player] Жгучая магия; [pet:демон бездны] Муки; [pet:суккуб] Удар кнутом; [pet:охотник скверны] Пожирание магии
--~ ]]
--~
--~         local ShiftQ_Macro = [[
--~ /stopmacro [nopet:суккуб]
--~ /petfollow
--~ /cast Соблазн
--~ ]]
--~
--~         PetMacro = CreateFrame("Button","SupaMacro",UIParent,"SecureActionButtonTemplate")
--~         PetMacro:SetAttribute("*type1","macro")
--~         PetMacro:SetAttribute("*type2","macro")
--~         PetMacro:SetAttribute("*type3","macro")
--~         PetMacro:SetAttribute("macrotext1",Q_Macro)
--~         PetMacro:SetAttribute("macrotext2",AltQ_Macro)
--~         PetMacro:SetAttribute("macrotext3",ShiftQ_Macro)
    -- end
end

-- function ListEmotes()
--     local prev = 0
--     for k,v in pairs(_G) do
--         if type(v) == "string" then
--             local num, cmd = string.match(k,"EMOTE(%d+)_CMD(%d+)")
--             if num and tonumber(num) ~= prev and tonumber(cmd) == 2 then
--                 print(v)
--                 prev = tonumber(num)
--             end
--         end
--     end
-- end




function d87add.Clear()
    local t = {}
    for i=1,30 do
        table.insert(t, "\n")
    end
    print (table.concat(t))
end



-- local SpecMacros = CreateFrame("Frame")
-- SpecMacros:RegisterEvent("PLAYER_ENTERING_WORLD")
--
-- SpecMacros:SetScript("OnEvent", function(self)
--     if not InCombatLockdown() then
--         local numSpec = GetNumSpecializations()
--         -- print(numSpec)
--         for i=1, GetNumSpecializations() do
--             local macroname = "SpecMacro"..i
--             local index = GetMacroIndexByName(macroname)
--             if index == 0 then
--                 index = CreateMacro(macroname, "Interface\\Icons\\Spell_Shadow_AntiShadow", string.format("/script SetSpecialization(%d)", i), nil)
--                 if not index or index == 0 then return end
--             end
--             local gID, _, _, icon = GetSpecializationInfo(i)
--             print(GetSpecializationInfoByID(gID))
--             print(index, icon)
--             EditMacro(index, nil, icon, nil)
--         end
--     end
-- end)



d87add:RegisterEvent("PLAYER_LOGIN");
function d87add.PLAYER_LOGIN()
    addon:DoMain()
    addon:FixCVars()

    if IsAddOnLoaded("Blizzard_ObjectiveTracker") then
        ObjectiveTracker_Collapse()
    end

    if (IsAddOnLoaded("Dominos")) then
        MainMenuBarArtFrame:SetParent(UIParent)
        MainMenuBarArtFrame:SetFrameStrata("LOW")

        -- MainMenuBarRightEndCap:SetParent(MainMenuBarArtFrame)
        -- MainMenuBarLeftEndCap:SetParent(MainMenuBarArtFrame)

        MainMenuBarArtFrame:ClearAllPoints()
        MainMenuBarArtFrame:SetWidth(1024)
        MainMenuBarArtFrame:SetHeight(53)
        MainMenuBarArtFrame:SetPoint("BOTTOM",UIParent,"BOTTOM",0,0)


        MainMenuBarMaxLevelBar:SetParent(MainMenuBarArtFrame)
        MainMenuBarMaxLevelBar:SetPoint("TOP", MainMenuBarArtFrame, "TOP", 0,-11)
        MainMenuBarMaxLevelBar.SetPoint = function() end
        MainMenuBarMaxLevelBar.SetParent = function() end

        MainMenuExpBar:SetParent(MainMenuBarArtFrame)
        ReputationWatchBar:SetParent(MainMenuBarArtFrame)

    end

    -- /dump NugCustomScrollFrame:SetHorizontalScroll(50)


    -- MultiBarBottomLeft:SetParent(UIParent)
    -- MultiBarBottomRight:SetParent(UIParent)
    -- MainMenuBarVehicleLeaveButton:SetParent(UIParent)

    ------- Disable Legion Exp bar and artifact bar
    -- hooksecurefunc("MainMenuBar_UpdateExperienceBars", function()
    --     MainMenuExpBar:Hide();
    --     MainMenuExpBar.pauseUpdates = true;
    --     ExhaustionTick:Hide();

    --     ArtifactWatchBar:Hide();

    --     HonorWatchBar:Hide();

    --     ReputationWatchBar:Hide();

    --     MainMenuBarMaxLevelBar:Show(); --cap

    --     UIParent_ManageFramePositions();
    --     UpdateContainerFrameAnchors();
    -- end)

    
end


do
    local hour, minute = 3600, 60
    local format = string.format
    local ceil = math.ceil
    function addon.WeakAurasTextFormat(expTime, duration)
        -- if s >= hour then
            -- return "%dh", ceil(s / hour)
        -- else
        if duration == 0 then return "" end
        local now = GetTime()
        local s = expTime - now
        if s >= minute*2 then
            return format("%dm", ceil(s / minute))
        elseif s >= 5 then
            return format("%d", floor(s))
        else
            return format("|cffff8888%d|r", floor(s))
        end
        -- return "%ds", floor(s)
        -- return "%.1f", s
    end
end

function d87add.ADDON_LOADED(self,event,arg1)
    if arg1 ~= addonName then return end
    -- if GetLocale() == "ruRU" then DoGlobalStrings() end
    -- GetLocale = function() return "enUS" end
    -- HideHotkeys()


    -- FeedbackUISurveyFrameSurveysPanelAlertFrameButton1:ClearAllPoints()
    -- FeedbackUISurveyFrameSurveysPanelAlertFrameButton1:SetPoint("BOTTOM",0,-1000)

    -- SetCVar("chatStyle","classic")

    -- SLASH_CLEARCHAT1= "/clear"
    -- SLASH_CLEARCHAT2= "/clearchat"
    -- SlashCmdList["CLEARCHAT"] = d87add.Clear
end

-- function SetTextHook()
--     local methods = getmetatable(CreateFrame('Frame', nil, nil):CreateFontString(nil, "OVERLAY")).__index
--     hooksecurefunc(methods, 'SetText', function(self, text)
--         if self.deloced then return end
--         if not text then return end
--         for what, with in pairs(textChanges) do
--             text = string.gsub(text,what,with)
--         end
--         self.deloced = true
--         self:SetText(text)
--         self.deloced = false
--     end)
-- end
-- SetTextHook()

-- local blacklist = {
--     [ERR_NO_ATTACK_TARGET] = true,
--     [OUT_OF_ENERGY] = true,
--     [ERR_ABILITY_COOLDOWN] = true,
--     [SPELL_FAILED_NO_COMBO_POINTS] = true,
--     [SPELL_FAILED_SPELL_IN_PROGRESS] = true,
--     [ERR_SPELL_COOLDOWN] = true,
-- }
-- UIErrorsFrame:UnregisterEvent"UI_ERROR_MESSAGE"

-- function d87add.UI_ERROR_MESSAGE(self, event, error)
-- 	if(not blacklist[error]) then
-- 		UIErrorsFrame:AddMessage(error, 1, .1, .1)
-- 	end
-- end

-- function DynamicArrayTableBytes(entries)
--   return 36 + math.pow(2, math.ceil(math.log(entries) / math.log(2))) * 16
-- end

function dumpspell()
    local obj = GetMouseFocus();
	if (obj and obj ~= WorldFrame) then
        local slot = SpellBook_GetSpellBookSlot(obj)
        local _, id  = GetSpellBookItemInfo(slot,"spell")
        UIParentLoadAddOn("Blizzard_DebugTools");
        print("\n\n")
        DevTools_DumpCommand(string.format("GetSpellInfo(%d)",id));
    end
end


local jug = {
            45226, -- [1]
            [6] = 50991,
            [7] = 51544,
            [8] = 49907,
            [10] = 30970,
            [3] = 39613,
            [16] = 47500,
            [5] = 60323,
            [17] = 50794,
            [55] = 5193,
            [56] = 51216,
            [57] = 64884,
            [58] = 94217,
            [59] = 51909,
        }

-- local jug = { 33666, 33668, 33664, 33667, 33665, 33878, 33877  }
-- local jug = { 41048, 31001, 31003, 31004, 31005, 31006, 72848, 94079, 47296, 47319, 41252 }
-- local jug = { 103527, 103529, 103525, 103528, 103526, 103457, 103456}
-- local jug = { 16808, 86713, 46137, 51921, 84353, 63570, 69621 }
-- local jug = { 46172, 30154, 33484, 82423, 46874, 30151, 44018, 59542, 62450, 32451, 15947 }

local jug = { 113807, 113805, 113808, 113809, 113806, 113810, 113811, 113812 }

function GetItemLinkByID(id)
local sName, sLink, iRarity, iLevel, iMinLevel, sType, sSubType, iStackCount = GetItemInfo(id);
ChatFrame1:AddMessage(sLink .."     "..sName );
end

function printjug()
    for k,v in pairs(jug) do
        GetItemLinkByID(v)
    end
end


d87add:RegisterEvent("ADDON_LOADED");

d87add:SetScript("OnEvent", function(self, event, ...)
	return self[event](self, event, ...)
end)

-- function HideHotkeys()
--     local bars = {"ActionButton","MultiBarBottomLeftButton","MultiBarBottomRightButton","MultiBarLeftButton","MultiBarRightButton"}
--     for _,bar in ipairs(bars) do
--         for i = 1,12 do
--             local btn = getglobal(bar..i)
--             local name = getglobal(bar..i.."Name")
--             local hotkey = getglobal(bar..i.."HotKey")
--             local border = getglobal(bar..i.."Border")
--             name:Hide();  name.Show = function() end;
--             hotkey:Hide();  hotkey.Show = function() end;
--             border:Hide();  border.Show = function() end;   -- green item border

--             -- pushed state flash
--             -- btn:SetPushedTexture([[Interface\Cooldown\star4]])
--             -- btn:GetPushedTexture():SetBlendMode("ADD")
--             -- btn:GetPushedTexture():SetTexCoord(0.2,0.8,0.2,0.8)
--             -- btn:GetPushedTexture():SetVertexColor(0.5,0.5,1)
--         end
--     end
-- end


-- function CreateCustomOverlay(self)
--     local overlay_check
--     local check_interval = .3
--     local f = CreateFrame("Frame")
--     f:SetScript("OnEvent", function(self, event, ...)
--         return self[event](self, event, ...)
--     end)


--         local fnb = CreateFrame("Model", "FnB_Frame", UIParent)
--         fnb:SetWidth(500)
--         fnb:SetHeight(500)

--         fnb:SetModel("SPELLS/Assassinate_Impact.m2")
--         fnb:SetModelScale(.2)
--         fnb:SetPosition(0.16,0.16,0)

--         fnb:SetAlpha(0.8)
--         fnb:SetPoint("CENTER",50,-170)

--         fnb:Hide()

--     local _, class = UnitClass("player")
--     if class == "WARRIOR" then
--         local startTime, endTime = 0, 0.1
--         -- local min, max, spellID
--         local GetSpellCooldown = GetSpellCooldown
--         local UnitBuff = UnitBuff
--         local enrageSpellName = GetSpellInfo(12880)
--         local ragingBlowName = GetSpellInfo(131116)

--         overlay_check = function()
--             local now = GetTime()
--             local colcd = 0
--                 local start, duration = GetSpellCooldown(86346)
--                 if duration > 1.5 then
--                     colcd = (start+duration) - GetTime()
--                 end
--             local _, _, _, rbstacks = UnitBuff("player", ragingBlowName)
--             return 131116, (colcd > 3 and colcd < 14 and rbstacks == 2)
--         end
--     end

--     if not overlay_check then return end

--     local expired = 0
--     local state = {}
--     f:RegisterEvent("PLAYER_ENTERING_WORLD")
--     function f:PLAYER_ENTERING_WORLD()
--         table.wipe(state)
--     end

--     local active = NugRunning.active
--     local gettimer = NugRunning.gettimer
--     local playerGUID = UnitGUID("player")

--     f:SetScript("OnUpdate", function(self, time)
--         expired = expired + time
--         if expired < check_interval then return end
--         expired = 0

--         local spellID, status = overlay_check()
--         if spellID and status ~= state[spellID] then
--             state[spellID] = status

--             local timer = gettimer(active, 131116, playerGUID, "BUFF")
--             if timer then
--                     if status then
--                         fnb:Show()
--                     else
--                         fnb:Hide()
--                     end
--             end
--         end
--     end)


-- end

-- CreateCustomOverlay()




function GetScaleFactor()
    
    local screenResolution = ({GetScreenResolutions()})[GetCurrentResolution()]
    local screenWidth, screenHeight = strsplit("x", screenResolution)
    local scale = 768/screenHeight -- This is the scale factor that will scale textures to the native resolution that the client uses internally... Or so I believe

    return (1/scale)

end




--- Useful visual data
-- Probably good to call if user changes screen resolutions
-- @usage local uiScale, resolutionX, resolutionY = myAddOn:VisualData()
-- @usage UIParent:SetScale(uiScale)
-- @return uiScale Number. The corrected UI scale (768/resolutionY)
-- @return resolutionX Number. Your screen's X dimension. IE// 1920
-- @return resolutionY Number. Your screen's Y dimension. IE// 1080
local currResolution = _G.GetCurrentResolution
local getResolutions = _G.GetScreenResolutions
local function VisualData()
	local uiScale, resolutionX, resolutionY = 1, 800, 600
	local resolutionNow = resolutionNow or {}
	table.wipe(resolutionNow)
	resolutionNow = ({getResolutions()})[currResolution()]
	resolutionX, resolutionY = string.split("x", resolutionNow, 2)
	resolutionX, resolutionY = tonumber(resolutionX), tonumber(resolutionY)
	uiScale = 768/resolutionY
	return uiScale, resolutionX, resolutionY
end

--- Scales an element to pixel perfection
-- @param number The height, width, or scale you want adjusted
-- @usage myFrame:SetHeight(myAddOn:PixelPerfect(100))
-- @usage FontInstance:SetFont("fileName", myAddOn:PixelPerfect(12), "OUTLINE")
function d87add.PixelPerfect(number)
	local uiScale = VisualData()
	return uiScale * number
end



function addon:TestScrollFrameOnModels()
    local Redraw = function(self)
        if not self.model_path then return end
    
        self:SetModelScale(1)
        self:SetPosition(0,0,0)
    
        if type(self.model_path) == "number" then
            self:SetDisplayInfo(self.model_path)
        else
            self:SetModel(self.model_path)
        end
        self:SetModelScale(self.model_scale)
        self:SetPosition(self.ox, self.oy, self.oz)
    end
    
    local ResetTransformations = function(self)
        -- print(self:GetName(), "hiding", self:GetCameraDistance(), self:GetCameraPosition())
        self:SetModelScale(1)
        self:SetPosition(0,0,0)
    end
    
    local MakeModelRegion = function(self,w,h,model_path, x,y,z)
        local pmf = CreateFrame("PlayerModel", nil, self )
        pmf:SetSize(w,h)
    
        pmf.model_scale = 1
        pmf.ox = x
        pmf.oy = y
        pmf.oz = z
        pmf.model_path = model_path
    
        pmf:SetScript("OnHide", ResetTransformations)
        pmf:SetScript("OnShow", Redraw)
        pmf.Redraw = Redraw
        pmf.ResetTransformations = ResetTransformations
        pmf:Redraw()
    
        return pmf
    end
    -- local root = CreateFrame("Frame", "NugCustomTestRoot", UIParent)

    local sf = CreateFrame("ScrollFrame", "NugCustomScrollFrame", UIParent)

    local f = CreateFrame("Frame", "NugCustomTestFrame", sf)
    f:SetWidth(200)
    f:SetHeight(25)

    local t = f:CreateTexture(nil, "ARTWORK",0)
    t:SetTexture([[Interface\AddOns\NugRunning\statusbar.tga]])
    t:SetAllPoints(f)

    -- local t1 = f:CreateTexture(nil, "ARTWORK", 4)
    -- t1:SetDrawLayer("ARTWORK", 4)
    -- t1:SetTexture([[Interface\AddOns\NugHealth\shieldtex.tga]])
    -- t1:SetHeight(25)
    -- t1:SetWidth(100)
    -- -- t1:SetTexCoord(0, 1, 0, 0.25 )
    -- t1:SetAlpha(0.5)
    -- t1:SetPoint("RIGHT", f, "RIGHT",0,0)


    local bigBubbles1 = MakeModelRegion(f, 30, 25, "spells/7fx_nightmare_dustcloud_state.m2", -8.6, 0, -5.1 )
    bigBubbles1:SetPoint("RIGHT", f, "RIGHT", 0, 0)

    local bigBubbles2 = MakeModelRegion(bigBubbles1, 30, 25, "spells/7fx_nightmare_dustcloud_state.m2",  -8.6, 0, -5.1 )
    bigBubbles2:SetPoint("RIGHT", f, "RIGHT", -50, 0)

    sf:SetScrollChild(f)
    sf:SetSize(f:GetWidth(), f:GetHeight())
    sf:SetPoint("CENTER",0,0)
    

    f:SetPoint("CENTER",0,0)

    sf:SetHorizontalScroll(50)

    return sf
end