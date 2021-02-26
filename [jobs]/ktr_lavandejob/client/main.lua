ESX                           = nil

local cachedBins = {}

Citizen.CreateThread(function ()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) 
            ESX = obj 
        end)

        Citizen.Wait(5)
    end
end)



Citizen.CreateThread(function()
    Citizen.Wait(100)

    for locationIndex2 = 1, #Config.BinsAvailable do
        local locationPos2 = Config.BinsAvailable[locationIndex2]

   --     local blip = AddBlipForCoord(locationPos)

        SetBlipSprite (blip, 409)
        SetBlipDisplay(blip, 4)
        SetBlipScale  (blip, 0.8)
        SetBlipColour (blip, 48)
        SetBlipAsShortRange(blip, true)

        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("Sell Bottles")
        EndTextCommandSetBlipName(blip)
    end




    while true do
        local sleepThread = 500

        local ped = PlayerPedId()
        local pedCoords = GetEntityCoords(ped)

        for locationIndex2 = 1, #Config.BinsAvailable do
            local locationPos2 = Config.BinsAvailable[locationIndex2]

            local dstCheck = GetDistanceBetweenCoords(pedCoords, locationPos2, true)

            if dstCheck <= 10.0 then
                sleepThread = 5

                local text = "Récolter"

                if dstCheck <= 9.5 then
                    text = "[~g~E~s~] " .. text

                    if IsControlJustReleased(0, 38) then
                        OpenTrashCan()
                    end
                end
                
                ESX.Game.Utils.DrawText3D(locationPos2, text, 0.6)
            end
        end

        Citizen.Wait(sleepThread)
    end
end)


--[[Citizen.CreateThread(function()
    Citizen.Wait(100)

for locationIndex2 = 1, #Config.BinsAvailable do
        local locationPos2 = Config.BinsAvailable[locationIndex2]


    while true do
      local ped = PlayerPedId()
        local pedCoords = GetEntityCoords(ped)

        for locationIndex2 = 1, #Config.BinsAvailable do
            local locationPos2 = Config.BinsAvailable[locationIndex2]

            local dstCheck = GetDistanceBetweenCoords(pedCoords, locationPos, true)

            if dstCheck <= 5.0 then
                sleepThread = 5

         --   ESX.Game.Utils.DrawText3D(binCoords + vector3(0.0, 0.0, 0.5), "[~g~E~s~] Pommier", 0.4)
         local text = "Récolter"

            if IsControlJustReleased(0, 38) then
                if not cachedBins[entity] then
                    cachedBins[entity] = true

                    OpenTrashCan()
                    end
                end
                else
                    ESX.ShowNotification("Fouillé un autre arbre !")
                end
        end

end


        Citizen.Wait(sleepThread)
    end
end)]]
RegisterNetEvent('ktr_lavandejob:clearped')
AddEventHandler("ktr_lavandejob:clearped", function()

 ClearPedTasks(PlayerPedId())

end)


function OpenTrashCan()
    TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_BUM_BIN", 0, true)

    Citizen.Wait(3000)

    TriggerServerEvent("ktr_lavandejob:retrieveBottle")

    Citizen.Wait(3000)

    TriggerServerEvent("ktr_lavandejob:retrieveBottle")

    Citizen.Wait(3000)

    TriggerServerEvent("ktr_lavandejob:retrieveBottle")

    ClearPedTasks(PlayerPedId())

 --   OpenTrashCan()
end




Citizen.CreateThread(function()
    Citizen.Wait(100)

    for locationIndex2 = 1, #Config.BinsAvailable2 do
        local locationPos2 = Config.BinsAvailable2[locationIndex2]

   --     local blip = AddBlipForCoord(locationPos)

        SetBlipSprite (blip, 409)
        SetBlipDisplay(blip, 4)
        SetBlipScale  (blip, 0.8)
        SetBlipColour (blip, 48)
        SetBlipAsShortRange(blip, true)

        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("Sell Bottles")
        EndTextCommandSetBlipName(blip)
    end




    while true do
        local sleepThread = 500

        local ped = PlayerPedId()
        local pedCoords = GetEntityCoords(ped)

        for locationIndex2 = 1, #Config.BinsAvailable2 do
            local locationPos2 = Config.BinsAvailable2[locationIndex2]

            local dstCheck = GetDistanceBetweenCoords(pedCoords, locationPos2, true)

            if dstCheck <= 10.0 then
                sleepThread = 5

                local text = "Récolter"

                if dstCheck <= 9.5 then
                    text = "[~g~E~s~] " .. text

                    if IsControlJustReleased(0, 38) then
                        OpenTrashCan2()
                    end
                end
                
                ESX.Game.Utils.DrawText3D(locationPos2, text, 0.6)
            end
        end

        Citizen.Wait(sleepThread)
    end
end)

function OpenTrashCan2()
    TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_BUM_BIN", 0, true)

    Citizen.Wait(3000)

    TriggerServerEvent("ktr_lavandejob:retrieveBottle2")

    Citizen.Wait(3000)

    TriggerServerEvent("ktr_lavandejob:retrieveBottle2")

    Citizen.Wait(3000)

    TriggerServerEvent("ktr_lavandejob:retrieveBottle2")

    ClearPedTasks(PlayerPedId())

 --   OpenTrashCan()
end