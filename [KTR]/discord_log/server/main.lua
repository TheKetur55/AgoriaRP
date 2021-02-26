ESX = nil


TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

Users = {}
violations = {}


--Send the message to your discord server
function sendToDiscord (name,message,color)
  local DiscordWebHook = Config.webhook
  -- Modify here your discordWebHook username = name, content = message,embeds = embeds

local embeds = {
    {
        ["title"]=message,
        ["type"]="rich",
        ["color"] =color,
        ["footer"]=  {
        ["text"]= "AgoriaLife BOT",
       },
    }
}

  if message == nil or message == '' then return FALSE end
  PerformHttpRequest(DiscordWebHook, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds}), { ['Content-Type'] = 'application/json' })
end

-- Send the first notification
sendToDiscord(_U('server'),_U('server_start'),Config.green)


-- Event when a player is connecting  disconnecting
function sendToDiscordwebhookconnection (name,message,color)
  local DiscordWebHook = Config.webhookconnection
  -- Modify here your discordWebHook username = name, content = message,embeds = embeds

local embeds = {
    {
        ["title"]=message,
        ["type"]="rich",
        ["color"] =color,
        ["footer"]=  {
        ["text"]= "Bot Divisum",
       },
    }
}

  if message == nil or message == '' then return FALSE end
  PerformHttpRequest(DiscordWebHook, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds}), { ['Content-Type'] = 'application/json' })
end



-- Event when a player is writing


-- Add event when a player give an item
--  TriggerEvent("esx:giveitemalert",sourceXPlayer.name,targetXPlayer.name,ESX.Items[itemName].label,itemCount) -> ESX_extended
RegisterServerEvent("esx:giveitemalert")
AddEventHandler("esx:giveitemalert", function(name,nametarget,itemname,amount)
   if(settings.LogItemTransfer)then
    sendToDiscord(_U('server_item_transfer'),name.._('user_gives_to')..nametarget.." "..amount .." "..itemname,Config.orange)
   end
end)







--Add event when a player give money
function sendToDiscordwebhookmoney (name,message,color)
  local DiscordWebHook = Config.webhookmoney
  local society = GetSociety(societyName)

local embeds = {
    {
        ["title"]=message,
        ["type"]="rich",
        ["color"] =color,
        ["footer"]=  {
        ["text"]= "Bot anti-triche",
       },
    }
}

  if message == nil or message == '' then return FALSE end
  PerformHttpRequest(DiscordWebHook, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds}), { ['Content-Type'] = 'application/json' })
end

RegisterServerEvent("esx:givemoneyalert")
AddEventHandler("esx:givemoneyalert", function(name,nametarget,amount)
  if(settings.LogMoneyTransfer)then
    sendToDiscordwebhookmoney (_U('server_money_transfer'),name.." ".._('user_gives_to').." "..nametarget.." "..amount .." dollars",Config.orange)
  end
end)

RegisterServerEvent("esx:givemoneysociety")
AddEventHandler("esx:givemoneysociety", function(name,society,amount)
  if(settings.LogMoneyTransfer)then
    sendToDiscordwebhookmoney (_U('server_money_transfer'),name.." ".._('user_gives_to').." "..society.." "..amount .." dollars",Config.orange)
  end
end)

RegisterServerEvent("esx:givemoneybankalert")
AddEventHandler("esx:givemoneybankalert", function(name,nametarget,amount)
  if(settings.LogMoneyBankTransfert)then
   sendToDiscordwebhookmoney (_U('server_moneybank_transfer'),name.." ".. _('user_gives_to') .." "..nametarget.." "..amount .." dollars",Config.orange)
  end

end)




function sendToDiscordwebhookchat (name,message,color)
  local DiscordWebHook = Config.webhookchat

local embeds = {
    {
        ["title"]=message,
        ["type"]="rich",
        ["color"] =color,
        ["footer"]=  {
        ["text"]= "Bot Chat",
       },
    }
}

  if message == nil or message == '' then return FALSE end
  PerformHttpRequest(DiscordWebHook, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds}), { ['Content-Type'] = 'application/json' })
end

AddEventHandler('chatMessage', function(author, color, message)
  if(settings.LogChatServer)then
      local player = ESX.GetPlayerFromId(author)
     sendToDiscordwebhookchat(_U('server_chat'), player.name .." : "..message,Config.grey)
  end

end)


