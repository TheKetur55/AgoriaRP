Config                = {}
Config.DrawDistance   = 5
Config.Size           = { x = 1.5, y = 1.5, z = 1.5 }
Config.Color          = { r = 0, g = 128, b = 255 }
Config.Type           = 30
Config.Locale         = 'fr'
Config.EnableLicense  = false
Config.LicensePrice   = 500

Config.Zones = {

    GunShop = {
        legal = 0,
        Items = {
            {name  = "WEAPON_BAT", price = 1300, label = "Bat de baseball"},
            {name  = "WEAPON_FLASHLIGHT", price = 700, label = "Lampe de torche"},
            {name  = "WEAPON_GOLFCLUB", price = 900, label = "Club de golf"},
            {name  = "WEAPON_KNUCKLE", price = 1700, label = "Coup de poing américain"},
            {name  = "WEAPON_KNIFE", price = 7000, label = "Couteau"},
            {name  = "WEAPON_SWITCHBLADE", price = 10000, label = "Couteau papillon"},
            {name  = "WEAPON_FIREWORK", price = 15440, label = "Feu d'artifice"},
            {name  = "WEAPON_FLARE", price = 5500, label = "Torche fumigène"},
         --   {name  = "WEAPON_PETROLCAN", price = 800, label = "Jerrycan"},


		    
        },
        Items1 = {
           
        },
        Items2 = {
           
        },
        Pos   = {
            { x = 1693.19,      y = 3759.99,   z = 33.70 },
            { x = 252.44,      y = -50.12,   z = 68.94 },
            { x = 842.42,      y = -1033.93,   z = 27.19 },
            { x = -330.50,      y = 6084.07,   z = 30.45 },
            { x = -662.11,      y = -934.92,   z = 20.82 },
            { x = -1305.46,      y = -394.38,   z = 35.69 },
            { x = -1117.91,      y = 2698.88,   z = 17.55 },
            { x = 2567.73,      y = 294.00,   z = 107.73 },
            { x = -3172.32,      y = 1087.76,   z = 19.83 },

        }
    },

     BlackWeashop = {
        legal = 1,
        Items = {
                {name  = "WEAPON_DAGGER", price = 8500, label = "Poignard"},
                {name  = "WEAPON_MACHETE", price = 10000, label = "Machette"},
                {name  = "WEAPON_NIGHTSTICK", price = 4500, label = "Matraque"},
                {name  = "WEAPON_WRENCH", price = 2500, label = "Clé"},
                {name  = "WEAPON_PISTOL", price = 15000, label = "Pistolet"},
                {name  = "WEAPON_APPISTOL", price = 44000, label = "Pistolet automatique"},
                {name  = "WEAPON_HEAVYPISTOL", price = 40550, label = "Pistolet lourd"},
                 {name  = "WEAPON_REVOLVER", price = 50550, label = "Pistolet revolver"},
                  {name  = "WEAPON_DOUBLEACTION", price = 52500, label = "Pistolet double revolver"},
                {name  = "WEAPON_MICROSMG", price = 90500, label = "Micro smg"},

                {name  = "WEAPON_MACHINEPISTOL", price = 100000, label = "Pistolet mitrailleur"},
                {name  = "WEAPON_MINISMG", price = 90000, label = "Mini smg"},
                 
                {name  = "WEAPON_PUMPSHOTGUN", price = 120000, label = "Fusil à pompe"},
                {name  = "WEAPON_DBSHOTGUN", price = 90000, label = "Fusil à pompe double canon"},
                 {name  = "WEAPON_ASSAULTRIFLE", price = 180000, label = "Fusil d\'assaut"},
                {name  = "WEAPON_COMPACTRIFLE", price = 165000, label = "Fusil compact"},
                 {name  = "WEAPON_GUSENBERG", price = 130000, label = "Balayeuse gusenberg"},
                {name  = "WEAPON_SNIPERRIFLE", price = 450000, label = "Fusil de sniper"},
                 {name  = "WEAPON_MOLOTOV", price = 50000, label = "Cocktail molotov"}
            --    {name  = "WEAPON_RPG", price = 2000000, label = "RPG"}




        },
        Pos   = {

         --   { x = 564.21,   y = -3117.80,  z = 17.76 },
        }
    },

}
