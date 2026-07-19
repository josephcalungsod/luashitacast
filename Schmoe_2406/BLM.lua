local profile = {}

local fastCastValue = 0.04 -- 4% from gear listed in Precast set
local snapShotValue = 0.00 -- 0% from gear listed in Preshot set

local ninSJMaxMP = 640 -- The Max MP you have when /nin in your idle set
local whmSJMaxMP = 1074 -- The Max MP you have when /whm in your idle set
local rdmSJMaxMP = 971 -- The Max MP you have when /rdm in your idle set

local nukeExtraThreshold = 850 -- The minimum MP for which NukeExtra and StoneskinExtra set will be used instead of regular sets (to allow additional nukes using max mp sets)

-- Comment out the equipment within these sets if you do not have them or do not wish to use them
local warlocks_mantle = { -- Don't add 2% to fastCastValue for this as it is SJ dependant
    Back = 'Warlock\'s Mantle',
}
local republic_circlet = {
    -- Head = 'Republic Circlet',
}
local opuntia_hoop = {
    -- Ring1 = 'Opuntia Hoop',
}
local diabolos_pole = {
    Main = 'Diabolos\'s Pole',
}
local sorcerers_ring = {
    Ring2 = 'Sorcerer\'s Ring', -- This is Ring1 instead of Ring2 to allow Ice Ring to work as well in gcmage.lua
}
local sorcerers_tonban = {
    Legs = 'Src. Tonban +1',
}

-- Disabled on horizon_safe_mode
local sorcerers_earring_hp_threshold = 360 -- HP at which Sorcerer's Earring set is equipped
local sorcerers_earring = { -- 1440
    -- Main = 'Terra\'s Staff',
    -- Ammo = 'Hedgehog Bomb',
    -- Head = 'Genie Tiara',
    -- Neck = 'Pch. Collar',
    -- Ear1 = 'Cassie Earring',
    -- Ear1 = 'Sorcerer\'s Earring',
    -- Body = 'Src. Coat +1',
    -- Hands = 'Garden Bangles',
    -- Ring1 = 'Bomb Queen Ring',
    -- Ring2 = 'Sattva Ring',
    -- Back = 'Gigant Mantle',
    -- Waist = 'Ocean Sash',
    -- Legs = 'Igqira Lappas',
    -- Feet = 'Marine M Boots',
}

