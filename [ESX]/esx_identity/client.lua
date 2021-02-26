 --==================================================================================
--======               ESX_IDENTITY BY ARKSEYONET @Ark                        ======
--======    YOU CAN FIND ME ON MY DISCORD @Ark - https://discord.gg/cGHHxPX   ======
--======    IF YOU ALTER THIS VERSION OF THE SCRIPT, PLEASE GIVE ME CREDIT    ======
--======     Special Thanks To Alphakush and CMD.Telhada For Help Testing     ======
--==================================================================================

--===============================================
--==                 VARIABLES                 ==
--===============================================
local guiEnabled = false
local myIdentity = {}

local skinchangerEnabled = false

local ESX = nil

--===============================================
--==                 ESX                       ==
--===============================================

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

--===============================================
--==                 VARIABLES                 ==
--===============================================
function EnableGui(enable)
	SetNuiFocus(enable)
	guiEnabled = enable

	SendNUIMessage({
		type = "enableui",
		enable = enable
	})
end

function openRegistry()
	TriggerEvent('esx_identity:showRegisterIdentity')
end

function freeze(ped) 
	ESX.Game.Teleport(ped, {
		x = 402.810,
		y = -997.22,
		z = -100.00
	}, function()
		SetEntityHeading(ped, 180.0)
		TriggerEvent('instance:create', 'register')
	end)

	FreezeEntityPosition(ped, true)
	SetEntityCollision(ped, false)
	SetPlayerInvincible(ped, true)
end

function unfreeze(ped, tp) 
	print('unfreeze')
	FreezeEntityPosition(ped, false)
	SetEntityCollision(ped, true)
	SetPlayerInvincible(ped, false)

	if(tp == nil) then
		TriggerEvent('instance:close')
	else
		ESX.Game.Teleport(ped, {
			x = -1042.28,
			y = -2745.39,
			z = 20.363
		}, function()
			SetEntityHeading(ped, 338.0)
			TriggerEvent('instance:close')
		end)
	end
end


RegisterNetEvent("esx_identity:open2")
AddEventHandler("esx_identity:open2", function()
	--Wait (500)
	freeze(GetPlayerPed(-1))
	EnableGui(true)
end)



RegisterNetEvent("esx_identity:open")
AddEventHandler("esx_identity:open", function()
	Wait (500)
	freeze(GetPlayerPed(-1))
	EnableGui(true)
end)

--===============================================
--==           Show Registration               ==
--===============================================
RegisterNetEvent("esx_identity:showRegisterIdentity")
AddEventHandler("esx_identity:showRegisterIdentity", function()
	Wait (500)
	freeze(GetPlayerPed(-1))
	EnableGui(true)
end)

--===============================================
--==              Close GUI                    ==
--===============================================
RegisterNUICallback('escape', function(data, cb)
	EnableGui(false)
end)

--===============================================
--==           Register Callback               ==
--===============================================
RegisterNUICallback('register', function(data, cb)
	myIdentity = data
	TriggerServerEvent('esx_identity:setIdentity', data)
	TriggerServerEvent("esx:charCreationDiscord")
	EnableGui(false)
	Wait (500)
	print('Registered ' .. data.sex)
	TriggerEvent('esx_identity:showskinchooser', data.sex)
	--TriggerEvent('esx_skin:OpenSaveableMenu2')
	--unfreeze(GetPlayerPed(-1), true)
end)

