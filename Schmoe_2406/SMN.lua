local profile = {}

local fastCastValue = 0.02 -- 4% from gear not including carbuncles cuffs or evokers boots

local carbuncles_cuffs = false
local evokers_boots = false

local cureMP = 1047 -- Cure set max MP

-- Disabled on horizon_safe_mode
local conjurersRingForced = true -- Default /cring value
local conjurersRingMaxHP = 737

-- Comment out the equipment within these sets if you do not have them or do not wish to use them
local carbuncles_cuffs = {
    -- Hands = 'Carbuncle\'s Cuffs',
}
local evokers_boots = {
    -- Feet = 'Evoker\'s Boots',
}
local warlocks_mantle = { -- Don't add 2% to fastCastValue for this as it is SJ dependant
    Back = 'Warlock\'s Mantle',
}
local carbuncle_mitts = {
    Hands = 'Carbuncle Mitts',
}
local yinyang_robe = {
    Body = 'Yinyang Robe',
}
local summoners_doublet = {
    Body = 'Smn. Doublet +1',
}
local summoners_horn = {
    Head = 'Summoner\'s Horn',
}
local conjurers_ring = {
    Ring1 = 'Conjurer\'s Ring',
}
local bahamuts_staff = {
    -- Main = 'Bahamut\'s Staff',
}

