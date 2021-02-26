ESX = nil				
playerData = {}	

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(1)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)		
    playerData = xPlayer								
   -- refreshBlips()										
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)	
  playerData.job = job						
  onDuty = false							
--  deleteBlips()								
--  refreshBlips()							
end)

math.randomseed(GetGameTimer())

local stopWatch = FiveWatch.new('rally')

local taskPoints = {}	
local rallyBlips = {}
local RallyTimes = {}	

local onDuty = false	
local jobDone = false	
local isInMarker = false
local menuIsOpen = false   
local currentZone = 'none'
	
local currentIndex = 1 
local lastRoute = 0

local zOffset = -0.65	
local hintToDisplay = "no hint bru"			
local displayHint = false								
local currentCar = nil												
local currentPlate = ''
								

chat = function(clr, msg) TriggerEvent('chatMessage', "", {255, 0, 0}, "^8>> ^" .. clr .. tostring(msg)) end

function sizeOfTable (tab)
  local count = 0
  for k, v in pairs(tab) do
    count = count + 1
  end
  return count
end

function elementAt(tab, indx) --I had a different table structure in the beginning. Will remove this useless piece of shit later
 
  local count = 0
  local ret = nil
  for k, v in pairs(tab) do
    count = count + 1
	if count == indx then
	ret = v
	break
	end
  end
  return ret
end


function table.clone(org)
  return {table.unpack(org)}
end


function msToClock(seconds) --https://gist.github.com/jesseadams/791673

  if seconds <= 0 then
    return "00:00:00";
  else								--78945, 
	hours = string.format("%02.f", math.floor(seconds/3600000)); --0
   	mins = string.format("%02.f", math.floor(seconds/60000 - (hours * 60))); --1,31
    	secs = string.format("%02.f", math.floor((seconds - hours*3600000 - mins *60000) / 1000)); --18,945
	mils = string.format("%01.f", math.floor(seconds - hours*3600000 - mins *60000 - secs * 1000)); --945
    return mins..":"..secs..":"..mils
  end
end

AddEventHandler('esx_rallyjob:celebrate', function()
	Citizen.CreateThread(function()
	  TaskStartScenarioInPlace(GetPlayerPed(-1), Config.celebrationScenario, 0, false)
	  stopWatch:StartTimer('celebrate')
	  repeat
		Citizen.Wait(500)
	  until stopWatch:GetTime('celebrate') > Config.celebrationTime
	  stopWatch:RemoveTime('celebrate')
	  ClearPedTasks(GetPlayerPed(-1))
	end)
end)

AddEventHandler('esx_rallyjob:grieve', function()
	Citizen.CreateThread(function()
	  RequestAnimDict(Config.failAnimDict) 
	  while not HasAnimDictLoaded(Config.failAnimDict) do
	    Citizen.Wait(100)
	  end
	  TaskPlayAnim(GetPlayerPed(-1), Config.failAnimDict , Config.failAnim ,8.0, -8.0, -1, 0, 0, false, false, false )
	end)
end)

AddEventHandler('esx_rallyjob:ragequit', function()
	Citizen.CreateThread(function()
	  RequestAnimDict(Config.quitAnimDict) 
	  while not HasAnimDictLoaded(Config.quitAnimDict) do
	    Citizen.Wait(100)
	  end
	  TaskPlayAnim(GetPlayerPed(-1), Config.quitAnimDict , Config.quitAnim,8.0, -8.0, -1, 0, 0, false, false, false )
	end)
end)


Citizen.CreateThread(function()
  while true do										
    Citizen.Wait(1)
    if displayHint then							
      SetTextComponentFormat("STRING")				
      AddTextComponentString(hintToDisplay)			
      DisplayHelpTextFromStringLabel(0, 0, 1, -1)	
    end
  end
end)


function displayMarker(coords) 
	DrawMarker(4, coords.x, coords.y, coords.z + 0.55, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.0, 1.0, 1.0, 15, 15, 255, 100, false, true, 2, false, false, false, false) 
end


function isMyCar()
	return currentPlate == GetVehicleNumberPlateText(GetVehiclePedIsIn(GetPlayerPed(-1), false))
end

