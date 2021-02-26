-- C O N F I G --
local companyName = "Agoria remorquage"

local towOffset = -5.0

local deleteLastTruck = true --Deletes the last spawned truck.
local spawnDistance = 500 	--	Default 500
							---								---
local drivingStyle = 786603  	--	**786603  - "Normal" - Default**
								--	**1074528293 - "Rushed"**
								--	**2883621 - "Ignore Lights"**
								--	**5 - "Sometimes Overtake Traffic"**
								--	**Customize Driving Style: https://vespura.com/drivingstyle/

local towDriverQuoteOfTheDay = {"Bonjour partenaire! Je vais le faire remorquer.","tu veux le faire toi même bro ? Parce que je le fais.","Vous avez appelé le bon gars, parce que j'ai des jeux de mots en tête à remorquer.","Pas d'inquiétude, je vais le faire remorquer!","Je ne vous chargerai pas un bras et une jambe! Je veux seulement vos remorques.","Vous voulez aussi passer du bon temps?","Je déteste mon travail.","Désolé j'ai mis beaucoup de temps!","Nous avons certaines des meilleurs prostitués de la ville!","Désolé j'ai mis beaucoup de temps","Voilà!","Fais attention à toi","Cela ira bien dans la fourrière!","je t'emmerde", "J'ai bien compris", ("Merci d\'utiliser " .. companyName .. "!"), "Ce sera à l'enceinte."}
	
								
-- Register a network event 
RegisterNetEvent('wk:spawnTow')
RegisterNetEvent('wk:cancelTow')

-- Gets a vehicle in a certain direction
-- Credit to Konijima
function GetVehicleInDirection( coordFrom, coordTo )
    local rayHandle = CastRayPointToPoint( coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z, 10, GetPlayerPed( -1 ), 0 )
    local _, _, _, _, vehicle = GetRaycastResult( rayHandle )
    return vehicle
end

-- The distance to check in front of the player for a vehicle
-- Distance is in GTA units, which are quite big  
local distanceToCheck = 5.0

