ESX                           = nil
local HasAlreadyEnteredMarker = false
local LastZone                = nil
local CurrentAction           = nil
local CurrentActionMsg        = ''
local CurrentActionData       = {}
local Licenses                = {}
local LicensePrice = Config.LicensePrice

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)

RegisterNetEvent('esx_weashop2:loadLicenses')
AddEventHandler('esx_weashop2:loadLicenses', function (licenses)
  for i = 1, #licenses, 1 do
    Licenses[licenses[i].type] = true
  end
end)

RegisterNetEvent('esx_weashop:clipcli')
AddEventHandler('esx_weashop:clipcli', function()
  ped = GetPlayerPed(-1)
  if IsPedArmed(ped, 4) then
    hash=GetSelectedPedWeapon(ped)
    if hash~=nil then
      TriggerServerEvent('esx_weashop:remove')
      AddAmmoToPed(GetPlayerPed(-1), hash,25)
      ESX.ShowNotification("tu a utilisé un chargeur")
    else
      ESX.ShowNotification("tu n'a pas d'arme en main")
    end
  else
    ESX.ShowNotification("ce type de munision ne convient pas")
  end
end)



function OpenMainMenu(zone)
  ESX.UI.Menu.CloseAll()

  ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'wea_cat',
    {
      title = "Armurier",
      elements = {
        { label = "Arme", value = 'wl_1' },
       -- { label = "Arme type 2", value = 'wl_2' },
      --  { label = "Arme type 3", value = 'wl_3' },
      }
    },
    function (data, menu)
      
      local value = data.current.value
      local rvalue = value

      if data.current.value == 'wl_1' then
      --  if Licenses['weapon1']  then
          OpenShopMenu(rvalue, zone)
      --  else
       --   OpenBuyLicenseMenu(rvalue, zone)
        end
     
      --  else
       --   OpenBuyLicenseMenu(rvalue, zone)
       end,
    function(data, menu)
      menu.close()
    end
  )
end

function OpenBuyLicenseMenu(rvalue, zone)
  
  local price = 0
  
  local wtype = nil

  if rvalue == 'wl_1' then
    price = LicensePrice * 1
    wtype = 'weapon1'
  elseif rvalue == 'wl_2' then
    price = LicensePrice * 2
    wtype = 'weapon2'
  elseif rvalue == 'wl_3' then
    price = LicensePrice * 3
    wtype = 'weapon3'
  end

  ESX.UI.Menu.CloseAll()

  ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'shop_license',
    {
      title = _U('buy_license'),
      elements = {
        { label = _U('yes') .. ' ($' .. price .. ')', value = 'yes' },
        { label = _U('no'), value = 'no' },
      }
    },
    function (data, menu)
      if data.current.value == 'yes' then
        TriggerServerEvent('esx_weashop2:buyLicense', price, wtype)
      end
      menu.close()
    end,
    function (data, menu)
      menu.close()
    end
  )

end

