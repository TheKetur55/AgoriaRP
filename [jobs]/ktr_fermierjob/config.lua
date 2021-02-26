Config                            = {}

Config.DrawDistance               = 100.0
Config.MarkerType                 = 1
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 0.5 }
Config.MarkerColor                = { r = 50, g = 50, b = 204 }
Config.EnableArmoryManagement     = true
Config.EnablePlayerManagement     = true
Config.EnableJobLogs              = true


Config.Locale                     = 'fr'
Config.vigneStations = {

	LSPD = {





		Vehicles = {
			{
				Spawner = vector3(-1163.382, -890.996, 14.138),
				InsideShop = vector3(-1170.460, -891.572, 12.952),
				SpawnPoints = {
					{ coords = vector3(-1170.460, -891.572, 12.952), heading = 31.800, radius = 6.0 }
				}
			}
		},
		BossActions = {
			vector3(-1195.358, -900.458, 13.995)
		},
		BossActions2 = {
			vector3(-1195.358, -900.458, -113.995)
		}

	

	}

}



Config.AuthorizedVehicles = {
	Shared = {

	},
	chef = {
		{ model = 'tractor2', label = 'Tracteur', price = 7500 },
		{ model = 'taco', label = 'Food Truck', price = 10000 },
		{ model = 'bison', label = 'Bison', price = 10000 }
	},
	employer = {
		{ model = 'tractor2', label = 'Tracteur', price = 10000 },
		{ model = 'bison', label = 'Bison', price = 10000 }
	},

	boss = {
		{ model = 'tractor2', label = 'Tracteur', price = 7500 },
		{ model = 'taco', label = 'Food Truck', price = 10000 },
		{ model = 'bison', label = 'Bison', price = 10000 }
	}


	
}
