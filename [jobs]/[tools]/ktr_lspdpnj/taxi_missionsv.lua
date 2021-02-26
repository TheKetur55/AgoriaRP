RegisterServerEvent('taxi:success')
AddEventHandler('taxi:success', function()
  print("Player ID " ..source)
	-- Get the players money amount
TriggerEvent('es:getPlayerFromId', source, function(user)
  total = math.random(500, 950);
  -- update player money amount
  user.addMoney(total)
 TriggerClientEvent("es_freeroam:notify", source, "CHAR_BANK_MAZE", 1, "Maze Bank", false, "Vous avez reçu la somme de ~g~$".. tonumber(total))
 end)
end)
