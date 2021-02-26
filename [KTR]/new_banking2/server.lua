--================================================================================================
--==                                VARIABLES - DO NOT EDIT                                     ==
--================================================================================================
ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('bank2:deposit2')
AddEventHandler('bank2:deposit2', function(amount)
	local _source = source
	
	local xPlayer = ESX.GetPlayerFromId(_source)
	if amount == nil or amount <= 0 or amount > xPlayer.getMoney() then
		TriggerClientEvent('bank2:result', _source, "error", "Montant invalide.")
	else
		xPlayer.removeMoney(amount)
		xPlayer.addAccountMoney('bank', tonumber(amount))
		TriggerClientEvent('bank2:result', _source, "success", "Dépot effectué.")
		TriggerEvent('esx_joblogs:AddInLog', 'banque', 'banque_deposer',xPlayer.name, amount)
	end
end)


RegisterServerEvent('bank2:withdraw2')
AddEventHandler('bank2:withdraw2', function(amount)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local base = 0
	amount = tonumber(amount)
	base = xPlayer.getAccount('bank').money
	if amount == nil or amount <= 0 or amount > base then
		TriggerClientEvent('bank2:result', _source, "error", "Montant invalide.")
	else
		xPlayer.removeAccountMoney('bank', amount)
		xPlayer.addMoney(amount)
		TriggerClientEvent('bank2:result', _source, "success", "Retrait effectué.")
		TriggerEvent('esx_joblogs:AddInLog', 'banque', 'banque_retirer',xPlayer.name, amount)
	end
end)

RegisterServerEvent('bank2:balance2')
AddEventHandler('bank2:balance2', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	balance = xPlayer.getAccount('bank').money
	TriggerClientEvent('currentbalance1', _source, balance)
end)


RegisterServerEvent('bank2:transfer2')
AddEventHandler('bank2:transfer2', function(to, amountt)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local zPlayer = ESX.GetPlayerFromId(to)
	local balance = 0

	if(zPlayer == nil or zPlayer == -1) then
		TriggerClientEvent('bank2:result', _source, "error", "Destinataire introuvable.")
	else
		balance = xPlayer.getAccount('bank').money
		zbalance = zPlayer.getAccount('bank').money
		
		if tonumber(_source) == tonumber(to) then
			TriggerClientEvent('bank2:result', _source, "error", "Vous ne pouvez pas faire de transfert à vous même.")
		else
			if balance <= 0 or balance < tonumber(amountt) or tonumber(amountt) <= 0 then
				TriggerClientEvent('bank2:result', _source, "error", "Vous n'avez pas assez d'argent en banque.")
			else
				xPlayer.removeAccountMoney('bank', tonumber(amountt))
				zPlayer.addAccountMoney('bank', tonumber(amountt))
				TriggerClientEvent('bank2:result', _source, "success", "Transfert effectué.")
			end
		end
	end
end)





