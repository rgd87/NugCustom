local addonName, addon = ...

local d87add = CreateFrame("Frame", "d87add")

local isClassic = select(4,GetBuildInfo()) <= 19999
local isMainline = WOW_PROJECT_ID == WOW_PROJECT_MAINLINE

local LSM = LibStub("LibSharedMedia-3.0")

LSM:Register("font", "Enigma", [[Interface\AddOns\NugCustom\Enigma__2.ttf]],  GetLocale() ~= "enUS" and 15)
LSM:Register("font", "ClearFont", [[Interface\AddOns\NugCustom\ClearFont.ttf]],  GetLocale() ~= "enUS" and 15)
LSM:Register("font", "ClearFontBold", [[Interface\AddOns\NugCustom\ClearFontBold.ttf]],  GetLocale() ~= "enUS" and 15)

LSM:Register("sound", "Heartbeat5", "Interface/AddOns/NugCustom/heartbeat_mp3.ogg")


local GetSpellInfo = addon.GetSpellInfo


C_AddOns.LoadAddOn("Blizzard_DebugTools")

-- LSM:Register("font", "Roboto-Medium", [[Interface\AddOns\NugCustom\Roboto-Medium.ttf]],  GetLocale() ~= "enUS" and 15)
-- LSM:Register("font", "Roboto-Regular", [[Interface\AddOns\NugCustom\Roboto-Regular.ttf]],  GetLocale() ~= "enUS" and 15)
-- LSM:Register("font", "Ubuntu-Medium", [[Interface\AddOns\NugCustom\Ubuntu-Medium.ttf]],  GetLocale() ~= "enUS" and 15)
-- LSM:Register("font", "Ubuntu-Regular", [[Interface\AddOns\NugCustom\Ubuntu-Regular.ttf]],  GetLocale() ~= "enUS" and 15)
-- LSM:Register("font", "AlegreyaSans-Medium", [[Interface\AddOns\NugCustom\AlegreyaSans-Medium.ttf]],  GetLocale() ~= "enUS" and 15)
-- LSM:Register("font", "AlegreyaSans-Regular", [[Interface\AddOns\NugCustom\AlegreyaSans-Regular.ttf]],  GetLocale() ~= "enUS" and 15)
-- LSM:Register("font", "FiraSans-Medium", [[Interface\AddOns\NugCustom\FiraSans-Medium.ttf]],  GetLocale() ~= "enUS" and 15)
-- LSM:Register("font", "FiraSans-Regular", [[Interface\AddOns\NugCustom\FiraSans-Regular.ttf]],  GetLocale() ~= "enUS" and 15)
-- LSM:Register("font", "AlegreyaSansSC-Medium", [[Interface\AddOns\NugCustom\AlegreyaSansSC-Medium.ttf]],  GetLocale() ~= "enUS" and 15)
-- LSM:Register("font", "AlegreyaSansSC-Regular", [[Interface\AddOns\NugCustom\AlegreyaSansSC-Regular.ttf]],  GetLocale() ~= "enUS" and 15)
-- LSM:Register("font", "NotoSans-Bold", [[Interface\AddOns\NugCustom\NotoSans-Bold.ttf]],  GetLocale() ~= "enUS" and 15)
-- LSM:Register("font", "NotoSans-Regular", [[Interface\AddOns\NugCustom\NotoSans-Regular.ttf]],  GetLocale() ~= "enUS" and 15)
-- LSM:Register("font", "IBMPlexSans-Medium", [[Interface\AddOns\NugCustom\IBMPlexSans-Medium.ttf]],  GetLocale() ~= "enUS" and 15)
-- LSM:Register("font", "IBMPlexSans-Regular", [[Interface\AddOns\NugCustom\IBMPlexSans-Regular.ttf]],  GetLocale() ~= "enUS" and 15)

_G.BINDING_NAME_NUGCUSTOM_CHANNELKEY1 = "Open /5 channel"
_G.BINDING_NAME_NUGCUSTOM_OBJECTIVE_TOGGLE = "Toggle Objective Tracker"
_G.BINDING_HEADER_NUGCUSTOM = addonName

-- function d87add:UNIT_HEALTH(event, unit)
--     if unit ~= "player" then return end
--     print(UnitHealth(unit))
-- end
-- d87add:RegisterEvent("UNIT_HEALTH")

local mymodels_ncb = {
    "spells\\gouge_precast_state_hand.m2",
    "spells/7fx_nightborne_precasthand.m2",
    "SPELLS/Shadowflame_Cast_Hand.m2",
    "spells\\Holy_precast_med_hand_simple.m2",
    "spells\\Paladin_headlinghands_state_01.m2",
    "SPELLS/Shadow_Strikes_State_Hand.m2",
    "spells\\blessingoffreedom_state.m2",
    "spells/druid_wrath_impact_v2.m2",
    "SPELLS/Precast_Corrupted_01.m2",
    "spells/6fx_smallfire.m2",
    "spells/cfx_mage_greaterpyroblast_missile.m2",
    "spells/bloodlust_state_hand.m2",
    "SPELLS/Monk_ChiBlast_Precast_Jade.m2",
    "SPELLS/Monk_ChiBlast_Precast.m2",
    "SPELLS/Monk_CracklingLightning_Impact_Blue.m2",
    "spells/7fx_deathknight_scourgeofworlds_statechest.m2",
    "spells/7fx_warlock_shadow_missile.m2",
    "spells\\soulfunnel_impact_chest.m2",
    "spells\\healrag_state_chest.m2",
    "spells/enchantments/greenflame_low.m2",
    "spells/enchantments/blueflame_low.m2",
    "spells/enchantments/redflame_low.m2",
    "spells/enchantments/whiteflame_low.m2",
    "spells/enchantments/redglow_high.m2",
    "spells/enchantments/yellowflame_low.m2",
    "spells/enchantments/purpleflame_low.m2",
    "spells\\lifetap_state_chest.m2",
    "spells/monk_avertharm_state_base.m2",
    "spells/divineshield_v2_chest.m2",
    "spells/weaponenchant_pvppandarias2.m2",
    "spells/cast_arcane_pink_01.m2",
    "spells/antimagic_precast_hand_02red.m2",
    "spells/arcaneshot_missile.m2",
    "spells\\lightningbolt_missile.m2",
    "SPELLS/FlowingWater_High.m2",
}

local mymodels_nrun = {
    "spells/7fx_nightborne_missile_streak.m2",
    "spells/7fx_paladin_judgement_missile.m2",
    "spells/7fx_mage_aegwynnsascendance_statehand.m2",
    "SPELLS/Monk_ForceSpere_Orb.m2",
}

local mymodels_ouf_player = {
    "spells/7fx_nightmare_dustcloud_state.m2",
    "spells/7fx_ghost_red_state.m2",
    "spells/acidburn_red.m2",
    "spells/7fx_ghost_blue_state.m2",
    "spells/acidburn_blue.m2",
    "spells/algalonsparkles.m2",
    "spells/enchantments/greenflame_low.m2",
    "spells/enchantments/blueflame_low.m2",
    "spells/enchantments/purpleflame_low.m2",
    "spells/enchantments/redflame_low.m2",
    "spells/Holy_precast_med_hand_simple.m2",
}

function PrintModelIDs()
    local f = CreateFrame("PlayerModel", nil, UIParent)
    for i,path in ipairs(mymodels_nrun) do
        f:SetModel(path)
        local id = f:GetModelFileID()
        local unescapedPath = string.gsub(path,"\\","\\\\")
        print(string.format('[%d] = "%s"', id, unescapedPath))
    end
end

-- local f = CreateFrame"Frame"
-- f:RegisterEvent("UPDATE_CHAT_WINDOWS")
-- f:RegisterEvent("PLAYER_LOGIN")
-- f:SetScript("OnEvent", function(self, event, ...)
--     print(GetTime(), event, ...)
--     -- return self[event](self, event, ...)
-- end)

-- hooksecurefunc("LFGListSearchPanel_DoSearch", function(self)
--     print(self.categoryID, self.filters, self.preferredFilters, languages)
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
        elseif class == "PRIEST" and (spec == 3 or spec == 1) then
            if current_profile ~= "dots" then kuiconfig:SetProfile("dots") end
        elseif class == "DRUID" and (spec == 2 or spec == 1) then
            if current_profile ~= "dots" then kuiconfig:SetProfile("dots") end
        else
            if current_profile ~= "default" then
                kuiconfig:SetProfile("default")
            end
        end
    end)
end

local function EnterSelectMode(frame)
    frame = frame or SELECTED_CHAT_FRAME

    frame:SetTextCopyable(true)
    frame:EnableMouse(true)
    frame:SetOnTextCopiedCallback(function(frame, text, num_copied)
      frame:SetTextCopyable(false)
      frame:EnableMouse(false)
      frame:SetOnTextCopiedCallback(nil)
    end)
end

function addon:HookChatFrameWithCopyMode()
    local tab = _G["ChatFrame1Tab"]
    tab:HookScript("OnClick", function(tabFrame)
        local id = tabFrame:GetID()
        local cf = _G["ChatFrame"..id]
        EnterSelectMode(cf)
    end)
