-- NIN will lose TP on many actions when switching to Staff.
-- Use "/lac disable Main" to prevent weapon swaps if this is not desired.
-- /locktp can be used as well however will lock Range and Ammo slots.

local profile = {}

local fastCastValue = 0.02 -- 0% from gear

-- local warlocks_mantle = true -- Don't add 2% to fastCastValue to this as it is SJ dependant

local max_hp_in_idle_with_regen_gear_equipped = 0 -- You could set this to 0 if you do not wish to ever use regen gear

local shinobi_ring = true
local shinobi_ring_slot = 'Ring2'

local koga_tekko = true
local koga_tekko_plus_one = false

local uggalepih_pendant = true

local fenrirs_stone = false -- Used for Evasion at night

-- Fill this out for which evasion pants to use at night / dusk to dawn
local night_time_eva_pants = ''
local dusk_to_dawn_eva_pants = 'Koga Hakama +1'

-- Leave as '' if you do not have the staff.
local fire_staff = 'Vulcan\'s Staff'
local earth_staff = 'Terra\'s Staff'
local water_staff = 'Neptune\'s Staff'
local wind_staff = 'Auster\'s Staff'
local ice_staff = 'Aquilo\'s Staff'
local thunder_staff = 'Jupiter\'s Staff'
local light_staff = 'Apollo\'s Staff'
local dark_staff = 'Pluto\'s Staff'

-- Set to true if you have the obi
local karin_obi = true
local dorin_obi = true
local suirin_obi = true
local furin_obi = true
local hyorin_obi = true
local rairin_obi = true
local korin_obi = true
local anrin_obi = true

local sets = {
    Idle = {
        -- Main = 'Kodachi +1',
        -- Sub = 'Nikkariaoe',
        -- Ammo = 'Morion Tathlum',
        Head = 'Emperor Hairpin',
        Neck = 'Peacock Amulet',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Body = 'Arhat\'s Gi +1',
        -- Body = 'Scorpion Harness',
        Hands = 'Arhat\'s Tekko',
        Ring1 = 'Merman\'s Ring',
        Ring2 = 'Merman\'s Ring',
        Back = 'Nomad\'s Mantle',
        Waist = 'Koga Sarashi',
        Legs = 'Koga Hakama',
        Feet = 'Koga Kyahan',
    },
    IdleALT = {},
    IdleDT = {
        -- Main = 'Kodachi +1',
        -- Sub = 'Nikkariaoe',
        -- Ammo = 'Happy Egg',
        Head = 'Emperor Hairpin',
        Neck = 'Jeweled Collar',
        -- Ear1 = 'Merman\'s Earring',
        -- Ear2 = 'Merman\'s Earring',
        Body = 'Arhat\'s Gi +1',
        Hands = 'Arhat\'s Tekko',
        Ring1 = 'Merman\'s Ring',
        Ring2 = 'Merman\'s Ring',
        Back = 'Nomad\'s Mantle',
        Waist = 'Koga Sarashi',
        Legs = 'Koga Hakama',
        Feet = 'Koga Kyahan',
    },
    IdleALTDT = {},
    Resting = {},
    Town = {},
    Movement = {
        Feet = 'Ninja Kyahan',
    },

    DT = {},
    DTNight = {
        Feet = 'Ninja Kyahan',
    },

    
    MDT = { -- Shell IV provides 23% MDT
    },
    FireRes = {},
    IceRes = {},
    LightningRes = {},
    EarthRes = {},
    WindRes = {},
    WaterRes = {},
    Evasion = {},

    Precast = {
        Back = 'Warlock\'s Mantle',
        Ear1 = 'Loquac. Earring',
    },
    SIRD = {
    },
    Haste = { -- Used for Utsusemi cooldown
    },

    Hate = {
        Back = 'Mercen. Mantle',
        -- Ring1 = 'Sattva Ring',
    },
    NinDebuff = {
        Ammo = 'Phtm. Tathlum',
        Head = 'Yasha Jinpachi',
        Neck = 'Ninjutsu Torque',
        Ear1 = 'Morion Earring +1',
        Ear2 = 'Moldavite Earring',
        Body = 'Arhat\'s Gi +1',
        -- Hands = 'Arhat\'s Tekko',
        Hands = 'Dusk Gloves',
        Ring1 = 'Tamas Ring',
        Ring2 = 'Snow Ring',
        Back = 'Astute Cape',
        Waist = 'Koga Sarashi',
        Legs = 'Yasha Hakama',
        Feet = 'Fuma Suen-Ate',
    },
    NinElemental = {
        Ammo = 'Phtm. Tathlum',
        Head = 'Yasha Jinpachi',
        Neck = 'Ninjutsu Torque',
        Ear1 = 'Novio Earring',
        Ear2 = 'Moldavite Earring',
        Body = 'Arhat\'s Gi +1',
        Hands = 'Dusk Gloves',
        Ring1 = 'Tamas Ring',
        Ring2 = 'Snow Ring',        
        Back = 'Astute Cape',
        Waist = 'Koga Sarashi',
        Legs = 'Yasha Hakama',
        Feet = 'Koga Kyahan',
    },
    NinElemental_Accuracy = {},
    DrkDarkMagic = {},

    LockSet1 = {},
    LockSet2 = {},
    LockSet3 = {},

    TP_LowAcc = {
        Main = 'Kodachi of Trials',
        Sub = 'Mamushito',
        -- Ammo = 'Happy Egg',
        Head = 'Emperor Hairpin',
        -- Neck = 'Peacock Amulet',
        Ear1 = 'Novio Earring',
        Ear2 = 'Moldavite Earring',
        Body = 'Ninja Chainmail',
        Hands = 'Dusk Gloves',
        Ring1 = 'Toreador\'s Ring',
        Ring2 = 'Toreador\'s Ring',
        -- Back = 'Nomad\'s Mantle',
        -- Waist = 'Warrior\'s Belt +1',
        -- Legs = 'Republic Subligar',
        -- Feet = 'Fed. Kyahan',
    },
    TP_HighAcc = {},
    TP_Mjollnir_Haste = {},

    WS = {},
    WS_HighAcc = {},

    WS_BladeJin = {
        Neck = 'Soil Gorget',
    },
    WS_BladeTen = {
        Neck = 'Soil Gorget',
    },
    WS_BladeKu = {},

    Ranged = {}, -- This won't work for automatically swapping shurikens, only other equipment

    Weapon_Loadout_1 = {},
    Weapon_Loadout_2 = {},
    Weapon_Loadout_3 = {},
}
profile.Sets = sets

