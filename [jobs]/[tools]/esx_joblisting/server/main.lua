ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('esx_joblisting:getJobsList', function(source, cb)
	MySQL.Async.fetchAll('SELECT * FROM jobs WHERE whitelisted = @whitelisted', {
		['@whitelisted'] = false
	}, function(result)
		local data = {}

		for i=1, #result, 1 do
			table.insert(data, {
				job   = result[i].name,
				label = result[i].label
			})
		end

		cb(data)
	end)
end)

ESX.RegisterServerCallback('esx_joblisting:getSecondJobsList', function(source, cb)
	MySQL.Async.fetchAll(
		'SELECT * FROM jobs WHERE whitelisted = false AND job_place = 2',
		{},
		function(result)
			local data = {}
			for i=1, #result, 1 do
				table.insert(data, {
					value   = result[i].name,
					label   = result[i].label
				})
			end
			cb(data)
		end
	)
end)

RegisterServerEvent('esx_joblisting:setJob')
AddEventHandler('esx_joblisting:setJob', function(job)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	MySQL.Async.fetchAll('SELECT whitelisted FROM jobs WHERE name = @name', {
		['@name'] = job,
	}, function(result)
		if not result[1].whitelisted then
			xPlayer.setJob(job, 0)
		else
			print(('esx_joblisting: %s attempted to set a whitelisted job! (lua injector)'):format(xPlayer.identifier))
		end
		
	end)

end)

RegisterServerEvent('esx_joblisting:setSecondJob')
AddEventHandler('esx_joblisting:setSecondJob', function(job)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.setSecondJob(job, 0)
	--MySQL.Async.execute('UPDATE users SET `second_job`=@job WHERE `identifier`=@identifier',
	--	{
	--		['@identifier'] = xPlayer.identifier,
	--		['@job'] = job
	--	},
	--	function(done)
	--		TriggerClientEvent('esx_joblisting:secondJobSet')
	--end)
end)
