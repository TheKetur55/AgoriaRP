
local duffle = true

local tafbw = true 
local tafsw = true 
local tafmw = true 
local tafdb = true 

local txt = "Personne" 
local bwtxt = "* La personne retire son arme. *"
local dbtxt = "* La personne retire son arme. *"
local dbtxterr = "Vous ne pouvez pas sortir cette arme."
local bwtxterr = "Vous ne pouvez pas sortir cette arme."
local swtxt = "* L'individu sort une arme. *"
local mwtxt = "* L'individu sort une arme blanche. *"





local color = { r = 23, g = 140, b = 240, alpha = 50 } -- yazı rengi 
local font = 0
local time = 1 
local background = {
    enable = false,
    color = { r = 23, g = 140, b = 240, alpha = 250 }, -- arka plan rengi şuan şeffaf
}
local chatMessage = false 
local dropShadow = false



-- Aracın yanındayken cıkması gereken silahlar (BİLMİYORSAN DOKUNMA)

bigweaponslist = {	
--[[	"WEAPON_MICROSMG",
	"WEAPON_MINISMG",
	"WEAPON_SMG",
	"WEAPON_SMG_MK2",
	"WEAPON_ASSAULTSMG",
	"WEAPON_MG",
	"WEAPON_COMBATMG",
	"WEAPON_COMBATMG_MK2",
	"WEAPON_COMBATPDW",
	"WEAPON_GUSENBERG",
	"WEAPON_ASSAULTRIFLE",
	"WEAPON_ASSAULTRIFLE_MK2",
	"WEAPON_CARBINERIFLE",
	"WEAPON_CARBINERIFLE_MK2",
	"WEAPON_ADVANCEDRIFLE",
	"WEAPON_SPECIALCARBINE",
	"WEAPON_BULLPUPRIFLE",
	"WEAPON_COMPACTRIFLE",
	"WEAPON_PUMPSHOTGUN",
	"WEAPON_SWEEPERSHOTGUN",
	"WEAPON_SAWNOFFSHOTGUN",
	"WEAPON_BULLPUPSHOTGUN",
	"WEAPON_ASSAULTSHOTGUN",
	"WEAPON_MUSKET",
	"WEAPON_HEAVYSHOTGUN",
	"WEAPON_DBSHOTGUN",
	"WEAPON_SNIPERRIFLE",
	"WEAPON_HEAVYSNIPER",
	"WEAPON_HEAVYSNIPER_MK2",
	"WEAPON_MARKSMANRIFLE",
	"WEAPON_GRENADELAUNCHER",
	"WEAPON_GRENADELAUNCHER_SMOKE",
	"WEAPON_RPG",
	"WEAPON_MINIGUN",
	"WEAPON_FIREWORK",
	"WEAPON_RAILGUN",
	"WEAPON_HOMINGLAUNCHER",
	"WEAPON_COMPACTLAUNCHER",
	"WEAPON_SPECIALCARBINE_MK2",
	"WEAPON_BULLPUPRIFLE_MK2",
	"WEAPON_PUMPSHOTGUN_MK2",
	"WEAPON_MARKSMANRIFLE_MK2",
	"WEAPON_RAYPISTOL",
	"WEAPON_RAYCARBINE",
	"WEAPON_RAYMINIGUN",]]
	"WEAPON_DIGISCANNER"
}



-- ÇIKARTILABİLİNCEK SİLAHLAR

