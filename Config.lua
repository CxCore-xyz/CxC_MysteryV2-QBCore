Config = {}

--Progress settings
Config.BasicOpenTime = 5000 -- 5 Seconds
Config.PremiumOpenTime = 5000 -- 5 Seconds

--Item settings
Config.BasicItem = "basicpack" -- Basic pack item
Config.BasicRemoveAmount = 1 -- Remove amount of the packs on use
Config.PremiumItem = "premiumpack" -- Premium pack
Config.PremiumRemoveAmount = 1 -- Remove amount of the packs on use

--Packs settings
Config.BasicAmount = 1 -- Amount wich player receive from the pack
Config.Basic = { -- Lower end pack rewards
    'lockpick',
    'advancedlockpick',
    'screwdriverset'
}

Config.PremiumAmount = 1 -- Amount wich player receive from the pack
Config.Premium = { -- Higher end pack rewards
    'phone',
    'weed_bag',
    'meth',
    'weapon_assaultrifle'
}

Config.Debug = true -- Set it to false if you don't want console spam