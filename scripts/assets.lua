---@diagnostic disable: undefined-global

local require = GLOBAL.require
local STRINGS = GLOBAL.STRINGS

PrefabFiles = {
	"scrap",
	"engineer",
	"engineer_skins",
	"esentry",
	"dispenser",
	"eteleporter",
	"eteleporter_exit",
	"tf2wrench",
	"gibus",
	"ehardhat",
	"esentry_bullet",
	"esentry_rocket",
	"destructionpda",
}

Assets = {
    Asset( "IMAGE", "bigportraits/engineer.tex" ),
    Asset( "ATLAS", "bigportraits/engineer.xml" ),
	Asset( "IMAGE", "bigportraits/engineer_none.tex" ),
    Asset( "ATLAS", "bigportraits/engineer_none.xml" ),
	--Skins
	Asset( "IMAGE", "bigportraits/engineer_blu.tex" ),
    Asset( "ATLAS", "bigportraits/engineer_blu.xml" ),
	Asset( "IMAGE", "bigportraits/engineer_formal.tex" ),
    Asset( "ATLAS", "bigportraits/engineer_formal.xml" ),
	Asset( "IMAGE", "bigportraits/engineer_survivor.tex" ),
    Asset( "ATLAS", "bigportraits/engineer_survivor.xml" ),
	Asset( "IMAGE", "bigportraits/engineer_shadow.tex" ),
    Asset( "ATLAS", "bigportraits/engineer_shadow.xml" ),
	Asset( "IMAGE", "bigportraits/engineer_rose.tex" ),
    Asset( "ATLAS", "bigportraits/engineer_rose.xml" ),
	--
    Asset( "IMAGE", "images/avatars/avatar_engineer.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_engineer.xml" ),
    Asset( "IMAGE", "images/avatars/avatar_ghost_engineer.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_ghost_engineer.xml" ),
    Asset( "IMAGE", "images/avatars/self_inspect_engineer.tex" ),
    Asset( "ATLAS", "images/avatars/self_inspect_engineer.xml" ),
	
    Asset( "IMAGE", "images/names_engineer.tex" ),
    Asset( "ATLAS", "images/names_engineer.xml" ),
	Asset( "IMAGE", "images/names_gold_engineer.tex" ),
    Asset( "ATLAS", "images/names_gold_engineer.xml" ),
	
	Asset("IMAGE", "images/minimap/esentry.tex"),
    Asset("ATLAS", "images/minimap/esentry.xml"),
	Asset("IMAGE", "images/minimap/esentry_2.tex"),
    Asset("ATLAS", "images/minimap/esentry_2.xml"),
	Asset("IMAGE", "images/minimap/esentry_3.tex"),
    Asset("ATLAS", "images/minimap/esentry_3.xml"),
    Asset("IMAGE", "images/minimap/dispenser.tex"),
    Asset("ATLAS", "images/minimap/dispenser.xml"),
    Asset("IMAGE", "images/minimap/eteleporter.tex"),
    Asset("ATLAS", "images/minimap/eteleporter.xml"),
	Asset("IMAGE", "images/minimap/eteleporterentrance.tex"),
    Asset("ATLAS", "images/minimap/eteleporterentrance.xml"),
	Asset("IMAGE", "images/minimap/eteleporterexit.tex"),
    Asset("ATLAS", "images/minimap/eteleporterexit.xml"),
	Asset( "IMAGE", "images/minimap/engineer.tex" ),
    Asset( "ATLAS", "images/minimap/engineer.xml" ),

    Asset("IMAGE", "images/engineeritemimages.tex"),
    Asset("ATLAS", "images/engineeritemimages.xml"),
    Asset("ATLAS_BUILD", "images/engineeritemimages.xml", 256),

    -- UI assets for silkspool badge
    Asset("IMAGE", "images/ui/silkspool_ui.tex"),
    Asset("ATLAS", "images/ui/silkspool_ui.xml"),
    Asset("ATLAS_BUILD", "images/ui/silkspool_ui.xml", 128),

--	Asset("ATLAS", "images/hud/engietab.xml" ),
--	Asset("IMAGE", "images/hud/engietab.tex"),

	Asset( "IMAGE", "images/crafting_menu_avatars/avatar_engineer.tex" ),
    Asset( "ATLAS", "images/crafting_menu_avatars/avatar_engineer.xml" ),

	Asset( "ANIM", "anim/emote_rancho.zip" ),
	Asset( "ANIM", "anim/player_idles_engineer.zip" ),
}

local ITEMS = {
    "scrap",
    "destructionpda",
    "tf2wrench",
    "ehardhat",
    "gibus",
    "esentry_item",
	"esentry",
	"dispenser",
	"eteleporter",
	"eteleporter_exit",
	"buildinglocked",
}

for _, item in ipairs(ITEMS) do
	RegisterInventoryItemAtlas(GLOBAL.resolvefilepath("images/engineeritemimages.xml"), item..".tex")
end

GLOBAL.ENGINEERITEMIMAGES = MODROOT.."images/engineeritemimages.xml"
