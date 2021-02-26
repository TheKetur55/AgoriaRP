ESX               = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function LoadLicenses (source)
  TriggerEvent('esx_license:getLicenses', source, function (licenses)
    TriggerClientEvent('ktr_shopnodb:loadLicenses', source, licenses)
  end)
end

if Config.EnableLicense == true then
  AddEventHandler('esx:playerLoaded', function (source)
    LoadLicenses(source)
  end)
end


RegisterServerEvent('ktr_shopnodb:buyItem')
AddEventHandler('ktr_shopnodb:buyItem', function(itemName, price, zone)

  local _source = source
  local xPlayer  = ESX.GetPlayerFromId(source)
  local account = xPlayer.getAccount('black_money')

  if zone=="BlackWeashop" then
    if account.money >= price then

    xPlayer.removeAccountMoney('black_money', price)
    xPlayer.addWeapon(itemName, 100000)
    TriggerClientEvent('esx:showNotification', _source, _U('buy') .. ESX.GetWeaponLabel(itemName))

  else
    TriggerClientEvent('esx:showNotification', _source, _U('not_enough_black'))
  end

  else if xPlayer.get('money') >= price then

    xPlayer.removeMoney(price)
    xPlayer.addInventoryItem(itemName, 1)

  --  TriggerClientEvent('esx:showNotification', _source, _U('buy') .. ESX.GetWeaponLabel(itemName))

  else
    TriggerClientEvent('esx:showNotification', _source, _U('not_enough'))
  end
  end

end)


