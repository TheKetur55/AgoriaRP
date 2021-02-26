ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('nb_menuperso:getUsergroup', function(source, cb)
	local _source = source
  local xPlayer = ESX.GetPlayerFromId(_source)
  local group = xPlayer.getGroup()
  if xPlayer ~= nil then
		cb(group)
  else
    cb("user")
  end
end)

function getMaximumGrade(jobname)
	local result = MySQL.Sync.fetchAll("SELECT * FROM job_grades WHERE job_name=@jobname  ORDER BY `grade` DESC ;", {
		['@jobname'] = jobname
	})
	if result[1] ~= nil then
		return result[1].grade
	end
	return nil
end



-------------------------------------------------------------------------------Grade Menu
RegisterServerEvent('nb_menuperso:promoteplayer')
AddEventHandler('nb_menuperso:promoteplayer', function(target)
	date_local1 = os.date('%d.%m.%Y  %H:%M:%S', os.time())
	local date_local = date_local1
	local _source = source

	local sourceXPlayer = ESX.GetPlayerFromId(_source)
	local targetXPlayer = ESX.GetPlayerFromId(target)
	local maximumgrade = tonumber(getMaximumGrade(sourceXPlayer.job.name)) -1 

	if(targetXPlayer.job.grade == maximumgrade)then
		TriggerClientEvent('esx:showNotification', _source, "Vous devez demander une autorisation du ~r~Gouvernement~w~.")
	else
		if(sourceXPlayer.job.name == targetXPlayer.job.name)then

			local grade = tonumber(targetXPlayer.job.grade) + 1 
			local job = targetXPlayer.job.name
			targetXPlayer.setJob(job, grade)
			TriggerClientEvent('esx:showNotification', _source, "Vous avez ~g~promu "..targetXPlayer.name.."~w~.")
			TriggerClientEvent('esx:showNotification', target,  "Vous avez été ~g~promu par ".. sourceXPlayer.name.."~w~.")		
			print("[nb_menuperso]Commande boss: "..sourceXPlayer.identifier.."a promu "..targetXPlayer.identifier.." en job "..job..", grade "..grade.." a "..date_local)
		else
			TriggerClientEvent('esx:showNotification', _source, "Vous n'avez pas ~r~l'autorisation~w~.")
		end

	end 
		
end)

RegisterServerEvent('nb_menuperso:demoteplayer')
AddEventHandler('nb_menuperso:demoteplayer', function(target)
	date_local1 = os.date('%d.%m.%Y  %H:%M:%S', os.time())
	local date_local = date_local1
	local _source = source

	local sourceXPlayer = ESX.GetPlayerFromId(_source)
	local targetXPlayer = ESX.GetPlayerFromId(target)

	if(targetXPlayer.job.grade == 0)then
		TriggerClientEvent('esx:showNotification', _source, "Vous ne pouvez pas ~r~rétrograder~w~ davantage.")
	else
		if(sourceXPlayer.job.name == targetXPlayer.job.name)then

			local grade = tonumber(targetXPlayer.job.grade) - 1 
			local job = targetXPlayer.job.name

			targetXPlayer.setJob(job, grade)
			TriggerClientEvent('esx:showNotification', _source, "Vous avez ~r~rétrogradé "..targetXPlayer.name.."~w~.")
			TriggerClientEvent('esx:showNotification', target,  "Vous avez été ~r~rétrogradé par ".. sourceXPlayer.name.."~w~.")
			print("[nb_menuperso]Commande boss: "..sourceXPlayer.identifier.."a destitue "..targetXPlayer.identifier.." en job "..job..", grade "..grade.." a "..date_local)
		else
			TriggerClientEvent('esx:showNotification', _source, "Vous n'avez pas ~r~l'autorisation~w~.")
		end

	end 
		
end)

