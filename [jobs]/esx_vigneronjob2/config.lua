Config                            = {}

Config.DrawDistance               = 100.0
Config.MarkerType                 = 1
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 0.5 }
Config.MarkerColor                = { r = 50, g = 50, b = 204 }
Config.EnableArmoryManagement     = true

Config.EnableJobLogs              = true


Config.Locale                     = 'fr'
Config.vigneStations = {

	LSPD = {


		Armories = {
			vector3(-1924.25, 2047.63, 140.73)
		},

--		Cloakrooms = {
--			vector3(452.6, -992.8, 99.6)
--		},


		Vehicles = {
			{
				Spawner = vector3(-1886.67, 2049.94, 140.90),
				InsideShop = vector3(228.5, -993.5, -99.5),
				SpawnPoints = {
					{ coords = vector3(-1890.64, 2047.17, 139.50), heading = 67.55, radius = 6.0 }
				}
			}
		}

	

	}

}



Config.AuthorizedVehicles = {
	Shared = {
		{ model = 'guardian', label = 'Guardian', price = 20000 }
	},
	recrue = {
		{ model = 'riata', label = 'Riata', price = 10000 }
	},
	novice = {
		{ model = 'riata', label = 'Riata', price = 10000 }
	},
	cdisenior = {
		{ model = 'riata', label = 'Riata', price = 10000 }
	},
	boss = {
		{ model = 'riata', label = 'Riata', price = 10000 }
	}


	
}


Config.Uniforms = {
	recruit_wear = {
		male = {
			['tshirt_1'] = 59,  ['tshirt_2'] = 1,
			['torso_1'] = 55,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 41,
			['pants_1'] = 25,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = 46,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
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

swat_wear = { -- currently the same as chef_wear
		male = {
		
			['tshirt_1'] = 129,  ['tshirt_2'] = 0,
			['torso_1'] = 53,   ['torso_2'] = 0,
			['decals_1'] = -1,   ['decals_2'] = 0,
			['arms'] = 33,
			['pants_1'] = 33,   ['pants_2'] = 0,
			['shoes_1'] = 24,   ['shoes_2'] = 0,
			['helmet_1'] = 124,  ['helmet_2'] = 15,
		--	['mask_1'] = 52,  ['mask_2'] = 0,
		--	['bproof_1'] = 16,  ['bproof_2'] = 2,
		--	['bag'] = 45,   
	
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 5,
			['glasses_1'] = -1,     ['glasses_2'] = 0


		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 3,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},








	}