end

function addon:MoveChat()
    for i=1,2 do
        local cf = _G["ChatFrame"..i]
        cf:SetClampedToScreen(false)
        cf:ClearAllPoints()
        cf:SetWidth(432);
        cf:SetHeight(408);

        cf:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 5, 32)

        cf.isInitialized = 1;
        if i == 1 then
        FCF_SetWindowColor(cf, 0,0,0);
        FCF_SetWindowAlpha(cf, 0);
        FCF_SavePositionAndDimensions(cf)
        FCF_SetLocked(cf, true)
        end
    end

    -- Blizzard_CombatLog_CurrentSettings.settings.timestamp = true
    -- CombatLogQuickButtonFrame_Custom:ClearAllPoints()
    -- CombatLogQuickButtonFrame_Custom:SetPoint("BOTTOMLEFT", COMBATLOG:GetName() .. "TabRight", "BOTTOMLEFT", 20, 0)
    -- CombatLogQuickButtonFrame_Custom:SetPoint("BOTTOMRIGHT", COMBATLOG, "TOPRIGHT")
end

local autoCollapseTimer
function NugCustom_ToggleObjectiveTracker()
    ObjectiveTracker_MinimizeButton_OnClick()
    if not ObjectiveTrackerFrame.collapsed then
        autoCollapseTimer = C_Timer.NewTimer(40, function()
            ObjectiveTracker_Collapse()
        end)
    else
        if autoCollapseTimer then
            autoCollapseTimer:Cancel()
        end
    end
end


-- LiteralName = "VOICE_CHAT_CHANNEL_JOINED",
-- 			Payload =
-- 			{
-- 				{ Name = "status", Type = "VoiceChatStatusCode", Nilable = false },
-- 				{ Name = "channelID", Type = "number", Nilable = false },
-- 				{ Name = "channelType", Type = "ChatChannelType", Nilable = false },
-- 				{ Name = "clubId", Type = "string", Nilable = true },
-- 				{ Name = "streamId", Type = "string", Nilable = true },
-- 			},

-- -------> Local player joins the voice chat
-- LiteralName = "VOICE_CHAT_CHANNEL_ACTIVATED",
-- 			Payload =
-- 			{
-- 				{ Name = "channelID", Type = "number", Nilable = false },

-- Dump: value=Enum.ChatChannelType
-- [1]={
--   Custom=1,
--   Private_Party=2,
--   Public_Party=3,
--   Communities=4,
--   None=0
-- }

-- GetActiveChannelType

-- d87add:RegisterEvent("VOICE_CHAT_CHANNEL_MEMBER_SPEAKING_STATE_CHANGED")
-- function d87add:VOICE_CHAT_CHANNEL_MEMBER_SPEAKING_STATE_CHANGED(event, memberID, channelID, isSpeaking)
--     print(memberID, channelID, isSpeaking)
-- end
function glowUnit(unit)
    local LGF = LibStub("LibGetFrame-1.0")
    local LCG = LibStub("LibCustomGlow-1.0")
    local frames = LGF.GetFrame(unit, { returnAll = true })
    LGFFRAMES = frames
    if frames then
        for frame, frameName in pairs(frames) do
            print(frame, frameName)
            LCG.PixelGlow_Start(frame, nil, 8, 0.5, 6, 1.5) --LCG.ButtonGlow_Stop(frame)
        end
    end
end


local spellSoundTable = {
    -- [6343] = 568003,
    -- [6343] = 3083209,
    [6343] = 612310,
}

function addon:CreateSpellSoundPlayer()
    local f = CreateFrame("Frame")
    f:RegisterUnitEvent("UNIT_SPELLCAST_SUCCEEDED", "player")
    f:SetScript("OnEvent", function(self, event, unit, lineID, spellID)
        local customSound = spellSoundTable[spellID]
        if customSound then
            PlaySoundFile(customSound, "SFX")
        end
    end)
end

ChatFrame1:SetMaxLines(256)
function addon:DoMain()

    -- local f = CreateFrame("Frame")
    -- f:RegisterEvent("GROUP_ROSTER_UPDATE")
    -- f:RegisterEvent("UNIT_NAME_UPDATE")
    -- f:SetScript("OnEvent", function(self, event)
    --     print(event)
    --     print(UnitExists("player"))
    -- end)

    -- hooksecurefunc("SecureGroupHeader_Update", function(self)
    --     print("SecureGroupHeader_Update")
    --     print(UnitExists("player"))
    -- end)

    -- SetCVar("CombatHealing", "1");
    -- SetCVar("violencelevel", 5)	-- [1]
    -- SetCVar("screenshotQuality", 12)	-- [2]
    -- SetCVar("screenshotFormat", "jpeg")	-- [3]
    -- SetCVar("nameplateMaxDistance", 70)
    -- SetCVar("WeatherDensity", 3)

    -- SetupTimestamps()
    -- if not isClassic then
        -- addon:KuiProfileSwapper()
    -- end

    -- addon:CreateAlphaDriver()

    addon:HookChatFrameWithCopyMode()

    addon:MoveChat()

    addon:CreateSpellSoundPlayer()

    local reclamp = function(self)
        GameTooltip:SetClampedToScreen(true)
    end
    -- GameTooltip:HookScript("OnShow", reclamp)
    hooksecurefunc(GameTooltip, "SetInventoryItem", reclamp)
    hooksecurefunc(GameTooltip, "SetBagItem", reclamp)
    hooksecurefunc(GameTooltip, "SetItemByID", reclamp)
    hooksecurefunc(GameTooltip, "SetInventoryItemByID", reclamp)

    -- C_Timer.After(10, MoveChat)

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
        -- [610172] = "SPELLS/Monk_ForceSpere_Orb.m2"
        f:SetModel(610172)
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
        f:SetScript("OnEvent", function( self, event)

            local timestamp, eventType, hideCaster,
            srcGUID, srcName, srcFlags, srcFlags2,
            dstGUID, dstName, dstFlags, dstFlags2,
            spellID, spellName, spellSchool, auraType, amount = CombatLogGetCurrentEventInfo()
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

    d87add.dumpmsg = function(msg)
        UIParentLoadAddOn("Blizzard_DebugTools");
        DevTools_DumpCommand(msg);
    end

    d87add.dump = function(t)
        if not IsAddOnLoaded("Blizzard_DebugTools") then
            UIParentLoadAddOn("Blizzard_DebugTools");
        end
        DevTools_Dump(t);
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
-- SpecMacros:RegisterEvent("PLAYER_LOGIN")

-- SpecMacros:SetScript("OnEvent", function(self)
--     if not InCombatLockdown() then
--         local numSpec = GetNumSpecializations()
--         for i=1, numSpec do
--             local macroname = "SpecMacro"..i
--             local index = GetMacroIndexByName(macroname)
--             if index == 0 then
--                 index = CreateMacro(macroname, 135754, string.format("/script SetSpecialization(%d)", i), nil)
--                 if not index or index == 0 then return end
--             end
--             local gID, _, _, icon = GetSpecializationInfo(i)

--             EditMacro(index, nil, icon, nil)
--         end

--         self:UnregisterEvent("PLAYER_REGEN_ENABLED")
--     else
--         self:RegisterEvent("PLAYER_REGEN_ENABLED")
--     end
-- end)


function d87add:MakeAzeriteThing()
    -- local item = Item:CreateFromEquipmentSlot(1)
    -- item:Get

    -- SetPortraitToTexture

    local powersFrame = CreateFrame("Frame", nil)
    powersFrame:SetSize(10,10)
    powersFrame.icons = {}
    for i=1, 12 do
        local t = powersFrame:CreateTexture(nil, "ARTWORK", nil, 0)
        t:SetSize(24, 24)
        t:SetTexCoord(.1, .9, .1, .9)
        table.insert(powersFrame.icons, t)
    end
    powersFrame.ResetPool = function(self)
        if self.index == 1 then return end
        for i, t in ipairs(self.icons) do
            t:Hide()
            t:ClearAllPoints()
        end
        self.index = 1
    end

    powersFrame.GetFreeIcon = function(self)
        local t = self.icons[self.index]
        self.index = self.index + 1
        t:Show()
        return t
    end

    powersFrame:ResetPool()

    GameTooltip:HookScript("OnHide", function()
        powersFrame:ResetPool()
    end)

    GameTooltip:HookScript("OnTooltipSetItem", function(self)
        local _, itemLink = self:GetItem();
        local item = Item:CreateFromItemLink(itemLink)
        local itemID = item:GetItemID()

        local isAzeriteEmpowered = C_AzeriteEmpoweredItem.IsAzeriteEmpoweredItemByID(itemID)
        if isAzeriteEmpowered then
            local allTierInfo = C_AzeriteEmpoweredItem.GetAllTierInfoByItemID(itemID)

            -- print(itemID)
            -- d87add.dump(allTierInfo)

            local width1 = self:GetWidth()
            local height1 = self:GetHeight()
            -- print(width1, height1)
            powersFrame:SetParent(self)
            powersFrame:SetPoint("TOPLEFT")

            powersFrame:ResetPool()

            for tierNum, tier in ipairs(allTierInfo) do
                self:AddLine(" ")
                local numLines = self:NumLines()
                local newLine = _G[self:GetName().."TextLeft"..numLines]

                self:AddLine(" ")

                local tierUnlockLevel = tier.unlockLevel
                newLine:SetText(tierUnlockLevel)

                local prev
                for i, powerID in ipairs(tier.azeritePowerIDs) do
                    local spellID = C_AzeriteEmpoweredItem.GetPowerInfo(powerID).spellID
                    local name, _, tex = GetSpellInfo(spellID)

                    local t = powersFrame:GetFreeIcon()
                    t:SetTexture(tex)
                    -- print(tierNum, numLines, spellID, tex)
                    if not prev then
                        t:SetPoint("TOPLEFT", newLine, "TOPLEFT",13, 0)
                    else
                        t:SetPoint("TOPLEFT", prev, "TOPRIGHT",5, 0)
                    end
                    prev = t
                end
            end

        else
            powersFrame:ResetPool()
        end
    end);
end


-- MainMenuBar:SetMovable(true)
-- MainMenuBar:SetUserPlaced(true)
-- MainMenuBar:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, 0);

-- hooksecurefunc(MainMenuBar, "SetPositionForStatusBars", function(self)
--     StatusTrackingBarManager:HideStatusBars()
--     if not InCombatLockdown() then
--         MainMenuBar:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, 0);
--     end
--     MainMenuBarArtFrame.LeftEndCap:SetPoint("BOTTOMLEFT", MainMenuBar, -98, 0);
--     MainMenuBarArtFrame.RightEndCap:SetPoint("BOTTOMRIGHT", MainMenuBar, 98, 0);
-- end)