function spawnCar()
	Citizen.CreateThread(function()
		
		local vehicleModel = GetHashKey('comet4')	
		RequestModel(vehicleModel)					
		
		while not HasModelLoaded(vehicleModel) do	
			Citizen.Wait(0)
		end
		
		currentCar = CreateVehicle(vehicleModel, Config.carSpawn.x, Config.carSpawn.y, Config.carSpawn.z, Config.carSpawn.h, true, false)	
		SetVehicleHasBeenOwnedByPlayer(currentCar,  true)														
		SetEntityAsMissionEntity(currentCar,  true,  true)													
		SetVehicleNumberPlateText(currentCar, "RALLY" .. math.random(100, 999))									
		local id = NetworkGetNetworkIdFromEntity(currentCar)												
		SetNetworkIdCanMigrate(id, true)																	
		local props = {																							
			modEngine       = 3,
			modTransmission = 3,
			modSuspension   = 3,
			modTurbo        = true,																				
		}
		ESX.Game.SetVehicleProperties(currentCar, props)
		TaskWarpPedIntoVehicle(GetPlayerPed(-1), currentCar, -1)
		Wait(500)																							
		currentPlate = GetVehicleNumberPlateText(currentCar)
		
	end)
end

function emeDel()
	Citizen.CreateThread(function()
		Citizen.Wait(500)
		if currentCar ~= nil and DoesEntityExist(currentCar) then
			ESX.Game.DeleteVehicle(currentCar)
		end
	end)
end

function startWork(flag)
	local playerPed = GetPlayerPed(-1)
	if IsPedInAnyVehicle(playerPed) and isMyCar() then 
		updateCurrentIndex()								
		if elementAt(taskPoints, currentIndex) == nil then
			ESX.ShowNotification('~w~trajet ~b~' .. lastRoute .. ' ~w~terminer ~y~' .. msToClock(stopWatch:SaveTime('lap')))
			chat("6", "temps au tour: ^4" .. msToClock(stopWatch:GetSavedTime('lap')))
			Citizen.CreateThread(function()
				FreezeEntityPosition(GetVehiclePedIsIn(GetPlayerPed(-1), false), true)
				Citizen.Wait(1000)
				FreezeEntityPosition(GetVehiclePedIsIn(GetPlayerPed(-1), false), false)
			end)
			jobDone = true
			setGps(Config.carDel)
			TriggerEvent('esx:showNotification', "Conduisez ~b~au dépôt.")
		else
			if flag then
				ESX.ShowNotification('~w~Temp au checkpoint: ~b~' .. msToClock(stopWatch:GetTime('lap')))
			end
			setGps(elementAt(taskPoints, currentIndex))	
		end
	else
		ESX.ShowNotification('~r~Pourquoi est-ce dans votre voiture?')	
	end
end

function giveWork()
	currentIndex = 1													
	jobDone = false
	local route
	local dumpster = math.random() + math.random() + math.random() + math.random() + math.random()
	
	repeat
		route = math.random(1, 6)
	until lastRoute ~= route
	
	lastRoute = route
	
	taskPoints = table.clone(Config.Routes[route].track)
	
	spawnCar()
	ESX.ShowNotification("Une caution de ~r~" .. Config.caution .. "~g~ $ ~w~vous a été retiré.")
	TriggerServerEvent('esx_rallyjob:getPunished', Config.caution)
	setGps(elementAt(taskPoints, currentIndex))									     
	ESX.ShowNotification("~w~Rendez-vous~b~ au point de départ.") --alert player
end

function getPenalty()
	local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1))
	local penalty = math.floor(980 - GetVehicleEngineHealth(vehicle))
	if penalty < 0 then
		penalty = 0
	end 
	return penalty
end

function getPayAmount()
	
	local amount = Config.Routes[lastRoute].rewards.fail
	
	local trackinfo = getTrackinfo(lastRoute)
	
	if stopWatch:GetSavedTime('lap') < trackinfo.gold then
		amount = Config.Routes[lastRoute].rewards.gold
		TriggerServerEvent('esx_rallyjob:onRecord', lastRoute, stopWatch:GetSavedTime('lap'))
		ESX.ShowNotification("~w~Vous avez gagné ~y~une médaille d'or!")
		TriggerEvent('esx_rallyjob:celebrate')
	elseif stopWatch:GetSavedTime('lap') < trackinfo.silver then
		amount = Config.Routes[lastRoute].rewards.silver
		ESX.ShowNotification("~w~Vous avez gagné ~y~une médaille d'argent!")
		TriggerEvent('esx_rallyjob:celebrate')
	elseif stopWatch:GetSavedTime('lap') < trackinfo.bronze then
		amount = Config.Routes[lastRoute].rewards.bronze
		ESX.ShowNotification('~w~Vous avez gagné ~y~une médaille de bronze!')
		TriggerEvent('esx_rallyjob:celebrate')
	else
		TriggerEvent('esx_rallyjob:grieve')
	end

	local penalty = getPenalty()

	amount = amount - penalty
	
	ESX.ShowNotification("~w~Vous avez gagné ~b~" .. amount .. "~g~ €~w~, les frais de réparation s'élèvent à ~r~" .. penalty .. "~g~ $")
	amount = amount + Config.caution
	if amount < 0 then
		TriggerServerEvent('esx_rallyjob:getPunished', (-1) * amount)
	else
		TriggerServerEvent('esx_rallyjob:getPaid', amount)
	end
	
	stopWatch:RemoveTime('lap')
