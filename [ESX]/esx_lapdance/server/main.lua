ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_lapdance:Buy')
AddEventHandler('esx_lapdance:Buy', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
	
    TriggerEvent('esx_addonaccount:getSharedAccount', 'society_unicorn', function(account)
                            societyAccount = account
                        end)
	if(xPlayer.getMoney() >= 1250) then
	xPlayer.removeMoney(1250)
    societyAccount.addMoney(1250)
	TriggerClientEvent('esx_lapdance:lapdance', _source)
	sendNotification(_source, 'Du köpte en lapdance för 1250 SEK', 'success', 2500)
	else
	sendNotification(_source, 'Vous n\'avez pas assez d\'argent sur vous', 'error', 2500)
	end

end)

--notification
function sendNotification(xSource, message, messageType, messageTimeout)
    TriggerClientEvent("pNotify:SendNotification", xSource, {
        text = message,
        type = messageType,
        queue = "lmao",
        timeout = messageTimeout,
        layout = "bottomCenter"
    })
end