local function HideDragonflightExpBar()
    StatusTrackingBarManager:UnregisterAllEvents()
    StatusTrackingBarManager:Hide()
end

local playerLoginTime = 0

d87add:RegisterEvent("PLAYER_LOGIN");
function d87add:PLAYER_LOGIN()
    playerLoginTime = GetTime()


    -- self:RegisterEvent("UNIT_HEALTH")
    -- local CLH = LibStub("LibCombatLogHealth-1.0")
    -- CLH.RegisterCallback(self, "COMBAT_LOG_HEALTH", function(event, unit, eventType)
    --     print(GetTime(), "|cffffaaaaCOMBAT_LOG_HEALTH|r", CLH.UnitHealth("player"))
    -- end)

    if isClassic then
        local FindMinerals = 2580
        local FindHerbs = 2383
        local selectedTracking
        if IsPlayerSpell(FindMinerals) then
            selectedTracking = FindMinerals
        elseif IsPlayerSpell(FindHerbs) then
            selectedTracking = FindHerbs
        end

        local f = CreateFrame("Frame", nil, UIParent)

        if selectedTracking then
            f:RegisterEvent("PLAYER_STARTED_MOVING")
            f:SetScript("OnEvent", function()
                if GetTrackingTexture() == nil
                then
                    CastSpellByID(selectedTracking)
                end
            end)
        end
    end


    if isMainline then
        HideDragonflightExpBar()
    end
    addon:DoMain()
    addon:FixCVars()
    if not isClassic then
        -- addon:ModObjectiveTracker()
    end

    -- addon:TestScrollFrameOnModels()
    -- addon:TestSetTransform()
    -- addon:Test82Models()

    if Confused then
        -- local PTR_IssueReporter = Confused:GetParent()
        -- if InterfaceLayer then
            -- InterfaceLayer:Reparent(PTR_IssueReporter)
        -- end

        -- PTR_IssueReporter:SetClampedToScreen(false)


        -- PTR_IssueReporter:ClearAllPoints()
        -- PTR_IssueReporter:SetPoint("CENTER", 0, 0)
        -- PTR_IssueReporter:SetPoint("CENTER", 2000, 0)
    end

    -- d87add:MakeAzeriteThing()
end

function d87add:UNIT_HEALTH()
    print(GetTime(), "|cffaaffaaUNIT_HEALTH|r", UnitHealth("player"))
end

function addon:ModObjectiveTracker()
    if IsAddOnLoaded("Blizzard_ObjectiveTracker") then
        C_Timer.After(3, function()
            OBJECTIVE_TRACKER_TEXT_WIDTH  = 400 - 12
            DEFAULT_OBJECTIVE_TRACKER_MODULE.lineWidth = OBJECTIVE_TRACKER_TEXT_WIDTH;

            local blocksFrame = DEFAULT_OBJECTIVE_TRACKER_MODULE.BlocksFrame
            local blocks = { blocksFrame:GetChildren() }
            table.insert(blocks, ScenarioObjectiveBlock)
            SCENARIO_TRACKER_MODULE.BlocksFrame:SetWidth(400)
            for i, block in ipairs(blocks) do
                if block.lines then
                    block.lineWidth = OBJECTIVE_TRACKER_TEXT_WIDTH
                    for objectiveKey, line in pairs(block.lines) do
                        if ( block.lineWidth ~= line.width ) then
                            line:SetWidth(block.lineWidth)
                            line.Text:SetWidth(block.lineWidth);
                            line.Text:SetHeight(0);
                            line.Text:SetWordWrap(true)
                            line.Text:SetNonSpaceWrap(true);
                            line.width = block.lineWidth;	-- default should be nil
                        end
                    end
                else

                end
            end

            hooksecurefunc(DEFAULT_OBJECTIVE_TRACKER_MODULE, "AddObjective", function(self, block, objectiveKey, text, lineType, useFullHeight, dashStyle, colorStyle, adjustForNoText, overrideHeight)
                local line = self:GetLine(block, objectiveKey, lineType);
                line.Text:SetHeight(0);
            end)
            -- hooksecurefunc(SCENARIO_TRACKER_MODULE, "AddObjective", function(self, block, objectiveKey, text, lineType, useFullHeight, dashStyle, colorStyle, adjustForNoText, overrideHeight)
            --     local line = self:GetLine(block, objectiveKey, lineType);
            --     line.Text:SetHeight(0);
            -- end)

            ObjectiveTrackerFrame:SetWidth(400)
            -- ObjectiveTrackerFrame:SetHeight(600)
            -- ObjectiveTrackerFrame:ClearAllPoints()
            -- ObjectiveTrackerFrame:SetPoint("TOPLEFT", 300, -100)



        end)
        -- ObjectiveTrackerFrame:SetPoint("TOPLEFT", UIParent, "TOPLEFT", 300, -100)
        -- ObjectiveTrackerFrame:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 300, 300)

        ObjectiveTracker_Collapse()
    end



    hooksecurefunc("QuestObjectiveSetupBlockButton_AddRightButton", function(block, button, initialAnchorOffsets)
        button:ClearAllPoints();

        local isGroupFinderButton = block.groupFinderButton == button

        local paddingBetweenButtons = block.module.paddingBetweenButtons or 0;

        -- if block.rightButton then
        --     button:SetPoint("TOP", block.rightButton, "BOTTOM", 0, -paddingBetweenButtons);
        -- else
            initialAnchorOffsets = initialAnchorOffsets or {0,0};
            -- print(initialAnchorOffsets[1], )
        if isGroupFinderButton then
            button:SetPoint("TOPRIGHT", block, "TOPLEFT", -10, 0);
        else
            button:SetPoint("TOPRIGHT", block, "TOPLEFT", -30, 0);
        end
        -- end
    end)




    hooksecurefunc("AutoQuestPopupTracker_AddPopUp", function(questID, popUpType, itemID)
        if InterfaceLayer then
            InterfaceLayer:TempActivation()
        end
    end)


    local questProgressBars = {}
    local scenarioPercent = 999

    hooksecurefunc("BonusObjectiveTrackerProgressBar_SetValue", function(self, percent)
        local questID = self.questID
        local oldPercent = questProgressBars[questID]
        if percent ~= oldPercent then
            local description = ""
            local isInArea, isOnMap, numObjectives, taskName, displayAsObjective = GetTaskInfo(questID);
            for objectiveIndex = 1, numObjectives do
                local text, objectiveType, finished = GetQuestObjectiveInfo(questID, objectiveIndex, false)
                if objectiveType == "progressbar" then
                    description = text
                    break
                end
            end
            -- print("[bonus] update on", questID)

            if playerLoginTime + 3 < GetTime() then
                UIErrorsFrame:AddMessage(string.format("%s: %d%%", description, percent), YELLOW_FONT_COLOR:GetRGB());
            end

            questProgressBars[questID] = percent
        end
    end)

    hooksecurefunc("ObjectiveTrackerProgressBar_SetValue", function(self, percent)
        local questID = self.questID
        local oldPercent = questProgressBars[questID]
        if percent ~= oldPercent then
            local description = ""
            local questLogIndex = GetQuestLogIndexByID(questID)
            local numObjectives = GetNumQuestLeaderBoards(questLogIndex)
            for objectiveIndex = 1, numObjectives do
                local text, objectiveType, finished = GetQuestLogLeaderBoard(objectiveIndex, questLogIndex);
                if objectiveType == "progressbar" then
                    description = text
                    break
                end
            end

            if playerLoginTime + 3 < GetTime() then
                UIErrorsFrame:AddMessage(string.format("%s: %d%%", description, percent), YELLOW_FONT_COLOR:GetRGB());
            end

            questProgressBars[questID] = percent
        end
    end)


    hooksecurefunc("ScenarioTrackerProgressBar_SetValue", function(self, percent)
        if percent ~= scenarioPercent then
            -- local _, _, difficulty, _, _, _, _, _ = GetInstanceInfo();
            -- local description = difficulty == 8 and "Mythic+" or "Scenario"
            local description = "Scenario"

            local stageName, stageDescription, numCriteria, _, _, _, _, numSpells, spellInfo, weightedProgress, _, widgetSetID = C_Scenario.GetStepInfo();
            for criteriaIndex = 1, numCriteria do
                local criteriaString, criteriaType, completed, quantity, totalQuantity, flags, assetID, quantityString, criteriaID, duration, elapsed, _, isWeightedProgress = C_Scenario.GetCriteriaInfo(criteriaIndex);

                if isWeightedProgress then -- means that's the bar criteria
                    description = criteriaString
                    -- percent = quantity/totalQuantity
                end
            end

            if playerLoginTime + 3 < GetTime() then
                UIErrorsFrame:AddMessage(string.format("%s: %.1f%%", description, percent), YELLOW_FONT_COLOR:GetRGB());
            end

            scenarioPercent = percent
        end
    end)



    -- -- SCENARIO (MYTHIC+)
    -- local stageName, stageDescription, numCriteria, _, _, _, _, numSpells, spellInfo, weightedProgress, _, widgetSetID = C_Scenario.GetStepInfo();
    -- for criteriaIndex = 1, numCriteria do
    --     local criteriaString, criteriaType, completed, quantity, totalQuantity, flags, assetID, quantityString, criteriaID, duration, elapsed, _, isWeightedProgress = C_Scenario.GetCriteriaInfo(criteriaIndex);

    --     if isWeightedProgress then -- means that's the bar criteria
    --         -- asd
    --     end
    -- end

    -- -- NORMAL QUESTS
    -- 55520
    -- for i = 1, GetNumQuestWatches() do
    --     local questID, title, questLogIndex, numObjectives, requiredMoney, isComplete, startEvent, isAutoComplete, failureTime, timeElapsed, questType, isTask, isBounty, isStory, isOnMap, hasLocalPOI, isHidden, isWarCampaign, hasOverrideSort = GetQuestWatchInfo(i);
            -- local questLogIndex = GetQuestLogIndexByID(questID)
    --     for objectiveIndex = 1, numObjectives do
    --         local text, objectiveType, finished = GetQuestLogLeaderBoard(objectiveIndex, questLogIndex);

    --         print(text, objectiveType, finished)
    --     end
    --     -- print(GetQuestLogLeaderBoard(questID, objectiveIndex, true))
    -- end
    -- print("--------------")

    -- -- WORLD QUESTS
    -- for i = 1, GetNumWorldQuestWatches() do
    --     local questID = GetWorldQuestWatchInfo(i)

    --     local isInArea, isOnMap, numObjectives, taskName, displayAsObjective = GetTaskInfo(questID);
    --     for objectiveIndex = 1, numObjectives do
    --         local text, objectiveType, finished = GetQuestObjectiveInfo(questID, objectiveIndex, false)
    --         print(text, objectiveType, finished)
    --     end
    -- end
