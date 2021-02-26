--==================================================================================
--======               ESX_IDENTITY BY ARKSEYONET @Ark                        ======
--======    YOU CAN FIND ME ON MY DISCORD @Ark - https://discord.gg/cGHHxPX   ======
--======    IF YOU ALTER THIS VERSION OF THE SCRIPT, PLEASE GIVE ME CREDIT    ======
--======            Special Thanks To COSHAREK FOR THE UI Design              ======
--======     Special Thanks To Alphakush and CMD.Telhada For Help Testing     ======
--==================================================================================

--===================================================================
--==                        MAIN FUNCTIONS                         ==
--===================================================================

--===============================================
--==     Get The Player's Identification       ==
--===============================================

ESX = nil


function getIdentity(source, callback)
	local identifier = GetPlayerIdentifiers(source)[1]
	MySQL.Async.fetchAll("SELECT * FROM `users` WHERE `identifier` = @identifier",
	{
		['@identifier'] = identifier
	},
	function(result)
		if result[1]['firstname'] ~= nil then
			local data = {
				identifier	= result[1]['identifier'],
				firstname	= result[1]['firstname'],
				lastname	= result[1]['lastname'],
				dateofbirth	= result[1]['dateofbirth'],
				sex			= result[1]['sex'],
				height		= result[1]['height'],
				skin        = ''
			}

			if result[1]['skin'] ~= nil then
				data.skin = result[1]['skin']
			end
			callback(data)
		else
			local data = {
				identifier	= '',
				firstname	= '',
				lastname	= '',
				dateofbirth	= '',
				sex			= '',
				height		= '',
				skin		= ''
			}
			callback(data)
		end
	end)
end

--===============================================
--==    Set The Player's Identification        ==
--===============================================
function setIdentity(identifier, data, callback)
	MySQL.Async.execute("UPDATE `users` SET `firstname` = @firstname, `lastname` = @lastname, `dateofbirth` = @dateofbirth, `sex` = @sex, `height` = @height WHERE identifier = @identifier",
	{
		['@identifier']		= identifier,
		['@firstname']		= data.firstname,
		['@lastname']		= data.lastname,
		['@dateofbirth']	= data.dateofbirth,
		['@sex']			= data.sex,
		['@height']			= data.height
	},
	function(done)
		if callback then
			callback(true)
		end
	end)
end

--===============================================
--==  Update The Player's Identification       ==
--===============================================
function updateIdentity(identifier, data, callback)
	MySQL.Async.execute("UPDATE `users` SET `firstname` = @firstname, `lastname` = @lastname, `dateofbirth` = @dateofbirth, `sex` = @sex, `height` = @height WHERE identifier = @identifier",
	{
		['@identifier']		= identifier,
		['@firstname']		= data.firstname,
		['@lastname']		= data.lastname,
		['@dateofbirth']	= data.dateofbirth,
		['@sex']			= data.sex,
		['@height']			= data.height
	},
	function(done)
		if callback then
			callback(true)
		end
	end)
end

--===============================================
--==       Server Event Set Identity           ==
--===============================================
RegisterServerEvent('esx_identity:setIdentity')
AddEventHandler('esx_identity:setIdentity', function(data)
	local identifier = GetPlayerIdentifiers(source)[1]
	setIdentity(identifier, data, function(callback)
		if callback == true then
			print('Création effectué pour : ' .. identifier)
		else
			print('Erreur création de compte : ' .. identifier)
		end
	end)
end)

--===============================================
--==       Player Loaded Event Handler         ==
--===============================================
--[[
AddEventHandler('es:playerLoaded', function(source)
	getIdentity(source, function(data)

		 if data.firstname == ''  then

		TriggerClientEvent('esx_identity:showRegisterIdentity', source)
			print('Création d\'un Personnage en cours')
			elseif data.lastname == '' then
				TriggerClientEvent('esx_identity:showRegisterIdentity', source)
				print('Création d\'un Personnage en cours')
		else
			TriggerClientEvent('esx:showNotification', source, ('~g~Bienvenue sur Agoria Paradise'))
			print('Connection effectué pour : ' .. data.firstname .. ' ' .. data.lastname)
		end
		end)
	end)
]]
AddEventHandler('es:playerLoaded', function(source)
	getIdentity(source, function(data)
if data.firstname == '' then
			TriggerClientEvent('esx_identity:open', source)
			print('Création d\'un Personnage en cours')
		else
			TriggerClientEvent('esx:showNotification', source, ('~g~Connection Effectué'))
			print('Connection effectué pour : ' .. data.firstname .. ' ' .. data.lastname)
		end
		end)
	end)




RegisterServerEvent('esx_identity:ktrcheck')
AddEventHandler('esx_identity:ktrcheck', function(data)
	getIdentity(source, function(data)
		if data.lastname == '' then
			TriggerClientEvent('esx_identity:showRegisterIdentity', source)
		else
			TriggerClientEvent('esx:showNotification', source, ('~r~Contacter KeyTur'))
		end
	end)
end)



--[[RegisterServerEvent('esx_identity:ktrcheck')
AddEventHandler('esx_identity:ktrcheck', function(source)
	getIdentity(source, function(data)
		if data.lastname == '' then
			TriggerClientEvent('esx_identity:showRegisterIdentity', source)
		else
			TriggerClientEvent('esx:showNotification', source, ('~r~Contacter KeyTur'))
		end
		end)
	end)

]]


TriggerEvent('es:addCommand', 'agoriareload', function(source, args, user)
	getIdentity(source, function(data)
		if data.firstname == '' then
			TriggerClientEvent('esx_identity:open', source)
		else
			TriggerClientEvent('esx:showNotification', source, ('~r~Vous avez déja crée votre carte d\'identiter'))
		end
		end)
	end)
