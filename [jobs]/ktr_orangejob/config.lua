Config = {}

Config.BottleRecieve = { 3 , 4 ,5 } -- This is the math random ex. math.random(1, 6) this will give you 1 - 6 bottles when searching a bin.
Config.BottleReward = { 11,12,13,14,15 } -- This is the math random ex. math.random(1, 4) this will give a random payout between 1 - 4

-- Here you add all the bins you are going to search.
Config.BinsAvailable = {
 --   "prop_veg_crop_orange"--,

vector3(321.785, 6531.189, 28.13968),
vector3(321.7952, 6517.392, 28.01308),
vector3(321.7991, 6505.43, 28.16754),
vector3(280.3781, 6530.831, 29.12036),
vector3(281.3197, 6518.829, 28.96136),
vector3(270.4885, 6530.557, 29.41779),
vector3(273.4984, 6507.414, 29.35535)
   -- "prop_bin_05a"
}

-- This is where you add the locations where you sell the bottles.
Config.SellBottleLocations = {
    vector3(-1182.27,-1721.26, 4.46)--,

  --  vector3(26.877752304077, -1343.0764160156, 29.497024536133)
}