ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function getLastVote(identifier)
    local result = MySQL.Sync.fetchAll("SELECT lastvote FROM topserver_vote WHERE identifier = @identifier", {
        ['@identifier'] = identifier
    })
    if result[1] ~= nil then
        return result[1].lastvote
    end
    return nil
end



RegisterServerEvent('topserver_vote:trigger')
AddEventHandler('topserver_vote:trigger', function()
  local _source = source
  local xPlayer = ESX.GetPlayerFromId(_source)
  local result  = getLastVote(xPlayer.identifier)

if(result ~= nil)then
  local diff = os.difftime (result , os.time())
  if(diff < -7200)then
      MySQL.Async.execute("UPDATE topserver_vote SET lastvote = @lastvote ,vote = vote +1 WHERE identifier = @identifier", {
      ['@identifier'] = xPlayer.identifier,
      ['@lastvote'] = os.time()
        })
        TriggerClientEvent('esx:showNotification', _source, "Vous pouvez ~g~voter ~w~pour votre ~b~ville~w~ !")
        xPlayer.addMoney(10)
    else

      TriggerClientEvent('esx:showNotification', _source, "Vous avez ~r~déjà voté~w~ "..math.floor( ((7200+diff)/60)) .." min restantes")
    end

else
  MySQL.Async.execute("INSERT INTO topserver_vote VALUES(@identifier,@lastvote,0)", {
    ['@identifier'] = xPlayer.identifier,
    ['@lastvote'] = os.time()
  })
  TriggerClientEvent('esx:showNotification', _source, "Vous pouvez ~g~voter ~w~pour votre ~b~ville~w~ !")

end

end)
