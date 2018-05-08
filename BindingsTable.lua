local function FeedBindingTable(t)
    LoadBindings(2) -- 2 = character bindings
    for key, command in pairs(t) do
        if GetBindingAction(key) ~= command then
            SetBinding(key, command)
        end
    end
    SaveBindings(2)
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
        ["ALT-BUTTON4"] = "MULTIACTIONBAR1BUTTON11",
        ["F4"] = "MULTIACTIONBAR1BUTTON11",
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

        ["SHIFT-Z"] = "TOGGLESHEATH",
        ["Z"] = "MULTIACTIONBAR4BUTTON12", --mount
        -- ["SHIFT-SPACE"] = "MULTIACTIONBAR4BUTTON12",
        ["SHIFT-X"] = "SITORSTAND",

        ["ALT-Y"] = "five", -- prat channel command

        ["ALT-P"] = "TOGGLEPETJOURNAL",
        ["NUMPAD1"] = "Toggle Autosummon",
        ["NUMPAD2"] = "Summon Random Pet",
        ["NUMPAD3"] = "Dismiss + Disable",

        ["SHIFT-MOUSEWHEELDOWN"] = "TARGETNEARESTENEMY",
        ["SHIFT-MOUSEWHEELUP"] = "TARGETPREVIOUSENEMY",

        ["U"] = "TOGGLEGUILDTAB",
        ["K"] = "NAMEPLATES",
        ["ALT-K"] = "FRIENDNAMEPLATES",
        ["I"] = "Inspect",
        ["Y"] = "REPLY",
        ["SHIFT-C"] = "NEXTACTIONPAGE",
        ["SHIFT-V"] = "ACTIONPAGE1",
    }

    FeedBindingTable(globalBindings)
    if doActionBars then FeedBindingTable(actionBars) end
end