ESX = nil
local _source = source
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local activity = 0
local activitySource = 0
local xPlayer = ESX.GetPlayerFromId(_source)

RegisterServerEvent('esx_carthief:pay')
AddEventHandler('esx_carthief:pay', function(payment)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local sourceXPlayer = ESX.GetPlayerFromId(_source)
	xPlayer.addAccountMoney('black_money',tonumber(payment))
--	TriggerEvent('esx_joblogs:AddInLog', 'volvoiturelux', 'volefin', GetPlayerName(PlayerId()))
	TriggerEvent('esx_joblogs:AddInLog', 'volvoiturelux', 'volefin', sourceXPlayer.name)
end)

ESX.RegisterServerCallback('esx_carthief:anycops',function(source, cb)
  local anycops = 0
  local playerList = GetPlayers()
  for i=1, #playerList, 1 do
    local _source = playerList[i]
    local xPlayer = ESX.GetPlayerFromId(_source)
    local playerjob = xPlayer.job.name
    if playerjob == 'police' then
      anycops = anycops + 1
    end
  end
  cb(anycops)
end)

ESX.RegisterServerCallback('esx_carthief:isActive',function(source, cb)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local sourceXPlayer = ESX.GetPlayerFromId(_source)
  cb(activity)
 -- TriggerEvent('esx_joblogs:AddInLog', 'volvoiturelux', 'volecommencer', GetPlayerName(PlayerId() ))
  TriggerEvent('esx_joblogs:AddInLog', 'volvoiturelux', 'volecommencer', sourceXPlayer.name)
end)

RegisterServerEvent('esx_carthief:registerActivity')
AddEventHandler('esx_carthief:registerActivity', function(value)
	activity = value
	if value == 1 then
		activitySource = source
		--Send notification to cops
		local xPlayers = ESX.GetPlayers()
		for i=1, #xPlayers, 1 do
			local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
			if xPlayer.job.name == 'police' or xPlayer.second_job.name == 'iaa' then
				TriggerClientEvent('esx_carthief:setcopnotification', xPlayers[i])
			end
		end
	else
		activitySource = 0
	end
end)

RegisterServerEvent('esx_carthief:alertcops')
AddEventHandler('esx_carthief:alertcops', function(cx,cy,cz)
	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	local xPlayers = ESX.GetPlayers()
	
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == 'police' or xPlayer.second_job.name == 'iaa' then
			TriggerClientEvent('esx_carthief:setcopblip', xPlayers[i], cx,cy,cz)
		end
	end
end)

RegisterServerEvent('esx_carthief:stopalertcops')
AddEventHandler('esx_carthief:stopalertcops', function()
	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	local xPlayers = ESX.GetPlayers()
	
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == 'police' or xPlayer.second_job.name == 'iaa' then
			TriggerClientEvent('esx_carthief:removecopblip', xPlayers[i])
		end
	end
end)

AddEventHandler('playerDropped', function ()
	local _source = source
	if _source == activitySource then
		--Remove blip for all cops
		local xPlayers = ESX.GetPlayers()
		for i=1, #xPlayers, 1 do
			local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
			if xPlayer.job.name == 'police' or xPlayer.second_job.name == 'iaa' then
				TriggerClientEvent('esx_carthief:removecopblip', xPlayers[i])
			end
		end
		--Set activity to 0
		activity = 0
		activitySource = 0
	end
end)