local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

ESX                              = nil
local GUI                        = {}
GUI.Time                         = 0
GUI.PhoneIsShowed                = false
GUI.MessagesIsShowed             = false
GUI.AddContactIsShowed           = false
local PhoneData                  = {phoneNumber = 0, contacts = {}}
local RegisteredMessageCallbacks = {}
local ContactJustAdded           = false
local CurrentAction              = nil
local CurrentActionMsg           = ''
local CurrentActionData          = {}
local CurrentDispatchRequestId   = -1
local phoneNumberSources         = {}

Citizen.CreateThread(function()

	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(1)
	end

	ESX.UI.Menu.RegisterType('cryptedphone', OpenPhone, ClosePhone)

end)

function OpenPhone()

	local playerPed = GetPlayerPed(-1)

	TriggerServerEvent('esx_cryptedphone:reload', PhoneData.phoneNumber)

  SendNUIMessage({
    showPhone = true,
    phoneData = PhoneData
  })

  GUI.PhoneIsShowed = true

  ESX.SetTimeout(250, function()
  	SetNuiFocus(true, true)
  end)

	if not IsPedInAnyVehicle(playerPed,  false) then
		TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_STAND_MOBILE", 0, true);
	end

end

function ClosePhone()

	local playerPed = GetPlayerPed(-1)

  SendNUIMessage({
  	showPhone = false
  })

  SetNuiFocus(false)

	GUI.PhoneIsShowed = false

	ClearPedTasks(playerPed)

end

RegisterNetEvent('esx_cryptedphone:loaded')
AddEventHandler('esx_cryptedphone:loaded', function(phoneNumber, contacts)

	PhoneData.phoneNumber = phoneNumber
	PhoneData.contacts = {}

	for i=1, #contacts, 1 do
		contacts[i].online = (phoneNumberSources[contacts[i].number] == nil and false or NetworkIsPlayerActive(GetPlayerFromServerId(phoneNumberSources[contacts[i].number]))),
		table.insert(PhoneData.contacts, contacts[i])
	end

	SendNUIMessage({
		reloadPhone = true,
		phoneData   = PhoneData
	})

end)

RegisterNetEvent('esx_cryptedphone:addContact')
AddEventHandler('esx_cryptedphone:addContact', function(name, phoneNumber)

	table.insert(PhoneData.contacts, {
		name   = name,
		number = phoneNumber,
		online = (phoneNumberSources[contacts[i].number] == nil and false or NetworkIsPlayerActive(GetPlayerFromServerId(phoneNumberSources[contacts[i].number]))),
	})
	-- CALL HERE RELOADCONTACT
	SendNUIMessage({
		contactAdded = true,
		phoneData    = PhoneData
	})
end)

RegisterNetEvent('esx_cryptedphone:addSpecialContact')
AddEventHandler('esx_cryptedphone:addSpecialContact', function(name, phoneNumber, base64Icon)

	SendNUIMessage({
		addSpecialContact = true,
		name              = name,
		number            = phoneNumber,
		base64Icon        = base64Icon
	})

end)

RegisterNetEvent('esx_cryptedphone:removeSpecialContact')
AddEventHandler('esx_cryptedphone:removeSpecialContact', function(phoneNumber)

	SendNUIMessage({
		removeSpecialContact = true,
		number               = phoneNumber
	})

end)

RegisterNUICallback('add_contact', function(data, cb)

	local phoneNumber = tonumber(data.phoneNumber)
  local contactName = tostring(data.contactName)

	if phoneNumber then
		TriggerServerEvent('esx_cryptedphone:addPlayerContact', phoneNumber, contactName)
	end

end)


RegisterNetEvent('esx_cryptedphone:onMessage')
AddEventHandler('esx_cryptedphone:onMessage', function(phoneNumber, message, position, anon, job, dispatchRequestId)

	if job == 'player' then
		TriggerEvent('InteractSound_CL:PlayOnOne', 'demo', 1.0)
	  ESX.ShowNotification(_U('new_message', message))
	else
	  ESX.ShowNotification('~b~' .. job .. ': ~s~' .. message)
	end

	SendNUIMessage({
		newMessage  = true,
		phoneNumber = phoneNumber,
		message     = message,
		position    = position,
		anonyme     = anon,
		job         = job
	})

	if dispatchRequestId then

		CurrentAction            = 'dispatch'
		CurrentActionMsg         = job .. _U('press_take_call')
		CurrentDispatchRequestId = dispatchRequestId

		CurrentActionData = {
			phoneNumber       = phoneNumber,
			message           = message,
			position          = position,
			actions           = actions,
			anonyme           = anon,
			job               = job
		}

		ESX.SetTimeout(15000, function()
			CurrentAction = nil
		end)

	end

end)