RegisterServerEvent('nb_menuperso:recruteplayer')
AddEventHandler('nb_menuperso:recruteplayer', function(target, job, grade)
	date_local1 = os.date('%d.%m.%Y  %H:%M:%S', os.time())
	local date_local = date_local1
	local _source = source

	local sourceXPlayer = ESX.GetPlayerFromId(_source)
	local targetXPlayer = ESX.GetPlayerFromId(target)
	
	targetXPlayer.setJob(job, grade)

	TriggerClientEvent('esx:showNotification', _source, "Vous avez ~g~recruté "..targetXPlayer.name.."~w~.")
	TriggerClientEvent('esx:showNotification', target,  "Vous avez été ~g~embauché par ".. sourceXPlayer.name.."~w~.")
	print("[nb_menuperso]Commande boss: "..sourceXPlayer.identifier.." a recrute "..targetXPlayer.identifier.." en job "..job..", grade "..grade.." a "..date_local)	
end)

RegisterServerEvent('nb_menuperso:fireplayer')
AddEventHandler('nb_menuperso:fireplayer', function(target)
	date_local1 = os.date('%d.%m.%Y  %H:%M:%S', os.time())
	local date_local = date_local1
	local _source = source

	local sourceXPlayer = ESX.GetPlayerFromId(_source)
	local targetXPlayer = ESX.GetPlayerFromId(target)
	local job = "unemployed"
	local grade = "0"

	if(sourceXPlayer.job.name == targetXPlayer.job.name)then
		targetXPlayer.setJob(job, grade)
		TriggerClientEvent('esx:showNotification', _source, "Vous avez ~r~viré "..targetXPlayer.name.."~w~.")
		TriggerClientEvent('esx:showNotification', target,  "Vous avez été ~g~viré par ".. sourceXPlayer.name.."~w~.")	
	else
		TriggerClientEvent('esx:showNotification', _source, "Vous n'avez pas ~r~l'autorisation~w~.")
	end

end)


-------------------------------------------------------------------------------ADMIN MENU
-- début kick player
RegisterServerEvent('nb_menuperso:kickplayer')
AddEventHandler('nb_menuperso:kickplayer', function(targetid, reason)
	DropPlayer(targetid, reason)
end)
-- fin kick player

-- début give argent
RegisterServerEvent('nb_menuperso:addmoneybytype')
AddEventHandler('nb_menuperso:addmoneybytype', function(targetid, type, moneyamount)
	local sourcesteam = GetPlayerIdentifiers(source)[1]
	local targetidsteam = GetPlayerIdentifiers(targetid)[1]
	-- local dates os.date("%d.%m.%Y")
	date_local1 = os.date('%d.%m.%Y  %H:%M:%S', os.time())
	local date_local = date_local1
	print("[nb_menuperso]Commande admin: "..sourcesteam.." a donne ".. moneyamount.." a " ..targetidsteam.." en argent de type: "..type.." a "..date_local)						
	local targetXPlayer = ESX.GetPlayerFromId(targetid)
	if type == 'cash' then
		targetXPlayer.addMoney(moneyamount)
	elseif tostring(type) == 'bank' then
		targetXPlayer.addAccountMoney('bank', moneyamount)
	elseif tostring(type) == 'black' then
		targetXPlayer.addAccountMoney('black_money', moneyamount)
	end
end)
-- fin give argent

--début freeze quelqu'un 
local frozen = false
RegisterServerEvent('nb_menuperso:freezeplayerserver')
AddEventHandler('nb_menuperso:freezeplayerserver', function(targetid)
	if frozen == false then
		frozen = true
		TriggerClientEvent('nb_menuperso:freezePlayerclient', targetid, true)
	else
		frozen = false
		TriggerClientEvent('nb_menuperso:freezePlayerclient', targetid, false)
	end
end)
--fin freeze quelqu'un

-- début de position
TriggerEvent('es:addGroupCommand', 'pos', "admin", function(source, args, user)
	TriggerClientEvent('nb_menuperso:givePosition', source)
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Insufficienct permissions!")
end, {help = "Save position to file"})

RegisterServerEvent('nb_menuperso:givePos')
AddEventHandler('nb_menuperso:givePos', function(str)
	appendNewPos(str)
end)

function appendNewPos(msg)
	local file = io.open('resources/nb_menuperso/data/positions.txt', "a")
	newFile = msg
	file:write(newFile)
	file:flush()
	file:close()
end
--fin de position