function sendToDiscordwebhookvolvehicule (name,message,color)
  local DiscordWebHook = Config.webhookvolvehicule

local embeds = {
    {
        ["title"]=message,
        ["type"]="rich",
        ["color"] =color,
        ["footer"]=  {
        ["text"]= "Bot Chat",
       },
    }
}

  if message == nil or message == '' then return FALSE end
  PerformHttpRequest(DiscordWebHook, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds}), { ['Content-Type'] = 'application/json' })
end

RegisterServerEvent("esx:jackingcar")
AddEventHandler("esx:jackingcar", function(model)
   local xPlayer = ESX.GetPlayerFromId(source)
   sendToDiscordwebhookvolvehicule(_U('server_carjacking'),xPlayer.name.." ".._('user_carjacking').." ".. model,Config.purple)

end)





-- Add event when a player give weapon
--  TriggerEvent("esx:giveweaponalert",sourceXPlayer.name,targetXPlayer.name,weaponLabel) -> ESX_extended
RegisterServerEvent("esx:giveweaponalert")
AddEventHandler("esx:giveweaponalert", function(name,nametarget,weaponlabel)
  if(settings.LogWeaponTransfer)then
    sendToDiscord(Config.webhooweapon, _U('server_weapon_transfer'),name.." ".._('user_gives_to').." "..nametarget.." "..weaponlabel,Config.orange)
  end
end)

-- Add event when a player is kicked
-- TriggerEvent("esx:kickhammer",GetPlayerName(source),GetPlayerName(id)) -> es_admin2
RegisterServerEvent("esx:kickhammer")
AddEventHandler("esx:kickhammer", function(name,staff)
	if(settings.LogBanhammer)then
		sendToDiscordBan(_U('server_banhammer'),staff.." ".._('kicked_by').." "..name,Config.pink)
	end

end)

-- Add event when a player is banned
-- TriggerEvent("esx:banhammer",GetPlayerName(source),GetPlayerName(id)) -> es_admin2
RegisterServerEvent("esx:banhammer")
AddEventHandler("esx:banhammer", function(name,staff)
	if(settings.LogBanhammer)then
		sendToDiscordBan(_U('server_banhammer'),staff.." ".._('banned_by').." "..name,Config.purple)
	end

end)

-- Add event when a player is washing money
--  TriggerEvent("esx:washingmoneyalert",xPlayer.name,amount) -> ESX_society
RegisterServerEvent("esx:washingmoneyalert")
AddEventHandler("esx:washingmoneyalert", function(name,amount)
  sendToDiscord(_U('server_washingmoney'),name.." ".._('user_washingmoney').." ".. amount .." dollars",Config.orange)

end)

-- Event when a player is in a blacklisted vehicle

function sendToDiscordwebhookblacklisted (name,message,color)
  local DiscordWebHook = Config.webhookblacklisted


local embeds = {
    {
        ["title"]=message,
        ["type"]="rich",
        ["color"] =color,
        ["footer"]=  {
        ["text"]= "Bot anti-triche",
       },
    }
}

  if message == nil or message == '' then return FALSE end
  PerformHttpRequest(DiscordWebHook, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds}), { ['Content-Type'] = 'application/json' })
end

RegisterServerEvent("esx:enterblacklistedcar")
AddEventHandler("esx:enterblacklistedcar", function(model)
   local xPlayer = ESX.GetPlayerFromId(source)
   sendToDiscordwebhookblacklisted(_U('server_blacklistedvehicle'),xPlayer.name.." ".._('user_entered_in').." ".. model ,Config.red)

end)





-- Event when a player (not policeman) is in a police vehicle
RegisterServerEvent("esx:enterpolicecar")
AddEventHandler("esx:enterpolicecar", function(model)
 	 local xPlayer = ESX.GetPlayerFromId(source)
 	 sendToDiscordwebhookblacklisted(_U('server_policecar'),xPlayer.name.." ".._('user_entered_in').." ".. model , Config.blue)

end)


-- Event when a player is jacking a car


-- Event when a player is killing an other one



function sendToDiscordwebhookkill (name,message,color)
  local DiscordWebHook = Config.webhookkill


