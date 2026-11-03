local profile = {}

local fastCastValue = 0.00 -- 0% from gea
local special_ammo = "Carapace Bullet"

local max_hp_in_idle_with_regen_gear_equipped = 0 -- You could set this to 0 if you do not wish to ever use regen gear

local sets = {
    Idle = {
        Head = 'Hunter\'s Beret',
        -- Neck = 'Peacock Amulet',
        Neck = 'Ranger\'s necklace',
        Ear1 = 'Drone Earring',
        Ear2 = 'Genin Earring',
        Body = 'Irn.Msk.Gmbsn. +1',
        Hands = 'Noct gloves +1',
        Ring1 = 'Sniper\'s Ring',
        Ring2 = 'Crossbowman Ring',
        -- Back = 'Amemet mantle +1',
        Back = 'Sniper\'s Mantle',
        Waist = 'R.K. Belt +2',
        Legs = 'Noct Brais +1',
        Feet = 'Leaping Boots',
    },
    IdleALT = {},
    Resting = {},
    Town = {},
    Movement = {},

    DT = {},
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

    Preshot = {},

    TP_LowAcc = {},
    TP_HighAcc = {},
    TP_Mjollnir_Haste = {},

    Ranged_ACC = {
        Head = 'Hunter\'s Beret',
        -- Neck = 'Peacock Amulet',
        Neck = 'Ranger\'s necklace',
        Ear1 = 'Drone Earring',
        Ear2 = 'Genin Earring',
        Body = 'Irn.Msk.Gmbsn. +1',
        Hands = 'Noct gloves +1',
        Ring1 = 'Sniper\'s Ring',
        Ring2 = 'Crossbowman\'s ring',
        -- Back = 'Amemet mantle +1',
        Back = 'Sniper\'s Mantle',
        Waist = 'Royal Knight\'s belt +2',
        Legs = 'Noct Brais +1',
        Feet = 'Leaping Boots',
    },
    Ranged_ATK = {
        Head = 'Hunter\'s Beret',
        Neck = 'Peacock Amulet',
        Ear1 = 'Drone Earring',
        Ear2 = 'Genin Earring',
        Body = 'Iron Musketeer\'s Gambison +1',
        Hands = 'Noct gloves +1',
        Ring1 = 'Sniper\'s Ring',
        Ring2 = 'Crossbowman\'s Ring',
        Back = 'Amemet mantle +1',
        Waist = 'Royal Knight\'s belt +2',
        Legs = 'Noct Brais +1',
        Feet = 'Leaping Boots',
    },

    EagleEyeShot = {},

    EnmityDown = {},

    Barrage = {},
    Scavenge = {
        Feet = 'Hunter\'s Socks',
    },
    Shadowbind = {},
    Camouflage = {},
    Sharpshot = {
        Legs = 'Hunter\'s Braccae',
    },
    UnlimitedShot = {},

    WS = {},
    WS_HighAcc = {},

    WS_SlugShot = {},
    WS_Coronach = {},

    Weapon_Loadout_1 = {},
    Weapon_Loadout_2 = {},
    Weapon_Loadout_3 = {},
}
profile.Sets = sets

profile.SetMacroBook = function()
    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 8')
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 1')
end

--[[
--------------------------------
Everything below can be ignored.
--------------------------------
]]

gcmelee = gFunc.LoadFile('Jtyler_126540\\common\\gcmelee.lua')

profile.Sets = gcmelee.AppendSets(sets)

profile.HandleAbility = function()
    gFunc.EquipSet(sets.EnmityDown)

    local action = gData.GetAction()
    if (action.Name == 'Scavenge') then
        gFunc.EquipSet(sets.Scavenge)
    elseif (action.Name == 'Shadowbind') then
        gFunc.EquipSet(sets.Shadowbind)
    elseif (action.Name == 'Camouflage') then
        gFunc.EquipSet(sets.Camouflage)
    elseif (action.Name == 'Sharpshot') then
        gFunc.EquipSet(sets.Sharpshot)
    elseif (action.Name == 'Eagle Eye Shot') then
        gFunc.EquipSet(sets.EagleEyeShot)

        local equipment = gData.GetEquipment()
        local unlimitedShot = gData.GetBuffCount('Unlimited Shot')
        if (unlimitedShot == 1) then
            gFunc.EquipSet(sets.UnlimitedShot)
        elseif (equipment.Ammo ~= nil and equipment.Ammo.Name == special_ammo) then
            print(chat.header('RNG'):append(chat.message('Action Canceled: Special Ammo Protection')))
            gFunc.CancelAction()
        end
    end
end

profile.HandleItem = function()
    gcinclude.DoItem()
end

profile.HandlePreshot = function()
    gFunc.EquipSet(sets.Preshot)

    local equipment = gData.GetEquipment()
    local unlimitedShot = gData.GetBuffCount('Unlimited Shot')
    if (unlimitedShot == 1) then
        gFunc.EquipSet(sets.UnlimitedShot)
    end
    if (unlimitedShot == 0 and equipment.Ammo ~= nil and equipment.Ammo.Name == special_ammo) then
        print(chat.header('RNG'):append(chat.message('Action Canceled: Special Ammo Protection')))
        gFunc.CancelAction()
    end
end

profile.HandleMidshot = function()
    gFunc.EquipSet(sets.Ranged_ACC)
    if (gcdisplay.GetCycle('Ranged') == 'Attack') then
        gFunc.EquipSet(sets.Ranged_ATK)
    end

    local barrage = gData.GetBuffCount('Barrage')
    if (barrage == 1) then
        gFunc.EquipSet(sets.Barrage)
    end

    local unlimitedShot = gData.GetBuffCount('Unlimited Shot')
    if (unlimitedShot == 1) then
        gFunc.EquipSet(sets.UnlimitedShot)
    end
end

profile.HandleWeaponskill = function()
    gcmelee.DoWS()

    local equipment = gData.GetEquipment()
    local unlimitedShot = gData.GetBuffCount('Unlimited Shot')
    if (unlimitedShot == 1) then
        gFunc.EquipSet(sets.UnlimitedShot)
    elseif (equipment.Ammo ~= nil and equipment.Ammo.Name == special_ammo) then
        print(chat.header('RNG'):append(chat.message('Action Canceled: Special Ammo Protection')))
        gFunc.CancelAction()
    end

    local action = gData.GetAction()
    if (action.Name == 'Slug Shot') then
        gFunc.EquipSet(sets.WS_SlugShot)
    elseif (action.Name == 'Coronach') then
        gFunc.EquipSet(sets.WS_Coronach)
    end
end

profile.OnLoad = function()
    gcinclude.SetAlias(T{'ranged'})
    gcdisplay.CreateCycle('Ranged', {[1] = 'Accuracy', [2] = 'Attack',})
    gcmelee.Load()
    profile.SetMacroBook()
end

profile.OnUnload = function()
    gcmelee.Unload()
    gcinclude.ClearAlias(T{'ranged'})
end

profile.HandleCommand = function(args)
    if (args[1] == 'ranged') then
        gcdisplay.AdvanceCycle('Ranged')
        gcinclude.Message('Ranged', gcdisplay.GetCycle('Ranged'))
    else
        gcmelee.DoCommands(args)
    end

    if (args[1] == 'horizonmode') then
        profile.HandleDefault()
    end
end

profile.HandleDefault = function()
    gcmelee.DoDefault(max_hp_in_idle_with_regen_gear_equipped)
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
