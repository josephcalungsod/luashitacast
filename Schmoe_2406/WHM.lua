local profile = {}

local fastCastValue = 0.00 -- 0% from gear listed in Precast set. Note: Do NOT include cure clogs / ruckes rung here.

local ninSJMaxMP = nil -- The Max MP you have when /nin in your idle set
local rdmSJMaxMP = nil -- The Max MP you have when /rdm in your idle set
local blmSJMaxMP = nil -- The Max MP you have when /blm in your idle set

local virology_ring = false
local virology_ring_slot = 'Ring2'
local republic_circlet = true

local sets = {
    Idle = {
        Ammo = 'Hedgehog Bomb',
        Head = 'Zenith Crown',        
        -- Head = 'Optical Hat',        
        -- Head = 'Healer\'s Cap',      
        -- Neck = 'Ajari Necklace',
        -- Ear1 = 'Novio Earring',
        Ear1 = 'Loquac. Earring',
        -- Ear2 = 'Moldavite Earring',
        -- Body = 'Vermillion cloak',
        -- Body = 'Tct.Mgc. Coat',
        Body = 'Noble\'s Tunic',
        -- Hands = 'Zenith Mitts',
        Hands = 'Blessed Mitts',
        -- Hands = 'Healer\'s Mitts',
        -- Ring1 = 'Tamas Ring',        
        Ring1 = 'Tamas Ring',        
        Ring2 = 'Aqua Ring',     
        Back = 'Altruistic Cape',
        -- Back = 'Prism Cape',
        -- Waist = 'Penitent\'s rope',
        Waist = 'Cleric\'s Belt',
        -- Legs = 'Mahatma Slops',
        -- Legs = 'Seer\'s Slacks +1',
        Legs = 'Blessed Trousers',
        -- Legs = 'Healer\'s Pantaloons',
        -- Feet = 'Sorcerer\'s Sabots',
        -- Feet = 'Mountain Gaiters',
        Feet = 'Blessed Pumps',
    },
    IdleALT = {},
    IdleMaxMP = {},
    Resting = {        
        Main = 'Pluto\'s Staff',
        Ammo = 'Hedgehog Bomb',
        -- Head = 'Sorcerer\'s Petas.',
        -- Head = 'Wizard\'s Petas.',
        -- Head = 'Healer\'s Cap',
        -- Head = 'Republic Circlet',
        Head = '',
        Neck = 'Checkered Scarf',
        -- Ear1 = 'Novio Earring',
        -- Ear1 = 'Morion Earring +1',
        Ear2 = 'Moldavite Earring',        
        -- Body = 'Tct.Mgc. Coat',
        -- Body = 'Black Cotehardie',
        Body = 'Errant Hpl.',
        -- Hands = 'Zenith Mitts',
        -- Hands = 'Wizard\'s Gloves',
        -- Hands = 'Zenith Mitts',
        Hands = 'Healer\'s Mitts',
        -- Ring1 = 'Tamas Ring',        
        Ring1 = 'Tamas Ring',        
        Ring2 = 'Aqua Ring',     
        Back = 'Prism Cape',
        -- Back = 'Prism Cape',
        Waist = 'Cleric\'s Belt',
        -- Waist = 'Hierarch Belt',
        -- Legs = 'Mahatma Slops',
        -- Legs = 'Seer\'s Slacks +1',
        Legs = 'Healer\'s Pantaloons',
        -- Feet = 'Sorcerer\'s Sabots',
        -- Feet = 'Mountain Gaiters',
    },
    Town = {
        Head = 'Zenith Crown',
    },
    Movement = {
        Feet = 'Herald\'s Gaiters',
    },

    DT = {
        Back = 'Cheviot Cape',
    },
    DTNight = {},
    MDT = { -- Shell IV provides 23% MDT
        Neck = 'Jeweled Collar',
        Back = 'Hexerei Cape',
        Ear1 = 'Static Earring',
        Ring1 = 'Merman\'s Ring',
        Ring2 = 'Merman\'s Ring',
    },
    FireRes = {
        Main = 'Neptune\'s Staff',
        Waist = 'Water belt',
    },
    IceRes = {
        Main = 'Vulcan\'s Staff',
        Waist = 'Fire belt',
    },
    LightningRes = {
        Main = 'Terrano\'s Staff',
        Waist = 'Earth belt',
    },
    EarthRes = {},
    WindRes = {
        Main = 'Aquilo\'s Staff',
        Waist = 'Ice belt',
    },
    WaterRes = {},
    Evasion = {},

    Precast = {
        -- Feet = 'Rostrum pumps',

    },
    Casting = { -- Default Casting Equipment when using Idle sets
    },
    SIRD = { -- Used on Stoneskin, Blink, Aquaveil and Utsusemi casts
        Feet = 'Healer\'s duckbills',
    },
    Haste = { -- Used only on Haste, Refresh, Blink and Utsusemi casts
    },
    ConserveMP = {},

    Yellow = {},
    Cure = {
        Ammo = 'Phantom Tathlum',
        Head = 'Healer\'s Cap',
        -- Neck = '',
        -- Ear1 = '',
        -- Ear2 = '',
        Body = 'Noble\'s Tunic',
        Hands = 'Healer\'s Mitts',
        Waist = 'Penitent\'s Rope',
        Ring1 = 'Tamas Ring',
        Ring2 = 'Aqua Ring',
    },
    Cure5 = {},
    Regen = {
        Body = 'Cleric\'s Bliaut',
    },
    Barspell = {
        Legs = 'Cleric\'s Pantaln.',
    },
    Cursna = {},

    Enhancing = {
        Back = 'Merciful Cape',
        Feet = 'Cleric\'s Duckbills',
    },
    Stoneskin = {},
    Spikes = {},

    Enfeebling = {
        Ammo = 'Phtm. Tathlum',
        -- Head = 'Sorcerer\'s Petas.',
        -- Head = 'Wizard\'s Petas.',
        -- Head = 'Healer\'s Cap',
        -- Head = 'Republic Circlet',
        Neck = 'Enfeebling Torque',
        -- Ear1 = 'Novio Earring',
        -- Ear1 = 'Morion Earring +1',
        Ear2 = 'Moldavite Earring',
        Body = 'Healer\'s Bliaut',
        -- Body = 'Tct.Mgc. Coat',
        -- Body = 'Black Cotehardie',
        -- Body = 'Demon\'s Cloak',
        -- Hands = 'Zenith Mitts',
        -- Hands = 'Wizard\'s Gloves',
        -- Hands = 'Zenith Mitts',
        Hands = 'Healer\'s Mitts',
        -- Ring1 = 'Tamas Ring',        
        Ring1 = 'Tamas Ring',        
        Ring2 = 'Aqua Ring',     
        Back = 'Altruistic Cape',
        -- Back = 'Prism Cape',
        -- Waist = 'Sorcerer\'s Belt',
        Waist = 'Penitent\'s rope',
        -- Legs = 'Mahatma Slops',
        -- Legs = 'Seer\'s Slacks +1',
        -- Legs = 'Healer\'s Pantaloons',
        -- Feet = 'Healer\'s duckbills',
        -- Feet = 'Mountain Gaiters',
        },
    EnfeeblingMND = {
        Neck = 'Ajari Necklace',
        Waist = 'Cleric\'s Belt',
        Back = 'Merciful Cape',
    },
    EnfeeblingINT = {},
    EnfeeblingACC = {
        Neck = 'Enfeebling Torque',
        Body = 'Healer\'s Bliaut',
    },

    Divine = {
        Ammo = 'Phtm. Tathlum',
        -- Head = 'Sorcerer\'s Petas.',
        -- Head = 'Wizard\'s Petas.',
        Head = 'Healer\'s Cap',
        -- Head = 'Republic Circlet',
        Neck = 'Divine Torque',
        -- Neck = 'Ajari Necklace',
        Ear1 = 'Novio Earring',
        Ear2 = 'Moldavite Earring',
        Body = 'Healer\'s Bliaut',
        -- Body = 'Tct.Mgc. Coat',
        -- Body = 'Black Cotehardie',
        -- Body = 'Demon\'s Cloak',
        -- Hands = 'Zenith Mitts',
        -- Hands = 'Wizard\'s Gloves',
        -- Hands = 'Zenith Mitts',
        Hands = 'Healer\'s Mitts',
        -- Ring1 = 'Tamas Ring',        
        Ring1 = 'Tamas Ring',        
        Ring2 = 'Aqua Ring',     
        Back = 'Altruistic Cape',
        -- Waist = 'Penitent\'s rope',
        Waist = 'Cleric\'s Belt',
        -- Legs = 'Mahatma Slops',
        -- Legs = 'Seer\'s Slacks +1',
        Legs = 'Healer\'s Pantaloons',
        -- Feet = 'Healer\'s duckbills',
        -- Feet = 'Mountain Gaiters',        
        },
    Banish = {},
    Dark = {},

    Nuke = {},
    NukeACC = {},
    NukeDOT = {},

    LockSet1 = {},
    LockSet2 = {},
    LockSet3 = {},

    TP = {
        Head = 'Optical Hat',
    },
    TP_HighAcc = {
        Head = 'Optical Hat',
    },
    TP_NIN = {},
    TP_Mjollnir_Haste = {},
    WS = {},
    WS_HighAcc = {},
    WS_Randgrith = {},
}
profile.Sets = sets

