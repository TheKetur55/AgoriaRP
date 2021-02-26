Config                            = {}
Config.DrawDistance               = 100.0

Config.EnablePlayerManagement     = true
Config.EnableSocietyOwnedVehicles = false
Config.EnableVaultManagement      = true
Config.EnableHelicopters          = false
Config.EnableMoneyWash            = true
Config.MaxInService               = -1
Config.Locale                     = 'fr'

Config.MissCraft                  = 10 -- %


Config.AuthorizedVehicles = {
    { name = 'rentalbus',  label = 'Vanilla nightclub Bus' },
}
--[[
Config.Blips = {
    
    Blip = {
      Pos     = { x = 129.246, y = -1299.363, z = 29.501 },
      Sprite  = 121,
      Display = 4,
      Scale   = 1.2,
      Colour  = 27,
    },

}]]

Config.Zones = {
--[[
    Cloakrooms = {
        Pos   = { x = -1581.47, y = -3006.73, z = -77.00 },
        Size  = { x = 1.5, y = 1.5, z = 1.0 },
        Color = { r = 255, g = 187, b = 255 },
        Type  = 27,
    },]]



    BossActions = {
		Pos   = { x = -1619.36, y = -3011.13, z = -76.20 },
        Size  = { x = 1.5, y = 1.5, z = 1.0 },
        Color = { r = 0, g = 100, b = 0 },
        Type  = 1,
    },

}




-- CHECK SKINCHANGER CLIENT MAIN.LUA for matching elements

Config.Uniforms = {
	barman_tenu = {
		male = {
			 ['tshirt_1'] = 22,  ['tshirt_2'] = 4,
        ['torso_1'] = 11,   ['torso_2'] = 1,
        ['decals_1'] = 0,   ['decals_2'] = 0,
        ['arms'] = 4,
        ['pants_1'] = 10,   ['pants_2'] = 0,
        ['shoes_1'] = 10,   ['shoes_2'] = 0,
        ['chain_1'] = 0,  ['chain_2'] = 0
		},
		female = {
			 ['tshirt_1'] = 14,   ['tshirt_2'] = 0,
        ['torso_1'] = 105,   ['torso_2'] = 2,
        ['decals_1'] = 0,   ['decals_2'] = 0,
        ['arms'] = 4,
        ['pants_1'] = 44,   ['pants_2'] = 2,
        ['shoes_1'] = 6,   ['shoes_2'] = 0,
        ['chain_1'] = 0,    ['chain_2'] = 0
		}
	},

vigil_tenu = { -- currently the same as chef_wear
		male = {
		
			 ['tshirt_1'] = 31,  ['tshirt_2'] = 2,
        ['torso_1'] = 4,   ['torso_2'] = 0,
        ['decals_1'] = 0,   ['decals_2'] = 0,
        ['arms'] = 22,
        ['pants_1'] = 10,   ['pants_2'] = 0,
        ['shoes_1'] = 10,   ['shoes_2'] = 0,
        ['chain_1'] = 0,  ['chain_2'] = 0,
		['ears_1'] = 1,     ['ears_2'] = 0


		},
		female = {
		['tshirt_1'] = 38,   ['tshirt_2'] = 2,
        ['torso_1'] = 57,   ['torso_2'] = 0,
        ['decals_1'] = 0,   ['decals_2'] = 0,
        ['arms'] = 26,
        ['pants_1'] = 52,   ['pants_2'] = 2,
        ['shoes_1'] = 29,   ['shoes_2'] = 0,
        ['chain_1'] = 0,    ['chain_2'] = 0,
		['ears_1'] = 1,     ['ears_2'] = 0,
		}
	},

danse1_tenu = { -- currently the same as chef_wear
		male = {
		
		 ['tshirt_1'] = 14,   ['tshirt_2'] = 0,
        ['torso_1'] = 22,   ['torso_2'] = 1,
        ['decals_1'] = 0,   ['decals_2'] = 0,
        ['arms'] = 15,
        ['pants_1'] = 20,   ['pants_2'] = 1,
        ['shoes_1'] = 42,   ['shoes_2'] = 0,
        ['chain_1'] = 23,    ['chain_2'] = 0


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

	danse2_tenu = { -- currently the same as chef_wear
		male = {
		
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
        ['torso_1'] = 91,   ['torso_2'] = 0,
        ['decals_1'] = 0,   ['decals_2'] = 0,
        ['arms'] = 15,
        ['pants_1'] = 21,   ['pants_2'] = 0,
        ['shoes_1'] = 34,   ['shoes_2'] = 0,
        ['chain_1'] = 11,  ['chain_2'] = 0


		},
		female = {
		 ['tshirt_1'] = 14,   ['tshirt_2'] = 0,
        ['torso_1'] = 15,   ['torso_2'] = 2,
        ['decals_1'] = 0,   ['decals_2'] = 0,
        ['arms'] = 15,
        ['pants_1'] = 17,   ['pants_2'] = 1,
        ['shoes_1'] = 35,   ['shoes_2'] = 0,
        ['chain_1'] = 0,    ['chain_2'] = 0
		}
	},

	flic_tenu = { -- currently the same as chef_wear
		male = {
		
		 ['tshirt_1'] = 14,   ['tshirt_2'] = 2,
        ['torso_1'] = 168,   ['torso_2'] = 1,
        ['decals_1'] = 0,   ['decals_2'] = 0,
        ['arms'] = 15,
        ['pants_1'] = 19,   ['pants_2'] = 2,
        ['shoes_1'] = 24,   ['shoes_2'] = 0,
        ['chain_1'] = 20,    ['chain_2'] = 0


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