---@diagnostic disable: undefined-global

local require = GLOBAL.require
local STRINGS = GLOBAL.STRINGS

-- Actions ------------------------------

local ENGIETELEPORT = AddAction("ENGIETELEPORT", "Enter", function(act)
	if act.doer ~= nil and act.target ~= nil and act.doer:HasTag("player") and act.target.components.engieteleporter and act.target:HasTag("eteleporter_enter") then
		act.target.components.engieteleporter.boundEntrance = act.target
		act.target.components.engieteleporter:TeleportAction(act.doer)
		if act.doer.components.sanity and not act.doer:HasTag("engie") then
            act.doer.components.sanity:DoDelta(-TUNING.ETELEPORT_PENALTY)
	    end
		return true
	end
end)
--ENGIETELEPORT.ghost_valid = true
ENGIETELEPORT.encumbered_valid = true
ENGIETELEPORT.mount_valid = true

local ENGIEWORKABLE = GLOBAL.Action()
ENGIEWORKABLE.id = "ENGIEWORKABLE"
ENGIEWORKABLE.str = {
    GENERIC = "Repair",
    DISPENSER = "Refuel",
	SENTRY = "Reload",
	SENTRY_LVL = "Reload/Upgrade",
	DISPENSER_LVL = "Refuel/Upgrade",
}
ENGIEWORKABLE.strfn = function(act)
	if act.target ~= nil then
		if act.target.prefab == "esentry" and act.target:HasTag("lvl3") then
			return "SENTRY"
		elseif act.target.prefab == "esentry" and not act.target:HasTag("lvl3") then
			return "SENTRY_LVL"
		elseif act.target.prefab == "dispenser" and act.target:HasTag("lvl3") then
			return "DISPENSER"
		elseif act.target.prefab == "dispenser" and not act.target:HasTag("lvl3") then
			return "DISPENSER_LVL"
		--elseif act.target.components.health ~= nil and act.target.components.health.currenthealth ~= act.target.components.health.maxhealth then
		--	return "GENERIC"
		end
	end
end

ENGIEWORKABLE.fn = function(act)
	if act.doer ~= nil and act.target ~= nil and act.doer:HasTag("player") and act.target.components.engieworkable then
		act.target.components.workable:WorkedBy(act.doer, 0)
		return true
	end
end
AddAction(ENGIEWORKABLE)
--[[
AddAction("ENGIEWORKABLE", "Repair/Reload", function(act)
	if act.doer ~= nil and act.target ~= nil and act.doer:HasTag("player") and act.target.components.engieworkable then
		act.target.components.workable:WorkedBy(act.doer, 0)
		return true
	end
end)--]]

GLOBAL.ACTIONS.PICKUP.oldfn = GLOBAL.ACTIONS.PICKUP.fn --Cheat to make non-engineers not able to toss them about
GLOBAL.ACTIONS.PICKUP.fn = function(act)
	if act.doer ~= nil and act.target ~= nil then
	if act.target:HasTag("ebuild") and not act.doer:HasTag("engie") then
		return false, "RESTRICTION"
	elseif act.target.dispenserID and act.target.dispenserID ~= act.doer.engieID and act.doer:HasTag("engie") then
		return false, "RESTRICTION_ENGINEER"
	elseif act.target.turretID and act.target.turretID ~= act.doer.engieID and act.doer:HasTag("engie") then
		return false, "RESTRICTION_ENGINEER"
	elseif act.target.telenterID and act.target.telenterID ~= act.doer.engieID and act.doer:HasTag("engie") then
		return false, "RESTRICTION_ENGINEER"
	elseif act.target.telexitID and act.target.telexitID ~= act.doer.engieID and act.doer:HasTag("engie") then
		return false, "RESTRICTION_ENGINEER"
	else
		return GLOBAL.ACTIONS.PICKUP.oldfn(act) 
	end
	end
end

-- Component actions ---------------------

AddComponentAction("SCENE", "engieteleporter", function(inst, doer, actions, right)
	if inst:HasTag("eteleporter_enter") then
		table.insert(actions, GLOBAL.ACTIONS.ENGIETELEPORT)
	end
end)

AddComponentAction("SCENE", "engieworkable", function(inst, doer, actions, right)
	if (inst:HasTag("ebuild_wrenchable") and doer.replica.inventory:GetEquippedItem(GLOBAL.EQUIPSLOTS.HANDS) ~= nil and doer.replica.inventory:GetEquippedItem(GLOBAL.EQUIPSLOTS.HANDS).prefab == "tf2wrench") then
		    table.insert(actions, GLOBAL.ACTIONS.ENGIEWORKABLE)
	end
end)