profile.SetMacroBook = function()
    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 3')
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 1')
end

--[[
--------------------------------
Everything below can be ignored.
--------------------------------
]]

gcmage = gFunc.LoadFile('common\\gcmage.lua')

profile.HandleAbility = function()
end

profile.HandleItem = function()
    gcinclude.DoItem()
end

profile.HandlePreshot = function()
end

profile.HandleMidshot = function()
end

profile.HandleWeaponskill = function()
    gFunc.EquipSet(sets.WS)
    if (gcdisplay.GetCycle('TP') == 'HighAcc') then
        gFunc.EquipSet('WS_HighAcc')
    end

    local action = gData.GetAction()
    if (action.Name == 'Randgrith') then
        gFunc.EquipSet(sets.WS_Randgrith)
    end

    gcmage.DoFenrirsEarring()
end

profile.OnLoad = function()
    gcmage.Load()
    profile.SetMacroBook()
end

profile.OnUnload = function()
    gcmage.Unload()
end

profile.HandleCommand = function(args)
    gcmage.DoCommands(args)

    if (args[1] == 'horizonmode') then
        profile.HandleDefault()
    end
end

profile.HandleDefault = function()
    gcmage.DoDefault(ninSJMaxMP, nil, blmSJMaxMP, rdmSJMaxMP, nil)

    gFunc.EquipSet(gcinclude.BuildLockableSet(gData.GetEquipment()))