smallweaponslist = {
	"WEAPON_MICROSMG",
	"WEAPON_MINISMG",
	"WEAPON_SMG",
	"WEAPON_SMG_MK2",
	"WEAPON_ASSAULTSMG",
	"WEAPON_MG",
	"WEAPON_COMBATMG",
	"WEAPON_COMBATMG_MK2",
	"WEAPON_COMBATPDW",
	"WEAPON_GUSENBERG",
	"WEAPON_ASSAULTRIFLE",
	"WEAPON_ASSAULTRIFLE_MK2",
	"WEAPON_CARBINERIFLE",
	"WEAPON_CARBINERIFLE_MK2",
	"WEAPON_ADVANCEDRIFLE",
	"WEAPON_SPECIALCARBINE",
	"WEAPON_BULLPUPRIFLE",
	"WEAPON_COMPACTRIFLE",
	"WEAPON_PUMPSHOTGUN",
	"WEAPON_SWEEPERSHOTGUN",
	"WEAPON_SAWNOFFSHOTGUN",
	"WEAPON_BULLPUPSHOTGUN",
	"WEAPON_ASSAULTSHOTGUN",
	"WEAPON_MUSKET",
	"WEAPON_HEAVYSHOTGUN",
	"WEAPON_DBSHOTGUN",
	"WEAPON_SNIPERRIFLE",
	"WEAPON_HEAVYSNIPER",
	"WEAPON_HEAVYSNIPER_MK2",
	"WEAPON_MARKSMANRIFLE",
	"WEAPON_GRENADELAUNCHER",
	"WEAPON_GRENADELAUNCHER_SMOKE",
	"WEAPON_RPG",
	"WEAPON_MINIGUN",
	"WEAPON_FIREWORK",
	"WEAPON_RAILGUN",
	"WEAPON_HOMINGLAUNCHER",
	"WEAPON_COMPACTLAUNCHER",
	"WEAPON_SPECIALCARBINE_MK2",
	"WEAPON_BULLPUPRIFLE_MK2",
	"WEAPON_PUMPSHOTGUN_MK2",
	"WEAPON_MARKSMANRIFLE_MK2",
	"WEAPON_RAYPISTOL",

	--
	"WEAPON_REVOLVER",
	"WEAPON_PISTOL",
	"WEAPON_PISTOL_MK2",
	"WEAPON_COMBATPISTOL",
	"WEAPON_APPISTOL",
	"WEAPON_PISTOL50",
	"WEAPON_SNSPISTOL",
	"WEAPON_HEAVYPISTOL",
	"WEAPON_VINTAGEPISTOL",
	"WEAPON_STUNGUN",
	"WEAPON_FLAREGUN",
	"WEAPON_MARKSMANPISTOL",
	"WEAPON_MACHINEPISTOL",
	"WEAPON_SNSPISTOL_MK2",
	"WEAPON_REVOLVER_MK2",
	"WEAPON_DOUBLEACTION",
	
--	"WEAPON_PROXMINE",
--	"WEAPON_BZGAS",
	--"WEAPON_SMOKEGRENADE",
--	"WEAPON_MOLOTOV",
--	"WEAPON_FIREEXTINGUISHER",
----	"WEAPON_PETROLCAN",
--	"WEAPON_SNOWBALL",
--	"WEAPON_FLARE",
--	"WEAPON_BALL",
--	"WEAPON_GRENADE",
	"WEAPON_STICKYBOMB"
}



-- BIÇAK LİSTESİ

meleeweaponslist = {
	"WEAPON_KNIFE",
	"WEAPON_KNUCKLE",
	"WEAPON_NIGHTSTICK",
	"WEAPON_HAMMER",
	"WEAPON_BAT",
	"WEAPON_GOLFCLUB",
	"WEAPON_CROWBAR",
	"WEAPON_BOTTLE",
	"WEAPON_DAGGER",
	"WEAPON_HATCHET",
	"WEAPON_MACHETE",
	--"WEAPON_FLASHLIGHT",
	"WEAPON_SWITCHBLADE",
	"WEAPON_POOLCUE",
	"WEAPON_PIPEWRENCH"
}



-- BİLMİYORSAN OYNAMA --

local nbrDisplaying = 1
--[[
RegisterCommand('me', function(source, args)
    local text = "* "..txt 
    for i = 1,#args do
        text = text .. ' ' .. args[i]
    end
    text = text .. ' *'
    TriggerServerEvent('3dme:shareDisplay2', text)
end)]]

RegisterNetEvent('3dme:triggerDisplay')
AddEventHandler('3dme:triggerDisplay', function(text, source)
    local offset = 1 + (nbrDisplaying*0.14)
    Display(GetPlayerFromServerId(source), text, offset)
end)

function Display(mePlayer, text, offset)
    local displaying = true

    if chatMessage then
        local coordsMe = GetEntityCoords(GetPlayerPed(mePlayer), false)
        local coords = GetEntityCoords(PlayerPedId(), false)
        local dist = Vdist2(coordsMe, coords)
        if dist < 2500 then
            TriggerEvent('chat:addMessage', {
                color = { color.r, color.g, color.b },
                multiline = true,
                args = { text}
            })
        end
    end

    Citizen.CreateThread(function()
        Wait(1000)
        displaying = false
    end)
    Citizen.CreateThread(function()
        nbrDisplaying = nbrDisplaying + 1
      --  print(nbrDisplaying)
        while displaying do
            Wait(0)
            local coordsMe = GetEntityCoords(GetPlayerPed(mePlayer), false)
            local coords = GetEntityCoords(PlayerPedId(), false)
            local dist = Vdist2(coordsMe, coords)
            if dist < 2500 then
                DrawText3D(coordsMe['x'], coordsMe['y'], coordsMe['z']+offset, text)
            end
        end
        nbrDisplaying = nbrDisplaying - 1
    end)
