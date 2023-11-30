local function FeedBindingTable(t)
    LoadBindings(2) -- 2 = character bindings
    for key, command in pairs(t) do
        if command == "NONE" then command = nil end
        if GetBindingAction(key) ~= command then
            SetBinding(key, command)
        end
    end
    if SaveBindings then
        SaveBindings(2)
    else
        AttemptToSaveBindings(2)
    end
end

function EnsureBindings(...)
    local bindTable = {
        bars = {
            ["1"] = "ACTIONBUTTON1",
            ["2"] = "ACTIONBUTTON2",
            ["3"] = "ACTIONBUTTON3",
            ["4"] = "ACTIONBUTTON4",
            ["5"] = "ACTIONBUTTON5",
            ["E"] = "ACTIONBUTTON6",
            ["F"] = "ACTIONBUTTON7",
            ["R"] = "ACTIONBUTTON8",
            ["Q"] = "ACTIONBUTTON9",
            ["F2"] =        "ACTIONBUTTON10",
            ["BUTTON4"] =   "ACTIONBUTTON11",
            ["NUMPAD4"] =   "ACTIONBUTTON11", -- Duplicate of BUTTON4
            ["F1"] =        "ACTIONBUTTON12",

            ["ALT-1"] = "MULTIACTIONBAR1BUTTON1",
            ["ALT-2"] = "MULTIACTIONBAR1BUTTON2",
            ["ALT-3"] = "MULTIACTIONBAR1BUTTON3",
            ["ALT-4"] = "MULTIACTIONBAR1BUTTON4",
            ["ALT-5"] = "MULTIACTIONBAR1BUTTON5",
            ["ALT-E"] = "MULTIACTIONBAR1BUTTON6",
            ["ALT-F"] = "MULTIACTIONBAR1BUTTON7",
            ["ALT-R"] = "MULTIACTIONBAR1BUTTON8",
            ["ALT-Q"] = "MULTIACTIONBAR1BUTTON9",
            ["ALT-F2"] = "MULTIACTIONBAR1BUTTON10",
            ["ALT-BUTTON4"] = "MULTIACTIONBAR1BUTTON11",
            ["ALT-NUMPAD4"] = "MULTIACTIONBAR1BUTTON11",
            ["ALT-F1"] = "MULTIACTIONBAR1BUTTON12",

            --f3 f4, T
            ["BUTTON5"] = "MULTIACTIONBAR2BUTTON1",
            ["ALT-BUTTON5"] = "MULTIACTIONBAR2BUTTON2",
            ["F3"] = "MULTIACTIONBAR2BUTTON3",
            ["F4"] = "MULTIACTIONBAR2BUTTON4",
            ["F5"] = "MULTIACTIONBAR2BUTTON5",
            ["SHIFT-G"] = "MULTIACTIONBAR2BUTTON6",
            ["G"] = "MULTIACTIONBAR2BUTTON7",
            ["H"] = "MULTIACTIONBAR2BUTTON8",
            ["T"] = "MULTIACTIONBAR2BUTTON9",
            ["X"] = "MULTIACTIONBAR2BUTTON10",
            ["C"] = "MULTIACTIONBAR2BUTTON11",
            ["V"] = "MULTIACTIONBAR2BUTTON12",

            ["SHIFT-1"] = "MULTIACTIONBAR3BUTTON1",
            ["6"] = "MULTIACTIONBAR3BUTTON2",
            ["SHIFT-2"] = "MULTIACTIONBAR3BUTTON2",
            ["SHIFT-3"] = "MULTIACTIONBAR3BUTTON3",
            ["SHIFT-4"] = "MULTIACTIONBAR3BUTTON4",
            ["SHIFT-5"] = "MULTIACTIONBAR3BUTTON5",
            ["SHIFT-E"] = "MULTIACTIONBAR3BUTTON6",
            ["SHIFT-F"] = "MULTIACTIONBAR3BUTTON7",
            ["SHIFT-R"] = "MULTIACTIONBAR3BUTTON8",
            ["SHIFT-Q"] = "MULTIACTIONBAR3BUTTON9",
            ["SHIFT-F2"] = "MULTIACTIONBAR3BUTTON10",
            ["SHIFT-BUTTON4"] = "MULTIACTIONBAR3BUTTON11",
            ["SHIFT-NUMPAD4"] = "MULTIACTIONBAR3BUTTON11",
            ["SHIFT-F1"] = "MULTIACTIONBAR3BUTTON12",

            ["CTRL-1"] = "MULTIACTIONBAR4BUTTON1",
            ["CTRL-2"] = "MULTIACTIONBAR4BUTTON2",
            ["CTRL-3"] = "MULTIACTIONBAR4BUTTON3",
            ["CTRL-4"] = "MULTIACTIONBAR4BUTTON4",
            ["CTRL-5"] = "MULTIACTIONBAR4BUTTON5",
            ["CTRL-E"] = "MULTIACTIONBAR4BUTTON6",
            ["CTRL-F"] = "MULTIACTIONBAR4BUTTON7",
            ["CTRL-R"] = "MULTIACTIONBAR4BUTTON8",
            ["CTRL-Q"] = "MULTIACTIONBAR4BUTTON9",
            ["CTRL-F2"] = "MULTIACTIONBAR4BUTTON10",
            -- ["CTRL-BUTTON4"] = "MULTIACTIONBAR4BUTTON11",
            -- ["CTRL-F1"] = "MULTIACTIONBAR4BUTTON12",
        },
        pvp = {
            ["ALT-CTRL-Z"] = "TOGGLEUI",
            ["ALT-Z"] = "NONE",
            ["ALT-CTRL-MOUSEWHEELUP"] = "VEHICLEAIMINCREMENT",
            ["ALT-CTRL-MOUSEWHEELDOWN"] = "VEHICLEAIMDECREMENT", -- raise/lower head

            ["SHIFT-MOUSEWHEELUP"] = "TARGETSELF",
            ["SHIFT-MOUSEWHEELDOWN"] = "TARGETPARTYMEMBER1",
            ["SHIFT-BUTTON3"] = "TARGETPARTYMEMBER2",

            ["CTRL-MOUSEWHEELUP"] = "TARGETARENA1",
            ["CTRL-MOUSEWHEELDOWN"] = "TARGETARENA2",
            ["CTRL-BUTTON3"] = "TARGETARENA3",

            ["SHIFT-1"] = "MULTIACTIONBAR3BUTTON1",
            ["SHIFT-2"] = "MULTIACTIONBAR3BUTTON2",
            ["SHIFT-3"] = "TARGETARENA1",
            ["SHIFT-4"] = "TARGETARENA2",
            ["SHIFT-5"] = "TARGETARENA3",

            ["CTRL-BUTTON5"] = "FOCUSTARGET",
            ["CTRL-BUTTON4"] = "MACRO ClearFocus", --

            ["ALT-CTRL-3"] = "MACRO PHeal1",
            ["ALT-CTRL-4"] = "MACRO PHeal2",
            ["ALT-CTRL-5"] = "MACRO PHeal3",

            ["ALT-SHIFT-3"] = "MACRO PDispel1",
            ["ALT-SHIFT-4"] = "MACRO PDispel2",
            ["ALT-SHIFT-5"] = "MACRO PDispel3",
        },
        pet = {
            ["F"] = "BONUSACTIONBUTTON1",
            ["V"] = "BONUSACTIONBUTTON2",
            ["ALT-F"] = "BONUSACTIONBUTTON3",
        },
        stealth = {
            -- Reverse F and F3 for stealth button
            ["F3"] = "ACTIONBUTTON7",
            ["F"] = "MULTIACTIONBAR2BUTTON3",
        },
        global = {
            ["BUTTON3"] = "TOGGLEAUTORUN",
            ["A"] = "STRAFELEFT",
            ["D"] = "STRAFERIGHT",
            ["F6"] = "RAIDTARGET8",
            ["F7"] = "MULTIACTIONBAR4BUTTON11", --marker macro
            ["F8"] = "RAIDTARGET7",
            ["F9"] = "RAIDTARGET5",
            ["F10"] = "RAIDTARGET1",
            ["F11"] = "NONE",

            ["U"] = "TOGGLECHARACTER0",

            ["SHIFT-Z"] = "TOGGLESHEATH",
            ["Z"] = "MULTIACTIONBAR4BUTTON12", --mount
            -- ["SHIFT-SPACE"] = "MULTIACTIONBAR4BUTTON12",
            ["SHIFT-X"] = "SITORSTAND",

            ["ALT-Y"] = "NUGCUSTOM_CHANNELKEY1", -- /5 channel command
            ["SHIFT-T"] = "NUGCUSTOM_OBJECTIVE_TOGGLE", -- toggle objective tracker


            ["ALT-P"] = "TOGGLECOLLECTIONSPETJOURNAL",
            ["SHIFT-P"] = "TOGGLECOLLECTIONS",
            ["NUMPAD1"] = "NUGMINIPETTOGGLE",
            ["NUMPAD2"] = "NUGMINIPETRANDOMPET",
            ["NUMPAD3"] = "NUGMINIPETDISABLE",

            -- ["SHIFT-MOUSEWHEELDOWN"] = "TARGETNEARESTENEMY",
            -- ["SHIFT-MOUSEWHEELUP"] = "TARGETPREVIOUSENEMY",

            [";"] = "TOGGLEGUILDTAB",
            ["SHIFT-;"] = "TOGGLECHATTAB",
            ["J"] = "TOGGLEQUESTLOG",
            ["SHIFT-J"] = "TOGGLEENCOUNTERJOURNAL",

            ["SHIFT-K"] = "NAMEPLATES",
            ["ALT-K"] = "FRIENDNAMEPLATES",
            ["K"] = "NONE",
            ["I"] = "TOGGLEBACKPACK",
            ["SHIFT-I"] = "Inspect",
            ["Y"] = "REPLY",
            ["SHIFT-7"] = "NEXTACTIONPAGE",
            ["SHIFT-8"] = "ACTIONPAGE1",
            ["SHIFT-C"] = "NONE",
            ["SHIFT-V"] = "NONE",
        }
    }

    for i,setName in ipairs({ "global", ... }) do
        local t = bindTable[setName]
        if t then
            FeedBindingTable(t)
        else
            print(setName, "not found")
        end
    end
end