local sets = {
    Idle = {
        Main = 'Terra\'s Staff',
        Ammo = 'Phtm. Tathlum',
        Head = 'Src. Petasos +1',
        Neck = 'Elemental Torque',
        -- Ear1 = 'Novio Earring',
        -- Ear1 = 'Sorcerer\'s Earring',
        -- Ear2 = 'Moldavite Earring',
        -- Ear2 = 'Sorcerer\'s Earring',
        Body = { Name = 'Sorcerer\'s Coat', Priority = 100 },
        -- Body = 'Black Cloak',
        Hands = 'Zenith Mitts',
        Ring1 = 'Tamas Ring',
        -- Ring2 = 'Sorcerer\'s Ring',
        Back = 'Cheviot Cape',
        Waist = 'Sorcerer\'s Belt',
        Legs = 'Sorcerer\'s Tonban',
        -- Feet = 'Herald\'s Gaiters',
        Feet = 'Src. Sabots +1',
    },
    IdleALT = {},
    IdleMaxMP = {
        -- Main = { Name = 'Kirin\'s Pole', Priority = 100 },
        -- Ammo = { Name = 'Hedgehog Bomb', Priority = 100 },
        -- Head = { Name = 'Zenith Crown', Priority = 100 },
        -- Neck = { Name = 'Uggalepih pendant', Priority = 100 },
        -- Ear1 = { Name = 'Loquac. Earring', Priority = 100 },
        -- Ear2 = { Name = 'Phtm. Earring +1', Priority = 100 },        
        -- Body = { Name = 'Sorcerer\'s Coat', Priority = 100 },
        -- Hands = { Name = 'Zenith Mitts', Priority = 100 },
        -- Back = { Name = 'Merciful Cape', Priority = 100 },
        -- Waist = { Name = 'Hierarch Belt', Priority = 100 },
        -- -- Legs = { Name = 'Sorcerer\'s Tonban', Priority = 100 },        
        -- Legs = { Name = 'Zenith Slacks', Priority = 100 },        
        -- -- Back = { Name = 'Prism Cape', Priority = 100 },
        -- Feet = { Name = 'Rostrum Pumps', Priority = 100 },
    },
    Resting = {
        Main = 'Pluto\'s Staff',
        Head = 'Src. Petasos +1',
        Neck = 'Checkered Scarf',
        Ear1 = 'Relaxing Earring',
        Ear2 = 'Warlock\'s Earring',
        Body = 'Errant Hpl.',        
        Hands = 'Zenith Mitts',
        Ring1 = 'Tamas Ring',
        Ring2 = 'Ether Ring',
        Back = 'Prism Cape',
        Waist = 'Hierarch Belt',
        Legs = 'Baron\'s Slops',
        Feet = 'Rostrum Pumps',
    },
    Town = {
        Main = 'Jupiter\'s Staff',
        Head = 'Src. Petasos +1',
        -- Body = 'Sorcerer\'s Coat',
        Hands = 'Zenith Mitts',
        Legs = 'Sorcerer\'s Tonban',
        Feet = 'Herald\'s Gaiters',
    },
    Movement = {
        Feet = 'Herald\'s Gaiters',
    },

    DT = {
        Main = 'Terra\'s Staff',
        Head = 'Igqira Tiara',
        Neck = 'Jeweled Collar',
        Ear1 = 'Merman\'s Earring',
        Ear2 = { Name = 'Merman\'s Earring', Priority = -100},
        Body = { Name = 'Sorcerer\'s Coat', Priority = 100 },
        Hands = 'Merman\'s Bangles',
        -- Ring1 = 'Jelly Ring',        
        Ring1 = 'Merman\'s Ring',
        Ring2 = 'Merman\'s Ring',
        Back = 'Cheviot Cape',
        Waist = 'Sorcerer\'s Belt',
        Legs = 'Igqira Lappas',
        Feet = 'Mountain Gaiters',
    },
    DTNight = {
        Main = 'Terra\'s Staff',
        Head = 'Igqira Tiara',
        Neck = 'Jeweled Collar',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Body = { Name = 'Sorcerer\'s Coat', Priority = 100 },
        Hands = 'Merman\'s Bangles',
        Ring1 = 'Jelly Ring',
        -- Ring2 = 'Sattva Ring',
        Back = 'Cheviot Cape',
        Waist = 'Sorcerer\'s Belt',
        Legs = 'Igqira Lappas',
        -- Feet = 'Mountain Gaiters',
    },
    MDT = { -- Shell IV provides 23% MDT
        Main = 'Kirin\'s Pole',
        -- Head = 'Black Ribbon',
        Head = 'Green Ribbon +1',
        Neck = 'Jeweled Collar',
        Ear1 = 'Merman\'s Earring', -- 2
        -- Ear2 = 'Sorcerer\'s Earring',
        -- Ear2 = 'Merman\'s Earring', -- 2
        Body = { Name = 'Sorcerer\'s Coat', Priority = 100 },
        Hands = 'Merman\'s Bangles', -- 3
        Ring1 = 'Merman\'s Ring', -- 4 -- Using this over Shadow Ring for consistency
        Ring2 = 'Merman\'s Ring', -- 5
        Back = { Name = 'Hexerei Cape', Priority = 100 }, -- 3
        Waist = 'Sorcerer\'s Belt',
        Legs = 'Igqira Lappas',
        -- Feet = 'Mountain Gaiters',
    },
    FireRes = {
        Main = 'Neptune\'s Staff', -- 20
        -- Head = 'Black Ribbon', -- 10
        Head = 'Green Ribbon +1', -- 10
        Neck = 'Jeweled Collar', -- 10
        Ear1 = 'Cmn. Earring', -- 11
        Ear2 = 'Cmn. Earring', -- 11
        Hands = 'Merman\'s Bangles',
        Ring1 = 'Triumph Ring', -- 10
        Ring2 = 'Malflame Ring', -- 10
        Back = 'Hexerei Cape',
        Waist = 'Water Belt', -- 20
        Legs = 'Igqira Lappas',
        Feet = 'Power Sandals', -- 7
    },
    IceRes = {
        Main = 'Vulcan\'s Staff', -- 20
        -- Head = 'Black Ribbon',
        Head = 'Green Ribbon +1',
        Neck = 'Jeweled Collar', -- 10
        Ear1 = 'Diamond Earring', -- 10
        Ear2 = 'Omn. Earring', -- 11
        Hands = 'Merman\'s Bangles',
        Ring1 = 'Omniscient Ring', -- 10
        Ring2 = 'Malfrost Ring', -- 10
        Back = 'Aurora Mantle', -- 7
        Waist = 'Fire Belt', -- 20
        Legs = 'Igqira Lappas',
        -- Feet = 'Mountain Gaiters',
    },
    LightningRes = {
        Main = 'Terra\'s Staff', -- 20
        -- Head = 'Black Ribbon',
        Head = 'Green Ribbon +1',
        Neck = 'Jeweled Collar', -- 10
        -- Ear1 = 'Robust Earring', -- 11
        -- Ear2 = 'Robust Earring', -- 11
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        -- Hands = 'Merman\'s Bangles',
        Hands = 'Merman\'s Bangles', -- 3
        Ring1 = 'Merman\'s Ring', -- 4 -- Using this over Shadow Ring for consistency
        Ring2 = 'Merman\'s Ring', -- 5
        -- Ring1 = 'Spinel Ring', -- 9
        -- Ring2 = 'Malflash Ring', -- 10
        Back = 'Hexerei Cape',
        Waist = 'Earth Belt', -- 20
        Legs = 'Igqira Lappas',
        -- Feet = 'Mountain Gaiters',
    },
    EarthRes = {
        Main = 'Auster\'s Staff', -- 20
        -- Head = 'Black Ribbon',
        Head = 'Green Ribbon +1',
        Neck = 'Jeweled Collar', -- 10
        Ear1 = 'Robust Earring', -- 11
        Ear2 = 'Robust Earring', -- 11
        Hands = 'Merman\'s Bangles',
        Ring1 = 'Robust Ring', -- 10
        Ring2 = 'Maldust Ring', -- 10
        Back = 'Hexerei Cape',
        Waist = 'Wind Belt', -- 20
        Legs = 'Igqira Lappas',
        -- Feet = 'Mountain Gaiters',
    },
    WindRes = {
        Main = 'Aquilo\'s Staff', -- 20
        -- Head = 'Black Ribbon',
        Head = 'Green Ribbon +1',
        Neck = 'Jeweled Collar', -- 10
        Ear1 = 'Diamond Earring', -- 10
        Ear2 = 'Omn. Earring', -- 11
        Hands = 'Mage\'s Cuffs', -- 5
        Ring1 = 'Emerald Ring', -- 9
        Ring2 = 'Malgust Ring', -- 10
        Back = 'Aurora Mantle', -- 7
        Waist = 'Ice Belt', -- 20
        Legs = 'Igqira Lappas',
        -- Feet = 'Mountain Gaiters',
    },
    WaterRes = {
        Main = 'Jupiter\'s Staff', -- 20
        -- Head = 'Black Ribbon',
        Head = 'Green Ribbon +1',
        Neck = 'Jeweled Collar', -- 10
        Ear1 = 'Cmn. Earring', -- 11
        Ear2 = 'Cmn. Earring', -- 11
        Hands = 'Merman\'s Bangles',
        Ring1 = 'Aqua Ring', -- 10
        Ring2 = 'Malflood Ring', -- 10
        Back = 'Hexerei Cape',
        Waist = 'Lightning Belt', -- 20
        Legs = 'Igqira Lappas',
        -- Feet = 'Mountain Gaiters',
    },
    Evasion = {},

    Precast = {
        Ear1 = 'Loquac. Earring',
        Feet = 'Rostrum Pumps',
    },
    Casting = {
        -- Main = 'Hermit\'s Wand', -- 25
        -- Sub = 'Hermit\'s Wand', -- 25
        -- Head = 'Nashira Turban', -- 10
        -- Neck = 'Willpower Torque', -- 5
        -- Ear1 = 'Merman\'s Earring',
        -- Ear2 = 'Magnetic Earring', -- 8
        -- Waist = 'Druid\'s Rope', -- 10
        -- Feet = 'Wizard\'s Sabots', -- 20
    },
    SIRD = { -- Used on Stoneskin, Blink, Aquaveil and Utsusemi casts
        Main = 'Hermit\'s Wand', -- 25
        Sub = 'Hermit\'s Wand', -- 25
        Head = 'Nashira Turban', -- 10
        Neck = 'Willpower Torque', -- 5
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Magnetic Earring', -- 8
        Waist = 'Druid\'s Rope', -- 10
        Feet = 'Wizard\'s Sabots', -- 20
    },
    Yellow = { -- This will override Precast if /lag is turned on or the spell casting time is too short. e.g. Tier 1: "Stone"
        Head = 'Zenith Crown',        
        -- Back = 'Blue Cape',
        -- Ear1 = 'Loquac. Earring',
        -- Ear2 = 'Magnetic Earring',
        -- Body = { Name = 'Black Cotehardie', Priority = 100 },
        Legs = { Name = 'Zenith Slacks', Priority = 100 },
        Hands = 'Zenith Mitts',
        -- Ring1 = 'Ether Ring',
        -- Ring2 = 'Serket Ring',
        -- Neck = 'Checkered Scarf',
        Waist = { Name = 'Penitent\'s Rope', Priority = -100 },
        Feet = 'Rostrum Pumps',
    },
    YellowHNM = {
        -- Neck = 'Star Necklace',
    },
    Haste = { -- Used only on Haste, Refresh, Blink and Utsusemi casts
        Head = 'Nashira Turban', -- 2
        Ear1 = 'Loquac. Earring',
        Body = 'Nashira Manteel', -- 3
        Hands = 'Nashira Gages', -- 1
        Waist = 'Swift Belt', -- 4
        Legs = 'Nashira Seraweels', -- 2
        Feet = 'Nashira Crackows', -- 1
    },
    ConserveMP = {
        Ammo = 'Dream Sand',
        Ear2 = 'Magnetic Earring',
        Body = 'Igqira Weskit',
        Feet = 'Src. Sabots +1',
    },

    Cure = {
        Ammo = 'Hedgehog Bomb', -- 1
        Head = 'Hydra Beret', -- 8
        Neck = 'Benign Necklace', -- 2
        Ear1 = 'Novia Earring', -- 7
        Ear2 = 'Magnetic Earring',
        Body = 'Hydra Doublet', -- 9
        Hands = 'Hydra Gloves', -- 5
        Ring1 = 'Aqua Ring',
        Ring2 = 'Aqua Ring',
        Back = 'Errant Cape', -- 5
        Waist = 'Penitent\'s Rope', -- 3
        Legs = 'Hydra Brais', -- 6
        Feet = 'Hydra Gaiters', -- 3
    },
    Cursna = {
        Back = 'Altruistic Cape',
    },

    Enhancing = {
        Main = 'Kirin\'s Pole',
        Ammo = 'Hedgehog Bomb',
        Head = 'Nashira Turban',
        Neck = 'Enhancing Torque',
        Ear1 = 'Cmn. Earring',
        Ear2 = 'Cmn. Earring',
        Body = 'Errant Hpl.',
        Hands = 'Dvt. Mitts +1',
        Ring1 = 'Aqua Ring',
        Ring2 = 'Aqua Ring',
        Back = 'Merciful Cape',
        Waist = 'Penitent\'s Rope',
        Legs = 'Mahatma Slops',
        Feet = 'Igqira Huaraches',
    },
    Stoneskin = {
        Main = 'Kirin\'s Pole',
        Ammo = 'Hedgehog Bomb',
        Head = 'Zenith Crown',
        Neck = 'Stone Gorget',
        Ear1 = { Name = 'Loquac. Earring', Priority = 100 },
        Ear2 = 'Static Earring',
        Body = 'Errant Hpl.',
        Hands = 'Dvt. Mitts +1',
        Ring1 = 'Aqua Ring',
        Ring2 = 'Aqua Ring',
        Waist = 'Penitent\'s Rope',
        Back = { Name = 'Errant Cape', Priority = 100 },
        Legs = 'Mahatma Slops',
        Feet = { Name = 'Errant Pigaches', Priority = 100 },
    },
    StoneskinExtra = {
        -- Main = 'Kirin\'s Pole',
        -- Ammo = 'Hedgehog Bomb',
        -- Head = 'Zenith Crown',
        -- Neck = 'Stone Gorget',
        -- Ear1 = 'Loquac. Earring',
        -- Ear2 = 'Cmn. Earring',
        -- Body = 'Errant Hpl.',
        -- Hands = 'Dvt. Mitts +1',
        -- Ring1 = 'Aqua Ring',
        -- Ring2 = 'Aqua Ring',
        -- Back = 'Errant Cape',
        -- Waist = 'Hierarch Belt',
        -- Legs = 'Mahatma Slops',
        -- Feet = 'Errant Pigaches',
    },
    Spikes = {
        Main = 'Kirin\'s Pole',
        Ammo = 'Phtm. Tathlum',
        Head = 'Demon Helm +1',
        Neck = 'Enhancing Torque',
        Ear1 = 'Novio Earring',
        Ear2 = 'Moldavite Earring',
        Body = 'Errant Hpl.',
        Hands = 'Zenith Mitts',
        Ring1 = 'Snow Ring',
        Ring2 = 'Omniscient Ring',
        Back = 'Merciful Cape',
        Waist = 'Sorcerer\'s Belt',
        Legs = 'Mahatma Slops',
        Feet = 'Src. Sabots +1',
    },

    Enfeebling = {
        Head = 'Igqira Tiara',
        Neck = 'Enfeebling Torque',
        Body = 'Wzd. Coat +1',
        Back = 'Altruistic Cape',
        Legs = 'Igqira Lappas',
    },
    EnfeeblingMND = {
        Ammo = 'Hedgehog Bomb',
        Ear1 = 'Cmn. Earring',
        Ear2 = 'Static Earring',
        Hands = 'Dvt. Mitts +1',
        Ring1 = 'Tamas Ring',
        Ring2 = 'Aqua Ring',
        Waist = 'Penitent\'s Rope',
        Feet = 'Errant Pigaches',
        Back = 'Prism Cape',
    },
    EnfeeblingINT = {
        Ammo = 'Phtm. Tathlum',
        Ear1 = 'Abyssal Earring',
        Ear2 = 'Phtm. Earring +1',
        Head = 'Demon Helm +1',
        Hands = 'Errant Cuffs',
        Ring1 = 'Tamas Ring',
        Ring2 = 'Snow Ring',
        Waist = 'Sorcerer\'s Belt',
        Feet = 'Src. Sabots +1',
        Back = 'Prism Cape',
    },
    EnfeeblingACC = {
        Ear2 = 'Enfeebling Earring',
        Back = 'Altruistic Cape',
    },

    Divine = {},
    Dark = {
        Ammo = 'Phtm. Tathlum',
        Head = 'Nashira Turban',
        Neck = 'Dark Torque',
        Ear1 = 'Abyssal Earring',
        Ear2 = 'Dark Earring',
        Body = 'Nashira Manteel',
        Hands = 'Src. Gloves +1',
        Ring1 = 'Tamas Ring',
        Ring2 = 'Snow Ring',
        Back = 'Merciful Cape',
        Waist = 'Swift Belt',
        Legs = 'Wzd. Tonban +1',
        Feet = 'Igqira Huaraches',
    },
    Stun = {
        Ammo = 'Phtm. Tathlum',
        Head = 'Nashira Turban',
        Neck = 'Dark Torque',
        Ear1 = 'Abyssal Earring',
        Ear2 = 'Loquac. Earring',
        Body = 'Nashira Manteel',
        Hands = 'Nashira Gages',
        Ring1 = 'Tamas Ring',
        Ring2 = 'Snow Ring',
        Back = 'Merciful Cape',
        Waist = 'Swift Belt',
        Legs = 'Nashira Seraweels',
        Feet = 'Nashira Crackows',
    },

    Nuke = {
        Ammo = 'Phtm. Tathlum',
        -- Head = 'Src. Petasos +1',
        Head = 'Demon Helm +1',
        Neck = 'Elemental Torque',
        Ear1 = 'Novio Earring',
        Ear2 = 'Moldavite Earring',
        Body = 'Igqira Weskit',
        -- Body = 'Black Cloak',
        Hands = 'Zenith Mitts',
        Ring1 = 'Tamas Ring',
        Ring2 = 'Sorcerer\'s Ring',
        Back = 'Prism Cape',
        Waist = 'Sorcerer\'s Belt',
        Legs = 'Mahatma Slops',
        Feet = 'Src. Sabots +1',
    },
    NukeHNM = {
        Ammo = 'Phtm. Tathlum',
        Head = 'Src. Petasos +1',
        -- Head = 'Demon Helm +1',
        -- Neck = 'Elemental Torque',
        Neck = 'Uggalepih pendant',
        Ear1 = 'Novio Earring',
        Ear2 = 'Moldavite Earring',
        Body = 'Igqira Weskit',
        -- Hands = 'Wizard Gloves',
        Hands = 'Zenith Mitts',
        Ring1 = 'Tamas Ring',
        -- Ring2 = 'Snow Ring',
        -- Back = 'Errant Cape',
        Back = 'Prism Cape',
        -- Back = 'Merciful Cape',
        Waist = 'Sorcerer\'s Belt',
        Legs = 'Mahatma Slops',
        Feet = 'Src. Sabots +1',
        -- Feet = 'Rostrum Pumps',
    },
    NukeACC = {
        Head = 'Src. Petasos',
        Neck = 'Elemental Torque',
        Hands = 'Wizard Gloves',
        Back = 'Merciful Cape',
        Feet = 'Nashira Crackows',
    },
    NukeDOT = {
        Main = 'Kirin\'s Pole',
        Ammo = 'Phtm. Tathlum',
        Head = 'Demon Helm +1',
        Neck = 'Prudence Torque',
        Ear1 = 'Abyssal Earring',
        Ear2 = 'Phtm. Earring +1',
        Body = 'Errant Hpl.',
        Hands = 'Wizard Gloves',
        Ring1 = 'Snow Ring',
        Ring2 = 'Omniscient Ring',
        Back = 'Prism Cape',
        Waist = 'Sorcerer\'s Belt',
        Legs = 'Mahatma Slops',
        Feet = 'Src. Sabots +1',
    },
    -- NukeExtra = {
    --     Ammo = 'Phtm. Tathlum',
    --     Head = { Name = 'Zenith Crown', Priority = 100 },
    --     Neck = 'Prudence Torque',
    --     Ear1 = 'Novio Earring',
    --     Ear2 = 'Magnetic Earring',
    --     Body = 'Igqira Weskit',
    --     Hands = { Name = 'Zenith Mitts', Priority = 100 },
    --     Ring1 = 'Snow Ring',
    --     Ring2 = { Name = 'Serket Ring', Priority = 100 },
    --     Back = { Name = 'Merciful Cape', Priority = 100 },
    --     Waist = 'Sorcerer\'s Belt',
    --     Legs = 'Mahatma Slops',
    --     Feet = 'Src. Sabots +1',
    -- },
    MB = {
        -- Ammo = 'Dream Sand',
        Ear2 = 'Static Earring',
        Hands = 'Sorc. Gloves +1',
    },

    LockSet1 = { -- 40 Cap
        Main = 'Solid Wand',
        Ammo = 'Morion Tathlum',
        Head = 'Seer\'s Crown +1',
        Neck = 'Black Neckerchief',
        Ear1 = 'Moldavite Earring',
        Ear2 = 'Morion Earring',
        Body = 'Ryl.Sqr. Robe',
        Hands = 'Seer\'s Mitts +1',
        Ring1 = 'Wisdom Ring +1',
        Ring2 = 'Wisdom Ring +1',
        Back = 'Black Cape +1',
        Waist = 'Druid\'s Rope',
        Legs = 'Seer\'s Slacks',
        Feet = 'Mannequin Pumps',
    },
    LockSet2 = {},
    LockSet3 = {},
}
profile.Sets = sets