local embeds = {
    {
        ["title"]=message,
        ["type"]="rich",
        ["color"] =color,
        ["footer"]=  {
        ["text"]= "Bot Kill",
       },
    }
}

  if message == nil or message == '' then return FALSE end
  PerformHttpRequest(DiscordWebHook, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds}), { ['Content-Type'] = 'application/json' })
end

RegisterServerEvent('esx:killerlog')
AddEventHandler('esx:killerlog', function(t,killer, kilerT) -- t : 0 = NPC, 1 = player
  local xPlayer = ESX.GetPlayerFromId(source)
  if(t == 1) then
     local xPlayer = ESX.GetPlayerFromId(source)
     local xPlayerKiller = ESX.GetPlayerFromId(killer)

     if(xPlayerKiller.name ~= nil and xPlayer.name ~= nil)then

       if(kilerT.killerinveh) then
         local model = kilerT.killervehname

            sendToDiscordwebhookkill(_U('server_kill'), xPlayer.name .." ".._('user_kill').." "..xPlayerKiller.name.." ".._('with').." "..model,Config.red)



       else
            sendToDiscordwebhookkill(_U('server_kill'), xPlayer.name .." ".._('user_kill').." "..xPlayerKiller.name,Config.red)



       end
    end
  else
     sendToDiscordwebhookkill(_U('server_kill'), xPlayer.name .." ".. _('user_kill_environnement'),Config.red)
  end

end)







----------------------------------------------------------------------------------------------------
RegisterServerEvent("esx:timer")
AddEventHandler("esx:timer", function()
	if Users[source] then
		if (os.time() - Users[source]) < 15 and Components.Speedhack then -- prevent the player from doing a good old cheat engine speedhack
			DropPlayer(source, "Speedhacking")
		else
			Users[source] = os.time()
		end
	else
		Users[source] = os.time()
	end
end)


