---@diagnostic disable: undefined-global

local require = GLOBAL.require
local STRINGS = GLOBAL.STRINGS

-- Recipes ------------------------------

--Scrap
local recipe_difficulty = GetModConfigData("Scrap_Difficulty")
if recipe_difficulty == "default" then
--local scrap = AddRecipe("scrap", {Ingredient("flint", 2), Ingredient("twigs", 2)}, engietab, GLOBAL.TECH.NONE, nil, nil, nil, 5, "engie", "images/inventoryimages/scrap.xml", "scrap.tex")
AddRecipe2("scrap", 				{Ingredient("flint", 2), Ingredient("twigs", 2)},				GLOBAL.TECH.NONE,				{builder_tag="engie", numtogive = 5, atlas = "images/engineeritemimages.xml", image = "scrap.tex"},				{"CHARACTER", "REFINE"})

elseif recipe_difficulty == "easy" then 
AddRecipe2("scrap", 				{Ingredient("flint", 1), Ingredient("twigs", 1)},				GLOBAL.TECH.NONE,				{builder_tag="engie", numtogive = 5, atlas = "images/engineeritemimages.xml"},				{"CHARACTER", "REFINE"})
elseif recipe_difficulty == "easier" then 
AddRecipe2("scrap", 				{Ingredient("flint", 1)},				GLOBAL.TECH.NONE,				{builder_tag="engie", numtogive = 5, atlas = "images/engineeritemimages.xml"},				{"CHARACTER", "REFINE"})
elseif recipe_difficulty == "hard" then 
AddRecipe2("scrap", 				{Ingredient("flint", 3), Ingredient("twigs", 3), Ingredient("goldnugget", 1)},				GLOBAL.TECH.NONE,				{builder_tag="engie", numtogive = 5, atlas = "images/engineeritemimages.xml"},				{"CHARACTER", "REFINE"})
elseif recipe_difficulty == "harder" then 
AddRecipe2("scrap", 				{Ingredient("flint", 4), Ingredient("twigs", 4), Ingredient("transistor", 1)},				GLOBAL.TECH.NONE,				{builder_tag="engie", numtogive = 5, atlas = "images/engineeritemimages.xml"},				{"CHARACTER", "REFINE"})
end

--Hard Hat
local recipe_difficulty = GetModConfigData("EHat_Difficulty")
if recipe_difficulty == "default" then
--local ehardhat = AddRecipe("ehardhat", {Ingredient("scrap", 4, "images/inventoryimages/scrap.xml"), Ingredient("goldnugget", 2)}, engietab, GLOBAL.TECH.NONE, nil, nil, nil, nil, "engie", "images/inventoryimages/ehardhat.xml", "ehardhat.tex")
AddRecipe2("ehardhat", 				{Ingredient("scrap", 5, "images/engineeritemimages.xml"), Ingredient("goldnugget", 2)},				GLOBAL.TECH.NONE,				{builder_tag="engie", atlas = "images/engineeritemimages.xml"},				{"CHARACTER", "ARMOUR"})

elseif recipe_difficulty == "easy" then 
AddRecipe2("ehardhat", 				{Ingredient("scrap", 1, "images/engineeritemimages.xml"), Ingredient("goldnugget", 1)},				GLOBAL.TECH.NONE,				{builder_tag="engie", atlas = "images/engineeritemimages.xml"},				{"CHARACTER", "ARMOUR"})
elseif recipe_difficulty == "hard" then 
AddRecipe2("ehardhat", 				{Ingredient("scrap", 6, "images/engineeritemimages.xml"), Ingredient("goldnugget", 3)},				GLOBAL.TECH.NONE,				{builder_tag="engie", atlas = "images/engineeritemimages.xml"},				{"CHARACTER", "ARMOUR"})
elseif recipe_difficulty == "harder" then 
AddRecipe2("ehardhat", 				{Ingredient("scrap", 10, "images/engineeritemimages.xml"), Ingredient("goldnugget", 4), Ingredient("strawhat", 1)},				GLOBAL.TECH.NONE,				{builder_tag="engie", atlas = "images/engineeritemimages.xml"},				{"CHARACTER", "ARMOUR"})
end

