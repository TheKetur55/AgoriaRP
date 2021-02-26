Config                            = {}

Config.DrawDistance               = 100.0
Config.MarkerType                 = 1
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 0.5 }
Config.MarkerColor                = { r = 50, g = 50, b = 204 }

Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = true -- enable if you're using esx_identity
Config.EnableNonFreemodePeds      = false -- turn this on if you want custom peds
Config.EnableLicenses             = true -- enable if you're using esx_license
Config.EnableJobLogs              = true

Config.EnableHandcuffTimer        = false -- enable handcuff timer? will unrestrain player after the time ends
Config.HandcuffTimer              = 10 * 60000 -- 10 mins

Config.EnableJobBlip              = false -- enable blips for colleagues, requires esx_society

Config.MaxInService               = -1
Config.Locale                     = 'fr'
Config.realestateagentStations = {

	LSPD = {

		--[[Blip = {
			Coords  = vector3(425.1, -979.5, 30.7),
			Sprite  = 60,
			Display = 4,
			Scale   = 1.2,
			Colour  = 29
		},
		--[[Cloakrooms = {
			vector3(452.6, -992.8, 30.6)
		},

		Armories = {
			vector3(-1910.74, -573.80, 21.80)
		},
]]
		Vehicles = {
			{
				Spawner = vector3(-1905.17, -560.86, 11.80),
				InsideShop = vector3(-1900.08, -560.82, 10.50),
				SpawnPoints = {
					{ coords = vector3(-1900.08, -560.82, 10.50), heading = 320.82, radius = 6.0 }
				}
			}
		}

		--[[Helicopters = {
			{
				Spawner = vector3(461.1, -981.5, 43.6),
				InsideShop = vector3(477.0, -1106.4, 43.0),
				SpawnPoints = {
					{ coords = vector3(449.5, -981.2, 43.6), heading = 92.6, radius = 10.0 }
				}
			}
		},

		BossActions = {
			vector3(448.4, -973.2, 30.6)
		}]]

	}

}



Config.AuthorizedVehicles = {
	Shared = {
		
	},
	employer = {
		{ model = 'tailgater', label = 'Tailgater', price = 8000 }
	},
	boss = {
		{ model = 'tailgater', label = 'Tailgater', price = 8000 },
		{ model = 'schafter3', label = 'Schafter V12', price = 40000 }
	}


	
}