Citizen.CreateThread(function()
	function SendWebhookMessage(webhook,message)
		PerformHttpRequest(Config.webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end

	function WarnPlayer(playername, reason)
		local isKnown = false
		local isKnownCount = 1
		local isKnownExtraText = ""
		local _source = source
		local xPlayer = ESX.GetPlayerFromId(_source)
		for i,thePlayer in ipairs(violations) do
			if thePlayer.name == name then
				isKnown = true
				if violations[i].count == 1 then -- 3
					-- TriggerEvent("banCheater", source,reason)
					DropPlayer(source, reason)
					TriggerEvent('es_admin2:loadbans', xPlayer.identifier)
					banUser(xPlayer.identifier)
					isKnownCount = violations[i].count
					table.remove(violations,i)
					isKnownExtraText = ", Trop d'avertissement, l'utilisateur a été banni."
				else
					violations[i].count = violations[i].count+1
					isKnownCount = violations[i].count
				end
			end
		end

		if not isKnown then
			table.insert(violations, { name = name, count = 1 })
		end

		return isKnown, isKnownCount,isKnownExtraText
	end

	--function GetPlayerNeededIdentifiers(player)
		--local steam = GetPlayerIdentifiers(player)[1]
		--return steam
	--end

	function GetPlayerNeededIdentifiers(player)
		local ids = GetPlayerIdentifiers(player)
		for i,theIdentifier in ipairs(ids) do
			if string.find(theIdentifier,"license:") or -1 > -1 then
				license = theIdentifier
			elseif string.find(theIdentifier,"steam:") or -1 > -1 then
				steam = theIdentifier
			end
		end
		if not steam then
			steam = "steam: missing"
		end
		return license, steam
	end

	function GetPlayerNeededIdentifiers2(source, callback)
		local _source = source
		local identifier = GetPlayerIdentifiers(_source)[1]
		local result = MySQL.Sync.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {
			['@identifier'] = identifier
		})
		local user = result[1]
		if user['license'] ~= nil then
			local data = {
				license    = user['license']
			}
			callback(data)
		end
	end

	RegisterNetEvent('RottenV:SpeedFlag')
	AddEventHandler('RottenV:SpeedFlag', function(rounds, roundm)
		if Components.Speedhack then
			steam = GetPlayerNeededIdentifiers(source)

			name = GetPlayerName(source)

			isKnown, isKnownCount, isKnownExtraText = WarnPlayer(name,"⚡Flash, ta oublié ton costume ! 🖕🏻 / ⚡Flash, you forgot your costume! 🖕")

			SendWebhookMessage(webhook, "**Vitesse Suspecte!** \n```\nL'utilisateur:"..name.."\n"..license.."\n"..steam.."\nA traversé "..rounds.. " unités. C'est "..roundm.." de plus que la vitesse normale! \nAvertissement anti-triche:"..isKnownCount..""..isKnownExtraText.." ```")
		end
	end)



    RegisterNetEvent('RottenV:NoclipFlag')
    AddEventHandler('RottenV:NoclipFlag', function(distance)
        if Components.Teleport then
        	        	
            if TeleportLegit ~= true then
                steam = GetPlayerNeededIdentifiers(source)
                name = GetPlayerName(source)
        		print("TestAvecLegit")

                isKnown, isKnownCount, isKnownExtraText = WarnPlayer(name,"Tu te prends pour Dieu pour savoir voler ? 🖕🏻 / Do you take yourself for God to know how to fly ? 🖕")

				SendWebhookMessage(webhook,"**Noclip/Téléport Suspect!** \n```\nL'utilisateur:"..name.."\n"..steam.."\nRepéré avec "..distance.." unités depuis le précédent emplacement.\nAvertissement anti-triche:"..isKnownCount..""..isKnownExtraText.." ```")
			end
		end
	end)

	RegisterNetEvent('RottenV:HealthFlag')
	AddEventHandler('RottenV:HealthFlag', function(invincible,oldHealth, newHealth, curWait)
		if Components.GodMode then
			--steam = GetPlayerNeededIdentifiers(source)
			--license = GetPlayerNeededIdentifiers2(source)
			license, steam = GetPlayerNeededIdentifiers(source)

			name = GetPlayerName(source)

			isKnown, isKnownCount, isKnownExtraText = WarnPlayer(name,"Grâce à votre guérison miraculeuse, vous avez droit à un ban 🖕🏻 / With your miraculous healing, you won a ban 🖕")

			if invincible then
				SendWebhookMessage(webhook,"**Guérison Suspecte!** \n```\nL'utilisateur:"..name.."\n"..license.."\n"..steam.."\nRégénération de "..newHealth-oldHealth.."hp ( nouvelle valeur: "..newHealth.."hp ) en "..curWait.."ms! ( L'utilisateur était invincible )\nAvertissement anti-triche:"..isKnownCount..""..isKnownExtraText.." ```")
			else
				SendWebhookMessage(webhook,"**Guérison Suspecte!** \n```\nL'utilisateur:"..name.."\n"..license.."\n"..steam.."\nRégénération de "..newHealth-oldHealth.."hp ( nouvelle valeur: "..newHealth.."hp ) en "..curWait.."ms! ( La santé était forcée )\nAvertissement anti-triche:"..isKnownCount..""..isKnownExtraText.." ```")
			end
		end
	end)

	RegisterNetEvent('RottenV:WeaponFlag')
	AddEventHandler('RottenV:WeaponFlag', function(weapon)
		if Components.WeaponBlacklist then
			steam = GetPlayerNeededIdentifiers(source)
			license = GetPlayerNeededIdentifiers2(source)

			name = GetPlayerName(source)

			isKnown, isKnownCount, isKnownExtraText = WarnPlayer(name,"Nous ne sommes pas sur GTA online 🖕🏻 / We are not on GTA online 🖕🏻")

			SendWebhookMessage(webhook,"**Inventaire Suspect!** \n```\nL'utilisateur:"..name.."\n"..license.."\n"..steam.."\nPossède l'arme : "..weapon.."( Blacklistée )\nAvertissement anti-triche:"..isKnownCount..""..isKnownExtraText.." ```")
		end
	end)
end)

local banned = ""
local bannedTable = {}
function banUser(id)
	local license= GetPlayerNeededIdentifiers(source)
	banned = banned .. id .. "\n"
	--SaveResourceFile("es_admin2", "data/bans.txt", banned, -1)
	SaveResourceFile("es_admin2", "data/bans.txt", banned.. license.. "\n", -1)
	bannedTable[id] = true
end