local sets = {
    Idle = {
        Main = 'Terra\'s Staff',
        Ear1 = 'Loquac. Earring',
        Ear2 = 'Static Earring',
        Ammo = 'Hedgehog Bomb',
        -- Head = 'Summoner\'s Horn',        
        Neck = 'Jeweled Collar',
        Body = 'Yinyang Robe',        
        -- Hands = 'Nashira Gages',
        Hands = 'Summoner\'s Brcr.',        
        Ring1 = 'Tamas Ring',
        Ring2 = 'Evoker\'s Ring',
        Back = 'Summoner\'s Cape',
        Waist = 'Hierarch Belt',
        Legs = 'Summoner\'s Spats',
        Feet = 'Summoner\'s Pgch.',
    },
    IdleALT = {},
    IdleMaxMP = {
        -- Neck = 'Uggalepih Pendant',
        -- Hands = 'Zenith Mitts',
        -- Legs = 'Zenith Slacks',

        -- Ammo = { Name = 'Hedgehog Bomb', Priority = 100 },
        -- Neck = { Name = 'Uggalepih Pendant', Priority = 100 },
        -- Ear1 = { Name = 'Loquac. Earring', Priority = 100 },
        -- Ear2 = { Name = 'Phtm. Earring +1', Priority = 100 },
        -- Hands = { Name = 'Zenith Mitts', Priority = 100 },
        -- Waist = { Name = 'Hierarch Belt', Priority = 100 },
        -- Legs = { Name = 'Zenith Slacks', Priority = 100 },
        -- Feet = { Name = 'Rostrum Pumps', Priority = 100 },
        -- Back = { Name = 'Merciful Cape', Priority = 100 },
    },
    Resting = {
        Main = 'Pluto\'s Staff',
        -- Head = 'Hydra Beret',
        Neck = 'Checkered Scarf',
        Ear1 = 'Loquac. Earring',
        Ear2 = 'Relaxing Earring',
        Body = 'Errant houppelande',
        Hands = 'Hydra Gloves',
        Ring1 = 'Bomb Queen Ring',
        Ring2 = 'Evoker\'s Ring',
        Back = 'Errant Cape',
        Waist = 'Hierarch Belt',
        Legs = 'Hydra Brais',
        Feet = 'Hydra Gaiters',
    },
    Town = {
        Head = 'Summoner\'s Horn',
    },
    Movement = {
        Feet = 'Herald\'s Gaiters',
    },
    Movement_TP = {},

    Perpetuation = { -- There is no point in using this set over an Idle set except for equipping Penance Robe
        -- Body = 'Penance Robe',
    },

    DT = {
        Main = 'Terra\'s Staff',
        Neck = 'Jeweled Collar',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Hands = 'Merman\'s Bangles',
        Ring1 = 'Merman\'s Ring',
        Ring2 = 'Merman\'s Ring',
        Back = 'Umbra Cape',
    },
    DTNight = {
        Main = 'Terra\'s Staff',
        Neck = 'Jeweled Collar',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Hands = 'Merman\'s Bangles',
        Ring1 = 'Jelly Ring',
        Ring2 = 'Sattva Ring',
        Back = 'Umbra Cape',
    },
    MDT = { -- Shell IV provides 23% MDT    
        Main = 'Terra\'s Staff',
        Head = 'Green Ribbon +1',
        Neck = 'Jeweled Collar',
        Ear1 = 'Merman\'s Earring', -- 2
        Ear2 = 'Merman\'s Earring', -- 2
        Hands = 'Merman\'s Bangles', -- 3
        Ring1 = 'Merman\'s ring',
        Ring2 = 'Merman\'s Ring', 
        Back = 'Cheviot Cape', -- 3
    },
    FireRes = {
        Main = 'Neptune\'s Staff', -- 20
        Ear1 = 'Cmn. Earring', -- 11
        Ear2 = 'Cmn. Earring', -- 11
        Head = 'Green Ribbon +1', -- 10
        Neck = 'Jeweled Collar', -- 10
        Hands = 'Merman\'s Bangles',
        Feet = 'Power Sandals', -- 7
        Back = 'Hexerei Cape',
        Ring1 = 'Triumph Ring', -- 10
        Waist = 'Water Belt', -- 20
        Ring2 = 'Malflame Ring', -- 10
    },
    IceRes = {
        Main = 'Vulcan\'s Staff', -- 20
        Ear1 = 'Diamond Earring', -- 10
        Ear2 = 'Omn. Earring', -- 11
        Head = 'Green Ribbon +1', -- 10
        Neck = 'Jeweled Collar', -- 10
        Hands = 'Merman\'s Bangles',
        Back = 'Aurora Mantle', -- 7
        Waist = 'Fire Belt', -- 20
        Ring1 = 'Omniscient Ring', -- 10
        Ring2 = 'Malfrost Ring', -- 10
    },
    LightningRes = {
        Main = 'Terra\'s Staff', -- 20
        Head = 'Green Ribbon +1', -- 10
        Neck = 'Jeweled Collar', -- 10
        Back = 'Hexerei Cape',
        Ear1 = 'Robust Earring', -- 11
        Ear2 = 'Robust Earring', -- 11
        Hands = 'Merman\'s Bangles',
        Waist = 'Earth Belt', -- 20
        Ring1 = 'Spinel Ring', -- 9
        Ring2 = 'Malflash Ring', -- 10
    },
    EarthRes = {
        Ring2 = 'Maldust Ring', -- 10
        Main = 'Auster\'s Staff', -- 20
        Head = 'Green Ribbon +1', -- 10
        Neck = 'Jeweled Collar', -- 10
        Hands = 'Merman\'s Bangles',
        Back = 'Hexerei Cape',
        Ear1 = 'Robust Earring', -- 11
        Ear2 = 'Robust Earring', -- 11
        Waist = 'Wind Belt', -- 20
        Ring1 = 'Robust Ring', -- 10
    },
    WindRes = {
        Ring2 = 'Malgust Ring', -- 10
        Main = 'Aquilo\'s Staff', -- 20
        Head = 'Green Ribbon +1', -- 10
        Neck = 'Jeweled Collar', -- 10
        Back = 'Aurora Mantle', -- 7
        Hands = 'Mage\'s Cuffs', -- 5
        Ear1 = 'Diamond Earring', -- 10
        Ear2 = 'Omn. Earring', -- 11
        Waist = 'Ice Belt', -- 20
        Ring1 = 'Emerald Ring', -- 9
    },
    WaterRes = {
        Main = 'Jupiter\'s Staff', -- 20
        Head = 'Green Ribbon +1', -- 10
        Neck = 'Jeweled Collar', -- 10
        Hands = 'Merman\'s Bangles',
        Ear1 = 'Cmn. Earring', -- 11
        Ear2 = 'Cmn. Earring', -- 11
        Ring1 = 'Sapphire Ring', -- 10
        Ring2 = 'Malflood Ring', -- 10
        Back = 'Hexerei Cape',
        Waist = 'Lightning Belt', -- 20
    },
    Evasion = {},

    Precast = {
        Ear1 = 'Loquac. Earring',
        Feet = 'Rostrum Pumps',
        Ring1 = { Name = 'Bomb Queen Ring', Priority = 100 },
    },
    Casting = { -- Default Casting Equipment when using Idle sets
        Main = 'Hermit\'s Wand', -- 25
        Sub = 'Hermit\'s Wand', -- 25
        Ammo = 'Hedgehog Bomb',
        Head = 'Nashira Turban', -- 10
        -- Neck = 'Willpower Torque', -- 5
        Neck = 'Smn. Torque',
        Ear1 = 'Loquac. Earring',
        Ear2 = 'Magnetic Earring', -- 8
        Body = 'Yinyang Robe',
        Hands = 'Merman\'s Bangles',
        Ring1 = 'Tamas Ring',
        Ring2 = 'Evoker\'s Ring',
        Back = { Name = 'Errant Cape', Priority = 100 },
        Waist = 'Druid\'s Rope', -- 10
        Legs = { Name = 'Evk. Spats +1', Priority = 100 },
        Feet = { Name = 'Mountain Gaiters', Priority = 100 }, -- 5
    },
    SIRD = { -- Used on Stoneskin, Blink, Aquaveil and Utsusemi casts
        Main = 'Hermit\'s Wand', -- 25
        Sub = 'Hermit\'s Wand', -- 25
        Ammo = 'Hedgehog Bomb',
        Head = 'Nashira Turban', -- 10
        Neck = 'Willpower Torque', -- 5
        Ear1 = 'Loquac. Earring',
        Ear2 = 'Magnetic Earring', -- 8
        Body = 'Yinyang Robe',
        Hands = 'Merman\'s Bangles',
        Ring1 = 'Tamas Ring',
        Ring2 = 'Evoker\'s Ring',
        Back = { Name = 'Errant Cape', Priority = 100 },
        Waist = 'Druid\'s Rope', -- 10
        Legs = { Name = 'Evk. Spats +1', Priority = 100 },
        Feet = { Name = 'Mountain Gaiters', Priority = 100 }, -- 5
    },
    Haste = { -- Used only on Haste, Refresh, Blink and Utsusemi casts
        Head = 'Nashira Turban',
        Ear1 = 'Loquac. Earring',
        Hands = 'Nashira Gages',
        Waist = 'Sonic Belt',
        Legs = 'Nashira Seraweels',
        Feet = 'Nashira Crackows',
    },
    ConserveMP = {
        -- Ammo = 'Dream Sand',
        -- Ear2 = 'Magnetic Earring',
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
        Ring2 = 'Sapphire Ring',
        Back = { Name = 'Errant Cape', Priority = 100 }, -- 5
        Waist = 'Penitent\'s Rope', -- 3
        Legs = 'Hydra Brais', -- 6
        Feet = 'Hydra Gaiters', -- 5
    },
    Cursna = {
        Back = 'Altruistic Cape',
    },

    Enhancing = {
        Main = 'Kirin\'s Pole',
        Ammo = 'Hedgehog Bomb',
        Head = 'Evk. Horn +1',
        Neck = 'Enhancing Torque',
        Ear1 = 'Cmn. Earring',
        Ear2 = 'Cmn. Earring',
        Body = 'Errant Hpl.',
        Hands = 'Dvt. Mitts +1',
        Ring1 = 'Aqua Ring',
        Ring2 = 'Sapphire Ring',
        Back = 'Merciful Cape',
        Waist = 'Penitent\'s Rope',
        Legs = 'Mahatma Slops',
        Feet = 'Mahatma Pigaches',
    },
    Stoneskin = {
        Neck = 'Stone Gorget',
        Back = 'Prism Cape',
    },
    Spikes = {},

    Enfeebling = {},
    EnfeeblingMND = {},
    EnfeeblingINT = {},
    EnfeeblingACC = {},

    Divine = {},
    Banish = {},
    Dark = {},

    Nuke = {},
    NukeACC = {},
    NukeDOT = {},

    LockSet1 = { -- 30 cap?
        Main = 'Solid Wand',
        Ammo = 'Morion Tathlum',
        Head = 'Seer\'s Crown +1',
        Neck = 'Black Neckerchief',
        Ear1 = 'Enfeebling Earring',
        Ear2 = 'Morion Earring',
        Body = 'Ryl.Sqr. Robe',
        Hands = 'Carbuncle Mitts',
        Ring1 = 'Wisdom Ring +1',
        Ring2 = 'Ether Ring',
        Back = 'Black Cape +1',
        Waist = 'Druid\'s Rope',
        Legs = 'Seer\'s Slacks',
        Feet = 'Mannequin Pumps',
    },
    LockSet2 = {},
    LockSet3 = {},

    FallbackSub = { -- Used only when you do not have complete staff sets
    },

    BP_Delay = {
        Head = 'Summoner\'s Horn',
        Legs = 'Summoner\'s Spats',
        Ring2 = 'Evoker\'s Ring',
        Ear1 = 'Loquac. Earring',
        -- Ear2 = 'Novia Earring',
        Ring1 = { Name = 'Bomb Queen Ring', Priority = 100 },
        Back = 'Summoner\'s Cape',
        Body = 'Yinyang Robe',
        Hands = { Name = 'Summoner\'s Brcr.', Priority = 100 },
        -- Hands = { Name = 'Austere Cuffs', Priority = 100 },
        Feet = 'Summoner\'s Pgch.',
        Ammo = 'Hedgehog Bomb',
        Waist = { Name = 'Penitent\'s Rope', Priority = -1 },
        Neck = 'Smn. Torque',
    },

    BP = {
        Ammo = 'Hedgehog Bomb',
        Head = 'Summoner\'s Horn', -- evokers?
        Neck = 'Smn. Torque',
        Body = 'Yinyang Robe',        
        Ear1 = 'Loquac. Earring',
        -- Ear2 = 'Magnetic Earring',        
        Hands = 'Summoner\'s Brcr.',
        -- Hands = 'Austere Cuffs',
        Ring1 = { Name = 'Tamas Ring', Priority = 100 },
        Ring2 = 'Evoker\'s Ring',
        -- Feet = 'Austere Sabots',        
        Back = 'Astute Cape',
        Waist = { Name = 'Hierarch Belt', Priority = 100 },  
        Legs = 'Evoker\'s Spats',
        Feet = 'Summoner\'s Pgch.', --nashira?        
    },
    BP_Magical = {
        -- Head = 'Buffalo Helm',
    },
    BP_Magical_Potency = {
        -- Feet = 'Shep. Boots', -- Increases damage at the cost of accuracy
    },
    BP_Physical = {-- accuracy
        Legs = 'Evoker\'s Spats',
        -- Feet = 'Summoner\'s Pgch.', -- Increases damage at the cost of accuracy
    },
    BP_Physical_Crit = {
        Body = 'Smn. Doublet +1',
    },
    BP_Hybrid = {
        -- Feet = 'Shep. Boots', -- Increases damage at the cost of accuracy
    },
    BP_Healing = { -- This set is pointless unless your server penalizes healing BPs by attributing amount healed enmity to you.
    },

    TP = {
        Ring1 = 'Jelly Ring',
    },
    TP_Mjollnir_Haste = {},
    TP_HighAcc = {
        Ring1 = { Name = 'Bomb Queen Ring', Priority = 100 },
    },

    WS = {},
    WS_HighAcc = {},

    Weapon_Loadout_1 = {},
    Weapon_Loadout_2 = {},
    Weapon_Loadout_3 = {},

    ConjurersRingHPDown = { -- 730 - Set to force HP below conjurersRingMaxHP. Note that /WHM provides regen so this is preferably at least 10 or more below.
        Main = 'Terra\'s Staff',
        Ammo = 'Hedgehog Bomb',
        Head = 'Zenith Crown +1',
        Neck = 'Jeweled Collar +1',
        Ear1 = 'Novia Earring',
        Ear2 = 'Hades Earring +1',
        Body = 'Yinyang Robe',
        Hands = 'Zenith Mitts +1',
        Ring1 = 'Serket Ring',
        Ring2 = 'Ether Ring',
        Back = 'Umbra Cape',
        Waist = 'Penitent\'s Rope',
        Legs = 'Evk. Spats +1',
        Feet = 'Rostrum Pumps',
    },

    Preshot = {}, -- This set is pointless until ToAU+ when Snapshot on equipment is available
    Ranged = {
        -- Ammo = 'Pebble',
    },

    VileElixir = {},
}
profile.Sets = sets