end

-- MainMenuBar:SetMovable(true)
-- MainMenuBar:SetUserPlaced(true)
-- MainMenuBar:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, 0);

-- hooksecurefunc(MainMenuBar, "SetPositionForStatusBars", function(self)
--     StatusTrackingBarManager:HideStatusBars()
--     if not InCombatLockdown() then
--         MainMenuBar:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, 0);
--     end
--     MainMenuBarArtFrame.LeftEndCap:SetPoint("BOTTOMLEFT", MainMenuBar, -98, 0);
--     MainMenuBarArtFrame.RightEndCap:SetPoint("BOTTOMRIGHT", MainMenuBar, 98, 0);
-- end)

function addon:DisableLegionExpBar()
    ------- Disable Legion Exp bar and artifact bar
    hooksecurefunc("MainMenuBar_UpdateExperienceBars", function()
        MainMenuExpBar:Hide();
        MainMenuExpBar.pauseUpdates = true;
        ExhaustionTick:Hide();

        ReputationWatchBar:Hide();

        MainMenuBarMaxLevelBar:Show(); --cap

        UIParent_ManageFramePositions();
        UpdateContainerFrameAnchors();
    end)
end
if isClassic then
    addon:DisableLegionExpBar()
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


-- local jug = { 33666, 33668, 33664, 33667, 33665, 33878, 33877  }
-- local jug = { 41048, 31001, 31003, 31004, 31005, 31006, 72848, 94079, 47296, 47319, 41252 }
-- local jug = { 103527, 103529, 103525, 103528, 103526, 103457, 103456}
-- local jug = { 16808, 86713, 46137, 51921, 84353, 63570, 69621 }
-- local jug = { 46172, 30154, 33484, 82423, 46874, 30151, 44018, 59542, 62450, 32451, 15947 }
-- local jug = { 113807, 113805, 113808, 113809, 113806, 113810, 113811, 113812 }
local jug = { 172077, 172082, 172080, 172081, 172076, 172083, 172075, 172078 }

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

function HideHotkeys()
    local bars = {"ActionButton","MultiBarBottomLeftButton","MultiBarBottomRightButton","MultiBarLeftButton","MultiBarRightButton"}
    for _,bar in ipairs(bars) do
        for i = 1,12 do
            local btn = getglobal(bar..i)
            local name = getglobal(bar..i.."Name")
            local hotkey = getglobal(bar..i.."HotKey")
            local border = getglobal(bar..i.."Border")
            name:Hide();  name.Show = function() end;
            hotkey:Hide();  hotkey.Show = function() end;
            border:Hide();  border.Show = function() end;   -- green item border

            -- pushed state flash
            -- btn:SetPushedTexture([[Interface\Cooldown\star4]])
            -- btn:GetPushedTexture():SetBlendMode("ADD")
            -- btn:GetPushedTexture():SetTexCoord(0.2,0.8,0.2,0.8)
            -- btn:GetPushedTexture():SetVertexColor(0.5,0.5,1)
        end
    end
end


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

    local bigBubbles2 = MakeModelRegion(f, 30, 25, "spells/7fx_nightmare_dustcloud_state.m2",  -8.6, 0, -5.1 )
    bigBubbles2:SetPoint("RIGHT", f, "RIGHT", -50, 0)

    sf:SetScrollChild(f)
    sf:SetSize(f:GetWidth(), f:GetHeight())
    sf:SetPoint("CENTER",0,0)


    f:SetPoint("CENTER",0,0)

    sf:SetHorizontalScroll(50)

    return sf
end

function d87add:TestSetTransform()
    local Redraw = function(self)
        if not self.model_path then return end

        self:SetModel(self.model_path)

        self:SetTransform(unpack(self.transformations))
    end

    local ResetTransformations = function(self)
        self:ClearTransform()
    end

    local MakeModelRegion = function(self,w,h,model_path, ...)
        local pmf = CreateFrame("PlayerModel", nil, self )
        pmf:SetSize(w,h)

        pmf.transformations = { ... }
        pmf.model_path = model_path

        -- before 8.0 this was a required workaround for a bug
        -- that made models disappear after opening fullscreen map or entering cutscene
        pmf:SetScript("OnHide", ResetTransformations)
        pmf:SetScript("OnShow", Redraw)
        pmf.Redraw = Redraw
        pmf.ResetTransformations = ResetTransformations
        pmf:Redraw()

        return pmf
    end


    local f = MakeModelRegion(UIParent, 100, 100, 165693, 0.0255,0.0255,0, rad(90), rad(270), rad(270), 0.006) -- "spells/blessingoffreedom_state.m2"
    f:SetPoint("CENTER")
    f:SetBackdrop({
        bgFile = "Interface\\Tooltips\\UI-Tooltip-Background", tile = true, tileSize = 0,
        insets = {left = -2, right = -2, top = -2, bottom = -2},
    })
    f:SetBackdropColor(0,0,0,0.5)

    local rect = f:CreateTexture(nil, "BACKGROUND", nil, -2)
    rect:SetTexture("Interface\\BUTTONS\\WHITE8X8")
    rect:SetVertexColor(0,0,0)
    rect:SetSize(40, 40)
    rect:SetPoint("CENTER")
    local vline = f:CreateLine(nil, "BACKGROUND")
    vline:SetTexture("Interface\\BUTTONS\\WHITE8X8")
    vline:SetStartPoint("TOP", f, 0,0)
    vline:SetEndPoint("BOTTOM", f, 0,0)
    vline:SetThickness(1)
    vline:SetVertexColor(1,1,1)
    local hline = f:CreateLine(nil, "BACKGROUND")
    hline:SetTexture("Interface\\BUTTONS\\WHITE8X8")
    hline:SetStartPoint("LEFT", f, 0,0)
    hline:SetEndPoint("RIGHT", f, 0,0)
    hline:SetThickness(1)
    hline:SetVertexColor(1,1,1)


    TransformTestModel = f
    TransformTestModel:Redraw()

    -- TransformTestModel:SetScale(2)
    -- frame scales, model doesnt, but if you manually multiply
    -- offsets and model scale by frame scale it'll catch up
