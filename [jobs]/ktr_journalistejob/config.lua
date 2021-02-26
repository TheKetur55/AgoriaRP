Config                            = {}

Config.DrawDistance               = 100.0
Config.MarkerType                 = 1
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 0.5 }
Config.MarkerColor                = { r = 50, g = 50, b = 204 }
Config.EnableArmoryManagement     = true
Config.EnablePlayerManagement     = true
Config.EnableJobLogs              = true


Config.Locale                     = 'fr'
Config.journalisteStations = {

	LSPD = {





		Vehicles = {
			{
				Spawner = vector3(-1098.65, -252.19, 37.95),
				InsideShop = vector3(-1099.80, -258.91, 37.65),
				SpawnPoints = {
					{ coords = vector3(-1099.80, -258.91, 37.65), heading = 159.07, radius = 6.0 }
				}
			}
		},
		BossActions = {
			vector3(-1051.81, -232.19, 43.02)
		}

	

	}

}



Config.AuthorizedVehicles = {
	Shared = {

	},
	employer = {
		{ model = 'rumpo', label = 'Rumpo', price = 10000 }
	},

	boss = {
		{ model = 'rumpo', label = 'Rumpo', price = 10000 }
	}


	
}
