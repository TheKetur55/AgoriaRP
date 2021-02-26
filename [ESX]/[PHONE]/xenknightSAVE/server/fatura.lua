--====================================================================================
-- # Discord XenKnighT#7085
--====================================================================================

ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function FaturaGetBilling (accountId, cb)
  local xPlayer = ESX.GetPlayerFromId(source)
    MySQL.Async.fetchAll([===[
      SELECT * FROM billing WHERE identifieri = @identifier
      ]===], { ['@identifier'] = xPlayer.identifier }, cb)
  end 

function getUserFatura(phone_number, firstname, cb)
  MySQL.Async.fetchAll("SELECT firstname, phone_number FROM users WHERE users.firstname = @firstname AND users.phone_number = @phone_number", {
    ['@phone_number'] = phone_number,
	['@firstname'] = firstname
  }, function (data)
    cb(data[1])
  end)
end

RegisterServerEvent('xenknight:fatura_getBilling')
AddEventHandler('xenknight:fatura_getBilling', function(phone_number, firstname)
  local sourcePlayer = tonumber(source)
  if phone_number ~= nil and phone_number ~= "" and firstname ~= nil and firstname ~= "" then
    getUserFatura(phone_number, firstname, function (user)
      local accountId = user and user.id
      FaturaGetBilling(accountId, function (billingg)
        TriggerClientEvent('xenknight:fatura_getBilling', sourcePlayer, billingg)
      end)
    end)
  else
    FaturaGetBilling(nil, function (billingg)
      TriggerClientEvent('xenknight:fatura_getBilling', sourcePlayer, billingg)
    end)
  end
end)


RegisterServerEvent("xenknight:faturapayBill")
AddEventHandler("xenknight:faturapayBill", function(id, senderi, amount, target)
	local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
	local xTarget = ESX.GetPlayerFromIdentifier(senderi)
	
if xTarget ~= nil then	
    if amount ~= nil then
        if xPlayer.getBank() >= amount then	

					MySQL.Async.execute('DELETE from billing WHERE id = @id', {
						['@id'] = id
					}, function(rowsChanged)
						xPlayer.removeAccountMoney('bank', amount)
						xTarget.addAccountMoney('bank', amount)

						TriggerClientEvent("esx:showNotification", src, "Vous avez payer une facture de " .. amount .. "$")
						TriggerClientEvent("esx:showNotification", senderi, "Vous ne pouvez pas vous permettre de payer cette facture.")
						TriggerClientEvent("esx:showNotification", xTarget.source, "Vous avez reöu une facture de " .. amount .. "$")

					end)
					
				else
					TriggerClientEvent("esx:showNotification", senderi, "Vous ne pouvez pas vous permettre de payer cette facture.")
					TriggerClientEvent("esx:showNotification", src, "Vous avez payé une facture de $" .. amount)

					
				end

			else
				
				TriggerClientEvent("esx:showNotification", xTarget.source, "Vous avez reçu une facture de " .. amount .. "$")
				
			end	
	
    end
	
end)