RegisterNetEvent('esx_cryptedphone:stopDispatch')
AddEventHandler('esx_cryptedphone:stopDispatch', function(dispatchRequestId, playerName)

	if CurrentDispatchRequestId == dispatchRequestId and CurrentAction == 'dispatch' then
		CurrentAction = nil
		ESX.ShowNotification(playerName .. _U('taken_call'))
	end

end)

RegisterNetEvent('esx_cryptedphone:setphoneNumberSource')
AddEventHandler('esx_cryptedphone:setphoneNumberSource', function(phoneNumber, source)

	if source == -1 then
		phoneNumberSources[phoneNumber] = nil
	else
		phoneNumberSources[phoneNumber] = source
	end
end)

RegisterNUICallback('setGPS', function(data)
	SetNewWaypoint(data.x,  data.y)
	ESX.ShowNotification(_U('gps_position'))
end)

RegisterNUICallback('send', function(data)

	local phoneNumber = data.number
	local playerPed   = GetPlayerPed(-1)
	local coords      = GetEntityCoords(playerPed)

	if tonumber(phoneNumber) ~= nil then
		phoneNumber = tonumber(phoneNumber)
	end

	TriggerServerEvent('esx_cryptedphone:send', phoneNumber, data.message, data.anonyme, {
		x = coords.x,
		y = coords.y,
		z = coords.z
	})

	SendNUIMessage({
		showMessageEditor = false
	})

	ESX.ShowNotification(_U('message_sent'))

end)

RegisterNUICallback('escape', function()
	ESX.UI.Menu.Close('cryptedphone', GetCurrentResourceName(), 'main')
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if GUI.PhoneIsShowed then -- codes here: https://pastebin.com/guYd0ht4
			DisableControlAction(0, 1,    true) -- LookLeftRight
			DisableControlAction(0, 2,    true) -- LookUpDown
			DisableControlAction(0, 25,   true) -- Input Aim
			DisableControlAction(0, 106,  true) -- Vehicle Mouse Control Override

			DisableControlAction(0, 24,   true) -- Input Attack
			DisableControlAction(0, 140,  true) -- Melee Attack Alternate
			DisableControlAction(0, 141,  true) -- Melee Attack Alternate
			DisableControlAction(0, 142,  true) -- Melee Attack Alternate
			DisableControlAction(0, 257,  true) -- Input Attack 2
			DisableControlAction(0, 263,  true) -- Input Melee Attack
			DisableControlAction(0, 264,  true) -- Input Melee Attack 2

			DisableControlAction(0, 12,   true) -- Weapon Wheel Up Down
			DisableControlAction(0, 14,   true) -- Weapon Wheel Next
			DisableControlAction(0, 15,   true) -- Weapon Wheel Prev
			DisableControlAction(0, 16,   true) -- Select Next Weapon
			DisableControlAction(0, 17,   true) -- Select Prev Weapon
		else
			if IsControlJustPressed(0, 182) and IsControlPressed(0, 209) then
				ESX.TriggerServerCallback('esx_cryptedphone:getItemAmount', function(qtty)
					if not ESX.UI.Menu.IsOpen('cryptedphone', GetCurrentResourceName(), 'main') and qtty > 0 then
						ESX.UI.Menu.CloseAll()
						ESX.UI.Menu.Open('cryptedphone', GetCurrentResourceName(), 'main')
					else
						ESX.ShowNotification("Vous n'avez pas de téléphone crypté.")
					end
				end, 'cryptedphone')
			end
		end
	end
end)

-- Key controls
Citizen.CreateThread(function()
	while true do

		Citizen.Wait(1)

		if CurrentAction ~= nil then

			SetTextComponentFormat('STRING')
			AddTextComponentString(CurrentActionMsg)
			DisplayHelpTextFromStringLabel(0, 0, 1, -1)

			if IsControlPressed(0,  Keys['E']) and (GetGameTimer() - GUI.Time) > 300 then

				if CurrentAction == 'dispatch' then
					TriggerServerEvent('esx_cryptedphone:stopDispatch', CurrentDispatchRequestId)
					SetNewWaypoint(CurrentActionData.position.x,  CurrentActionData.position.y)
				end

				CurrentAction = nil
				GUI.Time      = GetGameTimer()

			end

		end

	end
end)
