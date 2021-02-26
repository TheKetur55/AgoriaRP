Config                            = {}

Config.DrawDistance               = 100.0
Config.MarkerType                 = 1
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 0.5 }
Config.MarkerColor                = { r = 50, g = 50, b = 204 }
Config.EnableArmoryManagement     = true
Config.EnablePlayerManagement     = true
Config.EnableJobLogs              = true


Config.Locale                     = 'fr'
Config.tabacStations = {

	LSPD = {





		Vehicles = {
			{
				Spawner = vector3(1983.30, 3044.71, 47.05),
				InsideShop = vector3(1980.58, 3037.70, 46.80),
				SpawnPoints = {
					{ coords = vector3(1980.58, 3037.70, 46.80), heading = 56.82, radius = 6.0 }
				}
			}
		},
		BossActions = {
			vector3(1994.60, 3046.61, 47.20)
		}

	

	}

}



Config.AuthorizedVehicles = {
	Shared = {

	},
	employer = {
		{ model = 'burrito3', label = 'Burrito', price = 10000 }
	},

	boss = {
		{ model = 'burrito3', label = 'Burrito', price = 10000 }
	}


	
}