end


function DrawText3D(x,y,z, text)
    local onScreen,_x,_y = World3dToScreen2d(x,y,z)
    local px,py,pz = table.unpack(GetGameplayCamCoord())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
 
    local scale = ((1/dist)*2)*(1/GetGameplayCamFov())*100

    if onScreen then

        -- Formalize the text
        SetTextColour(color.r, color.g, color.b, color.alpha)
        SetTextScale(0.0*scale, 0.55*scale)
        SetTextFont(font)
        SetTextProportional(1)
        SetTextCentre(true)
        if dropShadow then
            SetTextDropshadow(10, 100, 100, 100, 255)
        end

        BeginTextCommandWidth("STRING")
        AddTextComponentString(text)
        local height = GetTextScaleHeight(0.55*scale, font)
        local width = EndTextCommandGetWidth(font)

        SetTextEntry("STRING")
        AddTextComponentString(text)
        EndTextCommandDisplayText(_x, _y)

        if background.enable then
            DrawRect(_x, _y+scale/45, width, height, background.color.r, background.color.g, background.color.b , background.color.alpha)
        end
    end
end

RegisterCommand('infoarme', function(source, args)
    playerPed = GetPlayerPed(-1)
	if playerPed then
		local weapon = GetSelectedPedWeapon(playerPed, true)
		nameWeapon(weapon)
	end
end)
--[[
RegisterCommand('cinfo', function(source, args)
    playerPed = GetPlayerPed(-1)
	if playerPed then
		getCustomization()
	end
end)
]]
-- OYNAMAYIN --

allweaponslist = {
	"WEAPON_MICROSMG",
	"WEAPON_MINISMG",
	"WEAPON_SMG",
	"WEAPON_SMG_MK2",
	"WEAPON_ASSAULTSMG",
	"WEAPON_MG",
	"WEAPON_COMBATMG",
	"WEAPON_COMBATMG_MK2",
	"WEAPON_COMBATPDW",
	"WEAPON_GUSENBERG",
	"WEAPON_ASSAULTRIFLE",
	"WEAPON_ASSAULTRIFLE_MK2",
	"WEAPON_CARBINERIFLE",
	"WEAPON_CARBINERIFLE_MK2",
	"WEAPON_ADVANCEDRIFLE",
	"WEAPON_SPECIALCARBINE",
	"WEAPON_BULLPUPRIFLE",
	"WEAPON_COMPACTRIFLE",
	"WEAPON_PUMPSHOTGUN",
	"WEAPON_SWEEPERSHOTGUN",
	"WEAPON_SAWNOFFSHOTGUN",
	"WEAPON_BULLPUPSHOTGUN",
	"WEAPON_ASSAULTSHOTGUN",
	"WEAPON_MUSKET",
	"WEAPON_HEAVYSHOTGUN",
	"WEAPON_DBSHOTGUN",
	"WEAPON_SNIPERRIFLE",
	"WEAPON_HEAVYSNIPER",
	"WEAPON_HEAVYSNIPER_MK2",
	"WEAPON_MARKSMANRIFLE",
	"WEAPON_GRENADELAUNCHER",
	"WEAPON_GRENADELAUNCHER_SMOKE",
	"WEAPON_RPG",
	"WEAPON_MINIGUN",
	"WEAPON_FIREWORK",
	"WEAPON_RAILGUN",
	"WEAPON_HOMINGLAUNCHER",
	"WEAPON_COMPACTLAUNCHER",
	"WEAPON_SPECIALCARBINE_MK2",
	"WEAPON_BULLPUPRIFLE_MK2",
	"WEAPON_PUMPSHOTGUN_MK2",
	"WEAPON_MARKSMANRIFLE_MK2",
	"WEAPON_RAYPISTOL",
	"WEAPON_RAYCARBINE",
	"WEAPON_RAYMINIGUN",
	"WEAPON_DIGISCANNER",
	
	"WEAPON_REVOLVER",
	"WEAPON_PISTOL",
	"WEAPON_PISTOL_MK2",
	"WEAPON_COMBATPISTOL",
	"WEAPON_APPISTOL",
	"WEAPON_PISTOL50",
	"WEAPON_SNSPISTOL",
	"WEAPON_HEAVYPISTOL",
	"WEAPON_VINTAGEPISTOL",
	"WEAPON_STUNGUN",
	"WEAPON_FLAREGUN",
	"WEAPON_MARKSMANPISTOL",
	"WEAPON_MACHINEPISTOL",
	"WEAPON_SNSPISTOL_MK2",
	"WEAPON_REVOLVER_MK2",
	"WEAPON_DOUBLEACTION",
	
	"WEAPON_PROXMINE",
	"WEAPON_BZGAS",
	"WEAPON_SMOKEGRENADE",
	"WEAPON_MOLOTOV",
	"WEAPON_FIREEXTINGUISHER",
	"WEAPON_PETROLCAN",
	"WEAPON_SNOWBALL",
	"WEAPON_FLARE",
	"WEAPON_BALL",
	"WEAPON_GRENADE",
	"WEAPON_STICKYBOMB",
	
	"WEAPON_KNIFE",
	"WEAPON_KNUCKLE",
	"WEAPON_NIGHTSTICK",
	"WEAPON_HAMMER",
	"WEAPON_BAT",
	"WEAPON_GOLFCLUB",
	"WEAPON_CROWBAR",
	"WEAPON_BOTTLE",
	"WEAPON_DAGGER",
	"WEAPON_HATCHET",
	"WEAPON_MACHETE",
	"WEAPON_FLASHLIGHT",
	"WEAPON_SWITCHBLADE",
	"WEAPON_POOLCUE",
	"WEAPON_PIPEWRENCH"
}