--Wrench
local recipe_difficulty = GetModConfigData("tf2Wrench_Difficulty")
if recipe_difficulty == "default" then
--local tf2wrench = AddRecipe("tf2wrench", {Ingredient("scrap", 5, "images/inventoryimages/scrap.xml"), Ingredient("twigs", 2), Ingredient("goldnugget", 1)}, engietab, GLOBAL.TECH.NONE, nil, nil, nil, nil, "engie", "images/inventoryimages/tf2wrench.xml", "tf2wrench.tex")
AddRecipe2("tf2wrench", 				{Ingredient("scrap", 5, "images/engineeritemimages.xml"), Ingredient("twigs", 3)},				GLOBAL.TECH.NONE,				{builder_tag="engie", atlas = "images/engineeritemimages.xml"},				{"CHARACTER", "TOOLS"})

elseif recipe_difficulty == "easy" then 
AddRecipe2("tf2wrench", 				{Ingredient("scrap", 3, "images/engineeritemimages.xml")},				GLOBAL.TECH.NONE,				{builder_tag="engie", atlas = "images/engineeritemimages.xml"},				{"CHARACTER", "TOOLS"})
elseif recipe_difficulty == "hard" then 
AddRecipe2("tf2wrench", 				{Ingredient("scrap", 10, "images/engineeritemimages.xml"), Ingredient("twigs", 5), Ingredient("goldnugget", 2)},				GLOBAL.TECH.NONE,				{builder_tag="engie", atlas = "images/engineeritemimages.xml"},				{"CHARACTER", "TOOLS"})
elseif recipe_difficulty == "harder" then 
AddRecipe2("tf2wrench", 				{Ingredient("scrap", 15, "images/engineeritemimages.xml"), Ingredient("twigs", 10), Ingredient("gears", 1)},				GLOBAL.TECH.NONE,				{builder_tag="engie", atlas = "images/engineeritemimages.xml"},				{"CHARACTER", "TOOLS"})
end

--Sentry
local recipe_difficulty = GetModConfigData("Sentry_Difficulty")
if recipe_difficulty == "default" then
--local esentry_item = AddRecipe("esentry", {Ingredient("scrap", 20, "images/inventoryimages/scrap.xml"), Ingredient("gears", 3)}, engietab, GLOBAL.TECH.SCIENCE_ONE, nil, nil, nil, nil, "engieturret", "images/inventoryimages/esentry.xml", "esentry.tex")
AddRecipe2("esentry", 				{Ingredient("scrap", 20, "images/engineeritemimages.xml"), Ingredient("gears", 3)},				GLOBAL.TECH.SCIENCE_ONE,				{builder_tag="engieturret", atlas = "images/engineeritemimages.xml"},				{"CHARACTER", "WEAPONS", "STRUCTURES"})

elseif recipe_difficulty == "hard" then
AddRecipe2("esentry", 				{Ingredient("scrap", 30, "images/engineeritemimages.xml"), Ingredient("gears", 5), Ingredient("transistor",5)},				GLOBAL.TECH.SCIENCE_ONE,				{builder_tag="engieturret", atlas = "images/engineeritemimages.xml"},				{"CHARACTER", "WEAPONS", "STRUCTURES"})
elseif recipe_difficulty == "harder" then
AddRecipe2("esentry", 				{Ingredient("scrap", 40, "images/engineeritemimages.xml"), Ingredient("gears", 6), Ingredient("gunpowder",5)},				GLOBAL.TECH.SCIENCE_TWO,				{builder_tag="engieturret", atlas = "images/engineeritemimages.xml"},				{"CHARACTER", "WEAPONS", "STRUCTURES"})
elseif recipe_difficulty == "easy" then
AddRecipe2("esentry", 				{Ingredient("scrap", 10, "images/engineeritemimages.xml"), Ingredient("gears", 1)},				GLOBAL.TECH.NONE,				{builder_tag="engieturret", atlas = "images/engineeritemimages.xml"},				{"CHARACTER", "WEAPONS", "STRUCTURES"})
end

