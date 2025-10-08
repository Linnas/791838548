local MakePlayerCharacter = require("prefabs/player_common")

local assets = 
{
	Asset("SCRIPT", "scripts/prefabs/player_common.lua"),
    Asset( "ANIM", "anim/engineer.zip" ),
    Asset( "ANIM", "anim/ghost_engineer_build.zip" ),
}

local start_inv = {}
for k, v in pairs(TUNING.GAMEMODE_STARTING_ITEMS) do
	start_inv[string.lower(k)] = v.ENGINEER
end

local prefabs = FlattenTree(start_inv, true)

local function maxbuild(inst)
    inst.cturrets = 0
    inst.ctelexits = 0
    inst.ctelenters = 0
    inst.cdispensers = 0

    for k,v in pairs(Ents) do
	if v and v.turretID and v.turretID == inst.engieID then
	    inst.cturrets = inst.cturrets +1
	end
	if v and v.telexitID and v.telexitID == inst.engieID  then
	    inst.ctelexits = inst.ctelexits +1
	end
	if v and v.telenterID and v.telenterID == inst.engieID then
	    inst.ctelenters = inst.ctelenters +1
	end
	if v and v.dispenserID and v.dispenserID == inst.engieID then
	    inst.cdispensers = inst.cdispensers +1
	end
    end
 
	if TUNING.ENGIE_BUILDINGMAX ~= false then

    if TUNING.ENGIE_DISPENSERLIMIT ~= false then
		if inst.cdispensers >= TUNING.ENGIE_DISPENSERMAX then
			inst:RemoveTag("engiedis")
			inst:AddTag("engiedispenserdummy")
		end
		if inst.cdispensers < TUNING.ENGIE_DISPENSERMAX then
			inst:AddTag("engiedis")
			inst:RemoveTag("engiedispenserdummy")
		end
    end

    if TUNING.ENGIE_TELEPORTERLIMIT ~= false then
		if inst.ctelenters >= TUNING.ENGIE_TELEPORTERMAX then
			inst:RemoveTag("engietelenter")
			inst:AddTag("engietelenterdummy")
		end
		if inst.ctelenters < TUNING.ENGIE_TELEPORTERMAX then
			inst:AddTag("engietelenter")
			inst:RemoveTag("engietelenterdummy")
		end
		if inst.ctelexits >= TUNING.ENGIE_TELEPORTERMAX then
			inst:RemoveTag("engietelexit")
			inst:AddTag("engietelexitdummy")
		end
		if inst.ctelexits < TUNING.ENGIE_TELEPORTERMAX then
			inst:AddTag("engietelexit")
			inst:RemoveTag("engietelexitdummy")
		end
    end

    if TUNING.ENGIE_SENTRYLIMIT ~= false then
		if inst.cturrets >= TUNING.ENGIE_SENTRYMAX then
			inst:RemoveTag("engieturret")
			inst:AddTag("engiesentrydummy")
		end
		if inst.cturrets < TUNING.ENGIE_SENTRYMAX then
			inst:AddTag("engieturret")
			inst:RemoveTag("engiesentrydummy")
		end
    end

	end
end

local function onsave(inst, data)
    if inst.engieID ~= nil then
	data.engieID = inst.engieID
    end
end

local function onload(inst, data)
    if data.engieID == nil then
	inst.engieID = inst.GUID
    end
    if data.engieID ~= nil then
	inst.engieID = data.engieID
    end
    maxbuild(inst)
end

local common_postinit = function(inst)
    inst:AddTag("engie")

    inst:AddTag("engiedis")
    inst:AddTag("engietelenter")
    inst:AddTag("engietelexit")
    inst:AddTag("engieturret")

	inst.AnimState:SetHatOffset(3, 0)

	-----------------------------
	if TheNet:GetServerGameMode() == "quagmire" then
		inst.regorged = true
        inst:AddTag("quagmire_grillmaster")
        inst:AddTag("quagmire_shopper")
	end

    inst.MiniMapEntity:SetIcon( "engineer.tex" )
end

local master_postinit = function(inst)
	if TheNet:GetServerGameMode() == "quagmire" then
		inst.starting_inventory = start_inv.quagmire
	else
		inst.starting_inventory = start_inv[TheNet:GetServerGameMode()] or start_inv.default
	end

	inst.soundsname = "woodie"

    inst.components.health:SetMaxHealth(TUNING.ENGINEER_HEALTH)
    inst.components.hunger:SetMax(TUNING.ENGINEER_HUNGER)
    inst.components.sanity:SetMax(TUNING.ENGINEER_SANITY)
    inst.components.builder.science_bonus = TUNING.ENGIE_SCIENCEBONUS --1
    inst.components.combat.damagemultiplier = TUNING.ENGIE_DMGDEBUFF --20% less

	inst.components.foodaffinity:AddPrefabAffinity("cookedmeat", TUNING.AFFINITY_15_CALORIES_MED)

    -- Add silkspool component
    inst:AddComponent("silkspool")
    inst.components.silkspool:Initialize()
    
    -- Debug function to test silkspool
    inst.DebugAddSilk = function(amount)
        if inst.components.silkspool then
            inst.components.silkspool:DoDelta(amount or 1)
            print("Silkspool value: " .. inst.components.silkspool:GetCurrent() .. "/" .. inst.components.silkspool:GetMax())
        end
    end

	--[[if TheNet:GetServerGameMode() == "lavaarena" then
        inst.forge_fn = forge_fn
		return
    end--]]

    inst.OnNewSpawn = function(inst)
		inst.engieID = inst.GUID
		local hardhat = SpawnPrefab("ehardhat")
		inst.components.inventory:Equip(hardhat)
    end

    inst.OnSave = onsave
    inst.OnLoad = onload

--  New build limit calls set up in config
    inst:ListenForEvent("engiebuilding", maxbuild)
end

return MakePlayerCharacter("engineer", prefabs, assets, common_postinit, master_postinit)