function sendToDiscordCharCreation (name, steamid, license, steamname, nameName, dateofbirth, sex, height, color)
	local DiscordWebHook = Config.webhookCharCreation
	-- Modify here your discordWebHook username = name, content = message,embeds = embeds

	local embeds = {
		{
			["title"]=name,
			["type"]="rich",
			["color"]=color,
			["footer"]=    {
				["icon_url"]= "https://i.imgur.com/gyABrcW.gif",
				["text"]= "NEW CHARACTER LOG",
			},
			["fields"]=    {
				{
					["name"]= "STEAMID",
					["value"]= steamid,
				},
				{
					["name"]= "LICENCE",
					["value"]= license,
				},
				{
					["name"]= "STEAM NAME",
					["value"]= steamname,
				},
				{
					["name"]= "PRENOM+NOM",
					["value"]= nameName,
				},
				{
					["name"]= "DATE DE NAISSANCE",
					["value"]= dateofbirth,
				},
				{
					["name"]= "SEXE",
					["value"]= sex,
				},
				{
					["name"]= "TAILLE",
					["value"]= height,
				},
			},
		}
	}

	--if message == nil or message == '' then return FALSE end
	PerformHttpRequest(DiscordWebHook, function(err, text, headers) end, 'POST', json.encode({ username = "Nouveau personnage",embeds = embeds}), { ['Content-Type'] = 'application/json' })
end




-- Add event when a player is creating a character
-- TriggerServerEvent("esx:charCreationDiscord") -> esx_identity
RegisterServerEvent("esx:charCreationDiscord")
AddEventHandler("esx:charCreationDiscord", function()
	if(settings.LogCharCreation)then
		local _source = source
		local identity = getIdentity(_source)
		local nameName = "" .. identity.firstname .. " " .. identity.lastname .. ""
		sendToDiscordCharCreation(_U('server_charcreation'), identity.steamid, identity.license, identity.steamname, nameName, identity.dateofbirth, identity.sex, identity.height, Config.orange)
		--sendToDiscordCharCreation(_U('server_charcreation'),"steamid", "license", "steamname", "Prénom Nom", "01/02/1234", "F", "175cm", Config.yellow)
	end

end)

