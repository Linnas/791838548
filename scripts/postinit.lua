---@diagnostic disable: undefined-global

local require = GLOBAL.require
local STRINGS = GLOBAL.STRINGS

-- PostInit ------------------------------

if GetModConfigData("sentryh_regen") == "y" then
AddPrefabPostInit("esentry", function(inst)
	if GLOBAL.TheWorld.ismastersim then
		inst.components.health:StartRegen(20, 1)
	end
end)
end

if GetModConfigData("building_upgradeable") == "n" then
function MachinePostInit(inst)
    if GLOBAL.TheWorld.ismastersim then
		inst:AddTag("NOLEVEL")
    end
end

AddPrefabPostInit("esentry", MachinePostInit)
AddPrefabPostInit("dispenser", MachinePostInit)
end