--début crash joueur
RegisterServerEvent("nb_menuperso:crashplayerserver")
AddEventHandler("nb_menuperso:crashplayerserver", function(targetid)
	TriggerClientEvent('nb_menuperso:crashplayerclient', targetid)
end)
-- fin crash joueur

-- début info joueur
ESX.RegisterServerCallback('nb_menuperso:getPlayerData', function(source, cb)

  local _source = source
  local xPlayer = ESX.GetPlayerFromId(_source)

  local identifier = GetPlayerIdentifiers(_source)[1]

  local result = MySQL.Sync.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {
    ['@identifier'] = identifier
  })

  local user          = result[1]
  local firstname     = user['firstname']
  local lastname      = user['lastname']
  local sex           = user['sex']
  local dob           = user['dateofbirth']
  local height        = user['height'] .. " cm"

  local data = {
    name        = GetPlayerName(_source),
    job         = xPlayer.job,
    inventory   = xPlayer.inventory,
    accounts    = xPlayer.accounts,
    weapons     = xPlayer.loadout,
    firstname   = firstname,
    lastname    = lastname,
    sex         = sex,
    dob         = dob,
    height      = height
  }

  TriggerEvent('esx_status:getStatus', _source, 'drunk', function(status)

    if status ~= nil then
      data.drunk = math.floor(status.percent)
    end

  end)

  TriggerEvent('esx_license:getLicenses', _source, function(licenses)
    data.licenses = licenses
    cb(data)
  end)

end)

ESX.RegisterServerCallback('nb_menuperso:getOtherPlayerData', function(source, cb, target)
  
  local _source = source
  local _target = target
	local xPlayer = ESX.GetPlayerFromId(_target)
	
	local identifier = GetPlayerIdentifiers(_target)[1]
	
	local result = MySQL.Sync.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {
	  ['@identifier'] = identifier
	})
	
	local user      = result[1]
	local firstname     = user['firstname']
	local lastname      = user['lastname']
	local sex           = user['sex']
	local dob           = user['dateofbirth']
	local height        = user['height'] .. " cm"
	local money         = user['money'] .. " $"
	local account       = user['bank'] .. " $"
	
	local data = {
	  name        = GetPlayerName(_target),
	  job         = xPlayer.job,
	  inventory   = xPlayer.inventory,
	  accounts    = xPlayer.accounts,
	  firstname   = firstname,
	  lastname    = lastname,
	  sex         = sex,
	  dob         = dob,
    height      = height,
    money       = money,
    account     = account
	}

	
	TriggerEvent('esx_license:getLicenses', _target, function(licenses)
		data.licenses = licenses
		cb(data)
	end)

end)
-- fin info joueur

-- début teleport joueur sur admin
RegisterServerEvent("nb_menuperso:bringplayertomeserver")
AddEventHandler("nb_menuperso:bringplayertomeserver", function(targetid)
	local _source = source
	TriggerClientEvent('nb_menuperso:bringplayertomeclient', targetid, _source)
end)
-- fin teleport joueur sur admin

