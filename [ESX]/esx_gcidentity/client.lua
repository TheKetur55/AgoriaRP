--====================================================================================
-- #Author: Jonathan D @ Gannon
-- #Edited: Chubbs (ADRP)
-- #Edited: Sylundef (Aeria)
--====================================================================================
 
-- Configuration
local KeyToucheClose = 177 -- PhoneCancel
local distMaxCheck = 3
-- Variable | 0 close | 1 open
local menuIsOpen = 0


-- @author https://github.com/EmmanuelVlad/ephone

local inAnim = "cellphone_text_in"
local outAnim = "cellphone_text_out"
local outInCallAnim = "cellphone_call_out"
local callAnim = "cellphone_call_listen_base"
local idleAnim = "cellphone_text_read_base"

local phoneProp = 0
local phoneModel = "prop_cs_swipe_card"
local ESX = nil

--------------------------------------------------------------------------------
--
--                FUNCTIONS
--
--------------------------------------------------------------------------------
function newPhoneProp()
  local x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
  RequestModel(phoneModel)
  while not HasModelLoaded(phoneModel) do
    Citizen.Wait(100)
  end
  return CreateObject(phoneModel, 1.0, 1.0, 1.0, 1, 1, 0)
end

function ePhoneInAnim()
  if IsPlayerDead(PlayerId()) then
    return
  end
  local bone = GetPedBoneIndex(GetPlayerPed(-1), 28422)
  local dict = "cellphone@"
  if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
    dict = dict .. "in_car@ds"
  end

  RequestAnimDict(dict)
  while not HasAnimDictLoaded(dict) do
    Citizen.Wait(100)
  end

  TaskPlayAnim(GetPlayerPed(-1), dict, inAnim, 4.0, -1, -1, 50, 0, false, false, false)
  Citizen.Wait(157)
  phoneProp = newPhoneProp()
  AttachEntityToEntity(phoneProp, GetPlayerPed(-1), bone, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1, 1, 0, 0, 2, 1)
end

function ePhoneOutAnim()
  if IsPlayerDead(PlayerId()) then
    return
  end
  local dict = "cellphone@"
  if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
    dict = dict .. "in_car@ds"
  end

  RequestAnimDict(dict)
  while not HasAnimDictLoaded(dict) do
    Citizen.Wait(1)
  end
  if GetCurrentPedWeapon == 1 then
    ClearPedSecondaryTask(GetPlayerPed(-1))
    return
  end
  if inCall then
    StopAnimTask(GetPlayerPed(-1), dict, callAnim, 1.0)
    TaskPlayAnim(GetPlayerPed(-1), dict, outAnim, 5.0, -1, -1, 50, 0, false, false, false)
    inCall = false
  elseif not inCall then
    StopAnimTask(GetPlayerPed(-1), dict, inAnim, 1.0)
    TaskPlayAnim(GetPlayerPed(-1), dict, outAnim, 5.0, -1, -1, 50, 0, false, false, false)
  end
  Citizen.Wait(700)
  DeleteEntity(phoneProp)
  Citizen.Wait(500)
  StopAnimTask(GetPlayerPed(-1), dict, outAnim, 1.0)
end
 
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    if menuIsOpen ~= 0 then
      if IsControlJustPressed(1, KeyToucheClose) then
        closeGui()
      end
    end
  end
end)

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)



-- Animations
local playAnim = false
local dataAnim = {}
function animsAction(animObj)
  Citizen.CreateThread(function()
    if not playAnim then
      local playerPed = GetPlayerPed(-1);
      if DoesEntityExist(playerPed) then -- Check if ped exist
        dataAnim = animObj

        -- Play Animation
        RequestAnimDict(dataAnim.lib)
        while not HasAnimDictLoaded(dataAnim.lib) do
          Citizen.Wait(0)
        end
        if HasAnimDictLoaded(dataAnim.lib) then
          local flag = 0
          if dataAnim.loop ~= nil and dataAnim.loop then
            flag = 1
          elseif dataAnim.move ~= nil and dataAnim.move then
            flag = 49
          end

          TaskPlayAnim(playerPed, dataAnim.lib, dataAnim.anim, 8.0, -8.0, -1, flag, 0, 0, 0, 0)
          playAnimation = true
        end

        -- Wait end animation
        while true do
          Citizen.Wait(0)
          if not IsEntityPlayingAnim(playerPed, dataAnim.lib, dataAnim.anim, 3) then
            playAnim = false
            TriggerEvent('ft_animation:ClFinish')
            break
          end
        end
      end -- end ped exist
    end
  end)
end

--====================================================================================
--  User Event
--====================================================================================
RegisterNetEvent("esx_cards:show")
AddEventHandler("esx_cards:show", function(lType)
    if ESX ~= nil then
      ESX.UI.Menu.CloseAll()
    end
    local t, distance = GetClosestPlayer()
    if(t ~= -1 and distance < 3) then
        TriggerServerEvent('gc:openIdentity', lType, GetPlayerServerId(t))
        animsAction({ lib = "mp_common", anim = "givetake1_a" })
    else
      ePhoneInAnim();
      TriggerServerEvent('gc:openMeIdentity', lType)
    end
end)


--====================================================================================
--  Gestion des evenements Server
--====================================================================================
RegisterNetEvent("gc:showItentity")
AddEventHandler("gc:showItentity", function(type, data)
	openGuiIdentity(type, data)
end)

--====================================================================================
--  Gestion UI
--====================================================================================
function openGuiIdentity(type, data)
	if menuIsOpen  == 0 then
		menuIsOpen = 1
  else
    closeGui()
  end
		SendNUIMessage({method = 'openGuiIdentity',  pType = type, data = json.encode(data)})
end
 
 
function closeGui()
  ePhoneOutAnim()
if menuIsOpen  == 1 then
		menuIsOpen = 0
		SendNUIMessage({method = 'closeGui'})
	end
end
 



--====================================================================================
--  Utils function
--====================================================================================
function GetPlayers()
    local players = {}

    for i = 0, 256 do
        if NetworkIsPlayerActive(i) then
            table.insert(players, i)
        end
    end

    return players
end

function GetClosestPlayer()
  local players = GetPlayers()
  local closestDistance = -1
  local closestPlayer = -1
  local ply = GetPlayerPed(-1)
  local plyCoords = GetEntityCoords(ply, 0)
  
  for index,value in ipairs(players) do
    local target = GetPlayerPed(value)
    if(target ~= ply) then
      local targetCoords = GetEntityCoords(GetPlayerPed(value), 0)
      local distance = GetDistanceBetweenCoords(targetCoords["x"], targetCoords["y"], targetCoords["z"], plyCoords["x"], plyCoords["y"], plyCoords["z"], true)
      if(closestDistance == -1 or closestDistance > distance) then
        closestPlayer = value
        closestDistance = distance
      end
    end
  end
  
  return closestPlayer, closestDistance
end
