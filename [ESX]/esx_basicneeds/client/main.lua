ESX          = nil
local IsDead = false
local IsAnimated = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
end)




AddEventHandler('esx_basicneeds:resetStatus', function()
	TriggerEvent('esx_status:set', 'hunger', 500000)
	TriggerEvent('esx_status:set', 'thirst', 500000)
--	TriggerEvent('esx_status:set', 'pee', 0)
--	TriggerEvent('esx_status:set', 'poo', 0)
end)

RegisterNetEvent('esx_basicneeds:healPlayer')
AddEventHandler('esx_basicneeds:healPlayer', function()
	-- restore hunger & thirst
	TriggerEvent('esx_status:set', 'hunger', 1000000)
	TriggerEvent('esx_status:set', 'thirst', 1000000)

	-- restore hp
	local playerPed = PlayerPedId()
	SetEntityHealth(playerPed, GetEntityMaxHealth(playerPed))
end)

RegisterNetEvent('esx_basicneeds:peefait')
AddEventHandler('esx_basicneeds:peefait', function()
	-- restore hunger & thirst
	TriggerEvent('esx_status:set', 'pee', 0)


end)

RegisterNetEvent('esx_basicneeds:poofait')
AddEventHandler('esx_basicneeds:poofait', function()
	-- restore hunger & thirst
	TriggerEvent('esx_status:set', 'poo', 0)



end)

AddEventHandler('esx:onPlayerDeath', function()
	IsDead = true
end)

AddEventHandler('playerSpawned', function(spawn)
	if IsDead then
		TriggerEvent('esx_basicneeds:resetStatus')
	end

	IsDead = false
end)

AddEventHandler('esx_status:loaded', function(status)

	TriggerEvent('esx_status:registerStatus', 'hunger', 1000000, '#00BD1C', function(status)
		return true
	end, function(status)
		status.remove(100)
	end)

	TriggerEvent('esx_status:registerStatus', 'thirst', 1000000, '#0002F2', function(status)
		return true
	end, function(status)
		status.remove(150)
	end)

--	TriggerEvent('esx_status:registerStatus', 'poo', 1000, '#8F4500',
--	function(status)
--		return true
--	end, function(status)
--		status.add(100)
--	end)

--	TriggerEvent('esx_status:registerStatus', 'pee', 1000, '#B5B5B5',
--	function(status)
--		return true
--	end, function(status)
--		status.add(150)
--	end)

	
 

	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(5000)

			local playerPed  = PlayerPedId()
			local prevHealth = GetEntityHealth(playerPed)
			local health     = prevHealth

			TriggerEvent('esx_status:getStatus', 'hunger', function(status)
				if status.val == 0 then
					if prevHealth <= 150 then
						health = health - 5
					else
						health = health - 1
					end
				end

				if status.val == 100000 then
					TriggerEvent('esx:showNotification', 'Vous avez ~r~trop faim ~w~...')	
				end
				if status.val == 50000 then
					TriggerEvent('esx:showNotification', '~r~Vous avez trop faim ~w~...')	
				end
			end)

			TriggerEvent('esx_status:getStatus', 'thirst', function(status)
				if status.val == 0 then
					if prevHealth <= 150 then
						health = health - 100
					else
						health = health - 1
					end
				end

				if status.val == 100000 then
					TriggerEvent('esx:showNotification', 'Vous avez ~r~trop soif ~w~...')	
				end
				if status.val == 50000 then
					TriggerEvent('esx:showNotification', '~r~Vous avez trop soif ~w~...')	
				end
			end)



			TriggerEvent('esx_status:getStatus', 'drug', function(status)
				

				if status.val >= 1000 then
					SetTimecycleModifier("spectator5")
				end
			end)
			

--[[
			TriggerEvent('esx_status:getStatus', 'pee', function(status)
				if status.val == 1000000 then
					TriggerEvent("esx_basicneeds:pee", source)
					TriggerEvent('esx_status:set', 'pee', 0)
				end

				if status.val == 900000 then
					TriggerEvent('esx:showNotification', 'Vous avez ~r~envie de pisser ~w~...')	
				end
			end)

			TriggerEvent('esx_status:getStatus', 'poo', function(status)
				if status.val == 1000000 then
					TriggerEvent("esx_basicneeds:poo", source)
					TriggerEvent('esx_status:set', 'poo', 0)
				end

				if status.val == 900000 then
					TriggerEvent('esx:showNotification', 'Vous avez ~r~envie de chier ~w~...')	
				end
			end)

			
			
]]
			

			if health ~= prevHealth then
				SetEntityHealth(playerPed, health)
			end
		end
	end)