daw = false
bigWeaponOut = false
smallWeaponOut = false
meleeWeaponOut = false

Citizen.CreateThread(function()
	while true do
		Wait(250)

		playerPed = GetPlayerPed(-1)
		if playerPed then
			local weapon = GetSelectedPedWeapon(playerPed, true)
			if daw == true then
				RemoveAllPedWeapons(playerPed, true)
			else
				if isWeaponBig(weapon) then
					local vehicle = VehicleInFront()
					if GetVehiclePedIsIn(playerPed, false) == 0 and DoesEntityExist(vehicle) and IsEntityAVehicle(vehicle) and bigWeaponOut == false then
						bigWeaponOut = true
						SetVehicleDoorOpen(vehicle, 5, false, false)
						if tafbw == true then
							local text = bwtxt
							TriggerServerEvent('3dme:shareDisplay2', text)
						end
						Citizen.Wait(2000)
						SetVehicleDoorShut(vehicle, 5, false)
					else
						if duffle == true then
							if IsPedModel(playerPed,1885233650) and bigWeaponOut == false and GetVehiclePedIsIn(playerPed, false) == 0 then -- male
								if GetPedDrawableVariation(playerPed,5) == 45 and GetPedTextureVariation(playerPed,5) == 0 and GetPedPaletteVariation(playerPed,5) == 0 then
									bigWeaponOut = true
									if tafdb == true then
										local text = dbtxt
										TriggerServerEvent('3dme:shareDisplay2', text)
									end
								else
									Wait(1)
									drawNotification("~p~ ~r~"..dbtxterr.."")
									SetCurrentPedWeapon(playerPed, -1569615261)
								end
							else	
								if IsPedModel(playerPed,-1667301416) and bigWeaponOut == false and GetVehiclePedIsIn(playerPed, false) == 0 then -- female
									if GetPedDrawableVariation(playerPed,5) == 45 and GetPedTextureVariation(playerPed,5) == 0 and GetPedPaletteVariation(playerPed,5) == 0 then
										bigWeaponOut = true
										if tafdb == true then
											local text = dbtxt
											TriggerServerEvent('3dme:shareDisplay2', text)
										end
									else
										SetCurrentPedWeapon(playerPed, -1569615261)
									end
								else
									if bigWeaponOut == false and GetVehiclePedIsIn(playerPed, false) == 0 then
									Wait(1)
									drawNotification("~p~ ~r~"..dbtxterr.."")
									SetCurrentPedWeapon(playerPed, -1569615261)
									end
								end
							end
						else
							if bigWeaponOut == false and GetVehiclePedIsIn(playerPed, false) == 0 then
								Wait(1)
								drawNotification("~p~ ~r~"..bwtxterr.."")
								SetCurrentPedWeapon(playerPed, -1569615261)
							end
						end
					end
				end
				if GetVehiclePedIsIn(playerPed, false) == 0 and isWeaponSmall(weapon) then
					if smallWeaponOut == false then
						smallWeaponOut = true
						if tafsw == true then
							local text = swtxt
							TriggerServerEvent('3dme:shareDisplay2', text)
						end
						Citizen.Wait(100)
					end
				end

				if GetVehiclePedIsIn(playerPed, false) == 0 and isWeaponMelee(weapon) then
					if meleeWeaponOut == false then
						meleeWeaponOut = true
						if tafmw == true then
							local text = mwtxt
							TriggerServerEvent('3dme:shareDisplay2', text)
						end
						Citizen.Wait(100)
					end
				end
			end
		end
	end
end)