function OpenShopMenu(rvalue, zone)
  local elements = {}

  if rvalue == "wl_1" then
    for i=1, #Config.Zones[zone].Items, 1 do

      local item = Config.Zones[zone].Items[i]
  
      table.insert(elements, {
        label     = item.label .. ' - <span style="color:green;">$' .. item.price .. ' </span>',
        realLabel = item.label,
        value     = item.name,
        price     = item.price
      })
  
    end
  
  
    ESX.UI.Menu.CloseAll()
  
    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'shop',
      {
        title  = _U('shop'),
        elements = elements
      },
      function(data, menu)
        TriggerServerEvent('esx_weashop2:buyItem', data.current.value, data.current.price, zone)
      end,
      function(data, menu)
  
        menu.close()
  
        CurrentAction     = 'shop_menu'
        CurrentActionMsg  = _U('shop_menu')
        CurrentActionData = {zone = zone}
      end
    )
  elseif rvalue == "wl_2" then
    for i=1, #Config.Zones[zone].Items1, 1 do

      local item = Config.Zones[zone].Items1[i]
  
      table.insert(elements, {
        label     = item.label .. ' - <span style="color:green;">$' .. item.price .. ' </span>',
        realLabel = item.label,
        value     = item.name,
        price     = item.price
      })
  
    end
  
  
    ESX.UI.Menu.CloseAll()
  
    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'shop',
      {
        title  = _U('shop'),
        elements = elements
      },
      function(data, menu)
        TriggerServerEvent('esx_weashop2:buyItem', data.current.value, data.current.price, zone)
      end,
      function(data, menu)
  
        menu.close()
  
        CurrentAction     = 'shop_menu'
        CurrentActionMsg  = _U('shop_menu')
        CurrentActionData = {zone = zone}
      end
    )
  elseif rvalue == "wl_3" then
    for i=1, #Config.Zones[zone].Items2, 1 do

      local item = Config.Zones[zone].Items2[i]
  
      table.insert(elements, {
        label     = item.label .. ' - <span style="color:green;">$' .. item.price .. ' </span>',
        realLabel = item.label,
        value     = item.name,
        price     = item.price
      })
  
    end
  
  
    ESX.UI.Menu.CloseAll()
  
    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'shop',
      {
        title  = _U('shop'),
        elements = elements
      },
      function(data, menu)
        TriggerServerEvent('esx_weashop2:buyItem', data.current.value, data.current.price, zone)
      end,
      function(data, menu)
  
        menu.close()
  
        CurrentAction     = 'shop_menu'
        CurrentActionMsg  = _U('shop_menu')
        CurrentActionData = {zone = zone}
      end
    )
  end
end

AddEventHandler('esx_weashop2:hasEnteredMarker', function(zone)

  CurrentAction     = 'shop_menu'
  CurrentActionMsg  = _U('shop_menu')
  CurrentActionData = {zone = zone}

end)

AddEventHandler('esx_weashop2:hasExitedMarker', function(zone)

  CurrentAction = nil
  ESX.UI.Menu.CloseAll()

end)

-- Create Blips


-- Display markers
Citizen.CreateThread(function()
  while true do
    Wait(0)
    local coords = GetEntityCoords(GetPlayerPed(-1))
    for k,v in pairs(Config.Zones) do
      for i = 1, #v.Pos, 1 do
        if(Config.Type ~= -1 and GetDistanceBetweenCoords(coords, v.Pos[i].x, v.Pos[i].y, v.Pos[i].z, true) < Config.DrawDistance) then
          DrawMarker(Config.Type, v.Pos[i].x, v.Pos[i].y, v.Pos[i].z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.Size.x, Config.Size.y, Config.Size.z, Config.Color.r, Config.Color.g, Config.Color.b, 100, false, true, 2, false, false, false, false)
        end
      end
    end
  end
end)

-- Enter / Exit marker events
Citizen.CreateThread(function()
  while true do
    Wait(0)
    local coords      = GetEntityCoords(GetPlayerPed(-1))
    local isInMarker  = false
    local currentZone = nil

    for k,v in pairs(Config.Zones) do
      for i = 1, #v.Pos, 1 do
        if(GetDistanceBetweenCoords(coords, v.Pos[i].x, v.Pos[i].y, v.Pos[i].z, true) < Config.Size.x) then
          isInMarker  = true
          ShopItems   = v.Items
          currentZone = k
          LastZone    = k
        end
      end
    end
    if isInMarker and not HasAlreadyEnteredMarker then
      HasAlreadyEnteredMarker = true
      TriggerEvent('esx_weashop2:hasEnteredMarker', currentZone)
    end
    if not isInMarker and HasAlreadyEnteredMarker then
      HasAlreadyEnteredMarker = false
      TriggerEvent('esx_weashop2:hasExitedMarker', LastZone)
    end
  end
end)

-- Key Controls
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    if CurrentAction ~= nil then

      SetTextComponentFormat('STRING')
      AddTextComponentString(CurrentActionMsg)
      DisplayHelpTextFromStringLabel(0, 0, 1, -1)

      if IsControlJustReleased(0, 38) then
        if CurrentAction == 'shop_menu' then
            OpenMainMenu(CurrentActionData.zone)
        end
        CurrentAction = nil
      end
    end
  end
end)