end

function addon:Test82Models()
    local Redraw = function(self)
        if not self.model_path then return end

        self:SetModelScale(1)
        self:SetPosition(0,0,0)

        self:SetModel(self.model_path)

        self:SetModelScale(self.model_scale)
        self:SetPosition(self.ox, self.oy, self.oz)
    end

    local ResetTransformations = function(self)
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

    local is82 = select(4,GetBuildInfo()) > 80100

    local ambientSmoke = MakeModelRegion(nil, 200, 200, is82 and 165535 or "spells/acidburn_blue.m2", 0,0,1 )
    -- ambientSmoke:SetPoint("TOP", f, "TOP", 0, 0)
    ambientSmoke:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
end


-- -- copy from SecureGroupHeaders.lua
-- local function GetGroupHeaderType(self)
--     local kind, start, stop;

--     local nRaid = GetNumGroupMembers();
--     local nParty = GetNumSubgroupMembers();
--     if ( IsInRaid() and self:GetAttribute("showRaid") ) then
--         kind = "RAID";
--     elseif ( IsInGroup() and self:GetAttribute("showParty") ) then
--         kind = "PARTY";
--     elseif ( self:GetAttribute("showSolo") ) then
--         kind = "SOLO";
--     end
--     if ( kind ) then
--         if ( kind == "RAID" ) then
--             start = 1;
--             stop = nRaid;
--         else
--             if ( kind == "SOLO" or self:GetAttribute("showPlayer") ) then
--                 start = 0;
--             else
--                 start = 1;
--             end
--             stop = nParty;
--         end
--     end
--     return kind, start, stop;
-- end

-- local function GetGroupRosterInfo(kind, index)
--     local _, unit, name, subgroup, className, role, server, assignedRole;
--     if ( kind == "RAID" ) then
--         unit = "raid"..index;
--         name, _, subgroup, _, _, className, _, _, _, role, _, assignedRole = GetRaidRosterInfo(index);
--     else
--         if ( index > 0 ) then
--             unit = "party"..index;
--         else
--             unit = "player";
--         end
--         if ( UnitExists(unit) ) then
--             name, server = UnitName(unit);
--             if (server and server ~= "") then
--                 name = name.."-"..server
--             end
--             _, className = UnitClass(unit);
--             if ( GetPartyAssignment("MAINTANK", unit) ) then
--                 role = "MAINTANK";
--             elseif ( GetPartyAssignment("MAINASSIST", unit) ) then
--                 role = "MAINASSIST";
--             end
--             assignedRole = UnitGroupRolesAssigned(unit)
--         end
--         subgroup = 1;
--     end
--     return unit, name, subgroup, className, role, assignedRole;
-- end

-- hooksecurefunc("SecureGroupHeader_Update", function(self)
--     local headerName = self:GetName()
--     if headerName ~= "TestGH" then return end

--     print(GetTime(), "SecureGroupHeader_Update", self:GetName())
--     local kind, start, stop = GetGroupHeaderType(self);
--     if kind then
--         for i = start, stop, 1 do
--             local unit, name, subgroup, className, role, assignedRole = GetGroupRosterInfo(kind, i);

--             print(unit, name, subgroup, className, role, assignedRole)
--         end
--     end
-- end)

-- local hdr = CreateFrame("Frame", "TestGH", UIParent, "SecureGroupHeaderTemplate")
-- hdr:SetAttribute("template", "SecureUnitButtonTemplate")
-- hdr:SetAttribute("showRaid", true)
-- hdr:SetAttribute("showParty", true)
-- hdr:SetAttribute("showSolo", true)
-- hdr:SetAttribute("point", "LEFT")
-- hdr:SetAttribute("xOffset", 5)
-- hdr:SetAttribute("yOffset", 5)
-- hdr:Show()
-- -- hdr:SetAttribute("groupFilter", "1,2,3,4,5,6,7,8")

-- hdr.SetupUnitButton = function(header, frameName)
--     local frame = _G[frameName]
--     frame:HookScript("OnAttributeChanged", function(self, attrname, unit)
--         if attrname == "unit" then
--             print(GetTime(), "onAttrChanged", self:GetName(), unit)
--         end
--     end)
-- end

-- hdr:SetAttribute("initialConfigFunction", [[
--     RegisterUnitWatch(self)
--     local header = self:GetParent()
--     header:CallMethod("SetupUnitButton", self:GetName())
-- ]])

-- hdr:SetPoint("CENTER",0,0)

--[[
<You joined the raid group>
810572.611 onAttrChanged TestGHUnitButton2 raid6
810572.611 onAttrChanged TestGHUnitButton3 raid8
810572.611 onAttrChanged TestGHUnitButton4 raid10
810572.611 onAttrChanged TestGHUnitButton5 raid15
810572.611 SecureGroupHeader_Update TestGH
raid1 Zeberdy-Saurfang 1 HUNTER nil DAMAGER
raid2 nil 1 nil nil DAMAGER
raid3 nil 1 nil nil DAMAGER
raid4 nil 1 nil nil DAMAGER
raid5 nil 1 nil nil TANK
raid6 Номка 2 HUNTER nil DAMAGER
raid7 nil 2 nil nil DAMAGER
raid8 Терпильник 2 SHAMAN nil DAMAGER
raid9 nil 2 nil nil HEALER
raid10 Типвересовой 2 DRUID nil DAMAGER
raid11 nil 3 nil nil DAMAGER
raid12 nil 3 nil nil DAMAGER
raid13 nil 3 nil nil TANK
raid14 nil 3 nil nil DAMAGER
raid15 Лунаша 3 MONK nil DAMAGER
]]




local CreateNormalBar = function(name, parent)
    local f = CreateFrame("StatusBar", name, parent)
    return f
end

local rand = math.random
function TESTBARS()
    local b1 = CreateCustomBar("ass1", UIParent)
    b1:SetStatusBarTexture([[Interface\AddOns\NugRunning\statusbar.tga]])
    b1:SetMinMaxValues(0, 100)
    b1:SetWidth(200)
    b1:SetHeight(30)
    b1:SetPoint("CENTER", 0,0)

    -- math.randomseed(GetTime())

    local beginTime, endTime
    beginTime = debugprofilestop();

    for i=1,10000 do
        b1:SetValue(rand(100))
    end

    endTime = debugprofilestop();
    print("Bar1", endTime - beginTime)



    local b2 = CreateNormalBar("ass2", UIParent)
    b2:SetStatusBarTexture([[Interface\AddOns\NugRunning\statusbar.tga]])
    b2:SetMinMaxValues(0, 100)
    b2:SetSize(200, 30)
    b2:SetPoint("CENTER", 0,100)

    local beginTime, endTime
    beginTime = debugprofilestop();

    for i=1,10000 do
        b2:SetValue(rand(100))
    end

    endTime = debugprofilestop();
    print("Bar2", endTime - beginTime)
end
--[[
function FauxScrollFrameExample()
    local BUTTON_HEIGHT = 16

    function MakeFrameList(parent)
        local prev
        parent.frameList = {}
        for i=1,20 do
            local f = CreateFrame("Frame", nil, parent)
            f:SetSize(200, BUTTON_HEIGHT)

            if prev then
                f:SetPoint("TOPLEFT", prev, "BOTTOMLEFT",0,0)
            else
                f:SetPoint("TOPLEFT", parent, "TOPLEFT",0,0)
            end
            prev = f

            local bg = f:CreateTexture(nil, "BACKGROUND")
            bg:SetAllPoints(f)
            bg:SetTexture("Interface\\BUTTONS\\WHITE8X8")
            if math.fmod(i,2) == 0 then
                bg:SetVertexColor(0,0,0,0.1)
            else
                bg:SetVertexColor(1,1,1,0.1)
            end

            local icon = f:CreateTexture(nil, "ARTWORK")
            icon:SetTexture(135882)
            icon:SetSize(BUTTON_HEIGHT-2, BUTTON_HEIGHT-2)
            icon:SetPoint("TOPLEFT",1,-1)
            f.icon = icon

            local label = f:CreateFontString(nil, "ARTWORK", "GameFontNormal")
            label:SetPoint("TOPLEFT", f, "TOPLEFT", BUTTON_HEIGHT+10, 0)
            label:SetText("ASS")
            f.label = label

            parent.frameList[i] = f
        end
    end

    local f = CreateFrame("ScrollFrame", "FAUXSCROLL", UIParent, "FauxScrollFrameTemplate")
    f:SetSize(200, 320)
    f:SetPoint("TOPLEFT", UIParent, "CENTER", 0,0)

    MakeFrameList(f)

    local ScrollFrame_Update = function(frame)
        FauxScrollFrame_Update(frame,50,20, BUTTON_HEIGHT);
        -- 50 is max entries, 20 is number of lines, 16 is pixel height of each line
        print("We're at "..FauxScrollFrame_GetOffset(frame));
        local offset = FauxScrollFrame_GetOffset(frame)
        for i=1,20 do
            local num = i+offset
            frame.frameList[i].label:SetText("Text"..num)
        end
    end
    ScrollFrame_Update(f)

    f:SetScript("OnVerticalScroll", function(self, offset)
        FauxScrollFrame_OnVerticalScroll(self, offset, BUTTON_HEIGHT, ScrollFrame_Update);
    end)
end
]]


