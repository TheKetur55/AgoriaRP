Config                            = {}

Config.DrawDistance               = 100.0

Config.Marker                     = { type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false }

Config.ReviveReward               = 0  -- revive reward, set to 0 if you don't want it enabled
Config.AntiCombatLog              = true -- enable anti-combat logging?
Config.LoadIpl                    = false -- disable if you're using fivem-ipl or other IPL loaders

Config.Locale                     = 'fr'

local second = 1000
local minute = 60 * second

Config.EarlyRespawnTimer          = 7 * minute  -- Time til respawn is available
Config.BleedoutTimer              = 15 * minute -- Time til the player bleeds out

Config.EnablePlayerManagement     = true

Config.RemoveWeaponsAfterRPDeath  = false
Config.RemoveCashAfterRPDeath     = false
Config.RemoveItemsAfterRPDeath    = false

-- Let the player pay for respawning early, only if he can afford it.
Config.EarlyRespawnFine           = true
Config.EarlyRespawnFineAmount     = 6000
Config.EarlyRespawnFineAmount     = 12000



Config.RespawnPoint = { coords = vector3(291.65, -582.18, 52.20), heading = 70.12 }

Config.Hospitals = {

	CentralLosSantos = {

		Blip = {
			coords = vector3(294.50, -605.38, 43.32),
			sprite = 61,
			scale  = 1.2,
			color  = 48
		},

		AmbulanceActions = {
			vector3(284.75, -590.34, 48.74)
		},

	--	Pharmacies = {
	--		vector3(230.1, -1366.1, 38.5)
	--	},

		Vehicles = {
			{
				Spawner = vector3(292.71, -599.63, 43.30),
				InsideShop = vector3(290.83, -595.79, 42.20),
				Marker = { type = 36, x = 1.0, y = 1.0, z = 1.0, r = 100, g = 50, b = 200, a = 100, rotate = true },
				SpawnPoints = {
					{ coords = vector3(290.83, -595.79, 42.20), heading = 342.73, radius = 4.0 }
				}
			}
		},

		Helicopters = {
			{
				Spawner = vector3(343.30, -585.64, 74.16),
				InsideShop = vector3(352.79, -586.95, 74.56),
				Marker = { type = 34, x = 1.5, y = 1.5, z = 1.5, r = 100, g = 150, b = 150, a = 100, rotate = true },
				SpawnPoints = {
					{ coords = vector3(352.79, -586.95, 74.56), heading = 212.11, radius = 10.0 }
				}
			}
		},



--[[
		FastTravels = {
			{
				From = vector3(294.7, -1448.1, 29.0),
				To = { coords = vector3(272.8, -1358.8, 23.5), heading = 0.0 },
				Marker = { type = 1, x = 2.0, y = 2.0, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false }
			},

			{
				From = vector3(275.3, -1361, 23.5),
				To = { coords = vector3(295.8, -1446.5, 28.9), heading = 0.0 },
				Marker = { type = 1, x = 2.0, y = 2.0, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false }
			},

			{
				From = vector3(247.3, -1371.5, 23.5),
				To = { coords = vector3(333.1, -1434.9, 45.5), heading = 138.6 },
				Marker = { type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false }
			},

			{
				From = vector3(335.5, -1432.0, 45.50),
				To = { coords = vector3(249.1, -1369.6, 23.5), heading = 0.0 },
				Marker = { type = 1, x = 2.0, y = 2.0, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false }
			},


			{
				From = vector3(234.5, -1373.7, 20.9),
				To = { coords = vector3(320.9, -1478.6, 28.8), heading = 0.0 },
				Marker = { type = 1, x = 1.5, y = 1.5, z = 1.0, r = 102, g = 0, b = 102, a = 100, rotate = false }
			},

			{
				From = vector3(317.9, -1476.1, 28.9),
				To = { coords = vector3(238.6, -1368.4, 23.5), heading = 0.0 },
				Marker = { type = 1, x = 1.5, y = 1.5, z = 1.0, r = 102, g = 0, b = 102, a = 100, rotate = false }
			}
		},

		FastTravelsPrompt = {
			{
				From = vector3(237.4, -1373.8, 26.0),
				To = { coords = vector3(251.9, -1363.3, 38.5), heading = 0.0 },
				Marker = { type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false },
				Prompt = _U('fast_travel')
			},

			{
				From = vector3(256.5, -1357.7, 36.0),
				To = { coords = vector3(235.4, -1372.8, 26.3), heading = 0.0 },
				Marker = { type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false },
				Prompt = _U('fast_travel')
			}
		}
		]]
	}
}

