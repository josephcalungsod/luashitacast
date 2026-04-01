local profile = {}

local fastCastValue = 0.00 -- 0% from gear

-- Replace these with '' if you do not have them
local myochin_kabuto = 'Myochin Kabuto'
local saotome_kote = 'Saotome Kote'

local sets = {
    Idle = {
        -- Ammo = 'Bomb Core',
        -- Range = 'Lightning Bow +1',
        -- Range = 'Shigeto Bow',
        Head = 'Ace\'s Helm',
        Neck = 'Peacock Amulet',
        Ear1 = 'Bushinomimi',
        -- Ear2 = 'Minuet earring',
        -- Ear2 = 'Attila\'s earring',
        Body = 'Arhat\'s Gi +1',        
        Hands = 'Hachiman kote +1',
        Ring1 = 'Toreador\'s Ring',
        Ring2 = 'Toreador\'s Ring',
        Back = 'Amemet mantle +1',
        Waist = 'Warwolf Belt',
        -- Legs = 'Shinimusha haidate',
        Legs = 'Byakko\'s haidate',
        Feet = 'Hachiman sune-ate',
    },
    IdleALT = {},
    Resting = {},
    Town = {
        -- Head = 'Homam Zucchetto',
        -- Neck = 'Justice Torque',
        -- Ear1 = 'Brutal Earring',
        -- Ear2 = 'Abyssal Earring',
        -- Body = 'Haubergeon',
        -- Hands = 'Dusk Gloves',
        -- Ring1 = 'Toreador\'s Ring',
        -- Ring2 = 'Toreador\'s Ring',
        -- Back = 'Amemet mantle +1',
        -- Waist = 'Sonic Belt',
        -- Legs = 'Homam Cosciales',
        -- Feet = 'Homam Gambieras',
    },
    Movement = {},

    DT = {
        Body = 'Arhat\'s Gi +1',        -- 9pdt
        Legs = 'Dst. Subligar +1',      -- 3pdt
    },
    MDT = { -- Shell IV provides 23% MDT
    },
    FireRes = {},
    IceRes = {},
    LightningRes = {
        Legs = 'Byakko\'s haidate',     -- 50% lightning res
    },
    EarthRes = {},
    WindRes = {},
    WaterRes = {},
    Evasion = {},

    Precast = {},
    SIRD = {
    },
    Haste = { -- Used for Utsusemi cooldown
        Head = 'Ace\'s Helm',
        Hands = 'Dusk Gloves',
        -- Waist = 'Swift Belt',
        -- Waist = 'Sonic Belt',
        Legs = 'Byakko\'s haidate',
        Feet = 'Fuma sune-ate',
    },

    LockSet1 = {},
    LockSet2 = {},
    LockSet3 = {},

    TP_LowAcc = {
        -- Ammo = 'Bomb Core',
        -- Range = 'Lightning Bow +1',
        Head = 'Ace\'s Helm',
        Neck = 'Peacock Amulet',
        Ear1 = 'Bushinomimi',
        -- Ear2 = 'Attila\'s earring',     -- store tp 1
        Ear2 = 'Minuet earring',
        Body = 'Haubergeon',        
        Hands = 'Hachiman kote +1',     -- store tp 9
        Ring1 = 'Toreador\'s Ring',
        Ring2 = 'Toreador\'s Ring',
        -- Ring2 = 'Rajas Ring',        -- store tp 5
        Back = 'Amemet mantle +1',
        Waist = 'Life Belt',
        -- Waist = 'Swift Belt',
        -- Waist = 'Sonic Belt',
        -- Legs = 'Shinimusha haidate',    -- store tp 6
        Legs = 'Byakko\'s haidate',
        Feet = 'Hachiman sune-ate',     -- store tp 5
        -- Feet = 'Fuma sune-ate',
    },
    TP_HighAcc = {
        Ammo = 'Bomb Core',
        -- Range = 'Lightning Bow +1',
        Head = 'Optical Hat',
        Neck = 'Peacock Amulet',
        Ear1 = 'Bushinomimi',
        Ear2 = 'Attila\'s earring',
        Body = 'Haubergeon',        
        Hands = 'Hachiman kote +1',
        Ring1 = 'Toreador\'s Ring',
        Ring2 = 'Toreador\'s Ring',
        Back = 'Amemet mantle +1',
        Waist = 'Life Belt',
        Legs = 'Shinimusha haidate',
        Feet = 'Hmn. Sune-Ate',
    },
    TP_Mjollnir_Haste = {},

    WS = {
        -- Head = 'Optical Hat',                   --                   acc 10
        -- Head = 'Wyvern Helm',                   --            str 5
        Head = 'Ace\'s Helm',                   --            str 4; acc 7
        -- Neck = 'Peacock Amulet',
        Neck = 'Spike Necklace',                --            str 3; dex 3
        Ear1 = 'Bushinomimi',                   --            str 2; GK 5
        -- Ear2 = 'Minuet Earring',
        -- Ear2 = 'Triumph Earring',
        Body = 'Kirin\'s Osode',                    --            str 5; acc 10; atk 10
        Hands = 'Hachiman kote +1',             -- store tp 9
        -- Hands = 'Palla\'s Bracelets',           --            str 9; 
        -- Ring1 = 'Toreador\'s Ring',
        -- Ring2 = 'Toreador\'s Ring',
        Ring1 = 'Flame Ring',                   --            str 5
        Ring2 = 'Flame Ring',                   --            str 5
        -- Ring2 = 'Rajas Ring',                -- store tp 5
        Back = 'Amemet mantle +1',              --            str 2;       atk 15
        Waist = 'Warwolf Belt',                 --            str 5; dex 5 
        -- Legs = 'Shinimusha haidate',
        Legs = 'Byakko\'s haidate',             -- store tp 5
        Feet = 'Hachiman sune-ate',             -- store tp 5; str 2
    },
    WS_HighAcc = {
        -- Head = 'Homam Zucchetto',
        Head = 'Optical Hat',
        Neck = 'Justice Torque',
        -- Ear1 = 'Brutal Earring',
        -- Ear2 = 'Abyssal Earring',
        Ear1 = 'Bushinomimi',
        Ear2 = 'Attila\'s earring',
        Body = 'Haubergeon',
        Head = 'Optical Hat',
        Hands = 'Hachiman kote +1',
        Ring1 = 'Toreador\'s Ring',
        Ring2 = 'Toreador\'s Ring',
        Back = 'Amemet mantle +1',
        Waist = 'Life Belt',
        Legs = 'Shinimusha haidate',
        Feet = 'Hachiman sune-ate',
    },

    WS_Kaiten = {
        Neck = 'Flame Gorget',
    },    
    WS_Gekko = {
        Neck = 'Snow Gorget',
    },
    WS_Jinpu = {
        Neck = 'Breeze Gorget',
    },
}
profile.Sets = sets