profile.SetMacroBook = function()
    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 20')
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 10')

    AshitaCore:GetChatManager():QueueCommand(-1, '/bind F9 //dia')
    -- AshitaCore:GetChatManager():QueueCommand(-1, '/bind F10 //dia')
end

--[[
--------------------------------
Everything below can be ignored.
--------------------------------
]]

gcmage = gFunc.LoadFile('common\\gcmage.lua')

sets.carbuncles_cuffs = carbuncles_cuffs
sets.evokers_boots = evokers_boots
sets.warlocks_mantle = warlocks_mantle
sets.carbuncle_mitts = carbuncle_mitts
sets.yinyang_robe = yinyang_robe
sets.summoners_doublet = summoners_doublet
sets.summoners_horn = summoners_horn
sets.conjurers_ring = conjurers_ring
sets.bahamuts_staff = bahamuts_staff
profile.Sets = gcmage.AppendSets(sets)

-- Includes Chaotic Strike and Shock Strike in SmnSkill to maximize stun chance
local SmnSkill = T{'Shining Ruby','Glittering Ruby','Crimson Howl','Inferno Howl','Frost Armor','Crystal Blessing','Aerial Armor','Hastega II','Fleet Wind','Hastega','Earthen Ward','Earthen Armor','Rolling Thunder','Lightning Armor','Soothing Current','Ecliptic Growl','Heavenward Howl','Ecliptic Howl','Noctoshield','Dream Shroud','Altana\'s Favor','Reraise','Reraise II','Reraise III','Raise','Raise II','Raise III','Wind\'s Blessing','Spring Water','Shock Strike','Chaotic Strike'}
local SmnHealing = T{'Healing Ruby','Healing Ruby II','Whispering Wind'}
local SmnMagical = T{'Searing Light','Meteorite','Holy Mist','Inferno','Fire II','Fire IV','Meteor Strike','Conflag Strike','Diamond Dust','Blizzard II','Blizzard IV','Heavenly Strike','Aerial Blast','Aero II','Aero IV','Wind Blade','Earthen Fury','Stone II','Stone IV','Geocrush','Judgement Bolt','Thunder II','Thunder IV','Thunderstorm','Thunderspark','Tidal Wave','Water II','Water IV','Grand Fall','Howling Moon','Lunar Bay','Ruinous Omen','Somnolence','Nether Blast','Night Terror','Level ? Holy'}
local SmnEnfeebling = T{'Diamond Storm','Sleepga','Shock Squall','Slowga','Tidal Roar','Pavor Nocturnus','Ultimate Terror','Nightmare','Mewing Lullaby','Eerie Eye'}
local SmnHybrid = T{'Flaming Crush','Burning Strike'}
local SmnCrit = T{'Predator Claws','Claw'}

