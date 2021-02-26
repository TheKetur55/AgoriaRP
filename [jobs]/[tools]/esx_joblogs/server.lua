--Create by
--Alex Garcio(https://github.com/RedAlex)
--Jade Perron(https://github.com/CaptnElizabeth)

ESX                  = nil
local LogAdmin       = ""
local LogAmbulance   = ""
local LogMecano      = ""
local LogPolice      = ""
local Logblanchisseur      = ""
local Logventeweed       = ""
local LogSheriff     = ""
local LogTaxi        = ""
local LogVehicleShop = ""
local Logvigneron = ""
local Logdrogue = ""
local Loglspdarmor = ""
local Logarmurier = ""
local Loglavande = ""
local Logpomme = ""
local Logvolvoiturelux = ""
local Logargentsocieter = ""
local Logbanque = ""
local Logbrak = ""
local Logdonnerargent = ""
local Logdonneritem = ""
local Logdonnerarme = ""
local Logjeter = ""

local Logfouiller = ""
local Logimmo = ""
local Logspec = ""
local Loggive = ""
local liasseblack = ""
local coffre = ""
local fermier = ""
local fermier1 = ""

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function sendToDiscord (canal, name, message, color)
  -- Modify here your discordWebHook username = name, content = message,embeds = embeds
local DiscordWebHook = canal
local embeds = {
    {
        ["title"]= message,
        ["type"]= "rich",
        ["color"] = color,
        ["footer"]=  {
        ["text"]= "Job_logs",
       },
    }
}

  if message == nil or message == '' then return FALSE end
  PerformHttpRequest(DiscordWebHook, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds}), { ['Content-Type'] = 'application/json' })
end


function loadLogs()
  Logarmurier       = LoadResourceFile("esx_joblogs", "Logs/armurier.log")       or ""
  coffre       = LoadResourceFile("esx_joblogs", "Logs/coffre.log")       or ""
  fermier       = LoadResourceFile("esx_joblogs", "Logs/fermier.log")       or ""
  fermier1       = LoadResourceFile("esx_joblogs", "Logs/fermier1.log")       or ""
  Logjeter      = LoadResourceFile("esx_joblogs", "Logs/jeter.log")       or ""
  gAdmin       = LoadResourceFile("esx_joblogs", "Logs/admin.log")       or ""
  LogAmbulance   = LoadResourceFile("esx_joblogs", "Logs/ambulance.log")   or ""
  LogVehicleShop = LoadResourceFile("esx_joblogs", "Logs/vehicleshop.log") or ""
  LogMecano      = LoadResourceFile("esx_joblogs", "Logs/mecano.log")      or ""
  LogPolice      = LoadResourceFile("esx_joblogs", "Logs/police.log")      or ""
  Logblanchisseur      = LoadResourceFile("esx_joblogs", "Logs/blanchisseur.log")      or ""
  Logventeweed     = LoadResourceFile("esx_joblogs", "Logs/venteweed.log")      or ""
  Loglavande     = LoadResourceFile("esx_joblogs", "Logs/lavande.log")      or ""
  Logpomme     = LoadResourceFile("esx_joblogs", "Logs/pomme.log")      or ""
Logargentsocieter     = LoadResourceFile("esx_joblogs", "argentsocieter/pomme.log")      or ""
  LogSheriff     = LoadResourceFile("esx_joblogs", "Logs/sheriff.log")     or ""
  LogTaxi        = LoadResourceFile("esx_joblogs", "Logs/taxi.log")        or ""
  Logvigneron        = LoadResourceFile("esx_joblogs", "Logs/vigneron.log")        or ""
  Logbanque        = LoadResourceFile("esx_joblogs", "Logs/banque.log")        or ""
    Logbrak        = LoadResourceFile("esx_joblogs", "Logs/brak.log")        or ""
   Logfouiller       = LoadResourceFile("esx_joblogs", "Logs/fouiller.log")        or ""
  Logdrogue        = LoadResourceFile("esx_joblogs", "Logs/drogue.log")        or ""
  Logvolvoiturelux        = LoadResourceFile("esx_joblogs", "Logs/voiturelux.log")        or ""
  Loglspdarmor        = LoadResourceFile("esx_joblogs", "Logs/lspdarmor.log")        or ""

  Logdonnerargent        = LoadResourceFile("esx_joblogs", "Logs/donnerargent .log")        or ""
  Logdonneritem        = LoadResourceFile("esx_joblogs", "Logs/donneritem.log")        or ""
  Logdonnerarme        = LoadResourceFile("esx_joblogs", "Logs/donnerarme.log")        or ""
  Logimmo        = LoadResourceFile("esx_joblogs", "Logs/immo.log")        or ""
  Loggive        = LoadResourceFile("esx_joblogs", "Logs/give.log")        or ""
  Logspec        = LoadResourceFile("esx_joblogs", "Logs/spec.log")        or ""
  liasseblack        = LoadResourceFile("esx_joblogs", "Logs/spec.log")        or ""