end

profile.HandlePrecast = function()
    gcmage.DoPrecast(fastCastValue)
end


local DivineFlash = T{ 'Flash' }

profile.HandleMidcast = function()
    gcmage.DoMidcast(sets, ninSJMaxMP, nil, blmSJMaxMP, rdmSJMaxMP, nil)

    local action = gData.GetAction()
    if (action.Skill == 'Enhancing Magic') then
        if (string.match(action.Name, 'Regen')) then
            gFunc.EquipSet('Regen')
        elseif (string.match(action.Name, 'Bar')) then
            gFunc.EquipSet('Barspell')
        end
    elseif (string.match(action.Name, 'Banish')) then
        gFunc.EquipSet('Banish')
    elseif virology_ring and (string.match(action.Name, '.*na$') or (action.Name == 'Erase')) then
        gFunc.Equip(virology_ring_slot, 'Virology Ring')
    end
    if (republic_circlet == true) then
        if (action.Skill == 'Divine Magic' and gcdisplay.GetCycle('Mode') == 'Potency') then            
            if (gcdisplay.GetToggle('Extra') and player.MP >= nukeExtraThreshold) then
                do return end
            end
            if (not DivineFlash:contains(action.Name)) then
                if (conquest:GetInsideControl()) then
                    print(chat.header('GCMage'):append(chat.message('In Region - Using Republic Circlet')))
                    gFunc.Equip('Head', 'Republic Circlet')
                end
            end
        end
    end
end

return profile
