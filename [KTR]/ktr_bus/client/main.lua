ESX                           = nil

local PlayerData              = {}

Citizen.CreateThread(function ()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(1)
    end

    while ESX.GetPlayerData() == nil do
        Citizen.Wait(10)
    end

    PlayerData = ESX.GetPlayerData()

    LoadMarkers()
end) 

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    PlayerData.job = job
end)

function LoadMarkers()
    Citizen.CreateThread(function()
    
        while true do
            Citizen.Wait(5)

            local plyCoords = GetEntityCoords(PlayerPedId())

            for location, val in pairs(Config.Teleporters) do

                local Enter = val['Enter']
                local Exit = val['Exit']
                local JobNeeded = val['Job']

                local dstCheckEnter, dstCheckExit = GetDistanceBetweenCoords(plyCoords, Enter['x'], Enter['y'], Enter['z'], true), GetDistanceBetweenCoords(plyCoords, Exit['x'], Exit['y'], Exit['z'], true)

                if dstCheckEnter <= 7.5 then
                    if JobNeeded ~= 'none' then
                        if PlayerData.job.name == JobNeeded then

                            DrawM(Enter['Information'], 39, Enter['x'], Enter['y'], Enter['z'])

                            if dstCheckEnter <= 1.2 then
                                if IsControlJustPressed(0, 38) then
                                    Teleport(val, 'enter')
                                end
                            end

                        end
                    else
                        DrawM(Enter['Information'], 39, Enter['x'], Enter['y'], Enter['z'])

                        if dstCheckEnter <= 1.2 then

                            if IsControlJustPressed(0, 38) then
                                Teleport(val, 'enter')
                            end

                        end

                    end
                end

                if dstCheckExit <= 7.5 then
                    if JobNeeded ~= 'none' then
                        if PlayerData.job.name == JobNeeded then

                            DrawM(Exit['Information'], 39, Exit['x'], Exit['y'], Exit['z'])

                            if dstCheckExit <= 1.2 then
                                if IsControlJustPressed(0, 38) then
                                    Teleport(val, 'exit')
                                end
                            end

                        end
                    else

                        DrawM(Exit['Information'], 39, Exit['x'], Exit['y'], Exit['z'])

                        if dstCheckExit <= 1.2 then

                            if IsControlJustPressed(0, 38) then
                                Teleport(val, 'exit')
                            end

                        end
                    end
                end

            end

        end

    end)
end

function Teleport(table, location)
    if location == 'enter' then
					TriggerServerEvent("bus",300)
                    PlaySound(-1, 'RACE_PLACED', 'HUD_AWARDS', false, 0, true)
					ESX.ShowNotification(('~r~ Vous venez d\'etre débiter de 300 $'))
					TriggerServerEvent('esx_joblogs:AddInLog', "bus", "bus", GetPlayerName(PlayerId()))
                    Citizen.Wait(200)
                    TriggerEvent('esx_status:setDisplay', 0.0)
    	exports['progressBars']:startUI(30000, "Transport en cours...")
    --	menuperso_hide_hud()
        DoScreenFadeOut(100)
        Citizen.Wait(30000)
        ESX.Game.Teleport(PlayerPedId(), table['Exit'])
         FreezeEntityPosition(ped, true)
         Citizen.Wait(1000)
        TriggerEvent('esx_status:setDisplay', 1.0)
        PlaySound(-1, 'RACE_PLACED', 'HUD_AWARDS', false, 0, true)
         FreezeEntityPosition(ped, false)
        DoScreenFadeIn(100)
    --    menuperso_hide_hud()
    else
    	TriggerServerEvent("bus",250)
        PlaySound(-1, 'RACE_PLACED', 'HUD_AWARDS', false, 0, true)
					ESX.ShowNotification(('~r~ Vous venez d\'etre débiter de 250 $'))
					TriggerServerEvent('esx_joblogs:AddInLog', "bus", "bus2", GetPlayerName(PlayerId()))
                     Citizen.Wait(200)
    	exports['progressBars']:startUI(30000, "Transport en cours...")
        DoScreenFadeOut(100)
        Citizen.Wait(30000)
        ESX.Game.Teleport(PlayerPedId(), table['Enter'])
        TriggerEvent('esx_status:setDisplay', 1.0)
        PlaySound(-1, 'RACE_PLACED', 'HUD_AWARDS', false, 0, true)
         FreezeEntityPosition(ped, true)
         Citizen.Wait(1000)
        DoScreenFadeIn(100)
         FreezeEntityPosition(ped, false)
    end
end


function DrawM(hint, type, x, y, z)
	ESX.Game.Utils.DrawText3D({x = x, y = y, z = z + 1.0}, hint, 0.4)
	DrawMarker(type, x, y, z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.5, 1.5, 1.5, 255, 255, 255, 100, false, true, 2, false, false, false, false)
end