end)





AddEventHandler('esx_basicneeds:isEating', function(cb)
	cb(IsAnimated)
end)

RegisterNetEvent('esx_basicneeds:onEat')
AddEventHandler('esx_basicneeds:onEat', function(prop_name)
	if not IsAnimated then
		prop_name = prop_name or 'prop_cs_burger_01'
		IsAnimated = true

		Citizen.CreateThread(function()
			local playerPed = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
			local boneIndex = GetPedBoneIndex(playerPed, 18905)
			AttachEntityToEntity(prop, playerPed, boneIndex, 0.12, 0.028, 0.001, 10.0, 175.0, 0.0, true, true, false, true, 1, true)

			ESX.Streaming.RequestAnimDict('mp_player_inteat@burger', function()
				TaskPlayAnim(playerPed, 'mp_player_inteat@burger', 'mp_player_int_eat_burger_fp', 8.0, -8, -1, 49, 0, 0, 0, 0)

				Citizen.Wait(3000)
				IsAnimated = false
				ClearPedSecondaryTask(playerPed)
				DeleteObject(prop)
			end)
		end)

	end
end)

RegisterNetEvent('esx_basicneeds:onEat2')
AddEventHandler('esx_basicneeds:onEat2', function(prop_name)
	if not IsAnimated then
		prop_name = prop_name or 'prop_sandwich_01'
		IsAnimated = true

		Citizen.CreateThread(function()
			local playerPed = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
			local boneIndex = GetPedBoneIndex(playerPed, 18905)
			AttachEntityToEntity(prop, playerPed, boneIndex, 0.12, 0.028, 0.001, 10.0, 175.0, 0.0, true, true, false, true, 1, true)

			ESX.Streaming.RequestAnimDict('mp_player_inteat@burger', function()
				TaskPlayAnim(playerPed, 'mp_player_inteat@burger', 'mp_player_int_eat_burger_fp', 8.0, -8, -1, 49, 0, 0, 0, 0)

				Citizen.Wait(3000)
				IsAnimated = false
				ClearPedSecondaryTask(playerPed)
				DeleteObject(prop)
			end)
		end)

	end
end)

RegisterNetEvent('esx_basicneeds:onDrink')
AddEventHandler('esx_basicneeds:onDrink', function(prop_name)
	if not IsAnimated then
		prop_name = prop_name or 'prop_ld_flow_bottle'
		IsAnimated = true

		Citizen.CreateThread(function()
			local playerPed = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
			local boneIndex = GetPedBoneIndex(playerPed, 18905)
			AttachEntityToEntity(prop, playerPed, boneIndex, 0.07, 0.035, 0.040, 0.000001, 115.0, 0.0001, true, true, false, true, 1, true)

			ESX.Streaming.RequestAnimDict('mp_player_intdrink', function()
				TaskPlayAnim(playerPed, 'mp_player_intdrink', 'loop_bottle', 1.0, -1.0, 2000, 0, 1, true, true, true)

				Citizen.Wait(3000)
				IsAnimated = false
				ClearPedSecondaryTask(playerPed)
				DeleteObject(prop)
			end)
		end)

	end
end)


