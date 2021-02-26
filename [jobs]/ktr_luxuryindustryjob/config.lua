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
				Spawner = vector3(-2188.49, -427.12, 13.50),
				InsideShop = vector3(-2183.06, -420.69, 13.10),
				SpawnPoints = {
					{ coords = vector3(-2183.06, -420.69, 13.10), heading = 353.45, radius = 6.0 }
				}
			}
		},
		BossActions = {
			vector3(-2195.04, -436.96, 13.50)
		},
		

	

	}

}



Config.AuthorizedVehicles = {
	Shared = {

	},
	
	employer = {
		{ model = 'granger', label = 'Granger', price = 24000 },
		{ model = 'sadler', label = 'Sadler', price = 27500 }
	},

	boss = {
		{ model = 'granger', label = 'Granger', price = 24000 },
		{ model = 'sadler', label = 'Sadler', price = 27500 }
	}


	
}