end


function SaveInLog(job, message)
    if job == "admin" then
        LogAdmin = LogAdmin .. message .. "\n"
        SaveResourceFile("esx_joblogs", "Logs/admin.log", LogAdmin, -1)
          if Config.EnableDiscordLink == true then
            sendToDiscord(Config.webhookadmin, _U('admin_bot_name'), message, Config.orange)
          end
    elseif job == "ambulance" then
        LogAmbulance = LogAmbulance .. message .. "\n"
        SaveResourceFile("esx_joblogs", "Logs/ambulance.log", LogAmbulance, -1)
          if Config.EnableDiscordLink == true then
            sendToDiscord(Config.webhookambulance, _U('ambulance_bot_name'), message, Config.orange)
          end
          
 elseif job == "spec" then
        Logspec = Logspec .. message .. "\n"
        SaveResourceFile("esx_joblogs", "Logs/spec.log", Logspec, -1)
          if Config.EnableDiscordLink == true then
            sendToDiscord(Config.webhookspec, _U('spec_bot_name'), message, Config.orange)
          end

      elseif job == "fermier" then
        fermier = fermier .. message .. "\n"
        SaveResourceFile("esx_joblogs", "Logs/spec.log", fermier, -1)
          if Config.EnableDiscordLink == true then
            sendToDiscord(Config.fermier, ('AL BONNE BOUF'), message, Config.orange)
          end
      elseif job == "fermier" then
        fermier1 = fermier1 .. message .. "\n"
        SaveResourceFile("esx_joblogs", "Logs/spec.log", fermier1, -1)
          if Config.EnableDiscordLink == true then
            sendToDiscord(Config.fermier1, ('AL BONNE BOUF'), message, Config.orange)
          end
      elseif job == "coffre" then
        coffre = coffre .. message .. "\n"
        SaveResourceFile("esx_joblogs", "Logs/spec.log", coffre, -1)
          if Config.EnableDiscordLink == true then
            sendToDiscord(Config.webhookcoffre, _U('spec_bot_name'), message, Config.orange)
          end

          elseif job == "liasseblack" then
        liasseblack = liasseblack .. message .. "\n"
        SaveResourceFile("esx_joblogs", "Logs/spec.log", liasseblack, -1)
          if Config.EnableDiscordLink == true then
            sendToDiscord(Config.webhookliasseblack, _U('spec_bot_name'), message, Config.orange)
          end
          
        elseif job == "fouiller" then
        Logfouiller = Logfouiller .. message .. "\n"
        SaveResourceFile("esx_joblogs", "Logs/fouiller.log", Logfouiller, -1)
          if Config.EnableDiscordLink == true then
            sendToDiscord(Config.webhookfouiller, _U('fouiller_bot_name'), message, Config.orange)
          end

          elseif job == "brak" then
        Logbrak = Logbrak .. message .. "\n"
        SaveResourceFile("esx_joblogs", "Logs/give.log", Logbrak, -1)
          if Config.EnableDiscordLink == true then
            sendToDiscord(Config.webhookbrak, _U('brak_bot_name'), message, Config.orange)
          end

          
 elseif job == "give" then
        Loggive = Loggive .. message .. "\n"
        SaveResourceFile("esx_joblogs", "Logs/give.log", Loggive, -1)
          if Config.EnableDiscordLink == true then
            sendToDiscord(Config.webhookgive, _U('give_bot_name'), message, Config.orange)
          end


           elseif job == "immo" then
        Logimmo = Logimmo .. message .. "\n"
        SaveResourceFile("esx_joblogs", "Logs/fouiller.log", Logimmo, -1)
          if Config.EnableDiscordLink == true then
            sendToDiscord(Config.webhookimmo, _U('immo_bot_name'), message, Config.orange)
          end


    elseif job == "vehicleshop" then
        LogVehicleShop = LogVehicleShop .. message .. "\n"
        SaveResourceFile("esx_joblogs", "Logs/vehicleshop.log", LogVehicleShop, -1)
          if Config.EnableDiscordLink == true then
            sendToDiscord(Config.webhookvehicleshop, _U('vehicleshop_bot_name'), message, Config.orange)
          end
 elseif job == "banque" then
        Logbanque = Logbanque .. message .. "\n"
        SaveResourceFile("esx_joblogs", "Logs/banque.log", Logbanque, -1)
          if Config.EnableDiscordLink == true then
            sendToDiscord(Config.webhookbanque, _U('banque_bot_name'), message, Config.orange)
          end
          elseif job == "lavande" then
        Loglavande = Loglavande .. message .. "\n"
        SaveResourceFile("esx_joblogs", "Logs/vehicleshop.log", Loglavande, -1)
          if Config.EnableDiscordLink == true then
            sendToDiscord(Config.webhooklavande, 'Agoria | Lavande', message, Config.orange)
          end

          elseif job == "pomme" then
        Logpomme = Logpomme .. message .. "\n"
        SaveResourceFile("esx_joblogs", "Logs/vehicleshop.log", Logpomme, -1)
          if Config.EnableDiscordLink == true then
            sendToDiscord(Config.webhookpomme, 'Agoria | Pomme', message, Config.orange)
          end
 elseif job == "argentsocieter" then
        Logargentsocieter = Logargentsocieter .. message .. "\n"
        SaveResourceFile("esx_joblogs", "Logs/argentsocieter.log", Logargentsocieter, -1)
          if Config.EnableDiscordLink == true then
            sendToDiscord(Config.webhookargentsocieter, _U('argentsocieter_bot_name'), message, Config.orange)
          end


           elseif job == "volvoiturelux" then
        Logvolvoiturelux = Logvolvoiturelux .. message .. "\n"
        SaveResourceFile("esx_joblogs", "Logs/volvoiturelux.log", Logvolvoiturelux, -1)
          if Config.EnableDiscordLink == true then
            sendToDiscord(Config.webhookvolvoiturelux, _U('volvoiturelux_bot_name'), message, Config.orange)
          end

            elseif job == "lspdarmor" then
        Loglspdarmor = Loglspdarmor .. message .. "\n"
        SaveResourceFile("esx_joblogs", "Logs/lspdarmor.log", Loglspdarmor, -1)
          if Config.EnableDiscordLink == true then
            sendToDiscord(Config.webhooklspdarmor, _U('lspdarmor_bot_name'), message, Config.orange)
          end
          

          elseif job == "drogue" then
        Logdrogue = Logdrogue .. message .. "\n"
        SaveResourceFile("esx_joblogs", "Logs/drogue.log", Logdrogue, -1)
          if Config.EnableDiscordLink == true then
            sendToDiscord(Config.webhookdrogue, _U('drogue_bot_name'), message, Config.orange)
          end

           elseif job == "armurier" then
        Logarmurier = Logarmurier .. message .. "\n"
        SaveResourceFile("esx_joblogs", "Logs/armurier.log", Logarmurier, -1)
          if Config.EnableDiscordLink == true then
            sendToDiscord(Config.webhookarmurier, _U('armurier_bot_name'), message, Config.orange)
          end

           elseif job == "jeter" then
        Logjeter = Logjeter .. message .. "\n"
        SaveResourceFile("esx_joblogs", "Logs/vehicleshop.log", Logjeter, -1)
          if Config.EnableDiscordLink == true then
            sendToDiscord(Config.webhookjeter, _U('jeter_bot_name'), message, Config.orange)
          end


           elseif job == "vigneron" then
        LogVehicleShop = LogVehicleShop .. message .. "\n"
        SaveResourceFile("esx_joblogs", "Logs/vigneron.log", LogVehicleShop, -1)
          if Config.EnableDiscordLink == true then
            sendToDiscord(Config.webhookvigneron, _U('vigneron_bot_name'), message, Config.orange)
          end

    elseif job == "mecano" then
        LogMecano = LogMecano .. message .. "\n"
        SaveResourceFile("esx_joblogs", "Logs/mecano.log", LogMecano, -1)
          if Config.EnableDiscordLink == true then
            sendToDiscord(Config.webhookmecano, _U('mecano_bot_name'), message, Config.orange)
          end
    elseif job == "police" then
        LogPolice = LogPolice .. message .. "\n"
        SaveResourceFile("esx_joblogs", "Logs/police.log", LogPolice, -1)
		  if Config.EnableDiscordLink == true then
            sendToDiscord(Config.webhookpolice, _U('blanchisseur_bot_name'), message, Config.orange)
          end
    elseif job == "sheriff" then
        LogSheriff = LogSheriff .. message .. "\n"
        SaveResourceFile("esx_joblogs", "Logs/sheriff.log", LogSheriff, -1)
          if Config.EnableDiscordLink == true then
            sendToDiscord(Config.webhooksheriff, _U('sheriff_bot_name'), message, Config.orange)
          end
    elseif job == "blanchisseur" then
        LogSheriff = LogSheriff .. message .. "\n"
        SaveResourceFile("esx_joblogs", "Logs/blanchisseur.log", LogSheriff, -1)
          if Config.EnableDiscordLink == true then
            sendToDiscord(Config.webhookblanchisseur, _U('blanchisseur_bot_name'), message, Config.orange)
          end

           elseif job == "venteweed" then
        LogSheriff = LogSheriff .. message .. "\n"
        SaveResourceFile("esx_joblogs", "Logs/Logventeweed.log", LogSheriff, -1)
          if Config.EnableDiscordLink == true then
            sendToDiscord(Config.webhookventeweed, _U('Logventeweed_bot_name'), message, Config.orange)
          end

           elseif job == "bus" then
        LogSheriff = LogSheriff .. message .. "\n"
        SaveResourceFile("esx_joblogs", "Logs/bus.log", LogSheriff, -1)
          if Config.EnableDiscordLink == true then
            sendToDiscord(Config.webhookbus, _U('Logbus_bot_name'), message, Config.orange)
          end

           elseif job == "donnerargent" then
        Logdonnerargent = Logdonnerargent .. message .. "\n"
        SaveResourceFile("esx_joblogs", "Logs/donnerargent.log", Logdonnerargent, -1)
          if Config.EnableDiscordLink == true then
            sendToDiscord(Config.webhookdonnerargent, _U('donnerargent_bot_name'), message, Config.orange)
          end
           elseif job == "donneritem" then
        Logdonneritem = Logdonneritem .. message .. "\n"
        SaveResourceFile("esx_joblogs", "Logs/donneritem.log", Logdonneritem, -1)
          if Config.EnableDiscordLink == true then
            sendToDiscord(Config.webhookdonneritem, _U('donneritem_bot_name'), message, Config.orange)
          end
           elseif job == "donnerarme" then
        Logdonnerarme = Logdonnerarme .. message .. "\n"
        SaveResourceFile("esx_joblogs", "Logs/donnerarme.log", Logdonnerarme, -1)
          if Config.EnableDiscordLink == true then
            sendToDiscord(Config.webhookdonnerarme, _U('donnerarme_bot_name'), message, Config.orange)
          end


    elseif job == "taxi" then
        LogTaxi = LogTaxi .. message .. "\n"
        SaveResourceFile("esx_joblogs", "Logs/taxi.log", LogTaxi, -1)
          if Config.EnableDiscordLink == true then
            sendToDiscord(Config.webhooktaxi, _U('taxi_bot_name'), message, Config.orange)
          end
    else
        print("The job " ..job.. "is not know by esx_joblogs contact the dev.")
    end