RegisterNetEvent('esx_basicneeds:onDrink2')
AddEventHandler('esx_basicneeds:onDrink2', function(prop_name)
	if not IsAnimated then
		prop_name = prop_name or 'prop_cocktail'
		IsAnimated = true

		Citizen.CreateThread(function()
			local playerPed = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
			local boneIndex = GetPedBoneIndex(playerPed, 18905)
			AttachEntityToEntity(prop, playerPed, boneIndex, 0.07, 0.035, 0.040, 0.000001, 115.0, 0.0001, true, true, false, true, 1, true)

			ESX.Streaming.RequestAnimDict('mp_player_intdrink', function()
				TaskPlayAnim(playerPed, 'mp_player_intdrink', 'loop_bottle', 1.0, -1.0, 2000, 0, 1, true, true, true)

				Citizen.Wait(3000)
				IsAnimated = false
				ClearPedSecondaryTask(playerPed)
				DeleteObject(prop)
			end)
		end)

	end
end)


--- Animation add pee poo

RegisterNetEvent('esx_basicneeds:poo')
AddEventHandler('esx_basicneeds:poo', function()
if not IsAnimated then
  local particleDictionary = "scr_amb_chop"
  local particleName = "ent_anim_dog_poo"
  local animDictionary = 'switch@trevor@on_toilet'
  local animName = 'trev_on_toilet_exit'

  RequestNamedPtfxAsset(particleDictionary)
  while not HasNamedPtfxAssetLoaded(particleDictionary) do
     Citizen.Wait(0)
  end

  RequestAnimDict(animDictionary)

  while not HasAnimDictLoaded(animDictionary) do
    Citizen.Wait(0)
  end

  SetPtfxAssetNextCall(particleDictionary)
  bone   = GetPedBoneIndex(GetPlayerPed(-1), 11816)
  IsAnimated = true
  	TaskPlayAnim(GetPlayerPed(-1), animDictionary, animName, 8.0, -8.0, -1, 0, 0, false, false, false)
  	effect = StartParticleFxLoopedOnPedBone(particleName, GetPlayerPed(-1), 0.0, -0.9, -0.5, 0.0, 0.0, 20.0, bone, 2.0, false, false, false);
  	Wait(2000)
	  StopParticleFxLooped(effect, 0)
	  IsAnimated = false
	end
end)

RegisterNetEvent('esx_basicneeds:pee')
AddEventHandler('esx_basicneeds:pee', function()
if not IsAnimated then
	
  local particleDictionary = "scr_amb_chop"
  local particleName = "ent_anim_dog_peeing"
  local animDictionary = 'missbigscore1switch_trevor_piss'
  local animName = 'piss_loop'
 
  RequestNamedPtfxAsset(particleDictionary)
  while not HasNamedPtfxAssetLoaded(particleDictionary) do
     Citizen.Wait(0)
  end

  RequestAnimDict(animDictionary)

  while not HasAnimDictLoaded(animDictionary) do
    Citizen.Wait(0)
  end
  SetPtfxAssetNextCall(particleDictionary)
  bone   = GetPedBoneIndex(GetPlayerPed(-1), 11816)
  IsAnimated = true
  	TaskPlayAnim(GetPlayerPed(-1), animDictionary, animName, 8.0, -8.0, -1, 0, 0, false, false, false)
  	effect = StartParticleFxLoopedOnPedBone(particleName, GetPlayerPed(-1), 0.0, 0.0, -0.1, 90.0, 90.0, 20.0, bone, 2.0, false, false, false);
  	Wait(5500)
	  StopParticleFxLooped(effect, 0)
	  IsAnimated = false
	end
end)





RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
end)

RegisterNetEvent('esx_cigarett:startSmoke')
AddEventHandler('esx_cigarett:startSmoke', function(source)
	SmokeAnimation()
end)

function SmokeAnimation()
	local playerPed = GetPlayerPed(-1)
	
	Citizen.CreateThread(function()
        TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_SMOKING", 0, true)               
	end)
end



RegisterNetEvent('boost:Monster')
AddEventHandler('boost:Monster', function()
  local playerPed = GetPlayerPed(-1)
  local player = PlayerId()

    Citizen.Wait(3000)
    SetRunSprintMultiplierForPlayer(player, 1.05)
   --- AddArmourToPed(playerPed, 100)  	
    Wait(600000)
    SetRunSprintMultiplierForPlayer(player, 1.0)		
end)