----------------Dud recipes for locking limits
GLOBAL.STRINGS.NAMES.ESENTRY_DUMMY = "Sentry Gun"
GLOBAL.STRINGS.RECIPE_DESC.ESENTRY_DUMMY = "Too Many Sentries Already Built!"
--local esentry_dummy = AddRecipe("esentry_dummy", {Ingredient("esentry", 0, "images/inventoryimages/esentry.xml")}, engietab, GLOBAL.TECH.SCIENCE_ONE, nil, nil, nil, nil, "engiesentrydummy", "images/inventoryimages/buildinglocked.xml", "buildinglocked.tex")
AddRecipe2("esentry_dummy", 				{Ingredient("esentry", 0, "images/engineeritemimages.xml")},				GLOBAL.TECH.NONE,				{builder_tag="engiesentrydummy", atlas = "images/engineeritemimages.xml", image = "buildinglocked.tex"},				{"CHARACTER"})

--Dispenser
local recipe_difficulty = GetModConfigData("Dispenser_Difficulty")
if recipe_difficulty == "default" then
--local dispenser_item = AddRecipe("dispenser", {Ingredient("scrap", 15, "images/inventoryimages/scrap.xml"), Ingredient("redgem", 3)}, engietab, GLOBAL.TECH.SCIENCE_TWO, nil, nil, nil, nil, "engiedis", "images/inventoryimages/dispenser.xml", "dispenser.tex")
AddRecipe2("dispenser", 				{Ingredient("scrap", 15, "images/engineeritemimages.xml"), Ingredient("redgem", 3)},				GLOBAL.TECH.SCIENCE_TWO,				{builder_tag="engiedis", atlas = "images/engineeritemimages.xml"},				{"CHARACTER", "RESTORATION", "STRUCTURES"})

elseif recipe_difficulty == "hard" then
AddRecipe2("dispenser", 				{Ingredient("scrap", 25, "images/engineeritemimages.xml"), Ingredient("redgem", 5), Ingredient("transistor",5)},				GLOBAL.TECH.SCIENCE_TWO,				{builder_tag="engiedis", atlas = "images/engineeritemimages.xml"},				{"CHARACTER", "RESTORATION", "STRUCTURES"})
elseif recipe_difficulty == "harder" then
AddRecipe2("dispenser", 				{Ingredient("scrap", 35, "images/engineeritemimages.xml"), Ingredient("redgem", 10), Ingredient("gears",5)},				GLOBAL.TECH.SCIENCE_TWO,				{builder_tag="engiedis", atlas = "images/engineeritemimages.xml"},				{"CHARACTER", "RESTORATION", "STRUCTURES"})
elseif recipe_difficulty == "easy" then
AddRecipe2("dispenser", 				{Ingredient("scrap", 10, "images/engineeritemimages.xml"), Ingredient("redgem", 1)},				GLOBAL.TECH.SCIENCE_ONE,				{builder_tag="engiedis", atlas = "images/engineeritemimages.xml"},				{"CHARACTER", "RESTORATION", "STRUCTURES"})
end

GLOBAL.STRINGS.NAMES.DISPENSER_DUMMY = "Dispenser"
GLOBAL.STRINGS.RECIPE_DESC.DISPENSER_DUMMY = "Too Many Dispensers Already Built!"
--local dispenser_dummy = AddRecipe("dispenser_dummy", {Ingredient("dispenser", 0, "images/inventoryimages/dispenser.xml")}, engietab, GLOBAL.TECH.SCIENCE_ONE, nil, nil, nil, nil, "engiedispenserdummy", "images/inventoryimages/buildinglocked.xml", "buildinglocked.tex")
AddRecipe2("dispenser_dummy", 				{Ingredient("dispenser", 0, "images/engineeritemimages.xml")},				GLOBAL.TECH.NONE,				{builder_tag="engiedispenserdummy", atlas = "images/engineeritemimages.xml", image = "buildinglocked.tex"},				{"CHARACTER"})