profile.SetMacroBook = function()
    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 1')
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 1')

    AshitaCore:GetChatManager():QueueCommand(-1, '/bind F9 //stun')
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind F10 //dia')
end

--[[
--------------------------------
Everything below can be ignored.
--------------------------------
]]

gcmage = gFunc.LoadFile('Schmoe_2406\\common\\gcmage.lua')

sets.warlocks_mantle = warlocks_mantle
sets.republic_circlet = republic_circlet
sets.opuntia_hoop = opuntia_hoop
sets.diabolos_pole = diabolos_pole
sets.sorcerers_ring = sorcerers_ring
sets.sorcerers_tonban = sorcerers_tonban
sets.sorcerers_earring = sorcerers_earring
profile.Sets = gcmage.AppendSets(sets)

profile.HandleAbility = function()
    gcmage.DoAbility()
end

profile.HandleItem = function()
    gcinclude.DoItem()
end

profile.HandlePreshot = function()
    gcmage.DoPreshot(sets.Preshot, gFunc.Combine(sets.Preshot, sets.Ranged), snapShotValue)
end

profile.HandleMidshot = function()
    gcmage.DoMidshot(sets, gFunc.Combine(sets.Preshot, sets.Ranged))
end

profile.HandleWeaponskill = function()
end

profile.OnLoad = function()
    gcinclude.SetAlias(T{'extra'})
    gcdisplay.CreateToggle('Extra', false)
    gcmage.Load()
    profile.SetMacroBook()
