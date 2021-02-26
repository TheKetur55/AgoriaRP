Config								= {}
Config.Locale 				= 'fr'
Config.DrawDistance		= 25.0

Config.DistanceHarvesting	= 1000
Config.PoliceNeeded				= 1
Config.PayeType = 3 -- [1 = Cash , 2 = Banque , 3 = Argent Sale]

Config.Zones = {

  Recolte = {
		Pos   = {x = -196.25, y = -2679.87, z = 4.70},
		Size  = {x = 8.0, y = 8.0, z = 0.6},
		Color = {r = 204, g = 204, b = 0},
		Type  = -1
	},

  Vente = {
		Pos   = {x = -1596.68, y = -448.90, z = 36.20},
		Size  = {x = 3.5, y = 3.5, z = 0.6},
		Color = {r = 204, g = 204, b = 0},
		Type  = -1
	}

}

Config.Uniforms = {
    
  GADGET_HAZMAT1 = {
    male = {
			['tshirt_1'] 	= 62, ['tshirt_2'] 	= 3,
			['torso_1'] 	= 67, ['torso_2'] 	= 3,
			['decals_1'] 	= 0,  ['decals_2'] 	= 0,
			['mask_1'] 		= 46, ['mask_2'] 	= 0,
			['arms'] 		= 86,
			['pants_1'] 	= 40, ['pants_2'] 	= 3,
			['shoes_1'] 	= 25, ['shoes_2'] 	= 0,
			['helmet_1'] 	= -1, ['helmet_2'] 	= 0,
			['chain_1'] 	= -1, ['chain_2'] 	= 0,
      		['ears_1'] 		= -1, ['ears_2'] 	= 0,
			['bags_1']		= 44, ['bags_2']	= 0,
			['bproof_1'] 	= 0,  ['bproof_2'] 	= 0
    },
    female = {
			['tshirt_1'] 	= 43, ['tshirt_2'] 	= 3,
			['torso_1'] 	= 61, ['torso_2'] 	= 3,
			['decals_1'] 	= 0,  ['decals_2'] 	= 0,
			['mask_1'] 		= 46, ['mask_2'] 	= 0,
			['arms'] 		= 101,
			['pants_1'] 	= 40, ['pants_2'] 	= 3,
			['shoes_1'] 	= 25, ['shoes_2'] 	= 0,
			['helmet_1'] 	= -1, ['helmet_2'] 	= 0,
			['chain_1'] 	= -1, ['chain_2'] 	= 0,
     		['ears_1'] 		= -1, ['ears_2'] 	= 0,
			['bags_1']		= 44, ['bags_2']	= 0,
			['bproof_1'] 	= 0,  ['bproof_2'] 	= 0
    }
  },

  GADGET_HAZMAT2 = {
    male = {
			['tshirt_1'] 	= 62, ['tshirt_2'] 	= 0,
			['torso_1'] 	= 67, ['torso_2'] 	= 0,
			['decals_1'] 	= 0,  ['decals_2'] 	= 0,
			['mask_1'] 		= 46, ['mask_2'] 	= 0,
			['arms'] 		= 86, ['arms_2'] 		= 1,
			['pants_1'] 	= 40, ['pants_2'] 	= 0,
			['shoes_1'] 	= 25, ['shoes_2'] 	= 0,
			['helmet_1'] 	= -1, ['helmet_2'] 	= 0,
			['chain_1'] 	= -1, ['chain_2'] 	= 0,
      		['ears_1'] 		= -1, ['ears_2'] 	= 0,
			['bags_1']		= 44, ['bags_2']	= 0,
			['bproof_1'] 	= 0,  ['bproof_2'] 	= 0
    },
    female = {
			['tshirt_1'] 	= 43, ['tshirt_2'] 	= 3,
			['torso_1'] 	= 61, ['torso_2'] 	= 3,
			['decals_1'] 	= 0,  ['decals_2'] 	= 0,
			['mask_1'] 		= 46, ['mask_2'] 	= 0,
			['arms'] 		= 101,
			['pants_1'] 	= 40, ['pants_2'] 	= 3,
			['shoes_1'] 	= 25, ['shoes_2'] 	= 0,
			['helmet_1'] 	= -1, ['helmet_2'] 	= 0,
			['chain_1'] 	= -1, ['chain_2'] 	= 0,
     		['ears_1'] 		= -1, ['ears_2'] 	= 0,
			['bags_1']		= 44, ['bags_2']	= 0,
			['bproof_1'] 	= 0,  ['bproof_2'] 	= 0
    }
  }

}