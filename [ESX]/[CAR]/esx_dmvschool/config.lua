Config                 = {}
Config.DrawDistance    = 100.0
Config.MaxErrors       = 5
Config.SpeedMultiplier = 3.6
Config.Locale          = 'fr'

Config.Prices = {
	dmv         = 2000,
	drive       = 3500,
	drive_bike  = 3000,
	drive_truck = 6000
}

Config.VehicleModels = {
	drive       = 'issi2',
	drive_bike  = 'defiler',
	drive_truck = 'mule3'
}

Config.SpeedLimits = {
	residence = 40,
	town      = 80,
	freeway   = 150
}

Config.Zones = {

	DMVSchool = {
		Pos   = {x = 239.471, y = -1380.960, z = 32.741},
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1
	},

	VehicleSpawnPoint = {
		Pos   = {x = 274.80, y = -1349.21, z = 31.16, h = 141.0},
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = -1
	}

}

Config.CheckPoints = {

--	{
--		Pos = {x = 255.139, y = -1400.731, z = 29.537},
--		Action = function(playerPed, vehicle, setCurrentZoneType)
--			DrawMissionText(_U('next_point_speed', Config.SpeedLimits['residence']), 5000)
--		end
--	},

	--{
--		Pos = {x = 271.874, y = -1370.574, z = 30.932},
--		Action = function(playerPed, vehicle, setCurrentZoneType)
--			DrawMissionText(_U('go_next_point'), 5000)
--		end
--	},


{
		Pos = {x = 267.96, y = -1353.49, z = 30.44},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			DrawMissionText(_U('next_point_speed', Config.SpeedLimits['residence']), 5000)
		end
	},


	{
		Pos = {x = 234.907, y = -1345.385, z = 29.542},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			Citizen.CreateThread(function()
				DrawMissionText(_U('stop_for_ped'), 5000)
				PlaySound(-1, 'RACE_PLACED', 'HUD_AWARDS', false, 0, true)
				FreezeEntityPosition(vehicle, true)
				Citizen.Wait(4000)
				DrawMissionText(_U('good_lets_cont'), 2000)
				FreezeEntityPosition(vehicle, false)
				Citizen.Wait(2000)
				DrawMissionText(_U('next_point_speed', Config.SpeedLimits['residence']), 5000)
			end)
		end
	},

	{
		Pos = {x = 217.821, y = -1410.520, z = 28.292},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			setCurrentZoneType('town')

			Citizen.CreateThread(function()
				DrawMissionText(_U('stop_look_left', Config.SpeedLimits['town']), 5000)
				PlaySound(-1, 'RACE_PLACED', 'HUD_AWARDS', false, 0, true)
				FreezeEntityPosition(vehicle, true)
				Citizen.Wait(6000)

				FreezeEntityPosition(vehicle, false)
				DrawMissionText(_U('good_turn_right'), 5000)
			end)
		end
	},

	{
		Pos = {x = 178.550, y = -1401.755, z = 27.725},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			DrawMissionText(_U('watch_traffic_lightson'), 5000)
		end
	},

	{
		Pos = {x = 117.92, y = -1357.75, z = 28.51},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			DrawMissionText(_U('go_next_point'), 5000)
		end
	},



	{
		Pos = {x = 67.04, y = -1184.08, z = 27.87},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			DrawMissionText(_U('stop_for_passing'), 5000)
			PlaySound(-1, 'RACE_PLACED', 'HUD_AWARDS', false, 0, true)
			FreezeEntityPosition(vehicle, true)
			Citizen.Wait(6000)
			FreezeEntityPosition(vehicle, false)
		end
	},



	{
		Pos = {x = -117.42, y = -1179.98, z = 36.54},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			setCurrentZoneType('freeway')

			DrawMissionText(_U('hway_time', Config.SpeedLimits['freeway']), 5000)
			PlaySound(-1, 'RACE_PLACED', 'HUD_AWARDS', false, 0, true)
		end
		
	},

	{
		Pos = {x = -393.74, y = -600.45, z = 31.76,},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			DrawMissionText(_U('go_next_point'), 5000)
		end
	},


	{
		Pos = {x = -430.68, y = -481.59, z = 31.77},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			DrawMissionText(_U('go_next_point'), 5000)
		end
	},


	{
		Pos = {x = -611.63, y = -476.48, z = 33.26},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			setCurrentZoneType('town')
			DrawMissionText(_U('in_town_speed', Config.SpeedLimits['town']), 5000)
		end
	},


	{
		Pos = {x = -620.79, y = -393.10, z = 33.27},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			DrawMissionText(_U('go_next_point'), 5000)
		end
	},


	{
		Pos = {x = -222.43, y = -438.79, z = 30.33},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			DrawMissionText(_U('go_next_point'), 5000)
		end
	},

	{
		Pos = {x = -282.17, y = -833.50, z = 30.22},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			DrawMissionText(_U('go_next_point'), 5000)
		end
	},

	{
		Pos = {x = 75.96, y = -1000.28, z = 27.88},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			DrawMissionText(_U('go_next_point'), 5000)
		end
	},

{
		Pos = {x = 221.06, y = -1439.60, z = 27.89},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			DrawMissionText(_U('go_next_point'), 5000)
		end
	},


{
		Pos = {x = 279.31, y = -1376.69, z = 30.49},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			setCurrentZoneType('residence')
			DrawMissionText(_U('in_town_speed', Config.SpeedLimits['residence']), 5000)
		end
	},



	{
		Pos = {x = 273.50, y = -1348.68, z = 30.49},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			ESX.Game.DeleteVehicle(vehicle)
		end
	}



}