end

profile.OnUnload = function()
    gcmage.Unload()
    gcinclude.ClearAlias(T{'extra'})
end

profile.HandleCommand = function(args)
    if (args[1] == 'extra') then
        gcdisplay.AdvanceToggle('Extra')
        gcinclude.Message('Extra', gcdisplay.GetToggle('Extra'))
    else
        gcmage.DoCommands(args, sets)
    end

    if (args[1] == 'horizonmode') then
        profile.HandleDefault()
    end
end

profile.HandleDefault = function()
    gcmage.DoDefault(sets, ninSJMaxMP, whmSJMaxMP, nil, rdmSJMaxMP, nil)

    local spikes = gData.GetBuffCount('Blaze Spikes') + gData.GetBuffCount('Shock Spikes') + gData.GetBuffCount('Ice Spikes')
    local isPhysical = gcdisplay.IdleSet == 'Normal' or gcdisplay.IdleSet == 'Alternate' or gcdisplay.IdleSet == 'DT'
    if (spikes > 0 and isPhysical) then
        gFunc.EquipSet('opuntia_hoop')
    end

    local player = gData.GetPlayer()
    -- if (not gcinclude.horizon_safe_mode) then
        if (player.HP <= sorcerers_earring_hp_threshold) then
            gFunc.EquipSet('sorcerers_earring')
        end
    -- end

    gcmage.DoDefaultOverride()

    gFunc.EquipSet(gcinclude.BuildLockableSet(gData.GetEquipment()))
