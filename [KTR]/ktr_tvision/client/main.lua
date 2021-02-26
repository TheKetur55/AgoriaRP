ESX              = nil
local PlayerData = {}

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


local Nightvision = false
function setNightvision(flag)
  Nightvision = flag
end

Nightvision = true
RegisterNetEvent("Nightvision")
AddEventHandler("Nightvision", function()
    if ( Nightvision ) then
        SetNightvision(true)
        Nightvision = false
        --TriggerEvent('night-thermal')
        TriggerEvent('skinchanger:getSkin', function(skin)
            if skin.sex == 0 then
                local clothesSkin = {
                    ['mask_1'] = 132, ['mask_2'] = 0
                        }
              TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
            else
                local clothesSkin = {
                    ['mask_1'] = 132, ['mask_2']    = 0
                }
                TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
                end
    end)
    else
        SetNightvision(false)
        Nightvision = true
        TriggerEvent('skinchanger:getSkin', function(skin)
            if skin.sex == 0 then
                local clothesSkin = {
                    ['mask_1'] = 0, ['mask_2'] = 0
                        }
              TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
            else
                local clothesSkin = {
                    ['mask_1'] = 0, ['mask_2']  = 0
                }
                TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
                end
    end)
    end
end)

local Thermalvision = false
function SetThermalvision(flag2)
  Thermalvision = flag2
end

Thermalvision = true
RegisterNetEvent("Thermalvision")
AddEventHandler("Thermalvision", function()
    if ( Thermalvision ) then
        SetSeethrough(true)
        Thermalvision = false
        TriggerEvent('skinchanger:getSkin', function(skin)
            if skin.sex == 0 then
                local clothesSkin = {
                    ['mask_1'] = 132, ['mask_2'] = 0
                        }
              TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
            else
                local clothesSkin = {
                    ['mask_1'] = 132, ['mask_2']    = 0
                }
                TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
                end
    end)
        
    else
        SetSeethrough(false)
        Thermalvision = true
        TriggerEvent('skinchanger:getSkin', function(skin)
            if skin.sex == 0 then
                local clothesSkin = {
                    ['mask_1'] = 0, ['mask_2'] = 0
                        }
              TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
            else
                local clothesSkin = {
                    ['mask_1'] = 0, ['mask_2']  = 0
                }
                TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
                end
    end)
    end
end)

--[[
RegisterNetEvent('esx_thermalvision:useThermalVision')
AddEventHandler('esx_thermalvision:useThermalVision', function()
	if IsNightvisionActive() then
		SetNightvision(false)
		SetSeethrough(false)
	else
		SetNightvision(true)
		SetSeethrough(true)
	end
end)

RegisterNetEvent('esx_thermalvision:useNightVision')
AddEventHandler('esx_thermalvision:useNightVision', function()
	if IsNightvisionActive() then
		SetNightvision(false)
		SetSeethrough(false)
	else
		SetNightvision(true)
		SetSeethrough(false)
	end
end)
]]


local levelOfDamageToKillThisBitch = 912.0 

function IsValidVehicle( veh )
    local model = GetEntityModel( veh )

    if ( IsThisModelACar( model ) or IsThisModelABike( model ) or IsThisModelAQuadbike( model ) ) then  
        return true 
    else 
        return false 
    end 
end 

function ManageVehicleDamage()
    local ped = GetPlayerPed( -1 )

    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then 
        if ( IsPedSittingInAnyVehicle( ped ) ) then 
            local vehicle = GetVehiclePedIsIn( ped, false )

            if ( GetPedInVehicleSeat( vehicle, -1 ) == ped ) then 
              --  local damage = GetVehicleEngineHealth( vehicle )
               local damage = GetVehicleBodyHealth( vehicle )
              

                if ( damage < levelOfDamageToKillThisBitch and IsValidVehicle( vehicle ) ) then 
                	TriggerEvent('esx:showNotification', '~g~Votre véhicule est endommager')
                    SetVehicleEngineHealth( vehicle, 300 )
                    SetVehicleEngineOn( vehicle, false, true )
                end 
            end  
        end 
    end 
end 

Citizen.CreateThread( function()
    while true do 
        ManageVehicleDamage()

        Citizen.Wait( 0 )
    end 
end )


--
--
--
-- 3d vector (airport) <x,y,z>
local v1 = vector3(-1037.39, -2737.53, 20.20)
-- 2d vector (airport) <x,y>
local v2 = vector2(-1037.39, -2737.53)
-- '4d' vector (airport) <x,y,z,w>
local v3 = vector4(-1037.39, -2737.53, 20.20, 360)


