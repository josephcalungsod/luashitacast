local profile = {}

local fastCastValue = 0.00 -- 0% from gear

local sets = {
    Idle = {
        Ammo = 'Bomb Core',
        Head = 'Valykyrie\'s Mask',
        -- Neck = 'Spike Necklace',
        -- Neck = 'Ryl.Grd. Collar',
        Neck = 'Peacock Amulet',
        -- Ear2 = 'Brutal Earring',
        -- Ear2 = 'Abyssal Earring',
        -- Ear1 = 'Spike Earring',
        -- Ear2 = 'Spike Earring',
        Body = 'Hauberk',        
        Hands = 'Thick mufflers +1',        
        Ring1 = 'Toreador\'s Ring',
        Ring2 = 'Toreador\'s Ring',
        -- Back = 'Jaguar Mantle',
        Back = 'Amemet mantle +1',
        -- Waist = 'Warwolf Belt',
        -- Waist = 'Ryl.Kgt. Belt',
        -- Waist = 'Swordbelt +1',
        -- Waist = 'Life Belt',
        -- Legs = 'Onyx Cuisses',
        -- Legs = 'Luisant Brayettes',
        -- Legs = 'Ryl.Kgt. Breeches',
        Legs = 'Thick Breeches',
        -- Legs = 'Republic Subligar',
        Feet = 'Thick Sollerets +1',
    },
    IdleALT = {},
    Resting = {},
    Town = {},
    Movement = {},

    DT = {
        Head = 'Darksteel Cap +1', -- 2
        Neck = 'Evasion Torque',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Body = 'Dst. Harness +1', -- 4
        Hands = 'Heavy Gauntlets', -- 3
        Ring1 = 'Jelly Ring', -- 5
        -- Ring2 = { Name = 'Sattva Ring', Priority = 100 }, -- 5
        -- Back = 'Shadow Mantle',
        Waist = 'Warwolf Belt',
        Legs = 'Dst. Subligar +1', -- 3
        Feet = 'Dst. Leggings +1', -- 2
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

    Precast = {},
    SIRD = {
    },
    Haste = { -- Used for Utsusemi cooldown
    },

    LockSet1 = {},
    LockSet2 = {},
    LockSet3 = {},

    TP_LowAcc = {
        -- Ammo = 'Bomb Core',
        Head = 'Optical Hat',
        Neck = 'Peacock Amulet',
        -- Ear1 = 'Bushinomimi',
        Ear2 = 'Brutal Earring',
        -- Ear2 = 'Abyssal Earring',
        Body = 'Hauberk',
        Hands = 'Dusk Gloves',
        -- Hands = 'Thick Mufflers +1',
        Ring1 = 'Toreador\'s Ring',
        Ring2 = 'Toreador\'s Ring',
        -- Back = 'Jaguar Mantle',
        Back = 'Amemet mantle +1',
        -- Back = 'Forager\'s Mantle',
        -- Waist = 'Life Belt',
        Waist = 'Warwolf Belt',
        Legs = 'Luisant Brayettes',
        -- Legs = 'Thick Breeches',
        Feet = 'Fighter\'s Calligae',
        -- Feet = 'Thick Sollerets +1',
    },
    TP_HighAcc = {
        Head = 'Optical Hat',
        Neck = 'Peacock Amulet',
        Ring1 = 'Toreador\'s Ring',
        Ring2 = 'Toreador\'s Ring',
        Waist = 'Life Belt',
    },
    TP_Aggressor = {
        Head = 'Optical Hat',
        Neck = 'Spike Necklace',
        Ear2 = 'Brutal Earring',
        -- Ear2 = 'Abyssal Earring',
        Body = 'Hauberk',
        Hands = 'Dusk Gloves',
        Ring1 = 'Flame Ring',
        Ring2 = 'Toreador\'s Ring',
        Back = 'Amemet mantle +1',
    },

    WS = {
        Ammo = 'Bomb Core',
        Head = 'Valykyrie\'s Mask',
        Neck = 'Spike Necklace',
        -- Neck = 'Ryl.Grd. Collar',        
        -- Ear1 = 'Brutal Earring',
        -- Ear2 = 'Abyssal Earring',
        -- Ear1 = 'Spike Earring',
        -- Ear2 = 'Spike Earring',
        Body = 'Hauberk',
        -- Body = 'Kirin\'s Osode',        
        Hands = 'Pallas\'s bracelets',
        -- Hands = 'Luisaant Moufles',        
        Ring1 = 'Flame Ring',
        Ring2 = 'Toreador\'s Ring',
        Back = 'Amemet mantle +1',
        -- Waist = 'Warwolf Belt',        
        Waist = 'Swordbelt +1',
        -- Waist = 'Ryl.Kgt. Belt',
        -- Waist = 'Life Belt',
        -- Legs = 'Onyx Cuisses',
        -- Legs = 'Luisant Brayettes',
        Legs = 'Ryl.Kgt. Breeches',
        -- Legs = 'Republic Subligar',
        -- Feet = 'Fighter\'s Calligae',
        Feet = 'Thick Sollerets +1',
    },
    WS_HighAcc = {},

    Warcry = {},
    Provoke = {},

    DW = {
        -- Ear1 = 'Stealth Earring',
    },
    SAM = {
        Ear1 = 'Bushinomimi',
    },
}
profile.Sets = sets

profile.SetMacroBook = function()
    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 1')
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 1')
end

gcmelee = gFunc.LoadFile('common\\gcmelee.lua')

profile.HandleAbility = function()
    local action = gData.GetAction()
    if (action.Name == 'Warcry') then
        gFunc.EquipSet(sets.Warcry)
    elseif (action.Name == 'Provoke') then
        gFunc.EquipSet(sets.Provoke)
    end
end

profile.HandleItem = function()
    gcinclude.DoItem()
end

profile.HandlePreshot = function()
end

profile.HandleMidshot = function()
end

profile.HandleWeaponskill = function()
    gcmelee.DoWS()
end

profile.OnLoad = function()
    gcinclude.SetAlias(T{'dw'})
    gcdisplay.CreateToggle('DW', false)
    gcmelee.Load()
    profile.SetMacroBook()
end

profile.OnUnload = function()
    gcmelee.Unload()
    gcinclude.ClearAlias(T{'dw'})
end

profile.HandleCommand = function(args)
    if (args[1] == 'dw') then
        gcdisplay.AdvanceToggle('DW')
        gcinclude.Message('DW', gcdisplay.GetToggle('DW'))
    else
        gcmelee.DoCommands(args)
    end

    if (args[1] == 'horizonmode') then
        profile.HandleDefault()
    end
end

profile.HandleDefault = function()
    gcmelee.DoDefault()

    local player = gData.GetPlayer()
    if (player.SubJob == 'SAM') then
        gFunc.EquipSet(sets.SAM)
    end
    if (gcdisplay.GetToggle('DW') and player.Status == 'Engaged') then
        gFunc.EquipSet(sets.DW)
    end

    local aggressor = gData.GetBuffCount('Aggressor')
    if (aggressor == 1 and gcdisplay.IdleSet == 'LowAcc') then
        gFunc.EquipSet(sets.TP_Aggressor)
    end

    gcmelee.DoDefaultOverride()
    gFunc.EquipSet(gcinclude.BuildLockableSet(gData.GetEquipment()))
end

profile.HandlePrecast = function()
    gcmelee.DoPrecast(fastCastValue)
end

profile.HandleMidcast = function()
    gcmelee.DoMidcast(sets)
end

return profile