--===============================================
--==              Show Skin                    ==
--===============================================
RegisterNetEvent("esx_identity:showskinchooser")
AddEventHandler("esx_identity:showskinchooser", function(sex)
	Wait (1000)
	freeze(GetPlayerPed(-1))

	local restrict = {}
	if sex == 'F' then
		--TriggerEvent('skinchanger:loadDefaultModel', false, cb)
		TriggerEvent('skinchanger:loadSkin', {sex = 1})
		TriggerEvent('skinchanger:change', 'face', 21)
		TriggerEvent('skinchanger:change', 'hair_1', 42)
		TriggerEvent('skinchanger:change', 'glasses_1', 5)
		TriggerEvent('skinchanger:change', 'eyebrows_2', 10)
		TriggerEvent('skinchanger:change', 'tshirt_1', 0)
		TriggerEvent('skinchanger:change', 'tshirt_2', 0)
		TriggerEvent('skinchanger:change', 'torso_1', 0)
		TriggerEvent('skinchanger:change', 'torso_2', 0)
		restrict = {
			'face',
		'skin',
		'age_1',
		'age_2',
		'eye_color',
		'blemishes_1',
		'blemishes_2',
		'blush_1',
		'blush_2',
		'blush_3',
		'complexion_1',
		'complexion_2',
		'sun_1',
		'sun_2',
		'moles_1',
		'moles_2',
		'chest_1',
		'chest_2',
		'chest_3',
		'bodyb_1',
		'bodyb_2',
	--	'beard_1',
	--	'beard_2',
	--	'beard_3',
	--	'beard_4',
		'eyebrows_1',
		'eyebrows_2',
		'eyebrows_3',
		'eyebrows_4',
		'hair_1',
		'hair_2',
		'hair_color_1',
		'hair_color_2',
		'tshirt_1',
		'tshirt_2',
		'arms',
		'torso_1',
		'torso_2',
		'pants_1',
		'pants_2',
		'shoes_1',
		'shoes_2',
		'chain_1',
		'chain_2',
		'watches_1',
		'watches_2',
		'bracelets_1',
		'bracelets_2'
		}
	else
		--TriggerEvent('skinchanger:loadDefaultModel', true, cb)
		TriggerEvent('skinchanger:loadSkin', {sex = 0})
		TriggerEvent('skinchanger:change', 'hair_1', 0)
		TriggerEvent('skinchanger:change', 'arms', 15)
		TriggerEvent('skinchanger:change', 'hair_color_1', 0)
		TriggerEvent('skinchanger:change', 'eyebrows_2', 10)
		TriggerEvent('skinchanger:change', 'tshirt_1', 15)
		TriggerEvent('skinchanger:change', 'tshirt_2', 0)
		TriggerEvent('skinchanger:change', 'torso_1', 15)
		TriggerEvent('skinchanger:change', 'torso_2', 0)
		TriggerEvent('skinchanger:change', 'pants_1', 29)
		TriggerEvent('skinchanger:change', 'pants_2', 0)
		TriggerEvent('skinchanger:change', 'shoes_1', 5)
		restrict = {
		'face',
		'skin',
		'age_1',
		'age_2',
		'eye_color',
		'blemishes_1',
		'blemishes_2',
		'blush_1',
		'blush_2',
		'blush_3',
		'complexion_1',
		'complexion_2',
		'sun_1',
		'sun_2',
		'moles_1',
		'moles_2',
		'chest_1',
		'chest_2',
		'chest_3',
		'bodyb_1',
		'bodyb_2',
		'beard_1',
		'beard_2',
		'beard_3',
		'beard_4',
		'eyebrows_1',
		'eyebrows_2',
		'eyebrows_3',
		'eyebrows_4',
		'hair_1',
		'hair_2',
		'hair_color_1',
		'hair_color_2',
		'tshirt_1',
		'tshirt_2',
		'arms',
		'torso_1',
		'torso_2',
		'pants_1',
		'pants_2',
		'shoes_1',
		'shoes_2',
		'chain_1',
		'chain_2',
		'watches_1',
		'watches_2',
		'bracelets_1',
		'bracelets_2'
	}
		end


	skinchangerEnabled = true

	TriggerEvent('esx_skin:openRestrictedMenu', function(data, menu)
		menu.close()
		TriggerEvent('skinchanger:getSkin', function(skin)
			TriggerServerEvent('esx_skin:save', skin)
			unfreeze(GetPlayerPed(-1), true)
			skinchangerEnabled = false
		end)
	end, function(data, menu) 
		print('Cancel')
	end, restrict)
end)

--===============================================
--==                 THREADING                 ==
--===============================================
Citizen.CreateThread(function()
	while true do
		if skinchangerEnabled then
		--	DisableControlAction(0, 1, guiEnabled) -- LookLeftRight
		--	DisableControlAction(0, 2, guiEnabled) -- LookUpDown

			DisableControlAction(0, 142, guiEnabled) -- MeleeAttackAlternate
		--	DisableControlAction(0, Keys['ESC'], true)322
			DisableControlAction(0, 322, guiEnabled)
			DisableControlAction(0, 199, guiEnabled)
			DisableControlAction(0, 200, guiEnabled)
			DisableControlAction(0, 298, guiEnabled)

			DisableControlAction(0, 106, guiEnabled) -- VehicleMouseControlOverride
			DisableControlAction(0, 177, guiEnabled)
			DisableControlAction(0, 318, guiEnabled)
			DisableControlAction(0, 327, guiEnabled)
		end

		if guiEnabled then
			DisableControlAction(0, 1, guiEnabled) -- LookLeftRight
			DisableControlAction(0, 2, guiEnabled) -- LookUpDown

			DisableControlAction(0, 142, guiEnabled) -- MeleeAttackAlternate

			DisableControlAction(0, 106, guiEnabled) -- VehicleMouseControlOverride
			DisableControlAction(0, 177, guiEnabled)
			if IsDisabledControlJustReleased(0, 142) then -- MeleeAttackAlternate
				SendNUIMessage({
					type = "click"
				})
			end
		end

		Citizen.Wait(0)
	end
end)

--===============================================
--==                 INSTANCES                 ==
--===============================================
TriggerEvent('instance:registerType', 'register')
RegisterNetEvent('instance:onCreate')
AddEventHandler('instance:onCreate', function(instance)

	if instance.type == 'register' then
		TriggerEvent('instance:enter', instance)
	end

end)