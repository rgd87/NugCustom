local addonName, addon = ...

local cvars = {
    -- Controls
    -- autoClearAFK        = "1",
    -- autoDismountFlying  = "0",
    -- autoDismount        = "0", -- no UI
    -- autointeract        = "0",
    -- autoLootDefault     = "1",
    -- autoOpenLootHistory = "0",
    -- autoStand           = "0", -- no UI
    -- autoUnshift         = "0", -- no UI
    -- blockChannelInvites = "1",
    -- blockTrades         = "0",
    -- deselectOnClick     = "1", -- Sticky Targeting, 0 = ON, 1 = OFF
    -- interactOnLeftClick = "0",
    -- lootUnderMouse      = "0",
    -- synchronizeBindings = "1", -- no UI
    -- synchronizeConfig   = "1", -- no UI
    -- synchronizeMacros   = "1", -- no UI
    -- synchronizeSettings = "1", -- no UI

    -- Combat
    -- ActionButtonUseKeyDown         = "0",
    -- assistAttack                   = "0",
    -- autoSelfCast                   = "0",
    -- displaySpellActivationOverlays = "1",
    -- lossOfControl                  = "1",
    -- lossOfControlDisarm            = "2",
    -- lossOfControlFull              = "2",
    -- lossOfControlInterrupt         = "2",
    -- lossOfControlRoot              = "2",
    -- lossOfControlSilence           = "2",
    -- spellActivationOverlayOpacity  = "1",
    -- stopAutoAttackOnTargetChange   = "0",

    -- Display
    -- displayFreeBagSlots           = "0",
    -- displayWorldPVPObjectives     = "2", -- no UI
    -- dontShowEquipmentSetsOnItems  = "0", -- no UI
    -- movieSubtitle                 = "1",
    -- Outline                       = "1", -- Quest Objectives Only
    screenEdgeFlash               = "0", -- no UI
    doNotFlashLowHealthWarning    = "1",
    -- serviceTypeFilter             = "2", -- no UI
    -- showQuestTrackingTooltips     = "1", -- no UI
    threatShowNumeric             = "1",
    -- threatPlaySounds              = "0",
    -- timeMgrUseLocalTime           = "1", -- no UI

    -- Objectives
    -- autoQuestWatch     = "1",
    -- autoQuestProgress  = "0", -- no UI
    -- mapFade            = "0",
    -- mapQuestDifficulty = "0",
    trackQuestSorting  = "proximity",
    -- watchFrameWidth    = "1",

    -- Social
    chatBubbles              = "1",
    chatBubblesParty         = "0",
    chatStyle                = "classic",
    whisperMode              = "popout_and_inline",
    -- chatTimestamps           = "none",
    colorChatNamesByClass    = "1", -- no UI
    chatClassColorOverride   = "0", -- 0 means always use class colors
    -- guildMemberNotify        = "0",
    profanityFilter          = "0",
    removeChatDelay          = "1",
    showToastWindow          = "0",
    -- spamFilter               = "1",
    -- wholeChatWindowClickable = "0", -- no UI

    -- Floating Combat Text
    -- enableFloatingCombatText        = "0",
    -- floatingCombatTextCombatDamageDirectionalScale = "0", -- disable fountain spray effect
    -- floatingCombatTextCombatHealingAbsorbTarget    = "0",
    -- floatingCombatTextLowManaHealth = "0",
    -- floatingCombatTextReactives     = "0",

    -- Nameplates
    nameplateMotion              = "1", -- 1 =  Stacking, 0 = Overlapping
    -- nameplateOtherBottomInset    = "-1", -- don't stick nameplates to the screen edges for offscreen mobs
    -- nameplateOtherTopInset       = "-1",
    nameplateShowAll             = "1", -- always show nameplates, not just in combat, if they're enabled

    nameplateShowSelf            = "0",
    nameplateMaxDistance         = "50",

    -- nameplateShowFriends        = "0",
    nameplateOtherAtBase        = "0", -- 2 = at base
    nameplateMinAlpha           = "0.6", -- def: 0.6

    nameplateShowOnlyNames      = "0",

    NamePlateVerticalScale      = "1",
    NamePlateHorizontalScale    = "1",
    nameplateShowDebuffsOnFriendly = "1",

    nameplateShowEnemyGuardians = "0",
    nameplateShowEnemyMinions   = "0",
    nameplateShowEnemyMinus     = "1",
    nameplateShowEnemyPets      = "1",
    nameplateShowEnemyTotems    = "1",

    nameplateShowFriendlyTotems    = "1",


    -- Unit Frames
    -- fullSizeFocusFrame   = "1",
    -- showArenaEnemyFrames = "1",
    -- showTargetOfTarget   = "1",

    -- Unit Names
    -- UnitNameOwn                  = "0",
    -- UnitNameGuildTitle           = "0",
    -- UnitNamePlayerGuild          = "0",
    -- UnitNamePlayerPVPTitle       = "0",
    -- UnitNameFriendlyGuardianName = "0",
    -- UnitNameFriendlyPetName      = "0",
    -- UnitNameFriendlyPlayerName   = "0",
    -- UnitNameFriendlyTotemName    = "0",
    -- UnitNameEnemyPlayerName      = "1",
    -- UnitNameEnemyPetName         = "1",
    -- UnitNameEnemyGuardianName    = "1",
    -- UnitNameEnemyTotemName       = "1",
    -- UnitNameFriendlySpecialNPCName = "1", -- Quest NPCs
    -- UnitNameHostleNPC            = "0", -- typo accurate
    -- UnitNameInteractiveNPC       = "0",
    -- UnitNameNPC                  = "0",
    -- ShowQuestUnitCircles         = "1",

    displaySpellActivationOverlays = "0",
    spellActivationOverlayOpacity = "0",

    -- Camera
    cameraDistanceMaxZoomFactor = "2.6",
    cameraSmoothStyle           = "0",   -- Never adjust

    -- Tab target

    -- Help
    scriptErrors  = "1",
    showTutorials = "0",

    -- Miscellaneous
    addFriendInfoShown = "1",
    screenshotFormat   = "jpeg",
    screenshotQuality  = "8",
    talentFrameShown   = "1",


    rawMouseEnable		= "1", -- fix mouse cursor reset bug
    ClipCursor			= "1",
    -- Graphics
    -- ffxGlow             = "0", -- full screen glow
    -- groundEffectDist    = "100",
    -- groundEffectDensity = "128",
    -- maxfps              = "30",
    -- maxfpsbk            = "15",
    -- pathSmoothing       = "1",
    WeatherDensity      = "3",
    uiScale             = "0.8",
    useUiScale          = "1", -- never wanted this before, but its behavior is different in 7.1
    violenceLevel       = "5", -- min 0, max 5
    SpellQueueWindow	= "200",
}

local isClassic = select(4,GetBuildInfo()) <= 19999
if isClassic then
    cvars.displaySpellActivationOverlays = nil
    cvars.spellActivationOverlayOpacity = nil
    cvars.threatShowNumeric = nil
    cvars.nameplateShowSelf = nil
end

function addon:FixCVars()
    SetAutoDeclineGuildInvites(true)
    -- ShowAccountAchievements(true) -- show ONLY account achievements
    -- ConsoleExec("fixedfunction 1") -- disable "tunnel vision" glow effect (not a cvar)
    if not isClassic then
        SetSortBagsRightToLeft(false)
    end

    for cvar, value in pairs(cvars) do
        local current = tostring(GetCVar(cvar))
        if current ~= value then
            print("|cff9f7fffSetCVar|r", cvar, current, "|cffff9f7f==>|r", value)
            SetCVar(cvar, value)
        end
    end

    -- hooksecurefunc("SetCVar", function(k, v)
    --     local o = cvars[k]
    --     if o and tostring(v) ~= o then
    --         print("|cffff9f7fSetCVar|r", k, o, "|cffff9f7f==>|r", v)
    --     end
    -- end
end
