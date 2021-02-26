Config                = {}
Config.DrawDistance   = 100
Config.Size           = { x = 1.5, y = 1.5, z = 1.5 }
Config.Color          = { r = 0, g = 128, b = 255 }
Config.Type           = 30
Config.Locale         = 'fr'
Config.EnableLicense  = true
Config.LicensePrice   = 0000

Config.Zones = {

    GunShop = {
        legal = 0,
        Items = {
        --	{name  = "clip", price = 0, label = "Chargeur"}, 

            {name  = "WEAPON_PISTOL", price = 12500, label = "Pistol"}, 
          --  {name  = "WEAPON_PISTOL_MK2", price = 0, label = "Pistol MkII"}, 
            {name  = "WEAPON_SNSPISTOL", price = 18000, label = "SNS Pistol"}, 
         --   {name  = "WEAPON_VINTAGEPISTOL", price = 0, label = "Vintage Pistol"}, 
            {name  = "WEAPON_MARKSMANPISTOL", price = 22000, label = "Marksman Pistol"}, 
            {name  = "WEAPON_REVOLVER", price = 28000, label = "Heavy Revolver"}, 
            {name  = "WEAPON_MUSKET", price = 35000, label = "Musket"}, 


		    
        },
        Items1 = {
            
        },
        Items2 = {
            
        },
        Pos   = {
            { x = 22.09,      y = -1107.28,   z = 28.80 },

        }
    },

    BlackWeashop = {
        legal = 0,
        Items = {
        		{name  = "WEAPON_APPISTOL", price = 41000, label = "Raffica"},
        		{name  = "WEAPON_APPISTOL", price = 41000, label = "Raffica"}




        },
        Pos   = {

           -- { x = 931.19,   y = -3202.52,  z = 4.90 },
        }
    },

}