-- hooksecurefunc("SecureGroupHeader_Update", function(self)
--     local headerName = self:GetName()

--     print(GetTime(), "SecureGroupHeader_Update", self:GetName())
-- end)

--[==[
local DebuffTypeColors = {
    Physical = { 1, 0, 0 },
    Magic = { 0.2, 0.6, 1},
    Curse = { 0.6, 0, 1},
    Poison = { 0, 0.6, 0},
    Disease = { 0.6, 0.4, 0},
}

local function AddDebuffIcon(hdr)
    local f = CreateFrame("Frame", nil, UIParent)
    local w,h = 40, 40
    f:SetSize(w, h)

    local bg = f:CreateTexture(nil, "BACKGROUND")
    bg:SetAllPoints()
    bg:SetTexture("Interface\\BUTTONS\\WHITE8X8")
    -- bg:SetVertexColor(0,0,0, 0.7)
    f.bg = bg

    local t = f:CreateTexture(nil, "ARTWORK")
    t:SetPoint("TOPLEFT", 3, -3)
    t:SetPoint("BOTTOMRIGHT", -3, 3)
    t:SetTexCoord(0.1, 0.9, 0.1, 0.9)
    f.icon = t

    local dtt = f:CreateTexture(nil, "ARTWORK", nil, 2)
    dtt:SetTexture[[Interface\AddOns\Aptechka\corner3]]
    dtt:SetTexCoord(0,1,0,1)
    dtt:SetSize(w*0.35, h*0.35)
    dtt:SetPoint("BOTTOMRIGHT", f, "BOTTOMRIGHT", 0,0)
    f.debuffType = dtt

    local outline = f:CreateTexture(nil, "BACKGROUND", nil, 1)
    outline:SetTexture("Interface\\BUTTONS\\WHITE8X8")
    outline:SetVertexColor(0,0,0, 1)
    outline:SetPoint("TOPLEFT", f.icon, "TOPLEFT", -1, 1)
    outline:SetPoint("BOTTOMRIGHT", f.icon, "BOTTOMRIGHT", 1, -1)



    -- if not f.SetBackdrop then
    --     Mixin(f, BackdropTemplateMixin)
    -- end

    -- f:SetBackdrop(debuff_border_backdrop)
    -- f:SetBackdropColor(1,0,0)

    table.insert(hdr.frames, f)

    return f
end

local function CreateSeparator(hdr)
    local t = hdr:CreateTexture(nil, "ARTWORK")
    t:SetWidth(3)
    t:SetHeight(60)
    t:SetTexture("Interface\\BUTTONS\\WHITE8X8")
    t:SetPoint("LEFT", 10, 0)
    t:SetVertexColor(0.65, 0, 0)
    return t
end

local f = CreateFrame("Frame", nil, UIParent)
f:SetSize(30, 30)
f:SetPoint("CENTER", -200, 0)
f.frames = {}
f.separator = CreateSeparator(f)
f.AddDebuffIcon = AddDebuffIcon
f:RegisterUnitEvent("UNIT_AURA", "player")
f:SetScript("OnEvent", function(hdr, event, unit)
    local index = 0;
    local prev = hdr
    for i=1, 40 do
        local name, icon, count, dt, duration, expirationTime, caster, _,_, spellID = UnitAura(unit, i, "HARMFUL")
        if not name then break end
        if not addon.blacklist[spellID] then
            index = index + 1;
            local frame = hdr.frames[index]
            if not frame then
                frame = hdr:AddDebuffIcon()
            end
            frame:Show()
            frame.icon:SetTexture(icon)
            local dtColor = dt and DebuffTypeColors[dt] or DebuffTypeColors["Physical"]
            frame.debuffType:SetVertexColor(unpack(dtColor))
            frame.bg:SetVertexColor(unpack(dtColor))
            -- frame:SetBackdropColor(1,0,0)
            -- frame:ApplyBackdrop()

            frame:SetPoint("RIGHT", prev, "LEFT", -5, 0)
            prev = frame
        end
    end

    for i=index+1, #hdr.frames do
        hdr.frames[i]:Hide()
    end

    if index == 0 then
        hdr.separator:Hide()
    else
        hdr.separator:Show()
    end
end)


addon.blacklist = {
    -- cast blacklist is shared with auras
    [120651] = true, -- explosive orb affix cast

    [178394] = true, -- Honorless Target

    [338906] = true, -- Jailer's Chains (Torghast debuff)
    [331148] = true, -- Torment: Eye of Skoldus
    [326469] = true, -- Torment: Soulforge Heat
    [331149] = true, -- Torment: Fracturing Forces
    [331151] = true, -- Torment: Breath of Coldheart
    [331153] = true, -- Torment: Mort'regar's Echoes
    [331154] = true, -- Torment: Might of the Upper Reaches
    [296847] = true, -- Torghast: Opressive Aura
    [294720] = true, -- Torghast: Bottled Enigma


    -- nazjatar pvp event participation states
    [304966] = true,
    [304959] = true,
    [304851] = true,

    [312243] = true, -- Amber Casing (Eternal Blossoms assault debuff)
    [318391] = true, -- Great Worm's Foul Stench

    [26218] = true, -- Winterveil something
    [26680] = true, -- Adored (Love is in the Air)

    [287825] = true, -- Lethargy, Hit or run azerite trait

    [209261] = true, -- Uncontained Fel (DH, Last Resort cooldown)
    [264689] = true, -- Fatigued (Hunter BL)
    [219521] = true, -- Shadow Covenant (Disc Priest Talent)
    [139485] = true, -- Throne of Thudner passive debuff
    [57724] = true, -- Sated (BL)
    [80354] = true, -- Temporal Displacement (Mage BL)
    [95809] = true, -- Insanity (old Hunter BL, Ancient Hysteria)
    [57723] = true, -- Drums BL debuff, and Heroism?
    [26013] = true, -- PVP Deserter
    [71041] = true, -- Deserter
    [8326] = true, -- Ghost
    [25771] = true, -- Forbearance
    [41425] = true, -- Hypothermia (after Ice Block)
    [6788] = true, -- Weakened Soul
    [113942] = true, -- demonic gates debuff
    [123981] = true, -- dk cooldown debuff
    [87024] = true, -- mage cooldown debuffц
    [97821] = true, -- dk battleres debuff
    [124275] = true, -- brewmaster light stagger debuff
    [174528] = true, -- Griefer debuff
    [206151] = true, -- Challenger's Burden

    [256200] = true, -- Heartstopper Venom, Tol'Dagor
    [271544] = true, -- Ablative Shielding, Tank Azerite trait

    [45181] = true, -- Cheat Death cooldown
    [187464] = true, -- Shadowmend debuff

    -- PvP trash debuffs
    [110310] = true, -- Dampening
    [195901] = true, -- Adaptation

    -- Azerite Traits
    [280286] = true, -- Dagger in the Back
    [279956] = true, -- Azerite Globules



    -- Common

    -- Healing Reduction
    -- [115804] = true, -- Mortal Wound, Healing effects received reduced by 25%.
    -- [197046] = true, -- Assa Rogue PvP Talent: Minor Wound Poison, Poison, Healing effects reduced by 15%.
    -- [8680] = true, -- Assa Rogue: Wound Poison, Poison, Healing effects reduced by 30%.
    [30213] = true, -- Demonology Warlock: Legion Strike, Effectiveness of any healing reduced by 10%.

    -- Slows
    -- [1715] = true, -- Warrior Hamstring, Physical 50%
    -- [12323] = true, -- Fury Warrior, Piercing Howl, Physical 50%
    -- [116095] = true, -- WW Monk, Disable, Physical 50%
    -- [183218] = true, -- Paladin, Hand of Hindrance, Magic 70%
    -- [185763] = true, -- Outlaw Rogue, Pistol Shot, Physical 50%
    -- [206760] = true, -- Subtlety Rogue, Shadow's Grasp, Magic 30%
    -- [3409] = true, -- Crippling Poison, Poison 50%
    [248744] = true, -- Assa Rogue, Shiv, Physical 70%. 4s
    -- [205708] = true, -- Frost Mage, Chilled, Magic 65% 15s
    -- [212792] = true, -- Frost Mage, Cone of Cold, Magic 85% 5s
    -- [31589] = true, -- Arcane Mage, Slow, Magic 50%
    -- [157981] = true, -- Fire Mage, Blast Wave, Physical 70% 4s
    -- [186387] = true, -- Hunter, Bursting Shot, Physical 50s 4s
    -- [195645] = true, -- Hunter Survival: Wing Clip, Physical 50%
    -- [5116] = true, -- Hunter: Concussive Shot, Physical 50% 6s



    -- MONK
    [113746] = true, -- 8.0 Monk: Mystic Touch, Physical damage taken increased by 5%.
    [228287] = true, -- 8.0 WW Monk: Mark of the Crane, Increases the damage of the Monk's Spinning Crane Kick by 10%.
    [273299] = true, -- 8.0 Monk Azerite Trait Sunrise Technique, Taking additional damage from Melee abilities.
    [337341] = true, -- 9.0 WW Monk: Skyreach Exhaustion, Keerer's Skyreach artifact CD

    -- WARRIOR

    -- DEMON HUNTER
    [1490] = true, -- 8.0 DH: Chaos Brand, Magic damage taken increased by 5%.
    [258860] = true, -- 8.0 DH: Dark Slash

    -- DEATH KNIGHT
    [214968] = true, -- 8.0 DK PvP Talent, Necrotic Aura, Taking 8% increased magical damage.
    [214975] = true, -- 8.0 DK PvP Talent, Heartstop Aura, Cooldown recovery rate decreased by 20%.
    [51714] = true, -- 8.0 Frost DK:  Razorice, Frost damage taken from the Death Knight's abilities increased by 3%.

    -- PALADIN
    [197277] = true, -- 8.0 Paladin: Judgement, Taking 25% increased damage from the Paladin's next Holy Power spender.
    [246807] = true, -- 8.0 Paladin PvP Talent: Lawbringer, Suffering up to 5% of maximum health in Holy damage when Judgment is cast.
    [204242] = true, -- 8.0 Paladin Holy, Consecration

    -- ROGUE
    [255909] = true, -- Rogue: Prey on the Weak, Damage taken increased by 10%. 6s
    [196937] = true, -- Outlaw Rogue: Ghostly Strike, Taking 10% increased damage from the Rogue's abilities.
    [137619] = true, -- Rogue: Marked for Death, Marked for Death will reset upon death.
    [91021] = true, -- Sub Rogue Talent: Find Weakness, 40% of armor is ignored by the attacking Rogue.
    [245389] = true, -- Assa Rogue Talent: Toxic Blade, 30% increased damage taken from poisons from the casting Rogue.
    [256148] = true, -- Assa Rogue Talent: Iron Wire, Damage done reduced by 15%.
    [154953] = true, -- Assa Rogue Talent: Internal Bleeding, Suffering (3.12% of Attack power) damage every 1 sec.
    [198222] = true, -- Assa Rogue PvP Talent: System Shock, Poison, Movement speed reduced by 90%. 2s
    -- [198097] = true, -- Assa Rogue PvP Talent: Creeping Venom, Poison, Suffering (2% of Attack power) Nature damage every 0.5 seconds.  Moving while afflicted by Creeping Poison causes it to refresh its duration to 4 sec.
    [197091] = true, -- Assa Rogue PvP Talent: Neurotoxin, Poison, Poisoned with a deadly neurotoxin.  Any ability used will incur an additional 3 second cooldown.
    [197051] = true, -- Assa Rogue PvP Talent: Mind-Numbing Poison, Poison, Casting spells while under the effects of Mind-numbing Poison will cause you to take Nature damage.


    -- MAGE
    [226757] = true, -- Fire Mage Talent: Conflagration, Deals (1.65% of Spell power) Fire damage every 2 sec.
    [12654] = true, -- Fire Mage: Ignite
    [2120] = true, -- Fire Mage, Flamestrike Slow, Physical 20% 8s

    -- WARLOCK
    [32390] = true, -- Aff Warlock Talent: Shadow Embrace
    [198590] = true, -- Aff Warlock: Drain Soul
    [234153] = true, -- Warlock: Drain Life

    -- HUNTER
    -- [131894] = true, -- Hunter: A Murder of Crows
    [259277] = true, -- Survival Hunter: Bloodseeker
    -- Wildfire Bombs
    -- [269747] = true, -- Wildfire Bomb
    [271049] = true, -- Volatile Wildfire
    [270339] = true, -- Scorching Shrapnel
    [270332] = true, -- Scorching Pheromones
    [132951] = true, -- Hunter Flare


}
]==]

