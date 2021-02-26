ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_securitycam2:unhackanimserver')
AddEventHandler('esx_securitycam2:unhackanimserver', function()
	local _source = source
	TriggerClientEvent('esx_securitycam2:unhackanim', _source)
end)

RegisterServerEvent('esx_securitycam2:setBankHackedState')
AddEventHandler('esx_securitycam2:setBankHackedState', function(state)
	print(('esx_securitycam2: %s has set the bank cameras to %s!'):format(GetPlayerIdentifiers(source)[1], state))
	TriggerClientEvent('esx_securitycam2:setBankHackedState', -1, state)
end)

RegisterServerEvent('esx_securitycam2:setPoliceHackedState')
AddEventHandler('esx_securitycam2:setPoliceHackedState', function(state)
	print(('esx_securitycam2: %s has set the police cameras to %s!'):format(GetPlayerIdentifiers(source)[1], state))
	TriggerClientEvent('esx_securitycam2:setPoliceHackedState', -1, state)
end)