function Draw3DText(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local p = GetGameplayCamCoords()
    local distance = GetDistanceBetweenCoords(p.x, p.y, p.z, x, y, z, 1)
    local scale = (1 / distance) * 2
    local fov = (1 / GetGameplayCamFov()) * 100
    local scale = scale * fov
    if onScreen then
        SetTextScale(0.0, 0.35)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
end

local distance_until_text_disappears = 150

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
            -- the "Vdist2" native checks how far two vectors are from another. 
            -- https://runtime.fivem.net/doc/natives/#_0xB7A628320EFF8E47
            if Vdist2(GetEntityCoords(PlayerPedId(), false), v1) < distance_until_text_disappears then
            	 Draw3DText(v1.x,v1.y,v1.z, "~y~Bienvenue sur Agoria Paradise")
                Draw3DText(v1.x,v1.y,v1.z-0.15, "~g~/agoriareload pour crée son personnage")
                Draw3DText(v1.x,v1.y,v1.z-0.30, "Mettez la densité des PNJ au minimum")
                 Draw3DText(v1.x,v1.y,v1.z-0.45, "Vous pouvez prendre le bus")
            end
    end
end)




-- Cross

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
		local ped = PlayerPedId()
            	if IsPedArmed(ped, 6) then
	    	DisableControlAction(1, 140, true)
            	DisableControlAction(1, 141, true)
            	DisableControlAction(1, 142, true)
        end
    end
end)


local BONES = {
    --[[Pelvis]][11816] = true,
    --[[SKEL_L_Thigh]][58271] = true,
    --[[SKEL_L_Calf]][63931] = true,
    --[[SKEL_L_Foot]][14201] = true,
    --[[SKEL_L_Toe0]][2108] = true,
    --[[IK_L_Foot]][65245] = true,
    --[[PH_L_Foot]][57717] = true,
    --[[MH_L_Knee]][46078] = true,
    --[[SKEL_R_Thigh]][51826] = true,
    --[[SKEL_R_Calf]][36864] = true,
    --[[SKEL_R_Foot]][52301] = true,
    --[[SKEL_R_Toe0]][20781] = true,
    --[[IK_R_Foot]][35502] = true,
    --[[PH_R_Foot]][24806] = true,
    --[[MH_R_Knee]][16335] = true,
    --[[RB_L_ThighRoll]][23639] = true,
    --[[RB_R_ThighRoll]][6442] = true,
}


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local ped = GetPlayerPed(-1)
            --if IsShockingEventInSphere(102, 235.497,2894.511,43.339,999999.0) then
            if HasEntityBeenDamagedByAnyPed(ped) then
            --if GetPedLastDamageBone(ped) = 
                    Disarm(ped)
            end
            ClearEntityLastDamageEntity(ped)
     end
end)



function Bool (num) return num == 1 or num == true end

-- WEAPON DROP OFFSETS
local function GetDisarmOffsetsForPed (ped)
    local v

    if IsPedWalking(ped) then v = { 0.6, 4.7, -0.1 }
    elseif IsPedSprinting(ped) then v = { 0.6, 5.7, -0.1 }
    elseif IsPedRunning(ped) then v = { 0.6, 4.7, -0.1 }
    else v = { 0.4, 4.7, -0.1 } end

    return v
end

function Disarm (ped)
    if IsEntityDead(ped) then return false end

    local boneCoords
    local hit, bone = GetPedLastDamageBone(ped)

    hit = Bool(hit)

    if hit then
        if BONES[bone] then
            

            boneCoords = GetWorldPositionOfEntityBone(ped, GetPedBoneIndex(ped, bone))
            SetPedToRagdoll(GetPlayerPed(-1), 5000, 5000, 0, 0, 0, 0)
            

            return true
        end
    end

    return false
end



local function stopPointing()
    local ped = GetPlayerPed(-1)
    Citizen.InvokeNative(0xD01015C7316AE176, ped, "Stop")
    if not IsPedInjured(ped) then
        ClearPedSecondaryTask(ped)
    end
    if not IsPedInAnyVehicle(ped, 1) then
        SetPedCurrentWeaponVisible(ped, 1, 1, 1, 1)
    end
    SetPedConfigFlag(ped, 36, 0)
    ClearPedSecondaryTask(PlayerPedId())
end



--[[Anti Tire
local passengerDriveBy = true

-- CODE --

Citizen.CreateThread(function()
	while true do
		Wait(1)

		playerPed = GetPlayerPed(-1)
		car = GetVehiclePedIsIn(playerPed, true)
		if car then
			if GetPedInVehicleSeat(car, 1) == playerPed then
				SetPlayerCanDoDriveBy(PlayerId(), true)
			elseif passengerDriveBy then
				SetPlayerCanDoDriveBy(PlayerId(), true)
			else
				SetPlayerCanDoDriveBy(PlayerId(), true)
			end
		end
	end
end)]]