end 

function deleteCar()
	local entity = GetVehiclePedIsIn(GetPlayerPed(-1), false)							
	ESX.Game.DeleteVehicle(entity)														
end

function getPaid()
	local playerPed = GetPlayerPed(-1)
	if IsPedInAnyVehicle(playerPed) and isMyCar() and jobDone then
		getPayAmount()
		deleteCar()												
	elseif isMyCar() then
		deleteCar()
		TriggerServerEvent('esx_rallyjob:getPaid', Config.caution - 500)
		TriggerEvent('esx_rallyjob:ragequit')
		ESX.ShowNotification("~r~Pas de rallye, Pas d'argent. ~w~Un dédommagement a été pris de la caution, -~r~500~g~$")
	else
		TriggerEvent('esx_rallyjob:ragequit')
		ESX.ShowNotification('Où diable est la ~r~voiture ?')
		emeDel()
	end
	currentPlate = ''										
	currentVehicle = nil										
	jobDone = false											
	setGps(0)										
	taskPoints = {}												
end

function updateCurrentIndex()
	currentIndex = currentIndex + 1
end

function setGps(coords)
	if rallyBlips['rally'] ~= nil then 	
		RemoveBlip(rallyBlips['rally'])	
		rallyBlips['rally'] = nil			
	end
	if coords ~= 0 then
		rallyBlips['rally'] = AddBlipForCoord(coords.x, coords.y, coords.z)	
		SetBlipRoute(rallyBlips['rally'], true)									
	end
end

function isInside(playerCoords, coords, distance) 
	return GetDistanceBetweenCoords(playerCoords, coords.x, coords.y, coords.z, true) < distance			
end

function taskTrigger(zone)					--NICE SWITCH LUA TY
	if zone == 'locker' then				
		openMenu()
	elseif zone == 'start' then				
		giveWork()
	elseif zone == 'pay' then				
		getPaid()
	end
end

function getTrackinfo(lastRoute)
	for i = 1, #RallyTimes, 1 do
		if RallyTimes[i].track == lastRoute then
			return {bronze = math.floor(RallyTimes[i].laptime * Config.bronze), silver = math.floor(RallyTimes[i].laptime * Config.silver), gold = RallyTimes[i].laptime, driver = RallyTimes[i].driver}
		end
	end
	return {bronze = 993700, silver = 990800, gold = 810099, driver = "Hemuli Harjula"} --default time should be quite high for auto-mode
end

Citizen.CreateThread(function()
	while true do
		if onDuty and elementAt(taskPoints, currentIndex) ~= nil then
			local pCoords = GetEntityCoords(GetPlayerPed(-1))
			if currentIndex == 1 and isInside(pCoords, elementAt(taskPoints, currentIndex), 0.9) and isMyCar() then
				
				FreezeEntityPosition(GetVehiclePedIsIn(GetPlayerPed(-1), false), true)
				ESX.ShowNotification('~w~Le rallye ~g~commence~w~...')
				startWork(false)
				
				ESX.TriggerServerCallback('esx_rallyjob:getTimes', function(times)
					RallyTimes = times
					local trackinfo = getTrackinfo(lastRoute)
					chat("7", "Trajet ^5::[ ^9" .. Config.Routes[lastRoute].name .. "^5 ]:: ^4Bronze: ^3" .. msToClock(trackinfo.bronze) .. " ^0|^4 Argent: ^3" .. msToClock(trackinfo.silver) .. " ^0| ^4Or: ^3" .. msToClock(trackinfo.gold))
					chat("7", "Meilleur chrono ^3@^9" .. trackinfo.driver)
					Citizen.Wait(3000)
					ESX.ShowNotification('~r~3~w~...')
					Citizen.Wait(1000)
					ESX.ShowNotification('~y~2~w~...')
					Citizen.Wait(1000)
					ESX.ShowNotification('~g~1~w~...')
					Citizen.Wait(1000)
					FreezeEntityPosition(GetVehiclePedIsIn(GetPlayerPed(-1), false), false)
					ESX.ShowNotification('~g~GO~r~!~y~!~w~!')
					stopWatch:StartTimer('lap')
				end)
				
			elseif currentIndex ~= 1 and isInside(pCoords, elementAt(taskPoints, currentIndex), 4.95) and isMyCar() then
				startWork(true)
				Citizen.Wait(500)
			end
		end
		Citizen.Wait(50)
	end
end)