Config.AuthorizedVehicles = {
	ambulance = {

		{ model = 'ambulance', label = 'Ambulance', price = 6500}
	},

	interne = {

		{ model = 'ambulance', label = 'Ambulance', price = 6500}
	},

	doctor = {
	--	{ model = 'ambulance22', label = '4X4', price = 20000},
		{ model = 'ambulance', label = 'Ambulance', price = 6500}
	},

	chief_doctor = {
	--	{ model = 'ambulance22', label = '4X4', price = 20000},
		{ model = 'ambulance', label = 'Ambulance', price = 6500}
	},

	boss = {
	--	{ model = 'ambulance22', label = '4X4', price = 20000},
		{ model = 'ambulance', label = 'Ambulance', price = 6500}
	}

}

Config.AuthorizedHelicopters = {

	ambulance = {},

	interne = {
		{ model = 'polmav', label = 'Helicopter de secours', price = 80000 }
	},

	doctor = {
		{ model = 'polmav', label = 'Helicopter de secours', price = 80000 }
	},

	chief_doctor = {
		{ model = 'polmav', label = 'Helicopter de secours', price = 80000 }
	},

	boss = {
		{ model = 'polmav', label = 'Helicopter de secours', price = 80000 }
	}

}


Config.JobLocations = {
  {x = 293.476, y = -590.163, z = 42.7371},
  {x = 253.404, y = -375.86, z = 44.0819},
  {x = 120.808, y = -300.416, z = 45.1399},
  {x = -38.4132, y = -381.576, z = 38.3456},
  {x = -107.442, y = -614.377, z = 35.6703},
  {x = -252.292, y = -856.474, z = 30.5626},
  {x = -236.138, y = -988.382, z = 28.7749},
  {x = -276.989, y = -1061.18, z = 25.6853},
  {x = -576.451, y = -998.989, z = 21.785},
  {x = -602.798, y = -952.63, z = 21.6353},
  {x = -790.653, y = -961.855, z = 14.8932},
  {x = -912.588, y = -864.756, z = 15.0057},
  {x = -1069.77, y = -792.513, z = 18.8075},
  {x = -1306.94, y = -854.085, z = 15.0959},
  {x = -1468.51, y = -681.363, z = 26.178},
  {x = -1380.89, y = -452.7, z = 34.0843},
  {x = -1326.35, y = -394.81, z = 36.0632},
  {x = -1383.68, y = -269.985, z = 42.4878},
  {x = -1679.61, y = -457.339, z = 39.4048},
  {x = -1812.45, y = -416.917, z = 43.6734},
  {x = -2043.64, y = -268.291, z = 22.9927},
  {x = -2186.45, y = -421.595, z = 12.6776},
  {x = -1862.08, y = -586.528, z = 11.1747},
  {x = -1859.5, y = -617.563, z = 10.8788},
  {x = -1634.95, y = -988.302, z = 12.6241},
  {x = -1283.99, y = -1154.16, z = 5.30998},
  {x = -1126.47, y = -1338.08, z = 4.63434},
  {x = -867.907, y = -1159.67, z = 5.00795},
  {x = -847.55, y = -1141.38, z = 6.27591},
  {x = -722.625, y = -1144.6, z = 10.2176},
  {x = -575.503, y = -318.446, z = 34.5273},
  {x = -592.309, y = -224.853, z = 36.1209},
  {x = -559.594, y = -162.873, z = 37.7547},
  {x = -534.992, y = -65.6695, z = 40.634},
  {x = -758.234, y = -36.6906, z = 37.2911},
  {x = -1375.88, y = 20.9516, z = 53.2255},
  {x = -1320.25, y = -128.018, z = 48.097},
  {x = -1285.71, y = 294.287, z = 64.4619},
  {x = -1245.67, y = 386.533, z = 75.0908},
  {x = -760.355, y = 285.015, z = 85.0667},
  {x = -626.786, y = 254.146, z = 81.0964},
  {x = -563.609, y = 267.962, z = 82.5116},
  {x = -486.806, y = 271.977, z = 82.8187},
  {x = 88.295, y = 250.867, z = 108.188},
  {x = 234.087, y = 344.678, z = 105.018},
  {x = 434.963, y = 96.707, z = 99.1713},
  {x = 482.617, y = -142.533, z = 58.1936},
  {x = 762.651, y = -786.55, z = 25.8915},
  {x = 809.06, y = -1290.8, z = 25.7946},
  {x = 490.819, y = -1751.37, z = 28.0987},
  {x = 432.351, y = -1856.11, z = 27.0352},
  {x = 164.348, y = -1734.54, z = 28.8982},
  {x = -57.6909, y = -1501.4, z = 31.1084},
  {x = 52.2241, y = -1566.65, z = 29.006},
  {x = 295.44149780273,y = -1439.6423339844,z = 28.803928375244 },
  {x = 1165.1629638672,y = -1536.8948974609,z = 38.400791168213 },
  {x = 1827.8881835938,y = 3693.8835449219,z = 33.224269866943 },  
}