RegisterNetEvent('boost:pisse')
AddEventHandler('boost:pisse', function()
  local playerPed = GetPlayerPed(-1)
  local player = PlayerId()

    Citizen.Wait(3000)
    SetRunSprintMultiplierForPlayer(player, 1.39)
	
    Wait(600000)
    SetRunSprintMultiplierForPlayer(player, 1.0)		
end)


RegisterNetEvent('carton:cartonfixkit')
AddEventHandler('carton:cartonfixkit', function()
if PlayerData.job ~= nil and PlayerData.job.name == 'mecano'  then	
	TriggerServerEvent("carton:cartonfixkitopen")
	TriggerEvent('esx:showNotification', 'Vous avez ouvert le carton')
else
	TriggerEvent('esx:showNotification', 'Vous ne pouvez pas faire cette action')	
end
end)

RegisterNetEvent('carton:cartonrevivekit')
AddEventHandler('carton:cartonrevivekit', function()
if PlayerData.job ~= nil and PlayerData.job.name == 'ambulance'  then	
	TriggerServerEvent("carton:cartonrevivekitopen")
	TriggerEvent('esx:showNotification', 'Vous avez ouvert le carton')
else
	TriggerEvent('esx:showNotification', 'Vous ne pouvez pas faire cette action')	
end
end)

RegisterNetEvent('carton:cartonbandage')
AddEventHandler('carton:cartonbandage', function()
if PlayerData.job ~= nil and PlayerData.job.name == 'ambulance'  then	
	TriggerServerEvent("carton:cartonbandageopen")
	TriggerEvent('esx:showNotification', 'Vous avez ouvert le carton')
else
	TriggerEvent('esx:showNotification', 'Vous ne pouvez pas faire cette action')	
end
end)

RegisterNetEvent('carton:cartonmedikit')
AddEventHandler('carton:cartonmedikit', function()
if PlayerData.job ~= nil and PlayerData.job.name == 'ambulance'  then	
	TriggerServerEvent("carton:cartonmedikitopen")
	TriggerEvent('esx:showNotification', 'Vous avez ouvert le carton')
else
	TriggerEvent('esx:showNotification', 'Vous ne pouvez pas faire cette action')	
end
end)


RegisterNetEvent('carton:cartonjackcharlie')
AddEventHandler('carton:cartonjackcharlie', function()
if PlayerData.job ~= nil and PlayerData.job.name == 'unicorn'  then	
	TriggerServerEvent("carton:cartonjackcharlieopen")
	TriggerEvent('esx:showNotification', 'Vous avez ouvert le carton')
else
	TriggerEvent('esx:showNotification', 'Vous ne pouvez pas faire cette action')	
end
end)

RegisterNetEvent('carton:cartonpissedelicorne')
AddEventHandler('carton:cartonpissedelicorne', function()
if PlayerData.job ~= nil and PlayerData.job.name == 'unicorn'  then	
	TriggerServerEvent("carton:cartonpissedelicorneopen")
	TriggerEvent('esx:showNotification', 'Vous avez ouvert le carton')
else
	TriggerEvent('esx:showNotification', 'Vous ne pouvez pas faire cette action')	
end
end)

RegisterNetEvent('carton:cartonabsynthe')
AddEventHandler('carton:cartonabsynthe', function()
if PlayerData.job ~= nil and PlayerData.job.name == 'unicorn' or PlayerData.job.name == 'nightclub'  then	
	TriggerServerEvent("carton:cartonabsyntheopen")
	TriggerEvent('esx:showNotification', 'Vous avez ouvert le carton')
else
	TriggerEvent('esx:showNotification', 'Vous ne pouvez pas faire cette action')	
end
end)

RegisterNetEvent('carton:cartonbiere')
AddEventHandler('carton:cartonbiere', function()
if PlayerData.job ~= nil and PlayerData.job.name == 'unicorn' or PlayerData.job.name == 'nightclub'  then	
	TriggerServerEvent("carton:cartonbiereopen")
	TriggerEvent('esx:showNotification', 'Vous avez ouvert le carton')
else
	TriggerEvent('esx:showNotification', 'Vous ne pouvez pas faire cette action')	
end
end)

