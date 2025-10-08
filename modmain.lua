---@diagnostic disable: undefined-global

local require = GLOBAL.require
local STRINGS = GLOBAL.STRINGS
local RECIPETABS = GLOBAL.RECIPETABS
local TimeEvent = GLOBAL.TimeEvent
local FRAMES = GLOBAL.FRAMES
local EventHandler = GLOBAL.EventHandler
local ActionHandler = GLOBAL.ActionHandler
local ACTIONS = GLOBAL.ACTIONS
local State = GLOBAL.State

-- Import all modularized files
modimport("scripts/assets.lua")
modimport("scripts/tuning.lua")
modimport("scripts/recipes.lua")
modimport("scripts/actions.lua")
modimport("scripts/stategraph.lua")
modimport("scripts/emotes.lua")
modimport("scripts/postinit.lua")

-- Import components
modimport("scripts/components/silkspool.lua")

-- Register the silkspool component
local Silkspool = require("components/silkspool")
AddComponent("silkspool", Silkspool)

-- Import client-side files
if not TheNet:IsDedicated() then
    modimport("scripts/clientpostinit.lua")
end

-- Skin setup
local _G = GLOBAL
local PREFAB_SKINS = _G.PREFAB_SKINS
local PREFAB_SKINS_IDS = _G.PREFAB_SKINS_IDS
local SKIN_AFFINITY_INFO = GLOBAL.require("skin_affinity_info")

GLOBAL.PREFAB_SKINS["engineer"] = {"engineer_none"}
GLOBAL.PREFAB_SKINS_IDS["engineer"] = {["engineer_none"] = 1}

modimport("scripts/strings.lua")
modimport("scripts/skins_api")

SKIN_AFFINITY_INFO.engineer = {
	"engineer_blu",
	"engineer_rose",
	"engineer_shadow",
	"engineer_formal",
	"engineer_survivor",
}

PREFAB_SKINS["engineer"] = {
	"engineer_none", 
	"engineer_blu",
	"engineer_rose",
	"engineer_shadow",
	"engineer_formal",
	"engineer_survivor",
}

PREFAB_SKINS_IDS = {}
for prefab,skins in pairs(PREFAB_SKINS) do
    PREFAB_SKINS_IDS[prefab] = {}
    for k,v in pairs(skins) do
      	  PREFAB_SKINS_IDS[prefab][v] = k
    end
end

AddSkinnableCharacter("engineer")

-- Minimap atlases
AddMinimapAtlas("images/minimap/engineer.xml")
AddMinimapAtlas("images/minimap/esentry.xml")
AddMinimapAtlas("images/minimap/esentry_2.xml")
AddMinimapAtlas("images/minimap/esentry_3.xml")
AddMinimapAtlas("images/minimap/dispenser.xml")
AddMinimapAtlas("images/minimap/eteleporterentrance.xml")
AddMinimapAtlas("images/minimap/eteleporterexit.xml")

-- Add mod character
AddModCharacter("engineer", "MALE")
