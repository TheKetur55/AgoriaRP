--====================================================================================
-- # Discord XenKnighT#7085
--====================================================================================


TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RegisterServerEvent('xenknight:transfer')
AddEventHandler('xenknight:transfer', function(to, amountt)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local zPlayer = ESX.GetPlayerFromId(to)
    local balance = 0
    if zPlayer ~= nil then
        balance = xPlayer.getAccount('bank').money
        zbalance = zPlayer.getAccount('bank').money
        if tonumber(_source) == tonumber(to) then
            -- advanced notification with bank icon

           TriggerClientEvent('esx:showAdvancedNotification', _source, 'Bank',
                               'Transfère',
                               'Action impossible!',
                               'CHAR_BANK_FLEECA', 9)
        else
            if balance <= 0 or balance < tonumber(amountt) or tonumber(amountt) <=
                0 then
                -- advanced notification with bank icon
                TriggerClientEvent('esx:showAdvancedNotification', _source,
                                   'Bank', 'Transfère',
                                   'Vous n\'avez pas assez d\'argent!',
                                   'CHAR_BANK_FLEECA', 9)
            else
                xPlayer.removeAccountMoney('bank', tonumber(amountt))
                zPlayer.addAccountMoney('bank', tonumber(amountt))
                -- advanced notification with bank icon
                TriggerEvent('esx_joblogs:AddInLog', 'banque', 'banque_ded',xPlayer.name, amountt , zPlayer.name)
                TriggerClientEvent('esx:showAdvancedNotification', _source,
                                   'Bank', 'Transfère',
                                   'Vous avez envoyer ~r~$' .. amountt ..
                                       '~s~ a ~r~' .. to .. ' .',
                                   'CHAR_BANK_FLEECA', 9)
                TriggerClientEvent('esx:showAdvancedNotification', to, 'Bank',
                                   'Transfère', 'Vous avez reçue ~r~$' ..
                                       amountt .. '~s~ de ~r~' .. _source ..
                                       ' .', 'CHAR_BANK_FLEECA', 9)
            end

        end
    end

end)


function myfirstname(phone_number, firstname, cb)
  MySQL.Async.fetchAll("SELECT firstname, phone_number FROM users WHERE users.firstname = @firstname AND users.phone_number = @phone_number", {
    ['@phone_number'] = phone_number,
	['@firstname'] = firstname
  }, function (data)
    cb(data[1])
  end)
end