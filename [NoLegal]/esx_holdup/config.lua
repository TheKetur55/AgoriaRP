Config = {}
Config.Locale = 'fr'

Config.PoliceNumberRequired = 3
Config.TimerBeforeNewRob = 4000 -- seconds


-- Change secondsRemaining if you want another timer
Stores = {

 ["un"] = {
        position = { ['x'] = 28.26, ['y'] = -1339.45, ['z'] = 28.47 },
        reward = math.random(20000,25000),
        nameofstore = "24/7. (1/9)",
        secondsRemaining = 120, -- seconds
        lastrobbed = 1800
    },
 ["deux"] = {
        position = { ['x'] = 378.05, ['y'] = 333.10, ['z'] = 102.56 },
        reward = math.random(20000,22000),
        nameofstore = "24/7. (2/9)",
        secondsRemaining = 140, -- seconds
        lastrobbed = 1800
    },
     ["trois"] = {
        position = { ['x'] = 2549.55, ['y'] = 384.86, ['z'] = 107.62 },
        reward = math.random(20000,23000),
        nameofstore = "24/7. (3/9)",
        secondsRemaining = 160, -- seconds
        lastrobbed = 1800
    },
     ["quatre"] = {
        position = { ['x'] = -3047.40, ['y'] = 585.69, ['z'] = 6.90 },
        reward = math.random(18000,25000),
        nameofstore = "24/7. (4/9)",
        secondsRemaining = 160, -- seconds
        lastrobbed = 1800
    },
     ["cinq"] = {
        position = { ['x'] = -3249.80, ['y'] = 1004.31, ['z'] = 11.83 },
        reward = math.random(16000,22000),
        nameofstore = "24/7. (5/9)",
        secondsRemaining = 160, -- seconds
        lastrobbed = 1800
    },
     ["six"] = {
        position = { ['x'] = 546.37, ['y'] = 2663.20, ['z'] = 41.15 },
        reward = math.random(15000,20000),
        nameofstore = "24/7. (6/9)",
        secondsRemaining = 180, -- seconds
        lastrobbed = 1800
    },
     ["sept"] = {
        position = { ['x'] = 1959.31, ['y'] = 3748.67, ['z'] = 31.34 },
        reward = math.random(13000,18000),
        nameofstore = "24/7. (7/9)",
        secondsRemaining = 190, -- seconds
        lastrobbed = 1800
    },
     ["huit"] = {
        position = { ['x'] = 2673.15, ['y'] = 3286.33, ['z'] = 54.24 },
        reward = math.random(12000,16000),
        nameofstore = "24/7. (8/9)",
        secondsRemaining = 180, -- seconds
        lastrobbed = 1800
    },
     ["neuf"] = {
        position = { ['x'] = 1734.63, ['y'] = 6420.65, ['z'] = 34.03 },
        reward = math.random(12000,15000),
        nameofstore = "24/7. (9/9)",
        secondsRemaining = 200, -- seconds
        lastrobbed = 1800
    },



     ["unltd"] = {
        position = { ['x'] = -43.10, ['y'] = -1748.67, ['z'] = 28.42 },
        reward = math.random(15000,20000),
        nameofstore = "LTD Gasoline (1/5)",
        secondsRemaining = 200, -- seconds
        lastrobbed = 1800
    },
     ["deuxltd"] = {
        position = { ['x'] = 1159.87, ['y'] = -313.85, ['z'] = 68.20 },
        reward = math.random(14000,20000),
        nameofstore = "LTD Gasoline (2/5)",
        secondsRemaining = 200, -- seconds
        lastrobbed = 1800
    },
     ["troisltd"] = {
        position = { ['x'] = -709.15, ['y'] = -904.29, ['z'] = 18.21 },
        reward = math.random(14000,17000),
        nameofstore = "LTD Gasoline (3/5)",
        secondsRemaining = 200, -- seconds
        lastrobbed = 1800
    },
     ["quatreltd"] = {
        position = { ['x'] = -1828.85, ['y'] = 798.92, ['z'] = 137.18 },
        reward = math.random(13000,16000),
        nameofstore = "LTD Gasoline (4/5)",
        secondsRemaining = 200, -- seconds
        lastrobbed = 1800
    },
     ["cinqltd"] = {
        position = { ['x'] = 1707.71, ['y'] = 4920.30, ['z'] = 41.06 },
        reward = math.random(16000,18000),
        nameofstore = "LTD Gasoline (5/5)",
        secondsRemaining = 200, -- seconds
        lastrobbed = 1800
    },



     ["unrobs"] = {
        position = { ['x'] = 1126.85, ['y'] = -980.53, ['z'] = 44.41 },
        reward = math.random(16000,18000),
        nameofstore = "RobsLiquor (1/6)",
        secondsRemaining = 200, -- seconds
        lastrobbed = 1800
    },
     ["deuxrobs"] = {
        position = { ['x'] = -1220.58, ['y'] = -915.95, ['z'] = 10.32 },
        reward = math.random(16000,18000),
        nameofstore = "RobsLiquor (2/6)",
        secondsRemaining = 200, -- seconds
        lastrobbed = 1800
    },
     ["troisrobs"] = {
        position = { ['x'] = -1479.21, ['y'] = -375.30, ['z'] = 38.16 },
        reward = math.random(16000,18000),
        nameofstore = "RobsLiquor (3/6)",
        secondsRemaining = 200, -- seconds
        lastrobbed = 1800
    },
     ["quatrerobs"] = {
        position = { ['x'] = -2959.53, ['y'] = 387.60, ['z'] = 13.04 },
        reward = math.random(16000,18000),
        nameofstore = "RobsLiquor (4/6)",
        secondsRemaining = 200, -- seconds
        lastrobbed = 1800
    },
     ["cinqrobs"] = {
        position = { ['x'] = 1169.17, ['y'] = 2717.89, ['z'] = 36.15 },
        reward = math.random(16000,18000),
        nameofstore = "RobsLiquor (5/6)",
        secondsRemaining = 200, -- seconds
        lastrobbed = 1800
    },
     ["sixrobs"] = {
        position = { ['x'] = 1395.08, ['y'] = 3613.38, ['z'] = 33.98 },
        reward = math.random(16000,18000),
        nameofstore = "RobsLiquor (6/6)",
        secondsRemaining = 200, -- seconds
        lastrobbed = 1800
    }





}