local nextConjurersRingCheck = 0

profile.HandleAbility = function()
    gcmage.DoAbility()

    local action = gData.GetAction()
    if (string.match(action.Type, 'Blood')) then
        gFunc.EquipSet('BP_Delay')
    end
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
    gFunc.EquipSet(sets.WS)
    if (gcdisplay.GetCycle('TP') == 'HighAcc') then
        gFunc.EquipSet('WS_HighAcc')
    end
    gcmage.DoFenrirsEarring()
end

profile.OnLoad = function()
    if (not gcinclude.horizon_safe_mode) then
        gcinclude.SetAlias(T{'cring'})
        gcdisplay.CreateToggle('C-Ring', conjurersRingForced)
    end

    gcmage.Load()
    profile.SetMacroBook()
end

profile.OnUnload = function()
    gcmage.Unload()

    if (not gcinclude.horizon_safe_mode) then
        gcinclude.ClearAlias(T{'cring'})
    end
end

profile.HandleCommand = function(args)
    if (args[1] == 'cring') then
        gcdisplay.AdvanceToggle('C-Ring')
        gcinclude.Message('Conjurer\'s Ring', gcdisplay.GetToggle('C-Ring'))
    else
        gcmage.DoCommands(args, sets)
    end

    if (args[1] == 'horizonmode') then
        profile.HandleDefault()
    end
