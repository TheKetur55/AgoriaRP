function getIdentity(source, callback)
  local identifier = GetPlayerIdentifiers(source)[1]
  MySQL.Async.fetchAll("SELECT u.firstname, u.lastname, u.dateofbirth, u.sex, u.height, u.job ,j.label as jobgrade FROM `users` u LEFT JOIN job_grades j ON j.job_name=u.job AND j.grade=u.job_grade WHERE identifier=@identifier", {['@identifier'] = identifier},
  function(result)
    if result[1]['firstname'] ~= nil then
      local data = {
        firstname     = result[1]['firstname'],
        lastname      = result[1]['lastname'],
        dateofbirth   = result[1]['dateofbirth'],
        sex           = result[1]['sex'],
        height        = result[1]['height'],
        job_grade     = result[1]['jobgrade'],
        job           = result[1]['job'],
      }
      callback(data)
    else
      local data = {
        identifier    = '',
        firstname     = '',
        lastname      = '',
        dateofbirth   = '',
        sex           = '',
        job_grade     = '',
        height        = ''
      }
      callback(data)
    end
  end)
end


RegisterServerEvent('gc:openIdentity')
AddEventHandler('gc:openIdentity',function(pType, other)
    getIdentity(source, function(data)
        local gender
        if data.sex == "h" or data.sex == "H" then
            gender = "h"
        elseif data.sex == "f" or data.sex == "F" then
            gender = "f"
        end
        local obj = {}
        if pType == 'identity' then
            obj = {
                lastname = data.lastname,
                firstname = data.firstname,
                birthday = tostring(data.dateofbirth),
                sex = gender,
                job = data.job,
                height = data.height
            }
        elseif pType == 'job' then
            obj = {
                lastname = data.lastname,
                firstname = data.firstname,
                job_name = data.job,
                job_grade = data.job_grade
            }
        elseif pType == 'weaponlicence' then
            obj = {
                lastname = data.lastname,
                firstname = data.firstname,
                sex = gender,
                birthday = tostring(data.dateofbirth)
            }
        elseif pType == 'driverlicence' then
            obj = {
                lastname = data.lastname,
                firstname = data.firstname,
                sex = gender,
                birthday = tostring(data.dateofbirth)
            }
        end
        TriggerClientEvent('gc:showItentity', tonumber(other), pType, obj)
    end)
end)




RegisterServerEvent('gc:openMeIdentity')
AddEventHandler('gc:openMeIdentity',function(pType)
    local source_ = source
    getIdentity(source, function(data)
        local gender
        if data.sex == "h" or data.sex == "H" then
            gender = "h"
        elseif data.sex == "f" or data.sex == "F" then
            gender = "f"
        end
        local obj = {}
        if pType == 'identity' then
            obj = {
                lastname = data.lastname,
                firstname = data.firstname,
                birthday = tostring(data.dateofbirth),
                sex = gender,
                job = data.job,
                height = data.height
            }
        elseif pType == 'job' then
            obj = {
                lastname = data.lastname,
                firstname = data.firstname,
                job_name = data.job,
                job_grade = data.job_grade
            }
        elseif pType == 'weaponlicence' then
            obj = {
                lastname = data.lastname,
                firstname = data.firstname,
                sex = gender,
                birthday = tostring(data.dateofbirth)
            }
        elseif pType == 'driverlicence' then
            obj = {
                lastname = data.lastname,
                firstname = data.firstname,
                sex = gender,
                birthday = tostring(data.dateofbirth)
            }
        end
        TriggerClientEvent('gc:showItentity', source_, pType, obj)
    end)
end)