Citizen.CreateThread(function()
	while true do																
		Citizen.Wait(2)																
	
		if not menuIsOpen then
			
			local pCoords = GetEntityCoords(GetPlayerPed(-1))
			
			if isInside(pCoords, Config.locker, 1.5) then 			
				isInMarker = true
				displayHint = true																
				hintToDisplay = "Appuyer sur E pour accéder au vestiaire"								
				currentZone = 'locker'																
			elseif onDuty and elementAt(taskPoints, currentIndex) == nil and isInside(pCoords, Config.carSpawn, 1.5) then
				isInMarker = true
				displayHint = true
				hintToDisplay = "Appuyer sur E pour commencer"
				currentZone = 'start'
			elseif currentPlate ~= '' and isInside(pCoords, Config.carDel, 2.5) then  				
				isInMarker = true
				displayHint = true
				hintToDisplay = "Appuyer sur E pour avoir ta récompense"
				currentZone = 'pay'
			else																				
				isInMarker = false
				displayHint = false
				hintToDisplay = "No hint to display"
				currentZone = 'none'
			end
		
			if IsControlJustReleased(0, 38) and isInMarker then
				taskTrigger(currentZone)														
				Citizen.Wait(500)
			end
			
		end
	end
end)


Citizen.CreateThread(function()
	while true do																		
		Citizen.Wait(1)
		local pCoords = GetEntityCoords(GetPlayerPed(-1))
		
		if isInside(pCoords, Config.locker, 100)  then
			displayMarker(Config.locker)
		end
		if onDuty and elementAt(taskPoints,currentIndex) == nil and isInside(pCoords, Config.carSpawn, 100) then
			displayMarker(Config.carSpawn)
		end
		if onDuty and elementAt(taskPoints,currentIndex) ~= nil and isInside(pCoords, elementAt(taskPoints, currentIndex), 100) then
			displayMarker(elementAt(taskPoints, currentIndex))
		end
		if onDuty and currentPlate ~= '' and isInside(pCoords, Config.carDel, 100) then
			displayMarker(Config.carDel)
		end																			
	end
end)

function openMenu()									
 
  menuIsOpen = true
  
  ESX.UI.Menu.CloseAll()									

  ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'locker',		
    {
      title    = "Vestiaire",
      elements = {
        {label = "Combinaison de course", value = 'rally_wear'},
        {label = "Tenue Civil", value = 'everyday_wear'}
      }
    },
    function(data, menu)									
      if data.current.value == 'everyday_wear' then			
        onDuty = false										
        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)	
            TriggerEvent('skinchanger:loadSkin', skin)					
        end)
      end
      if data.current.value == 'rally_wear' then
        onDuty = true
      --  ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
       --   if skin.sex == 0 then
       --       TriggerEvent('skinchanger:loadClothes', skin, jobSkin.skin_male)
       --   else
       --       TriggerEvent('skinchanger:loadClothes', skin, jobSkin.skin_female)
       --   end
      --  end)
      TriggerEvent('vetement:rally')
      end
      menu.close()											
	  menuIsOpen = false
    end,
    function(data, menu)
      menu.close()
	  menuIsOpen = false
    end
  )
end





	RegisterNetEvent('vetement:rally')
AddEventHandler('vetement:rally', function()
	local playerPed = GetPlayerPed(-1)
	if IsPedInAnyVehicle(playerPed,  false) then
		ESX.ShowNotification('~r~Vous ne pouvez pas faire cette action')
	else
	TriggerEvent('skinchanger:getSkin', function(skin)
		local clothesSkin = {
		['helmet_1']	= 81,  ['helmet_2']	= 3,
		}
		TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
		ESX.ShowNotification(('Vous venez de vous mettre en Tenue'))
	end)
end
end)