profile.SetMacroBook = function()
    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 7')
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 2')
end

--[[
--------------------------------
Everything below can be ignored.
--------------------------------
]]

local NinDebuffs = T{ 'Kurayami: Ni', 'Hojo: Ni', 'Jubaku: Ichi', 'Dokumori: Ichi', 'Kurayami: Ichi', 'Hojo: Ichi' }
local DrkDebuffs = T{ 'Bind', 'Sleep', 'Poison' }
local DrkDarkMagic = T{ 'Stun', 'Aspir', 'Drain', 'Absorb-AGI', 'Absorb-VIT' }
local NinElemental = T{
    'Hyoton: Ni', 'Katon: Ni', 'Huton: Ni', 'Doton: Ni', 'Raiton: Ni', 'Suiton: Ni',
    'Hyoton: Ichi', 'Katon: Ichi', 'Huton: Ichi', 'Doton: Ichi', 'Raiton: Ichi', 'Suiton: Ichi',
    'Hyoton: San', 'Katon: San', 'Huton: San', 'Doton: San', 'Raiton: San', 'Suiton: San'
}

local ElementalStaffTable = {
    ['Fire'] = fire_staff,
    ['Earth'] = earth_staff,
    ['Water'] = water_staff,
    ['Wind'] = wind_staff,
    ['Ice'] = ice_staff,
    ['Thunder'] = thunder_staff,
    ['Light'] = light_staff,
    ['Dark'] = dark_staff
}

local NukeObiTable = {
    ['Fire'] = 'Karin Obi',
    ['Earth'] = 'Dorin Obi',
    ['Water'] = 'Suirin Obi',
    ['Wind'] = 'Furin Obi',
    ['Ice'] = 'Hyorin Obi',
    ['Thunder'] = 'Rairin Obi',
    ['Light'] = 'Korin Obi',
    ['Dark'] = 'Anrin obi'
}

local NukeObiOwnedTable = {
    ['Fire'] = karin_obi,
    ['Earth'] = dorin_obi,
    ['Water'] = suirin_obi,
    ['Wind'] = furin_obi,
    ['Ice'] = hyorin_obi,
    ['Thunder'] = rairin_obi,
    ['Light'] = korin_obi,
    ['Dark'] = anrin_obi
}

local WeakElementTable = {
    ['Fire'] = 'Water',
    ['Earth'] = 'Wind',
    ['Water'] = 'Thunder',
    ['Wind'] = 'Ice',
    ['Ice'] = 'Fire',
    ['Thunder'] = 'Earth',
    ['Light'] = 'Dark',
    ['Dark'] = 'Light'
}

gcmelee = gFunc.LoadFile('common\\gcmelee.lua')
profile.Sets = gcmelee.AppendSets(sets)

profile.HandleAbility = function()
    gFunc.EquipSet(sets.Hate)
end

profile.HandleItem = function()
    gcinclude.DoItem()
end

profile.HandlePreshot = function()
end

profile.HandleMidshot = function()
    gFunc.EquipSet(sets.Ranged)
end

profile.HandleWeaponskill = function()
    gcmelee.DoWS()

    local action = gData.GetAction()
    if (action.Name == 'Blade: Jin') then
        gFunc.EquipSet(sets.WS_BladeJin)
    elseif (action.Name == 'Blade: Ku') then
        gFunc.EquipSet(sets.WS_BladeKu)
    elseif (action.Name == 'Blade: Ten') then
        gFunc.EquipSet(sets.WS_BladeTen)
        elseif (action.Name == 'Blade: Retsu') then
        gFunc.EquipSet(sets.WS_BladeTen)
    end

    local environment = gData.GetEnvironment()
    if (koga_tekko and (environment.Time < 6 or environment.Time >= 18)) then
        gFunc.Equip('Hands', 'Koga Tekko')
    end
    if (koga_tekko_plus_one and (environment.Time < 7 or environment.Time >= 17)) then
        gFunc.Equip('Hands', 'Kog. Tekko +1')
    end