end

profile.HandlePrecast = function()
    local player = gData.GetPlayer()
    if (player.SubJob == 'RDM' and warlocks_mantle.Back) then
        gcmage.DoPrecast(sets, fastCastValue + 0.02, 0)
        gFunc.EquipSet('warlocks_mantle')
    else
        gcmage.DoPrecast(sets, fastCastValue, 0)
    end
end

local ElementalDebuffs = T{ 'Burn','Rasp','Drown','Choke','Frost','Shock' }

profile.HandleMidcast = function()
    gcmage.DoMidcast(sets, ninSJMaxMP, whmSJMaxMP, nukeExtraThreshold, rdmSJMaxMP, nil)

    local player = gData.GetPlayer()
    local action = gData.GetAction()
    if (republic_circlet.Head) then
        if (action.Skill == 'Elemental Magic' and gcdisplay.GetCycle('Mode') == 'Potency') then
            if (gcdisplay.GetToggle('Extra') and player.MP >= nukeExtraThreshold) then
                do return end
            end
            if (not ElementalDebuffs:contains(action.Name)) then
                if (conquest:GetInsideControl() and gcdisplay.GetToggle('HNM') == false and gcdisplay.GetCycle('Mode') ~= 'Accuracy') then
                    print(chat.header('LAC - BLM'):append(chat.message('In Region - Using Republic Circlet')))
                    gFunc.EquipSet('republic_circlet')
                end
            end
        end
    end
end

return profile
