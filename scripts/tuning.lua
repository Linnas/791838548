---@diagnostic disable: undefined-global

local require = GLOBAL.require
local STRINGS = GLOBAL.STRINGS

-- Basic tuning values
TUNING.ENGIE_DISPENSERMAX = GetModConfigData("dispenseramount")
TUNING.ENGIE_TELEPORTERMAX = GetModConfigData("teleporteramount")
TUNING.ENGIE_SENTRYMAX = GetModConfigData("sentryamount")

TUNING.ENGIE_BUILDINGMAX = GetModConfigData("buildinglimit")
TUNING.ENGIE_SENTRYLIMIT = GetModConfigData("sentrylimit")
TUNING.ENGIE_DISPENSERLIMIT = GetModConfigData("dispenserlimit")
TUNING.ENGIE_TELEPORTERLIMIT = GetModConfigData("teleporterlimit")

TUNING.ENGIE_DMGDEBUFF = GetModConfigData("engiedmgdebuff")
TUNING.ENGIE_SCIENCEBONUS = GetModConfigData("engiesciencebonus")
TUNING.ENGIE_BUILDINGLOSS = GetModConfigData("Building_SD")
TUNING.TOOLBOX_SPEED_MULT = GetModConfigData("toolbox_penalty")
TUNING.TF2WRENCH_DAMAGE = GetModConfigData("tf2wrenchdmg")
TUNING.TF2WRENCH_USES = GetModConfigData("tf2wrenchuses")
TUNING.ARMOR_HARDHAT_ABSORPTION = GetModConfigData("hardhatabsorb")
TUNING.ARMOR_EHARDHAT = GetModConfigData("ehardhatdura")
TUNING.PDA_AMOUNT = GetModConfigData("pda_ingredientpercent")

TUNING.DISP_RANGE = GetModConfigData("disprange")
TUNING.DISP_HEALING = GetModConfigData("dispenserhealingrate")

-- Global values
GLOBAL.SENTRY_RANGE = GetModConfigData("Sentry_Range")
GLOBAL.SENTRY_DAMAGE = GetModConfigData("Sentry_Damage")
GLOBAL.SENTRY_ROF = GetModConfigData("Sentry_ROF")
GLOBAL.SENTRY_HEALTH = GetModConfigData("Sentry_Health")
GLOBAL.SENTRY_FF = GetModConfigData("sentry_ff")
GLOBAL.SENTRY_FF_WALL = GetModConfigData("sentry_ff_wall")
TUNING.SENTRY_ROCKET_DAMAGE = GetModConfigData("sentry_rocketdamage")
TUNING.SENTRY_WRENCH_HEAL = GetModConfigData("sentry_healinghit")

TUNING.ETELEPORT_PENALTY = GetModConfigData("eteleport_penalty")

-- Character stats
TUNING.ENGINEER_HEALTH = GetModConfigData("engineer_health")--125
TUNING.ENGINEER_HUNGER = GetModConfigData("engineer_hunger")--150
TUNING.ENGINEER_SANITY = GetModConfigData("engineer_sanity")--200

-- Starting items configuration
if GetModConfigData("starting_scrap") == "y" then
	TUNING.GAMEMODE_STARTING_ITEMS.DEFAULT.ENGINEER = { "tf2wrench",
	"scrap",
	"scrap",
	"scrap",
	"scrap",
	"scrap",
	"scrap",
	"scrap",
	"scrap",
	"scrap",
	"scrap",
	"scrap",
	"scrap",
	"scrap",
	"scrap",
	"scrap"
	}
elseif GetModConfigData("starting_scrap") == "z" then
		TUNING.GAMEMODE_STARTING_ITEMS.DEFAULT.ENGINEER = { "tf2wrench", "destructionpda",
	"scrap",
	"scrap",
	"scrap",
	"scrap",
	"scrap",
	"scrap",
	"scrap",
	"scrap",
	"scrap",
	"scrap",
	"scrap",
	"scrap",
	"scrap",
	"scrap",
	"scrap"
	}
else
	TUNING.GAMEMODE_STARTING_ITEMS.DEFAULT.ENGINEER = { "tf2wrench" }
end

-- Starting item image overrides
TUNING.STARTING_ITEM_IMAGE_OVERRIDE["tf2wrench"] = 
{
    atlas = "images/engineeritemimages.xml",
--    image = "tf2wrench.tex",
}
TUNING.STARTING_ITEM_IMAGE_OVERRIDE["scrap"] = 
{
    atlas = "images/engineeritemimages.xml",
--    image = "scrap.tex",
}
TUNING.STARTING_ITEM_IMAGE_OVERRIDE["destructionpda"] = 
{
    atlas = "images/engineeritemimages.xml",
--    image = "destructionpda.tex",
}

-- Lava arena configuration
if GLOBAL.TheNet:GetServerGameMode() == "lavaarena" then
TUNING.LAVAARENA_STARTING_HEALTH.ENGINEER = GetModConfigData("engineer_health")
TUNING.GAMEMODE_STARTING_ITEMS.LAVAARENA.ENGINEER = { "bacontome", "forge_woodarmor" }
end

-- Materials
GLOBAL.MATERIALS.SCRAP = "SCRAP"
