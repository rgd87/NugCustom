function AddonUsage()
    local num = GetNumAddOns()
    local totalMemory = 0
    local list = {}
    UpdateAddOnMemoryUsage()
    for i = 1, num do
        local name = GetAddOnInfo(i)
        local mem = GetAddOnMemoryUsage(i)
        if mem > 1 then
        table.insert(list,{ name = name, memory = mem })
        totalMemory = totalMemory + mem
        end
    end
    table.sort(list,function(a,b) if a.memory > b.memory then return true end end)
    for i=1,#list do
        print (string.format("%s - %d KB",list[i].name,list[i].memory))
    end
    print (string.format("TOTAL: %.1f MB",totalMemory/1024))
end

function CPUUsage()
    local num = GetNumAddOns()
    local totalTime = GetScriptCPUUsage()
    local list = {}
    UpdateAddOnCPUUsage()
    for i = 1, num do
        local name = GetAddOnInfo(i)
        local time = GetAddOnCPUUsage(i)
        table.insert(list,{ name = name, time = time })
    end
    table.sort(list,function(a,b) if a.time > b.time then return true end end)
    for i=1,#list do
        local time = list[i].time/totalTime*100
        if time > 0 then
            print (string.format("%s - %.5f ",list[i].name, time))
        end
    end
    print (string.format("TOTAL: %d ",totalTime))
--~     ResetCPUUsage() 
end

function ToggleCPUProfiling()
    SetCVar("scriptProfile", (GetCVar("scriptProfile") == "1") and "0" or "1")
    ReloadUI()
end