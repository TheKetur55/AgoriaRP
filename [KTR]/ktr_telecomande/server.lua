ESX                        = nil


TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


ESX.RegisterUsableItem('ktrneon', function(source)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    TriggerClientEvent('ktr_telecomande:menuouvre', _source)
end)


ESX.RegisterUsableItem('nitro', function(source)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    xPlayer.removeInventoryItem('nitro', 1)
    TriggerClientEvent('ktr_telecomande:nitro', _source)
end)