profile.SetMacroBook = function()
    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 6')
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 1')
end

--[[
--------------------------------
Everything below can be ignored.
--------------------------------
]]

gcmelee = gFunc.LoadFile('common\\gcmelee.lua')

profile.HandleAbility = function()
    local action = gData.GetAction()
    if (action.Name == 'Meditate') then
        if (myochin_kabuto ~= '') then
            gFunc.Equip('Head', myochin_kabuto)
        end
        if (saotome_kote ~= '') then
            gFunc.Equip('Hands', saotome_kote)
        end
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

    local action = gData.GetAction()
    if (action.Name == 'Tachi: Kaiten' or action.Name == 'Tachi: Kasha') then
        gFunc.EquipSet(sets.WS_Kaiten)
    end    
    if (action.Name == 'Tachi: Gekko' or action.Name == 'Tachi: Yukikaze') then
        gFunc.EquipSet(sets.WS_Gekko)    
    end
    if (action.Name == 'Tachi: Jinpu') then
        gFunc.EquipSet(sets.WS_Jinpu)
    end
end

profile.OnLoad = function()
    gcmelee.Load()
    profile.SetMacroBook()
end

profile.OnUnload = function()
    gcmelee.Unload()
end

profile.HandleCommand = function(args)
    gcmelee.DoCommands(args)

    if (args[1] == 'horizonmode') then
        profile.HandleDefault()
    end
end

profile.HandleDefault = function()
    gcmelee.DoDefault()
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