--[=[
local hdr = CreateFrame("Frame", "TestGH", UIParent, "SecureGroupHeaderTemplate")
hdr:SetAttribute("template", "SecureUnitButtonTemplate")
hdr:SetAttribute("showRaid", true)
hdr:SetAttribute("showParty", true)
hdr:SetAttribute("showPlayer", true)
hdr:SetAttribute("showSolo", true)
hdr:SetAttribute("point", "LEFT")
-- hdr:SetAttribute("unitsPerColumn", 5)
-- hdr:SetAttribute("maxColumns", 8 )
hdr:SetAttribute("xOffset", 5)
hdr:SetAttribute("yOffset", 5)
hdr:SetAttribute("nameList", "Конкура,Лунаша")
hdr:SetAttribute("sortMethod", "NAMELIST")
hdr:SetSize(50, 50)
hdr:SetPoint("CENTER",0,0)


hdr.SetupUnitButton = function(header, frameName)
    local frame = _G[frameName]
    local t = frame:CreateTexture(nil, "ARTWORK")
    t:SetAllPoints(frame)
    t:SetTexture("Interface\\BUTTONS\\WHITE8X8")
    t:SetVertexColor(0,0,0, 0.5)
end

hdr:SetAttribute("initialConfigFunction", [[
    RegisterUnitWatch(self)
    self:SetWidth(50)
    self:SetHeight(50)

    self:SetAttribute("*type1","target")

    local header = self:GetParent()
    header:CallMethod("SetupUnitButton", self:GetName())
]])

hdr:Show()
]=]