-- do not edit !!

Citizen.CreateThread(function()
	while true do
		Wait(500)
		
		playerPed = GetPlayerPed(-1)
		if playerPed then
			local weapon = GetSelectedPedWeapon(playerPed, true)
			if not isWeaponBig(weapon) and bigWeaponOut == true then
				Wait(100)
				bigWeaponOut = false
			end
			if not isWeaponSmall(weapon) and smallWeaponOut == true then
				Wait(100)
				smallWeaponOut = false
			end
			if not isWeaponMelee(weapon) and meleeWeaponOut == true then
				Wait(100)
				meleeWeaponOut = false
			end
		end
	end
end)


function VehicleInFront()
	local player = PlayerPedId()
    local pos = GetEntityCoords(player)
    local entityWorld = GetOffsetFromEntityInWorldCoords(player, 0.0, 2.0, 0.0)
    local rayHandle = CastRayPointToPoint(pos.x, pos.y, pos.z, entityWorld.x, entityWorld.y, entityWorld.z, 30, player, 0)
    local _, _, _, _, result = GetRaycastResult(rayHandle)
    return result
end


function isWeaponBig(model)
	for _, bigWeapon in pairs(bigweaponslist) do
		if model == GetHashKey(bigWeapon) then
			return true
		end
	end

	return false
end


function isWeaponSmall(model)
	for _, smallWeapon in pairs(smallweaponslist) do
		if model == GetHashKey(smallWeapon) then
			return true
		end
	end

	return false
end


function isWeaponMelee(model)
	for _, meleeWeapon in pairs(meleeweaponslist) do
		if model == GetHashKey(meleeWeapon) then
			return true
		end
	end

	return false
end


function nameWeapon(model)
	if model == -1569615261 then
		local text = "* "..model.." Unarmed *"
		TriggerEvent('chat:addMessage', {
        color = { color.r, color.g, color.b },
        multiline = true,
        args = { text}
		})
		return true
	else
		for _, weapons in pairs(allweaponslist) do
			if model == GetHashKey(weapons) then
				local text = "* "..model.." "..weapons.." *"
				TriggerEvent('chat:addMessage', {
				color = { color.r, color.g, color.b },
				multiline = true,
				args = { text}
				})
				return true
			end
		end
	end
	local text = "* "..model.." ERROR *"
	TriggerEvent('chat:addMessage', {
	color = { color.r, color.g, color.b },
	multiline = true,
	args = { text}
	})
	return false
end

function drawNotification(Notification)
	SetNotificationTextEntry('STRING')
	AddTextComponentString(Notification)
	DrawNotification(false, false)
end

function getCustomization()
	local ped = GetPlayerPed(-1)

	local custom = {}

	custom.modelhash = GetEntityModel(ped)

	for i=0,20 do 
		custom[i] = {GetPedDrawableVariation(ped,i), GetPedTextureVariation(ped,i), GetPedPaletteVariation(ped,i)}
		drawNotification("ped " ..GetPedDrawableVariation(ped,i).. " " ..GetPedTextureVariation(ped,i).. " " ..GetPedPaletteVariation(ped,i).. " ped")
	end

	-- props
	for i=0,10 do 
		custom["p"..i] = {GetPedPropIndex(ped,i), math.max(GetPedPropTextureIndex(ped,i),0)}
		drawNotification("props " ..GetPedPropIndex(ped,i).. " " ..math.max(GetPedPropTextureIndex(ped,i),0).. " props")
	end

	

	return custom
end