end

profile.HandleDefault = function()
    local petAction = gData.GetPetAction()
    if (petAction ~= nil) then
        gFunc.EquipSet('BP')

        if (SmnSkill:contains(petAction.Name)) then
            -- Do Nothing
        elseif (SmnMagical:contains(petAction.Name)) then
            gFunc.EquipSet(sets.BP_Magical)
            gFunc.EquipSet(sets.BP_Magical_Potency)
        elseif (SmnHybrid:contains(petAction.Name)) then
            gFunc.EquipSet(sets.BP_Physical)
            gFunc.EquipSet(sets.BP_Hybrid)
        elseif (SmnHealing:contains(petAction.Name)) then
            gFunc.EquipSet(sets.BP_Healing)
        elseif (SmnEnfeebling:contains(petAction.Name)) then
            gFunc.EquipSet(sets.BP_Magical)
        else
            gFunc.EquipSet(sets.BP_Physical)
            if (SmnCrit:contains(petAction.Name)) then
                gFunc.EquipSet(sets.BP_Physical_Crit)
            end
        end
    else
        if (not gcinclude.horizon_safe_mode) then
            local player = gData.GetPlayer()
            if (gcdisplay.GetToggle('C-Ring') and player.HP >= conjurersRingMaxHP and gData.GetPet()) then
                local time = os.clock()
                if (time > nextConjurersRingCheck) then
                    nextConjurersRingCheck = time + 3 -- only recheck again after 3 seconds to prevent spam
                    gFunc.ForceEquipSet('ConjurersRingHPDown')
                    gFunc.ForceEquipSet('Idle')
                end
            end
        end

        gcmage.DoDefault(sets, nil, nil, nil, nil, nil)
        gcmage.DoDefaultOverride()
    end
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

    local action = gData.GetAction()
    if (action.Skill == 'Summoning') then
        gFunc.EquipSet('carbuncles_cuffs')
        gFunc.EquipSet('evokers_boots')
    end
end

profile.HandleMidcast = function()
    gcmage.DoMidcast(sets, cureMP, cureMP, cureMP, cureMP, cureMP)
end

return profile
