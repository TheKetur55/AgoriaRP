ESX                       = nil
local DisptachRequestId   = 0
local phoneNumbers        = {}

TriggerEvent('esx:getSharedObject', function(obj)
	ESX = obj
end)

function GenerateUniquephoneNumber()

	local foundNumber = false
	local phoneNumber = nil

	while not foundNumber do

		phoneNumber = math.random(15000, 99999)

		local result = MySQL.Sync.fetchAll(
			'SELECT COUNT(*) as count FROM users WHERE crypted_phone_number = @phoneNumber',
			{
				['@phoneNumber'] = phoneNumber
			}
		)

		local count  = tonumber(result[1].count)

		if count == 0 then
			foundNumber = true
		end

	end

	return phoneNumber
end

function GetDistpatchRequestId()

	local requestId = DisptachRequestId

	if DisptachRequestId < 65535 then
		DisptachRequestId = DisptachRequestId + 1
	else
		DisptachRequestId = 0
	end

	return requestId

end

AddEventHandler('esx_cryptedphone:getDistpatchRequestId', function(cb)
	cb(GetDistpatchRequestId())
end)

AddEventHandler('onResourceStart', function(ressource)
	if ressource == 'esx_cryptedphone' then
		TriggerEvent('esx_cryptedphone:ready')
	end
end)

AddEventHandler('esx:playerLoaded', function(source)

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

	for num,v in pairs(phoneNumbers) do
		if tonumber(num) == num then -- If phoneNumber is a player phone number
			for src,_ in pairs(v.sources) do
				TriggerClientEvent('esx_cryptedphone:setphoneNumberSource', source, num, tonumber(src))
			end
		end
	end

	MySQL.Async.fetchAll(
		'SELECT * FROM users WHERE identifier = @identifier',
		{
			['@identifier'] = xPlayer.identifier
		},
		function(result)

			local phoneNumber = result[1].crypted_phone_number

			if phoneNumber == nil then

				phoneNumber = GenerateUniquephoneNumber()

				MySQL.Async.execute(
					'UPDATE users SET crypted_phone_number = @crypted_phone_number WHERE identifier = @identifier',
					{
						['@identifier']   = xPlayer.identifier,
						['@crypted_phone_number'] = phoneNumber
					}
				)
			end

			TriggerClientEvent('esx_cryptedphone:setphoneNumberSource', -1, phoneNumber, source)

			phoneNumbers[phoneNumber] = {
				type          = 'player',
				hashDispatch  = false,
				sharePos      = false,
				hideNumber    = false,
				hidePosIfAnon = false,
				sources       = {[source] = true}
			}

			xPlayer.set('phoneNumber', phoneNumber)

			if phoneNumbers[xPlayer.job.name] ~= nil then
				TriggerEvent('esx_cryptedphone:addSource', xPlayer.job.name, source)
			end

			local contacts = {}

			MySQL.Async.fetchAll(
				'SELECT * FROM user_contacts WHERE identifier = @identifier ORDER BY name ASC',
				{
					['@identifier'] = xPlayer.identifier
				},
				function(result2)

					for i=1, #result2, 1 do

						table.insert(contacts, {
							name   = result2[i].name,
							number = result2[i].number,
						})
					end

					xPlayer.set('contacts', contacts)

					TriggerClientEvent('esx_cryptedphone:loaded', source, phoneNumber, contacts)

				end
			)

		end
	)

end)

AddEventHandler('esx:playerDropped', function(source)
	
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
	
	TriggerClientEvent('esx_cryptedphone:setphoneNumberSource', -1, xPlayer.get('phoneNumber'), -1)

	phoneNumbers[xPlayer.get('phoneNumber')] = nil

	if phoneNumbers[xPlayer.job.name] ~= nil then
		TriggerEvent('esx_cryptedphone:removeSource', xPlayer.job.name, source)
	end

end)

AddEventHandler('esx:setJob', function(source, job, lastJob)
	
	if phoneNumbers[lastJob.name] ~= nil then
		TriggerEvent('esx_cryptedphone:removeSource', lastJob.name, source)
	end

	if phoneNumbers[job.name] ~= nil then
		TriggerEvent('esx_cryptedphone:addSource', job.name, source)
	end

end)

RegisterServerEvent('esx_cryptedphone:reload')
AddEventHandler('esx_cryptedphone:reload', function(phoneNumber)

	local _source  = source
	local xPlayer  = ESX.GetPlayerFromId(_source)
	local contacts = xPlayer.get('contacts')

	TriggerClientEvent('esx_cryptedphone:loaded', _source, phoneNumber, contacts)

end)