enroute = false
onscene = false
cleartask = false
AddEventHandler( 'wk:spawnTow', function()
	local spawnDistance = math.random(spawnDistance * -1, spawnDistance)
	local player = GetPlayerPed(-1)
	local playerPos = GetEntityCoords(player)
	local pmodels = {"mp_m_waremech_01"}
	local vehicles = {"flatbed"}
	local driver = GetHashKey(pmodels[math.random(#pmodels)])
	local vehiclehash = GetHashKey(vehicles[math.random(#vehicles)])
    local inFrontOfPlayer = GetOffsetFromEntityInWorldCoords(player, 0.0, distanceToCheck, 0.0)
	RequestModel(vehiclehash)
	RequestModel(driver)
	
	while not HasModelLoaded(vehiclehash) and RequestModel(driver) do
		RequestModel(vehiclehash)
		RequestModel(driver)
		Citizen.Wait(0)
	end
	
	if IsPedSittingInAnyVehicle(player) then 
        targetVeh = GetVehiclePedIsIn(player, false)
	else
		targetVeh = GetVehicleInDirection(playerPos, inFrontOfPlayer)
	end
	
	if DoesEntityExist(vehicle) and deleteLastTruck == true then
		SetEntityAsMissionEntity(driver)
		SetEntityAsMissionEntity(vehicle)
		SetEntityAsMissionEntity(towedVeh)
		
		DeleteEntity(driver)
		DeleteEntity(vehicle)
		DeleteEntity(towedVeh)
		
		while DoesEntityExist(driver) do
			Wait(0)
			DeleteEntity(driver)
		end
	end
	
	if DoesEntityExist(targetVeh) then
	TriggerEvent('radio')
	
		Wait(math.random(2000, 6000))
		
		local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
		local heading, vector = GetNthClosestVehicleNode(x, y, z, spawnDistance, 0, 0, 0)
		local sX, sY, sZ = table.unpack(vector)	
		vehicle = CreateVehicle(vehiclehash, sX, sY, sZ, heading, true, true)
		
		local vehiclehash = GetHashKey(vehicle)
		
		driver = CreatePedInsideVehicle(vehicle, 26, driver, -1, true, false)
		local vehpos = GetEntityCoords(targetVeh)
		TaskVehicleDriveToCoord(driver, vehicle, vehpos.x, vehpos.y, vehpos.z, 17.0, 0, vehiclehash, drivingStyle, 1.0, true)
		SetVehicleFixed(vehicle)
		SetVehicleOnGroundProperly(vehicle)
		if DoesEntityExist(driver) and DoesEntityExist(vehicle) then
		SetEntityAsMissionEntity(driver, true, true)
		towblip = AddBlipForEntity(vehicle)
		SetBlipColour(towblip, 29)
		SetBlipFlashes(towblip, true)
		
		local distanceToTow = GetDistanceBetweenCoords(GetEntityCoords(vehicle), GetEntityCoords(targetVeh))
		
		if distanceToTow < 100 then
			eta = '~g~100 mètres'
		elseif distanceToTow < 300 then
			eta = '~g~300 mètres '
		elseif distanceToTow < 500 then
			eta = '~o~500 mètres'
		elseif distanceToTow > 500 then
			eta = '~r~500 mètres'
		end
		
		ShowNotification("Une dépanneuse a été envoyée à votre emplacement. Merci d'utiliser ~y~" .. companyName .. "~w~\nETA: " .. eta)
		enroute = true
		while (enroute) do
			Citizen.Wait(300)
			local distanceToVeh = GetDistanceBetweenCoords(GetEntityCoords(vehicle), GetEntityCoords(targetVeh), 1)
			SetEntityInvincible(vehicle, true)
			SetEntityInvincible(driver, true)
				if distanceToVeh <= 15 then
					SetVehicleIndicatorLights(vehicle, 1, true)
					SetVehicleIndicatorLights(vehicle, 2, true)
					TaskVehicleTempAction(driver, vehicle, 27, 5000)
					Wait(5000)
					AttachEntityToEntity(targetVeh, vehicle, 20, -0.5, towOffset, 1.0, 0.0, 0.0, 0.0, false, false, false, false, 20, true)
					targetVeh = towedVeh
					SetDriveTaskDrivingStyle(vehicle, 786603)
					TaskVehicleDriveWander(driver, vehicle, 17.0, drivingStyle)
					SetVehicleSiren(vehicle, true)
					ShowNotification("~o~Remorqueur~w~ " .. towDriverQuoteOfTheDay[math.random(#towDriverQuoteOfTheDay)])
					SetEntityAsNoLongerNeeded(vehicle)
					enroute = false
					towblip = RemoveBlip(towblip)
					SetVehicleIndicatorLights(vehicle, 1, false)
					SetVehicleIndicatorLights(vehicle, 2, false)
					SetEntityInvincible(vehicle, false)
					SetEntityInvincible(driver, false)
					SetEntityAsNoLongerNeeded(vehicle)
					SetEntityAsNoLongerNeeded(driver)
					SetEntityAsNoLongerNeeded(targetVeh)
				end
			end
		end
	else
	ShowNotification("Pas de véhicule trouvé !")
	end
end)

AddEventHandler( 'wk:cancelTow', function()
	if enroute == true then
		ShowNotification("La demande de dépanneuse a été annulée. Merci d'utiliser ~y~" .. companyName)
		
		SetEntityAsMissionEntity(vehicle)
		SetEntityAsMissionEntity(driver)
		
		DeleteEntity(vehicle)
		DeleteEntity(driver)
		enroute = false
	end
end)

RegisterNetEvent('radio')
AddEventHandler('radio', function()
    Citizen.CreateThread(function()
        TaskPlayAnim(player, "random@arrests", "generic_radio_enter", 1.5, 2.0, -1, 50, 2.0, 0, 0, 0 )
		Citizen.Wait(6000)
		ClearPedTasks(player)
    end)
end)

function loadAnimDict( dict )
	while ( not HasAnimDictLoaded( dict ) ) do
		RequestAnimDict( dict )
		Citizen.Wait( 0 )
	end
end

-- Shows a notification on the player's screen 
function ShowNotification( text )
    SetNotificationTextEntry( "STRING" )
    AddTextComponentString( text )
    DrawNotification( false, false )
end