end


RegisterServerEvent('esx_joblogs:AddInLog')
AddEventHandler('esx_joblogs:AddInLog', function(job, localetxt, info1, info2, info3, info4)
  local _job        = job
  local _localetxt  = localetxt
  local _info1      = info1
  local _info2      = ''
  local _info3      = ''
  local _info4      = ''
  if info2 ~= nil then
    _info2 = info2
  end
  if info3 ~= nil then
    _info3 = info3
  end
  if info4 ~= nil then
    _info4 = info4
  end
  local message     = "["..os.date("%Y/%m/%d %H:%M:%S").."] ' ".. _U(_localetxt, _info1, _info2, _info3, _info4)
  SaveInLog(_job, message)
end)


loadLogs()
--SaveInLog("admin", "["..os.date("%c").."] ' ".. _U("reboot"))
--SaveInLog("ambulance", "["..os.date("%c").."] ' ".. _U("reboot"))
--SaveInLog("vehicleshop", "["..os.date("%c").."] ' ".. _U("reboot"))
--SaveInLog("mecano", "["..os.date("%c").."] ' ".. _U("reboot"))
--SaveInLog("police", "["..os.date("%c").."] ' ".. _U("reboot"))
--SaveInLog("sheriff", "["..os.date("%c").."] ' ".. _U("reboot"))
--SaveInLog("taxi", "["..os.date("%c").."] ' ".. _U("reboot"))
