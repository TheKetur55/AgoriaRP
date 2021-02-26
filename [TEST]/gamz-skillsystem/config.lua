Config = {}

Config.UpdateFrequency = 3000 -- seconds interval between removing values 

Config.Notifications = false -- notification when skill is added

Config.Skills = {
    ["Stamina"] = {
        ["Current"] = 10, -- Default value 
        ["RemoveAmount"] = -0.1, -- % to remove when updating,
        ["Stat"] = "MP0_STAMINA" -- GTA stat hashname
    },

    ["Strength"] = {
        ["Current"] = 10,
        ["RemoveAmount"] = -0.1,
        ["Stat"] = "MP0_STRENGTH"
    },

    ["Lung Capacity"] = {
        ["Current"] = 10,
        ["RemoveAmount"] = -0.1,
        ["Stat"] = "MP0_LUNG_CAPACITY"
    },

    ["Shooting"] = {
        ["Current"] = 10,
        ["RemoveAmount"] = -0.1,
        ["Stat"] = "MP0_SHOOTING_ABILITY"
    },

    ["Driving"] = {
        ["Current"] = 10,
        ["RemoveAmount"] = -0.1,
        ["Stat"] = "MP0_DRIVING_ABILITY"
    },

    ["Wheelie"] = {
        ["Current"] = 10,
        ["RemoveAmount"] = -0.1,
        ["Stat"] = "MP0_WHEELIE_ABILITY"
    }
}
