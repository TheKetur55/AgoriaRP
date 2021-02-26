ESX = nil

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)




local nbPizza = 0
--CONFIGURATION--

local pizzeria = { x = -1191.40, y = -1727.39, z = 3.46} --Configuration marker prise de service
local pizzeriafin = { x = -1177.04, y = -1746.40, z = 3.00} --Configuration marker fin de service
local spawnfaggio = { x = -1185.92, y = -1747.93, z = 3.00} --Configuration du point de spawn du faggio

local livpt = { --Configuration des points de livraisons (repris ceux de Maykellll1 / NetOut)
[1] ={name ="Livraison" ,x= -1138.60, y= -1625.05,z = 3.39},
[2] ={name ="Livraison" ,x= -1156.41, y= -1575.14,z = 7.34},
[3] ={name ="Livraison" ,x= -1116.43, y= -1506.46,z = 3.41},
[4] ={name ="Livraison" ,x= -1087.06, y= -1502.12,z = 3.98},
[5] ={name ="Livraison" ,x= -1077.30, y= -1526.09,z = 3.87},
[6] ={name ="Livraison" ,x= -1091.83, y= -1534.65,z = 3.57},
[7] ={name ="Livraison" ,x= -1134.29, y= -1569.64,z = 3.41},
[8] ={name ="Livraison" ,x= -1115.43 , y= -1576.52,z = 3.54},
[9] ={name ="Livraison" ,x= -1071.28,  y= -1564.84,z = 3.43},
[10] ={name ="Livraison" ,x= -1026.70, y= -1574.69,z = 4.18},
[11] ={name ="Livraison" ,x= -1037.51, y= -1604.62,z = 3.96},
[12] ={name ="Livraison" ,x= -1038.23, y= -1609.71,z = 4.00},
[13] ={name ="Livraison" ,x= -1041.08 ,y= -1591.36,z = 3.99},
[14] ={name ="Livraison" ,x= -1030.94, y= -1621.61,z = 4.03},
[15] ={name ="Livraison" ,x= -1022.85 ,y= -1615.47,z = 4.00},
[16] ={name ="Livraison" ,x= -1131.73 ,y= -1435.19,z = 3.99},
[17] ={name ="Livraison" ,x= -1151.22, y= -1448.60,z = 3.54},
[18] ={name ="Livraison" ,x= -1246.83, y= -1359.24,z = 6.82},
[19] ={name ="Livraison" ,x= -1269.31, y= -1296.06,z = 3.00},
[20] ={name ="Livraison" ,x= -1254.96, y= -1330.52,z = 3.08},
[21] ={name ="Livraison" ,x=-1225.38 , y= -1268.41,z = 5.15},
[22] ={name ="Livraison" ,x= -1245.58, y= -1276.79,z = 3.30},
[23] ={name ="Livraison" ,x= -1284.47 ,y= -1252.83,z = 3.06},
[24] ={name ="Livraison" ,x= -1318.41, y= -1159.13,z = 3.86},
[25] ={name ="Livraison" ,x= -1336.88, y= -1161.60,z = 3.50},
[26] ={name ="Livraison" ,x= -1244.27, y= -1240.19,z = 10.02},
[27] ={name ="Livraison" ,x= -1221.60, y= -1231.88 ,z =10.02},
[28] ={name ="Livraison" ,x= -1229.89, y= -1235.12,z = 10.02},
[29] ={name ="Livraison" ,x= -1342.77, y= -1043.53,z = 6.80},
[30] ={name ="Livraison" ,x= -1384.31, y= -975.46,z = 7.95},
[31] ={name ="Livraison" ,x= -1373.04, y= -900.29,z = 11.47},
[32] ={name ="Livraison" ,x= -1309.49, y= -930.20,z = 12.35},
[33] ={name ="Livraison" ,x= -1319.93, y= -934.43,z = 12.35},
[34] ={name ="Livraison" ,x= -1309.28, y= -930.43,z = 15.35},
[35] ={name ="Livraison" ,x= -1320.22, y= -934.38,z = 15.35},
[36] ={name ="Livraison" ,x= -1329.56, y= -937.67,z = 14.35},
[37] ={name ="Livraison" ,x= -1338.35, y= -941.11,z = 15.35},
[38] ={name ="Livraison" ,x= -1338.14 ,y= -940.83,z = 11.35},
[39] ={name ="chez un client" ,x= -810.4093, y=-978.4364,z = 13.74061},
[40] ={name ="chez un client" ,x= -683.8874, y=-876.8568,z = 24.02004},
[41] ={name ="chez un client" ,x= -1031.316, y=-903.0217,z = 3.692086},
[42] ={name ="chez un client" ,x= -1262.703, y=-1123.342,z = 7.092357},
[43] ={name ="chez un client" ,x= -1225.079, y=-1208.524,z = 7.619214},
[44] ={name ="chez un client" ,x= -1207.095, y=-1263.851,z = 6.378308},
[45] ={name ="chez un client" ,x= -1086.787, y=-1278.122,z = 5.09411},
[46] ={name ="chez un client" ,x= -886.1298, y=-1232.698,z = 5.006698},
[47] ={name ="chez un client" ,x= -753.5927, y=-1512.016,z = 4.370816},
[48] ={name ="chez un client" ,x= -696.3545, y=-1386.89,z = 4.846177}
}