--Teleporter
local recipe_difficulty = GetModConfigData("Teleporter_Difficulty")
if recipe_difficulty == "default" then
--local eteleporter_item = AddRecipe("eteleporter", {Ingredient("scrap", 15, "images/inventoryimages/scrap.xml"), Ingredient("nightmarefuel", 10)}, engietab, GLOBAL.TECH.MAGIC_TWO, nil, nil, nil, nil, "engietelenter", "images/inventoryimages/eteleporter.xml", "eteleporter.tex")
AddRecipe2("eteleporter", 				{Ingredient("scrap", 15, "images/engineeritemimages.xml"), Ingredient("nightmarefuel", 10)},				GLOBAL.TECH.MAGIC_TWO,				{builder_tag="engietelenter", atlas = "images/engineeritemimages.xml"},				{"CHARACTER", "MAGIC", "STRUCTURES"})

elseif recipe_difficulty == "hard" then
AddRecipe2("eteleporter", 				{Ingredient("scrap", 25, "images/engineeritemimages.xml"), Ingredient("nightmarefuel", 12), Ingredient("marble",5)},				GLOBAL.TECH.MAGIC_TWO,				{builder_tag="engietelenter", atlas = "images/engineeritemimages.xml"},				{"CHARACTER", "MAGIC", "STRUCTURES"})
elseif recipe_difficulty == "harder" then
AddRecipe2("eteleporter", 				{Ingredient("scrap", 30, "images/engineeritemimages.xml"), Ingredient("nightmarefuel", 15), Ingredient("orangegem",1)},				GLOBAL.TECH.MAGIC_TWO,				{builder_tag="engietelenter", atlas = "images/engineeritemimages.xml"},				{"CHARACTER", "MAGIC", "STRUCTURES"})
elseif recipe_difficulty == "easy" then
AddRecipe2("eteleporter", 				{Ingredient("scrap", 10, "images/engineeritemimages.xml"), Ingredient("nightmarefuel", 5)},				GLOBAL.TECH.SCIENCE_TWO,				{builder_tag="engietelenter", atlas = "images/engineeritemimages.xml"},				{"CHARACTER", "MAGIC", "STRUCTURES"})
end

--Exit
local recipe_difficulty = GetModConfigData("Teleporter_Difficulty")
if recipe_difficulty == "default" then
--local eteleporter_exit_item = AddRecipe("eteleporter_exit", {Ingredient("scrap", 15, "images/inventoryimages/scrap.xml"), Ingredient("nightmarefuel", 10)}, engietab, GLOBAL.TECH.MAGIC_TWO, nil, nil, nil, nil, "engietelexit", "images/inventoryimages/eteleporter.xml", "eteleporter.tex")
AddRecipe2("eteleporter_exit", 				{Ingredient("scrap", 15, "images/engineeritemimages.xml"), Ingredient("nightmarefuel", 10)},				GLOBAL.TECH.MAGIC_TWO,				{builder_tag="engietelexit", atlas = "images/engineeritemimages.xml"},				{"CHARACTER", "MAGIC", "STRUCTURES"})

elseif recipe_difficulty == "hard" then
AddRecipe2("eteleporter_exit", 				{Ingredient("scrap", 25, "images/engineeritemimages.xml"), Ingredient("nightmarefuel", 12), Ingredient("marble",5)},				GLOBAL.TECH.MAGIC_TWO,				{builder_tag="engietelexit", atlas = "images/engineeritemimages.xml"},				{"CHARACTER", "MAGIC", "STRUCTURES"})
elseif recipe_difficulty == "harder" then
AddRecipe2("eteleporter_exit", 				{Ingredient("scrap", 30, "images/engineeritemimages.xml"), Ingredient("nightmarefuel", 15), Ingredient("orangegem",1)},				GLOBAL.TECH.MAGIC_TWO,				{builder_tag="engietelexit", atlas = "images/engineeritemimages.xml"},				{"CHARACTER", "MAGIC", "STRUCTURES"})
elseif recipe_difficulty == "easy" then
AddRecipe2("eteleporter_exit", 				{Ingredient("scrap", 10, "images/engineeritemimages.xml"), Ingredient("nightmarefuel", 5)},				GLOBAL.TECH.SCIENCE_TWO,				{builder_tag="engietelexit", atlas = "images/engineeritemimages.xml"},				{"CHARACTER", "MAGIC", "STRUCTURES"})
end