RegisterServerEvent('esx_cryptedphone:send')
AddEventHandler('esx_cryptedphone:send', function(phoneNumber, message, anon, position)

	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	print('MESSAGE => ' .. xPlayer.name .. '@' .. phoneNumber .. ' : ' .. message)

	if phoneNumbers[phoneNumber] ~= nil then

		for k,v in pairs(phoneNumbers[phoneNumber].sources) do

			local numType          = phoneNumbers[phoneNumber].type
			local numHasDispatch   = phoneNumbers[phoneNumber].hasDispatch
			local numHide          = phoneNumbers[phoneNumber].hideNumber
			local numHidePosIfAnon = phoneNumbers[phoneNumber].hidePosIfAnon
			local numPosition      = (phoneNumbers[phoneNumber].sharePos and position or false)
			local numSource        = tonumber(k)

			if numHidePosIfAnon and anon then
				numPosition = false
			end

			if numHasDispatch then
				TriggerClientEvent('esx_cryptedphone:onMessage', numSource, xPlayer.get('phoneNumber'), message, numPosition, (numHide and true or anon), numType, GetDistpatchRequestId())
			else
				TriggerClientEvent('esx_cryptedphone:onMessage', numSource, xPlayer.get('phoneNumber'), message, numPosition, (numHide and true or anon), numType, false)
			end

		end

	end

end)

AddEventHandler('esx_cryptedphone:registerNumber', function(number, type, sharePos, hasDispatch, hideNumber, hidePosIfAnon)
	
	local hideNumber    = hideNumber    or false
	local hidePosIfAnon = hidePosIfAnon or false

	phoneNumbers[number] = {
		type          = type,
		sharePos      = sharePos,
		hasDispatch   = (hasDispatch or false),
		hideNumber    = hideNumber,
		hidePosIfAnon = hidePosIfAnon,
		sources       = {}
	}

end)

AddEventHandler('esx_cryptedphone:addSource', function(number, source)
	phoneNumbers[number].sources[tostring(source)] = true
end)

AddEventHandler('esx_cryptedphone:removeSource', function(number, source)
	phoneNumbers[number].sources[tostring(source)] = nil
end)

RegisterServerEvent('esx_cryptedphone:addPlayerContact')
AddEventHandler('esx_cryptedphone:addPlayerContact', function(phoneNumber, contactName)

	local _source     = source
	local xPlayer     = ESX.GetPlayerFromId(_source)
	local foundNumber = false
	local foundPlayer = nil

	MySQL.Async.fetchAll(
		'SELECT crypted_phone_number FROM users WHERE crypted_phone_number = @number',
		{
			['@number'] = phoneNumber
		},
		function(result)

			if result[1] ~= nil then
				foundNumber = true
			end

			if foundNumber then

				if phoneNumber == xPlayer.get('phoneNumber') then
					TriggerClientEvent('esx:showNotification', _source, _U('cannot_add_self'))
				else

					local hasAlreadyAdded = false
					local contacts        = xPlayer.get('contacts')

					for i=1, #contacts, 1 do
						if contacts[i].number == phoneNumber then
							hasAlreadyAdded = true
						end
					end

					if hasAlreadyAdded then
						TriggerClientEvent('esx:showNotification', _source, _U('number_in_contacts'))
					else

						table.insert(contacts, {
							name   = contactName,
							number = phoneNumber,
						})

						xPlayer.set('contacts', contacts)

						MySQL.Async.execute(
							'INSERT INTO user_contacts (identifier, name, number) VALUES (@identifier, @name, @number)',
							{
								['@identifier'] = xPlayer.identifier,
								['@name']       = contactName,
								['@number']     = phoneNumber
							},
							function(rowsChanged)

								TriggerClientEvent('esx:showNotification', _source, _U('contact_added'))

								TriggerClientEvent('esx_cryptedphone:addContact', _source, contactName, phoneNumber)
							end
						)

					end
				end

			else
				TriggerClientEvent('esx:showNotification', source, _U('number_not_assigned'))
			end

		end
	)

end)

RegisterServerEvent('esx_cryptedphone:stopDispatch')
AddEventHandler('esx_cryptedphone:stopDispatch', function(dispatchRequestId)
	TriggerClientEvent('esx_cryptedphone:stopDispatch', -1, dispatchRequestId, GetPlayerName(source))
end)

ESX.RegisterServerCallback('esx_cryptedphone:getItemAmount', function(source, cb, item)
    local xPlayer = ESX.GetPlayerFromId(source)
    local qtty = xPlayer.getInventoryItem(item).count
--	print("phone qtty: " .. qtty)
    cb(qtty)
end)