local blips = {
  --{title="Pizzeria", colour=51, id=103, x = -1285.73, y = -1387.15, z = 3.44}, --Configuration du point sur la carte
}

local coefflouze = 0.1 --Coeficient multiplicateur qui en fonction de la distance definit la paie

--INIT--

local isInJobPizz = false
local livr = 0
local plateab = "POPJOBS"
local isToHouse = false
local isToPizzaria = false
local paie = 0

local pourboire = 0
local posibilidad = 0
local px = 0
local py = 0
local pz = 0

--THREADS--

Citizen.CreateThread(function() --Thread d'ajout du point de la pizzeria sur la carte

  for _, info in pairs(blips) do

    info.blip = AddBlipForCoord(info.x, info.y, info.z)
    SetBlipSprite(info.blip, info.id)
    SetBlipDisplay(info.blip, 4)
    SetBlipScale(info.blip, 0.9)
    SetBlipColour(info.blip, info.colour)
    SetBlipAsShortRange(info.blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(info.title)
    EndTextCommandSetBlipName(info.blip)
  end

end)

Citizen.CreateThread(function() --Thread lancement + livraison depuis le marker vert
  while true do

    Citizen.Wait(0)

    if isInJobPizz == false then

      DrawMarker(1,pizzeria.x,pizzeria.y,pizzeria.z, 0, 0, 0, 0, 0, 0, 1.5001, 1.5001, 0.6001,0,255,0, 200, 0, 0, 0, 0)

      if GetDistanceBetweenCoords(pizzeria.x, pizzeria.y, pizzeria.z, GetEntityCoords(GetPlayerPed(-1),true)) < 1.5 then
        HelpText("Appuyez sur ~INPUT_CONTEXT~ pour lancer la livraison de ~r~Colis",0,1,0.5,0.8,0.6,255,255,255,255)

        if IsControlJustPressed(1,38) then
            notif = true
            isInJobPizz = true
            isToHouse = true
            livr = math.random(1, 48)

            px = livpt[livr].x
            py = livpt[livr].y
            pz = livpt[livr].z
            distance = round(GetDistanceBetweenCoords(pizzeria.x, pizzeria.y, pizzeria.z, px,py,pz))
            paie = distance * coefflouze

            spawn_faggio()
            goliv(livpt,livr)
            nbPizza = math.random(1, 1)

            TriggerServerEvent("livreur:itemadd", nbPizza)
        end
      end
    end

    if isToHouse == true then

      destinol = livpt[livr].name

      while notif == true do

        ESX.ShowNotification('Livrer le Coli')


       

        notif = false

        i = 1
      end

      DrawMarker(1,livpt[livr].x,livpt[livr].y,livpt[livr].z, 0, 0, 0, 0, 0, 0, 1.5001, 1.5001, 0.6001,0,255,0, 200, 0, 0, 0, 0)

      if GetDistanceBetweenCoords(px,py,pz, GetEntityCoords(GetPlayerPed(-1),true)) < 3 then
        HelpText("Appuyez sur ~INPUT_CONTEXT~ pour livrer le Coli",0,1,0.5,0.8,0.6,255,255,255,255)

        if IsControlJustPressed(1,38) then

          notif2 = true
          posibilidad = math.random(1, 100)
          afaitunepizzamin = true

          TriggerServerEvent("livreur:itemrm")
          nbPizza = nbPizza - 1

          if (posibilidad > 70) and (posibilidad < 90) then

            pourboire = math.random(10, 60)

            TriggerEvent("esx:showNotification", {
              text = "Un petit pourboire : " .. pourboire .. "$",
              type = "success",
              queue = "global",
              timeout = 4000,
              layout = "bottomRight"
            })

            TriggerServerEvent("livreur:pourboire", pourboire)

          end

          RemoveBlip(liv)
          Wait(250)
          if nbPizza == 0 then
            isToHouse = false
            isToPizzaria = true
          else
            isToHouse = true
            isToPizzaria = false
            livr = math.random(1, 48)

            px = livpt[livr].x
            py = livpt[livr].y
            pz = livpt[livr].z

            distance = round(GetDistanceBetweenCoords(pizzeria.x, pizzeria.y, pizzeria.z, px,py,pz))
            paie = distance * coefflouze

            goliv(livpt,livr)
          end


        end
      end
    end

    if isToPizzaria == true then

      while notif2 == true do
        SetNewWaypoint(pizzeria.x,pizzeria.y)


        ESX.ShowNotification('Direction l\'agence')

       

        notif2 = false

      end
      DrawMarker(1,pizzeria.x,pizzeria.y,pizzeria.z, 0, 0, 0, 0, 0, 0, 1.5001, 1.5001, 0.6001,0,255,0, 200, 0, 0, 0, 0)

      if GetDistanceBetweenCoords(pizzeria.x,pizzeria.y,pizzeria.z, GetEntityCoords(GetPlayerPed(-1),true)) < 3 and afaitunepizzamin == true then
        HelpText("Appuyez sur ~INPUT_CONTEXT~ pour recuperer les colis",0,1,0.5,0.8,0.6,255,255,255,255)

        if IsVehicleModel(GetVehiclePedIsIn(GetPlayerPed(-1), true), GetHashKey("faggio2"))  then

          if IsControlJustPressed(1,38) then

            if IsInVehicle() then

              afaitunepizzamin = false

              ESX.ShowNotification("Nous vous remercions de votre travail, voici votre paie : " .. paie .. "$")


             

              TriggerServerEvent("livreur:pourboire", paie)

              isInJobPizz = true
              isToHouse = true
              livr = math.random(1, 48)

              px = livpt[livr].x
              py = livpt[livr].y
              pz = livpt[livr].z

              distance = round(GetDistanceBetweenCoords(pizzeria.x, pizzeria.y, pizzeria.z, px,py,pz))
              paie = distance * coefflouze

              goliv(livpt,livr)
              nbPizza = math.random(1, 1)

              TriggerServerEvent("livreur:itemadd", nbPizza)

            else

              notifmoto1 = true

              while notifmoto1 == true do

                ESX.ShowNotification("Et la moto tu l'as oublié ?")


               

                notifmoto1 = false

              end
            end
          end
        else

          notifmoto2 = true

          while notifmoto2 == true do

             ESX.ShowNotification("Et la moto tu l'as oublié ?")

           

            notifmoto2 = false

          end
        end
      end
    end
    if IsEntityDead(GetPlayerPed(-1)) then

      isInJobPizz = false
      livr = 0
      isToHouse = false
      isToPizzaria = false

      paie = 0
      px = 0
      py = 0
      pz = 0
      RemoveBlip(liv)

    end
  end
end)



Citizen.CreateThread(function() -- Thread de "fin de service" depuis le point rouge
  while true do

    Citizen.Wait(0)

    if isInJobPizz == true then

      DrawMarker(1,pizzeriafin.x,pizzeriafin.y,pizzeriafin.z, 0, 0, 0, 0, 0, 0, 1.5001, 1.5001, 0.6001,255,0,0, 200, 0, 0, 0, 0)

      if GetDistanceBetweenCoords(pizzeriafin.x, pizzeriafin.y, pizzeriafin.z, GetEntityCoords(GetPlayerPed(-1),true)) < 1.5 then
        HelpText("Appuyez sur ~INPUT_CONTEXT~ pour arreter la livraison de ~r~coli",0,1,0.5,0.8,0.6,255,255,255,255)

        if IsControlJustPressed(1,38) then
          TriggerServerEvent('livreur:deleteAllPizz')
          isInJobPizz = false
          livr = 0
          isToHouse = false
          isToPizzaria = false

          paie = 0
          px = 0
          py = 0
          pz = 0

          if afaitunepizzamin == true then

            local vehicleu = GetVehiclePedIsIn(GetPlayerPed(-1), false)

            SetEntityAsMissionEntity( vehicleu, true, true )
            deleteCar( vehicleu )


             ESX.ShowNotification("Merci d'avoir travaillé, bonne journée")


           

            TriggerServerEvent("livreur:paiefinale")

            SetWaypointOff()

            afaitunepizzamin = false

          else

            local vehicleu = GetVehiclePedIsIn(GetPlayerPed(-1), false)

            SetEntityAsMissionEntity( vehicleu, true, true )
            deleteCar( vehicleu )
            RemoveBlip(liv)

             ESX.ShowNotification("Merci quand même, bonne journée")

            
          end
        end
      end
    end
  end
end)

--FONCTIONS--

function goliv(livpt,livr) -- Fonction d'ajout du point en fonction de la destination de livraison chosie
  liv = AddBlipForCoord(livpt[livr].x,livpt[livr].y, livpt[livr].z)
  SetBlipSprite(liv, 1)
  SetNewWaypoint(livpt[livr].x,livpt[livr].y)
end

function spawn_faggio() -- Thread spawn faggio

  Citizen.Wait(0)

  local myPed = GetPlayerPed(-1)
  local player = PlayerId()
  local vehicle = GetHashKey('faggio2')

  RequestModel(vehicle)

  while not HasModelLoaded(vehicle) do
    Wait(1)
  end

  local plateJob = math.random(1000, 9999)
  local spawned_car = CreateVehicle(vehicle, spawnfaggio.x,spawnfaggio.y,spawnfaggio.z, 431.436, - 996.786, 25.1887, true, false)

  local plate = "PIZZ"..plateJob

  SetVehicleNumberPlateText(spawned_car, plate)
  SetVehicleOnGroundProperly(spawned_car)
  SetVehicleLivery(spawned_car, 2)
  SetPedIntoVehicle(myPed, spawned_car, - 1)
  SetModelAsNoLongerNeeded(vehicle)

  Citizen.InvokeNative(0xB736A491E64A32CF, Citizen.PointerValueIntInitialized(spawned_car))
end

function round(num, numDecimalPlaces)
  local mult = 5^(numDecimalPlaces or 0)
  return math.floor(num * mult + 0.5) / mult
end

function deleteCar( entity )
  Citizen.InvokeNative( 0xEA386986E786A54F, Citizen.PointerValueIntInitialized( entity ) ) --Native qui del le vehicule
end

function IsInVehicle() --Fonction de verification de la presence ou non en vehicule du joueur
  local ply = GetPlayerPed(-1)
  if IsPedSittingInAnyVehicle(ply) then
    return true
  else
    return false
  end
end

function HelpText(text, state) --Fonction qui permet de creer les "Help Text" (Type "Appuyez sur ...")
  SetTextComponentFormat("STRING")
  AddTextComponentString(text)
  DisplayHelpTextFromStringLabel(0, state, 0, -1)
end