GLOBAL.STRINGS.NAMES.ETELEPORTER_DUMMY = "Teleporter Entrance"
GLOBAL.STRINGS.RECIPE_DESC.ETELEPORTER_DUMMY = "Too Many Entrances Already Built!"
--local eteleporter_dummy = AddRecipe("eteleporter_dummy", {Ingredient("eteleporter", 0, "images/inventoryimages/eteleporter.xml")}, engietab, GLOBAL.TECH.SCIENCE_ONE, nil, nil, nil, nil, "engietelenterdummy", "images/inventoryimages/buildinglocked.xml", "buildinglocked.tex")
AddRecipe2("eteleporter_dummy", 				{Ingredient("eteleporter", 0, "images/engineeritemimages.xml")},				GLOBAL.TECH.NONE,				{builder_tag="engietelenterdummy", atlas = "images/engineeritemimages.xml", image = "buildinglocked.tex"},				{"CHARACTER"})

GLOBAL.STRINGS.NAMES.ETELEPORTER_EXIT_DUMMY = "Teleporter Exit"
GLOBAL.STRINGS.RECIPE_DESC.ETELEPORTER_EXIT_DUMMY = "Too Many Exits Already Built!"
--local eteleporter_exit_dummy = AddRecipe("eteleporter_exit_dummy", {Ingredient("eteleporter_exit", 0, "images/inventoryimages/eteleporter_exit.xml")}, engietab, GLOBAL.TECH.SCIENCE_ONE, nil, nil, nil, nil, "engietelexitdummy", "images/inventoryimages/buildinglocked.xml", "buildinglocked.tex")
AddRecipe2("eteleporter_exit_dummy", 				{Ingredient("eteleporter_exit", 0, "images/engineeritemimages.xml")},				GLOBAL.TECH.NONE,				{builder_tag="engietelexitdummy", atlas = "images/engineeritemimages.xml", image = "buildinglocked.tex"},				{"CHARACTER"})


--Gibus
-- Craftable for everyone for all your Gibus needs.
--local gibus = AddRecipe("gibus", {Ingredient("silk", 2), Ingredient("charcoal", 2)}, GLOBAL.RECIPETABS.DRESS, GLOBAL.TECH.SCIENCE_NONE, nil, nil, nil, nil, nil, "images/inventoryimages/gibus.xml")
AddRecipe2("gibus", 				{Ingredient("silk", 2), Ingredient("charcoal", 2)},				GLOBAL.TECH.NONE,				{atlas = "images/engineeritemimages.xml"},				{"CLOTHING"})

--Deconstruction PDA
--AddRecipe2("destructionpda", 				{Ingredient("scrap", 10, "images/inventoryimages/scrap.xml")},				GLOBAL.TECH.NONE,				{builder_tag="engie", atlas = "images/inventoryimages/destructionpda.xml", image = "destructionpda.tex"},				{"CHARACTER"})
local recipe_difficulty = GetModConfigData("pda_Difficulty")
if recipe_difficulty == "default" then
AddRecipe2("destructionpda", 				{Ingredient("scrap", 15, "images/engineeritemimages.xml")},				GLOBAL.TECH.NONE,				{builder_tag="engie", atlas = "images/engineeritemimages.xml"},				{"CHARACTER"})

elseif recipe_difficulty == "easy" then 
AddRecipe2("destructionpda", 				{Ingredient("scrap", 5, "images/engineeritemimages.xml")},				GLOBAL.TECH.NONE,				{builder_tag="engie", atlas = "images/engineeritemimages.xml"},				{"CHARACTER"})
elseif recipe_difficulty == "hard" then 
AddRecipe2("destructionpda", 				{Ingredient("scrap", 20, "images/engineeritemimages.xml"), Ingredient("gears", 2)},				GLOBAL.TECH.NONE,				{builder_tag="engie", atlas = "images/engineeritemimages.xml"},				{"CHARACTER"})
elseif recipe_difficulty == "harder" then 
AddRecipe2("destructionpda", 				{Ingredient("scrap", 25, "images/engineeritemimages.xml"), Ingredient("gears", 5), Ingredient("gunpowder", 3)},				GLOBAL.TECH.ONE,				{builder_tag="engie", atlas = "images/engineeritemimages.xml"},				{"CHARACTER"})
end