end

profile.OnLoad = function()
    gcinclude.SetAlias(T{'nuke'})
    gcdisplay.CreateCycle('Nuke', {[1] = 'Potency', [2] = 'Accuracy',})
    gcmelee.Load()
    profile.SetMacroBook()
end

profile.OnUnload = function()
    gcmelee.Unload()
    gcinclude.ClearAlias(T{'nuke'})
end

profile.HandleCommand = function(args)
    if (args[1] == 'nuke') then
        gcdisplay.AdvanceCycle('Nuke')
        gcinclude.Message('Nuke', gcdisplay.GetCycle('Nuke'))
    else
        gcmelee.DoCommands(args)
    end

    if (args[1] == 'horizonmode') then
        profile.HandleDefault()
    end
end

profile.HandleDefault = function()
    gcmelee.DoDefault(max_hp_in_idle_with_regen_gear_equipped)

    local player = gData.GetPlayer()
    local environment = gData.GetEnvironment()

    if (player.Status == 'Engaged') then
        if (shinobi_ring and player.HPP <= 75 and player.TP <= 1000) then
            gFunc.Equip(shinobi_ring_slot, 'Shinobi Ring')
        end
        if (koga_tekko and (environment.Time < 6 or environment.Time >= 18)) then
            gFunc.Equip('Hands', 'Koga Tekko')
        end
        if (koga_tekko_plus_one and (environment.Time < 7 or environment.Time >= 17)) then
            gFunc.Equip('Hands', 'Kog. Tekko +1')
        end
    end

    gcmelee.DoDefaultOverride()

    if (gcdisplay.IdleSet == 'Evasion') then
        if (fenrirs_stone and (environment.Time < 6 or environment.Time >= 18)) then
            -- gFunc.Equip('Ammo', 'Fenrir\'s Stone')
            gFunc.Equip('Ammo', 'Hedgehog Bomb')
            gFunc.Equip('Range', '')
        end
        if (night_time_eva_pants ~= '' and (environment.Time < 6 or environment.Time >= 18)) then
            gFunc.Equip('Legs', night_time_eva_pants)
        end
        if (dusk_to_dawn_eva_pants ~= '' and (environment.Time < 7 or environment.Time >= 17)) then
            gFunc.Equip('Legs', dusk_to_dawn_eva_pants)
        end
    end

    gFunc.EquipSet(gcinclude.BuildLockableSet(gData.GetEquipment()))
end

profile.HandlePrecast = function()
    gcmelee.DoPrecast(fastCastValue)
end

profile.HandleMidcast = function()
    gcmelee.DoMidcast(sets)

    local action = gData.GetAction()
    if (action.Skill == 'Ninjutsu') then
        if (NinDebuffs:contains(action.Name)) then
            gFunc.EquipSet(sets.NinDebuff)
            EquipStaffAndObi(action)
        elseif (NinElemental:contains(action.Name)) then
            gFunc.EquipSet(sets.NinElemental)
            if (gcdisplay.GetCycle('Nuke') == 'Accuracy') then
                gFunc.EquipSet(sets.NinElemental_Accuracy)
            end
            if (action.MppAftercast < 51) and uggalepih_pendant then
                gFunc.Equip('Neck', 'Uggalepih Pendant')
            end
            EquipStaffAndObi(action)
        end
    elseif (action.Skill == 'Enfeebling Magic') then
        if (DrkDebuffs:contains(action.Name)) then
            gFunc.EquipSet(sets.Hate)
        end
        local staff = ElementalStaffTable[action.Element]
        if staff ~= '' then
            gFunc.Equip('Main', staff)
        end
    elseif (action.Skill == 'Dark Magic') then
        if (DrkDarkMagic:contains(action.Name)) then
            gFunc.EquipSet(sets.DrkDarkMagic)
        end
        EquipStaffAndObi(action)
    end
end

function EquipStaffAndObi(action)
    local staff = ElementalStaffTable[action.Element]
    if staff ~= '' then
        gFunc.Equip('Main', staff)
    end

    if (ObiCheck(action)) then
        local obi = NukeObiTable[action.Element]
        local obiOwned = NukeObiOwnedTable[action.Element]
        if (obiOwned) then
            gFunc.Equip('Waist', obi)
        end
    end
end

function ObiCheck(action)
    local element = action.Element
    local environment = gData.GetEnvironment()
    local weakElement = WeakElementTable[element]

    if environment.WeatherElement == element then
        return environment.Weather:match('x2') or environment.DayElement ~= weakElement
    end

    return environment.DayElement == element and environment.WeatherElement ~= weakElement
end

return profile