--[[
local function getRelativePointAnchor( point )
    point = point:upper();
    if (point == "TOP") then
        return "BOTTOM", 0, -1;
    elseif (point == "BOTTOM") then
        return "TOP", 0, 1;
    elseif (point == "LEFT") then
        return "RIGHT", 1, 0;
    elseif (point == "RIGHT") then
        return "LEFT", -1, 0;
    elseif (point == "TOPLEFT") then
        return "BOTTOMRIGHT", 1, -1;
    elseif (point == "TOPRIGHT") then
        return "BOTTOMLEFT", -1, -1;
    elseif (point == "BOTTOMLEFT") then
        return "TOPRIGHT", 1, 1;
    elseif (point == "BOTTOMRIGHT") then
        return "TOPLEFT", -1, 1;
    else
        return "CENTER", 0, 0;
    end
end

function ConfigHeader(self, unitTable)
    local point = self:GetAttribute("point") or "TOP"; --default anchor point of "TOP"
    local relativePoint, xOffsetMult, yOffsetMult = getRelativePointAnchor(point);
    local xMultiplier, yMultiplier =  abs(xOffsetMult), abs(yOffsetMult);
    local xOffset = self:GetAttribute("xOffset") or 0; --default of 0
    local yOffset = self:GetAttribute("yOffset") or 0; --default of 0
    local sortDir = self:GetAttribute("sortDir") or "ASC"; --sort ascending by default
    local columnSpacing = self:GetAttribute("columnSpacing") or 0;
    local startingIndex = self:GetAttribute("startingIndex") or 1;

    -- local unitCount = #unitTable;
    local unitCount = 20;
    local numDisplayed = unitCount - (startingIndex - 1);
    local unitsPerColumn = self:GetAttribute("unitsPerColumn");
    local numColumns;
    if ( unitsPerColumn and numDisplayed > unitsPerColumn ) then
        numColumns = min( ceil(numDisplayed / unitsPerColumn), (self:GetAttribute("maxColumns") or 1) );
    else
        unitsPerColumn = numDisplayed;
        numColumns = 1;
    end
    print("numDisplayed, numColumns", numDisplayed, numColumns)
    local loopStart = startingIndex;
    local loopFinish = min((startingIndex - 1) + unitsPerColumn * numColumns, unitCount)
    local step = 1;

    numDisplayed = loopFinish - (loopStart - 1);

    if ( sortDir == "DESC" ) then
        loopStart = unitCount - (startingIndex - 1);
        loopFinish = loopStart - (numDisplayed - 1);
        step = -1;
    end

    -- -- ensure there are enough buttons
    -- local needButtons = max(1, numDisplayed);
    -- if not ( self:GetAttribute("child"..needButtons) ) then
    -- 	local buttonTemplate = self:GetAttribute("template");
    -- 	local templateType = self:GetAttribute("templateType") or "Button";
    -- 	local name = self:GetName();
    -- 	for i = 1, needButtons, 1 do
    -- 		local childAttr = "child" .. i;
    -- 		if not ( self:GetAttribute(childAttr) ) then
    -- 			local newButton = CreateFrame(templateType, name and (name.."UnitButton"..i), self, buttonTemplate);
    -- 			self[i] = newButton;
    -- 			SetupUnitButtonConfiguration(self, newButton);
    -- 			setAttributesWithoutResponse(self, childAttr, newButton, "frameref-"..childAttr, GetFrameHandle(newButton));
    -- 		end
    -- 	end
    -- end

    local columnAnchorPoint, columnRelPoint, colxMulti, colyMulti;
    if ( numColumns > 1 ) then
        columnAnchorPoint = self:GetAttribute("columnAnchorPoint");
        columnRelPoint, colxMulti, colyMulti = getRelativePointAnchor(columnAnchorPoint);
    end

    local buttonNum = 0;
    local columnNum = 1;
    local columnUnitCount = 0;
    local currentAnchor = self;
    for i = loopStart, loopFinish, step do
        buttonNum = buttonNum + 1;
        columnUnitCount = columnUnitCount + 1;
        if ( columnUnitCount > unitsPerColumn ) then
            columnUnitCount = 1;
            columnNum = columnNum + 1;
        end

        local unitButton = "Button"..buttonNum;
        if ( buttonNum == 1 ) then
            -- unitButton:SetPoint(point, currentAnchor, point, 0, 0);
            print("SetPoint point, currentAnchor, point", point, currentAnchor, point, 0, 0)
            if ( columnAnchorPoint ) then
                print("SetPoint columnAnchorPoint", columnAnchorPoint, currentAnchor, columnAnchorPoint, 0, 0)
                -- unitButton:SetPoint(columnAnchorPoint, currentAnchor, columnAnchorPoint, 0, 0);
            end

        elseif ( columnUnitCount == 1 ) then
            print(">>> FIRST COLUMN UNIT", unitButton)
            local columnAnchor = "button"..(buttonNum - unitsPerColumn);
            print(columnAnchorPoint, columnAnchor, columnRelPoint, colxMulti * columnSpacing, colyMulti * columnSpacing)
            -- unitButton:SetPoint(columnAnchorPoint, columnAnchor, columnRelPoint, colxMulti * columnSpacing, colyMulti * columnSpacing);
        else
            print("NORMAL UNIT", unitButton)
            print(point, currentAnchor, relativePoint, xMultiplier * xOffset, yMultiplier * yOffset)
            -- unitButton:SetPoint(point, currentAnchor, relativePoint, xMultiplier * xOffset, yMultiplier * yOffset);
        end
        -- unitButton:SetAttribute("unit", unitTable[i]);

        -- local configCode = unitButton:GetAttribute("refreshUnitChange");
        -- if ( type(configCode) == "string" ) then
        -- 	local selfHandle = GetFrameHandle(unitButton);
        -- 	if ( selfHandle ) then
        -- 		CallRestrictedClosure(unitButton, "self",
        -- 		                      GetManagedEnvironment(unitButton, true),
        -- 		                      selfHandle, configCode, selfHandle);
        -- 	end
        -- end

        -- if not unitButton:GetAttribute("statehidden") then
        -- 	unitButton:Show();
        -- end

        currentAnchor = unitButton;
    end
end
]]


function addon.CreateAlphaDriver()
    local f = CreateFrame("Frame", "NugCustomAlphaDriver", UIParent)
    f:SetFrameStrata("HIGH")

    f:SetSize(700, 160)
    f:SetPoint("BOTTOM",0,0)

    f.alphaFrames = {
        -- [NugArtMainMenuBackground] = true,
        -- [oUF_NugVials] = true,
    }

    local rawSetAlpha = f.SetAlpha

    f.Add = function(self, frame)
        self.alphaFrames[frame] = true
        -- frame.SetAlpha = function() end
    end

    f:Add(NugArtMainMenuBackground)
    f:Add(oUF_NugVials)
    local bars = {"ActionButton","MultiBarBottomLeftButton","MultiBarBottomRightButton","MultiBarLeftButton","MultiBarRightButton"}
    for _,bar in ipairs(bars) do
        for i = 1,12 do
            local btn = getglobal(bar..i)
            f:Add(btn)
        end
    end


    f:SetScript("OnEnter", function(self)
        for frame in pairs(self.alphaFrames) do
            frame:SetAlpha(1)
        end
    end)

    f:SetScript("OnLeave", function(self)
        for frame in pairs(self.alphaFrames) do
            frame:SetAlpha(0)
        end
    end)
    f:EnableMouse(false)

end



local function IsCombatItem(class, subclass, slot)
	return slot ~= 'INVTYPE_TABARD' and slot ~= 'INVTYPE_BODY' and subclass ~= FISHING_POLE
end

local POOR, COMMON, UNCOMMON, RARE, EPIC = 0,1,2,3,4
local function IsStandardQuality(quality)
	return quality >= UNCOMMON and quality <= EPIC
end

local ScanTip = CreateFrame("GameTooltip", "NCScanTip", nil, "GameTooltipTemplate")
ScanTip:SetOwner(UIParent, "ANCHOR_NONE")
function ScanTip:Load(link, bag, slot)
    self:SetOwner(UIParent, 'ANCHOR_NONE')

	if bag and slot then
		if bag ~= BANK_CONTAINER then
			self:SetBagItem(bag, slot)
		else
			self:SetInventoryItem('player', BankButtonIDToInvSlotID(slot))
		end
	else
		self:SetHyperlink(link)
	end

	self.limit = 2
	self.numLines = self:NumLines()
end
function ScanTip:ScanLine(i)
	local line = _G[self:GetName() .. 'TextLeft' .. i]
	return line and line:GetText() or ''
end

local CAN_TRADE = BIND_TRADE_TIME_REMAINING:format('.*')
local CAN_REFUND = REFUND_TIME_REMAINING:format('.*')
local MATCH_CLASS = ITEM_CLASSES_ALLOWED:format('')
local IN_SET = EQUIPMENT_SETS:format('.*')
local function BelongsToSet()
	return C_EquipmentSet and C_EquipmentSet.CanUseEquipmentSets() and ScanTip:ScanLine(ScanTip.numLines - 1):find(IN_SET)
end

local function IsSoulbound(bag, slot)
	local lastLine = ScanTip:ScanLine(ScanTip.numLines)
	local soulbound = bag and slot and ITEM_SOULBOUND or ITEM_BIND_ON_PICKUP

	if not lastLine:find(CAN_TRADE) and not lastLine:find(CAN_REFUND) then
		for i = 2,7 do
			if ScanTip:ScanLine(i) == soulbound then
				ScanTip.limit = i
				return true
			end
		end
	end
end

local function IsLowLevelGear(link, itemLevelThreshold)
    local itemLevel = GetDetailedItemLevelInfo(link)
    return itemLevel <= itemLevelThreshold
end

local WEAPON, ARMOR, CONSUMABLES = LE_ITEM_CLASS_WEAPON, LE_ITEM_CLASS_ARMOR, LE_ITEM_CLASS_CONSUMABLE
local function IsJunk(bag, position, itemLevelThreshold)
    local link = GetContainerItemLink(bag, position)
    if not link then return false end

    local _, _, quality, _,_,_,_,_, slot, _, value, class, subclass = GetItemInfo(link)

    if not value or value == 0 then
        return

    elseif class == ARMOR or class == WEAPON then
		if value and IsCombatItem(class, subclass, slot) then
			-- if quality == POOR then
				-- return (slot ~= 'INVTYPE_SHOULDER' and level > 15) or level > 25
			if IsStandardQuality(quality) then
				ScanTip:Load(link, bag, position)

				if not BelongsToSet() and IsSoulbound(bag, position) then
					return IsLowLevelGear(link, itemLevelThreshold)
				end
			end
        end
    elseif quality == POOR then
		return true
	elseif class == CONSUMABLES then
		return false
    end
end


local function PrintTotal(totalValue)
    local tvGold = math.floor(totalValue / 10000)
    print(string.format("TOTAL: %dg", tvGold))
end

function SellOldGear(itemLevelThreshold)
    if not MerchantFrame:IsShown() then return end

    local maxItems = 12
    local numItemsSold = 0
    local totalValue = 0
    for bag=0,4 do
        for slot=1,GetContainerNumSlots(bag) do
            if IsJunk(bag, slot, itemLevelThreshold) then
                local _, count, _,_,_,_, link = GetContainerItemInfo(bag, slot)
                local _, _, quality, _,_,_,_,_, _, _, value = GetItemInfo(link)

                UseContainerItem(bag, slot)
                PickupMerchantItem()

                local stackValue = (value or 0) * count
                totalValue = totalValue + stackValue
                print("Sold ", link)

                numItemsSold = numItemsSold + 1

                if numItemsSold == maxItems then
                    return PrintTotal(totalValue)
                end
            end
        end
    end

    PrintTotal(totalValue)
end
