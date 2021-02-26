Config                            = {}

Config.DrawDistance               = 30.0
Config.MarkerType                 = 1
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 0.5 }
Config.MarkerColor                = { r = 50, g = 50, b = 204 }
Config.EnableArmoryManagement     = true

Config.EnableJobLogs              = false


Config.Locale                     = 'fr'
Config.securitasStations = {

	LSPD = {


		Armories = {
			vector3(-144.20, -572.98 , 32.42)
		},

		Cloakrooms = {
			vector3(-142.08 , -574.08 , 32.42)
		},


		Vehicles = {
			{
				Spawner = vector3(-148.22 , -581.07 , 32.42),
				InsideShop = vector3(-146.44, -585.80, 31.90),
				SpawnPoints = {
					{ coords = vector3(-146.44, -585.80, 31.90), heading = 162.17, radius = 6.0 }
				}
			}
		}

	

	}

}



Config.AuthorizedVehicles = {
	Shared = {
	--	{ model = 'guardian', label = 'Guardian', price = 20000 }
	},
	
	new = {
		{ model = 'sultan', label = 'Sultan', price = 25000 },
			{ model = 'sultanrs', label = 'Sultan RS', price = 220000 }
	},
	ssap = {
		{ model = 'riata', label = 'Riata', price = 10000 }
	},
	ssdeap = {
		{ model = 'riata', label = 'Riata', price = 10000 }
	},
	ssap = {
		{ model = 'riata', label = 'Riata', price = 10000 }
	},
	boss = {
		{ model = 'riata', label = 'Riata', price = 10000 }
	}


	
}


Config.Uniforms = {
	recruit_wear = {
		male = {
			['tshirt_1'] = 36,  ['tshirt_2'] = 0,
			['torso_1'] = 102,   ['torso_2'] = 2,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 31,
			['pants_1'] = 24,   ['pants_2'] = 0,
			['shoes_1'] = 10,   ['shoes_2'] = 0,
		--	['helmet_1'] = 46,  ['helmet_2'] = 0,
			['chain_1'] = 27,    ['chain_2'] = 2,
			['bags_1'] = 45,
			['ears_1'] = 0,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 36,  ['tshirt_2'] = 1,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = 45,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},









	}