RegisterNetEvent('carton:cartondesperados')
AddEventHandler('carton:cartondesperados', function()
if PlayerData.job ~= nil and PlayerData.job.name == 'unicorn' or PlayerData.job.name == 'nightclub'  then	
	TriggerServerEvent("carton:cartondesperadosopen")
	TriggerEvent('esx:showNotification', 'Vous avez ouvert le carton')
else
	TriggerEvent('esx:showNotification', 'Vous ne pouvez pas faire cette action')	
end
end)

RegisterNetEvent('carton:cartonjackdaniel')
AddEventHandler('carton:cartonjackdaniel', function()
if PlayerData.job ~= nil and PlayerData.job.name == 'unicorn' or PlayerData.job.name == 'nightclub'  then	
	TriggerServerEvent("carton:cartonjackdanielopen")
	TriggerEvent('esx:showNotification', 'Vous avez ouvert le carton')
else
	TriggerEvent('esx:showNotification', 'Vous ne pouvez pas faire cette action')	
end
end)

--
RegisterNetEvent('carton:cartonjager')
AddEventHandler('carton:cartonjager', function()
if PlayerData.job ~= nil and PlayerData.job.name == 'unicorn' or PlayerData.job.name == 'nightclub'  then	
	TriggerServerEvent("carton:cartonjageropen")
	TriggerEvent('esx:showNotification', 'Vous avez ouvert le carton')
else
	TriggerEvent('esx:showNotification', 'Vous ne pouvez pas faire cette action')	
end
end)
--
RegisterNetEvent('carton:cartonleffe')
AddEventHandler('carton:cartonleffe', function()
if PlayerData.job ~= nil and PlayerData.job.name == 'unicorn' or PlayerData.job.name == 'nightclub'  then	
	TriggerServerEvent("carton:cartonleffeopen")
	TriggerEvent('esx:showNotification', 'Vous avez ouvert le carton')
else
	TriggerEvent('esx:showNotification', 'Vous ne pouvez pas faire cette action')	
end
end)

--
RegisterNetEvent('carton:cartonmojitos')
AddEventHandler('carton:cartonmojitos', function()
if PlayerData.job ~= nil and PlayerData.job.name == 'unicorn' or PlayerData.job.name == 'nightclub'  then	
	TriggerServerEvent("carton:cartonmojitosopen")
	TriggerEvent('esx:showNotification', 'Vous avez ouvert le carton')
else
	TriggerEvent('esx:showNotification', 'Vous ne pouvez pas faire cette action')	
end
end)

RegisterNetEvent("carton:cartonrhum")
AddEventHandler("carton:cartonrhum", function()
if PlayerData.job ~= nil and PlayerData.job.name == 'unicorn' or PlayerData.job.name == 'nightclub'  then	
	TriggerServerEvent("carton:cartonrhumopen")
	TriggerEvent('esx:showNotification', "Vous avez ouvert le carton")
else
	TriggerEvent('esx:showNotification', "Vous ne pouvez pas faire cette action")	
end
end)
--
RegisterNetEvent('carton:cartonvodka')
AddEventHandler('carton:cartonvodka', function()
if PlayerData.job ~= nil and PlayerData.job.name == 'unicorn' or PlayerData.job.name == 'nightclub'  then	
	TriggerServerEvent("carton:cartonvodkaopen")
	TriggerEvent('esx:showNotification', 'Vous avez ouvert le carton')
else
	TriggerEvent('esx:showNotification', 'Vous ne pouvez pas faire cette action')	
end
end)
--
RegisterNetEvent('carton:cartontquilafrappee')
AddEventHandler('carton:cartontquilafrappee', function()
if PlayerData.job ~= nil and PlayerData.job.name == 'unicorn'  then	
	TriggerServerEvent("carton:cartontquilafrappeeopen")
	TriggerEvent('esx:showNotification', 'Vous avez ouvert le carton')
else
	TriggerEvent('esx:showNotification', 'Vous ne pouvez pas faire cette action')	
end
end)




