ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_chirurgiep:pay')
AddEventHandler('esx_chirurgiep:pay', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.removeMoney(Config.Price)

	TriggerEvent('esx_addonaccount:getSharedAccount', 'society_ambulance', function(account)
                            societyAccount = account
                        end)

	TriggerClientEvent('esx:showNotification', _source, _U('you_paid') .. '$' .. Config.Price)
	societyAccount.addMoney(50000)

end)

ESX.RegisterServerCallback('esx_chirurgiep:checkMoney', function(source, cb)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	if xPlayer.get('money') >= Config.Price then
		cb(true)
	else
		cb(false)
	end

end)
