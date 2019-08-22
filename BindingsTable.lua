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

function EnsureBindings(doActionBars)
    local actionBars = {
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
        ["F3"] = "MULTIACTIONBAR1BUTTON11",
        ["F4"] = "MULTIACTIONBAR1BUTTON12",

        ["ALT-F1"] = "MULTIACTIONBAR2BUTTON5",
        ["ALT-G"] = "MULTIACTIONBAR2BUTTON6",
        ["G"] = "MULTIACTIONBAR2BUTTON7",
        ["H"] = "MULTIACTIONBAR2BUTTON8",
        ["6"] = "MULTIACTIONBAR2BUTTON9",
        ["C"] = "MULTIACTIONBAR2BUTTON10",
        ["SHIFT-BUTTON4"] = "MULTIACTIONBAR2BUTTON11",
        ["V"] = "MULTIACTIONBAR2BUTTON12",
    }

    local globalBindings = {
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

        ["SHIFT-MOUSEWHEELDOWN"] = "TARGETNEARESTENEMY",
        ["SHIFT-MOUSEWHEELUP"] = "TARGETPREVIOUSENEMY",

        ["J"] = "TOGGLEGUILDTAB",
        ["SHIFT-U"] = "TOGGLECHATTAB",
        ["SHIFT-J"] = "TOGGLEENCOUNTERJOURNAL",
        ["K"] = "NAMEPLATES",
        ["ALT-K"] = "FRIENDNAMEPLATES",
        ["I"] = "Inspect",
        ["Y"] = "REPLY",
        ["SHIFT-7"] = "NEXTACTIONPAGE",
        ["SHIFT-8"] = "ACTIONPAGE1",
        ["SHIFT-C"] = "NONE",
        ["SHIFT-V"] = "NONE",
    }

    FeedBindingTable(globalBindings)
    if doActionBars then FeedBindingTable(actionBars) end
end