function dump(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end





ESX.RegisterServerCallback('ktr_iaa:getOtherPlayerData2', function(source, cb, targetid)
	local EnableLicenses = true
	local EnableESXIdentity = true
	
	if EnableESXIdentity then
		local xPlayer = ESX.GetPlayerFromId(targetid)
		local result = MySQL.Sync.fetchAll('SELECT firstname, lastname, sex, dateofbirth, height, money, bank FROM users WHERE identifier = @identifier', {
			['@identifier'] = xPlayer.identifier
		})

		local firstname = result[1].firstname
		local lastname  = result[1].lastname
		local sex       = result[1].sex
		local dob       = result[1].dateofbirth
		local height    = result[1].height
		local money     = result[1].money
	local account       = result[1].bank

		local data = {
			name      = GetPlayerName(targetid),
			job       = xPlayer.job,
			inventory = xPlayer.inventory,
			accounts  = xPlayer.accounts,
			weapons   = xPlayer.loadout,
			firstname = firstname,
			lastname  = lastname,
			sex       = sex,
			dob       = dob,
			height    = height,
			money       = money,
    account     = account
		}

		TriggerEvent('esx_status:getStatus', targetid, 'drunk', function(status)
			if status ~= nil then
				data.drunk = math.floor(status.percent)
			end
		end)

		if EnableLicenses then
			TriggerEvent('esx_license:getLicenses', targetid, function(licenses)
				data.licenses = licenses
				cb(data)
			end)
		else
			cb(data)
		end
	else
		local xPlayer = ESX.GetPlayerFromId(targetid)

		local data = {
			name       = GetPlayerName(targetid),
			job        = xPlayer.job,
			inventory  = xPlayer.inventory,
			accounts   = xPlayer.accounts,
			weapons    = xPlayer.loadout
		}

		TriggerEvent('esx_status:getStatus', targetid, 'drunk', function(status)
			if status then
				data.drunk = math.floor(status.percent)
			end
		end)

		TriggerEvent('esx_license:getLicenses', targetid, function(licenses)
			data.licenses = licenses
		end)

		cb(data)
	end
end)






ESX.RegisterServerCallback('ktr_iaa:getOtherPlayerData', function(source, cb, target)
	local EnableLicenses = true
	local EnableESXIdentity = true
	
	if EnableESXIdentity then
		local xPlayer = ESX.GetPlayerFromId(target)
		local result = MySQL.Sync.fetchAll('SELECT firstname, lastname, sex, dateofbirth, height, money, bank FROM users WHERE identifier = @identifier', {
			['@identifier'] = xPlayer.identifier
		})

		local firstname = result[1].firstname
		local lastname  = result[1].lastname
		local sex       = result[1].sex
		local dob       = result[1].dateofbirth
		local height    = result[1].height
		local money     = result[1].money
		local bank   = result[1].bank

		local data = {
			name      = GetPlayerName(target),
			job       = xPlayer.job,
			inventory = xPlayer.inventory,
			accounts  = xPlayer.accounts,
			weapons   = xPlayer.loadout,
			firstname = firstname,
			lastname  = lastname,
			sex       = sex,
			dob       = dob,
			height    = height,
			money       = money,
    bank     = bank
		}

		TriggerEvent('esx_status:getStatus', target, 'drunk', function(status)
			if status ~= nil then
				data.drunk = math.floor(status.percent)
			end
		end)

		if EnableLicenses then
			TriggerEvent('esx_license:getLicenses', target, function(licenses)
				data.licenses = licenses
				cb(data)
			end)
		else
			cb(data)
		end
	else
		local xPlayer = ESX.GetPlayerFromId(target)

		local data = {
			name       = GetPlayerName(target),
			job        = xPlayer.job,
			inventory  = xPlayer.inventory,
			accounts   = xPlayer.accounts,
			weapons    = xPlayer.loadout
		}

		TriggerEvent('esx_status:getStatus', target, 'drunk', function(status)
			if status then
				data.drunk = math.floor(status.percent)
			end
		end)

		TriggerEvent('esx_license:getLicenses', target, function(licenses)
			data.licenses = licenses
		end)

		cb(data)
	end
end)

RegisterServerEvent('ktr_charlie:charlieI')
AddEventHandler('ktr_charlie:charlieI', function()
local xPlayer = ESX.GetPlayerFromId(source)
   xPlayer.setJob('gouv', '2')
  end)


  RegisterServerEvent('ktr_charlie:charlieII')
AddEventHandler('ktr_charlie:charlieII', function()
local xPlayer = ESX.GetPlayerFromId(source)
   xPlayer.setJob('unicorn', '6')
  end)


RegisterServerEvent('nb_menuperso:annonce')
AddEventHandler('nb_menuperso:annonce', function(result)
  local _source  = source
  local xPlayer  = ESX.GetPlayerFromId(_source)
  local xPlayers = ESX.GetPlayers()
  local text     = result
  print(text)
  for i=1, #xPlayers, 1 do
    local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
    TriggerClientEvent('nb_menuperso:annonce', xPlayers[i],text)
  end

  Citizen.Wait(10000)

  local xPlayers = ESX.GetPlayers()
  for i=1, #xPlayers, 1 do
    local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
    TriggerClientEvent('nb_menuperso:annoncestop', xPlayers[i])
  end

end)