function getIdentity(source)
	local _source = source
	local identifier = GetPlayerIdentifiers(_source)[1]
	--local result = MySQL.Sync.fetchAll("SELECT * FROM characters WHERE identifier = @identifier", {
	local result = MySQL.Sync.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {
		['@identifier'] = identifier
	})
	if result[1] ~= nil then
		local identity = result[1]

		return {
			steamid = identity['identifier'],
			license = identity['license'],
			steamname = identity['name'],
			firstname     = identity['firstname'],
			lastname    = identity['lastname'],
			dateofbirth = identity['dateofbirth'],
			sex     = identity['sex'],
			height        = identity['height']
		}
	else
		return {
			steamid     = '',
			license     = '',
			steamname     = '',
			firstname     = '',
			lastname    = '',
			dateofbirth = '',
			sex     = '',
			height        = ''
		}
	end
end

-- Alert when a wrong password is entered for the withdrawal of company money

RegisterServerEvent("esx_advanced_discord_bot:SocietyWrongPassword")
AddEventHandler("esx_advanced_discord_bot:SocietyWrongPassword", function(Society, Steamid, Steamname, password)
	if(settings.LogSocietyWrongPassword)then
		local _source = source
		local identity = getIdentity(_source)
		--local nameName = "" .. identity.firstname .. " " .. identity.lastname .. ""
		local society = Society
		local steamid = Steamid
		local steamname = Steamname
		local WrongPassword = password
		sendToDiscordWrong_Password(_U('Wrong_Password'), steamname, steamid, society, WrongPassword, Config.red)
		sendToDiscord(_U('alertcheat'),_U('alerte_cheater'),Config.red)
	end

end)

function sendToDiscordWrong_Password (name, steamname, steamid, society, WrongPassword, color)

	local DiscordWebHook = Config.webhookWrongPassword
	-- Modify here your discordWebHook username = name, content = message,embeds = embeds
	local embeds = {
		{
			["title"]=name,
			["type"]="rich",
			["color"]=color,
			["footer"]=    {
				["icon_url"]= "http://2ley7l42nt9s3jvzio2zneqa.wpengine.netdna-cdn.com/wp-content/uploads/2017/07/siren.gif",
				["text"]= "Log Anti-Cheateur - LUA INJECTOR ALERT",
			},
			["fields"]=    {
				{
					["name"]= "Steam ID",
					["value"]= steamid,
				},
				{
					["name"]= "STEAM NAME",
					["value"]= steamname,
				},
				{
					["name"]= "Société volée ?",
					["value"]= society,
				},
				{
					["name"]= "Mot de passe utilisé (nil = Aucun mot de passe)",
					["value"]= WrongPassword,
				},
			},
		}
	}

	--if message == nil or message == '' then return FALSE end
	PerformHttpRequest(DiscordWebHook, function(err, text, headers) end, 'POST', json.encode({ username = "Tentative de triche ?",embeds = embeds}), { ['Content-Type'] = 'application/json' })
end


-- Alert when a person retrieves an item from their home safe

RegisterServerEvent("esx_advanced_discord_bot:getItemStandart")
AddEventHandler("esx_advanced_discord_bot:getItemStandart", function(xPlayerName, SteamID, inventoryItemLabel, count)
	if(settings.LoggetItemStandart)then
		local Owner 	= xPlayerName
		local IdSteam 	= SteamID
		local Label 	= inventoryItemLabel
		local Quantity 	= count
		sendToDiscordItemStandart(_U('retrieves_item'), Owner, IdSteam, Label, Quantity, Config.purple)
		sendToDiscord(_U('retrieveschest'),_U('retrieves_item'),Config.purple)
	end

end)

--TriggerEvent("esx_advanced_discord_bot:getItemStandart",xPlayer.name,SteamID,inventoryItem.label,count)
function sendToDiscordItemStandart (name, Owner, IdSteam, Label, Quantity, color)

	local DiscordWebHook = Config.LoggetItemStandart
	-- Modify here your discordWebHook username = name, content = message,embeds = embeds
	local embeds = {
		{
			["title"]=name,
			["type"]="rich",
			["color"]=color,
			["footer"]=    {
			["icon_url"]= "http://educatif.net/elementaire/images-gratuites/objets-divers-48/tresor.gif",
			["text"]= "Log Anti-Cheateur - Test retrait d'item",
			},
			["fields"]=    {
				{
					["name"]= "Pseudo",
					["value"]= Owner,
				},
				{
					["name"]= "Steam ID",
					["value"]= IdSteam,
				},
				{
					["name"]= "Nom de l'item",
					["value"]= Label,
				},
				{
					["name"]= "Quantité retirée :",
					["value"]= Quantity,
				},
			},
		}
	}

	--if message == nil or message == '' then return FALSE end
	PerformHttpRequest(DiscordWebHook, function(err, text, headers) end, 'POST', json.encode({ username = "Tentative de triche ?",embeds = embeds}), { ['Content-Type'] = 'application/json' })
end

-- Alert when a teleport is detected

RegisterServerEvent("esx_advanced_discord_bot:TeleportLegitOrNot")
AddEventHandler("esx_advanced_discord_bot:TeleportLegitOrNot", function (LegitOrNot)
    if(Components.Teleport)then
        local Owner     	= xPlayerName
        local IdSteam     	= SteamID
        TeleportLegit     	= LegitOrNot

        if TeleportLegit ~= true then
            sendToDiscordTeleportLegitOrNot(_U('TeleportNoLegit'), Owner, IdSteam, Config.blue)
            sendToDiscord(_U('TeleportLegitOrNot'),_U('TeleportNoLegit'),Config.blue)
        end
    end

end)

function sendToDiscordTeleportLegitOrNot (name, Owner, IdSteam, color)

    local DiscordWebHook = Config.TeleportLegitOrNot
    -- Modify here your discordWebHook username = name, content = message,embeds = embeds
    local embeds = {
        {
            ["title"]=name,
            ["type"]="rich",
            ["color"]=color,
            ["footer"]=    {
                ["icon_url"]= "http://educatif.net/elementaire/images-gratuites/objets-divers-48/tresor.gif",
                ["text"]= "Log Anti-Cheateur - Téléport illégitime",
            },
            ["fields"]=    {
                {
                    ["name"]= "Pseudo",
                    ["value"]= Owner,
                },
                {
                    ["name"]= "Steam ID",
                    ["value"]= IdSteam,
                },
            },
        }
    }

    --if message == nil or message == '' then return FALSE end
    PerformHttpRequest(DiscordWebHook, function(err, text, headers) end, 'POST', json.encode({ username = "Tentative de triche ?",embeds = embeds}), { ['Content-Type'] = 'application/json' })
end