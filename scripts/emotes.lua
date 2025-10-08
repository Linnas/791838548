---@diagnostic disable: undefined-global

local require = GLOBAL.require
local STRINGS = GLOBAL.STRINGS

-- Emotes ----------------------------
local ranchocommands = { "ranchorelaxo", "relaxo", "engineer" }

GLOBAL.AddModUserCommand("ranchorelaxo", "rancho", {
	aliases = ranchocommands,
	prettyname = function(command) return "engineer emote" end,
	desc = function() return "Perform an emote!" end,
	permission = "USER",
	params = {},
	emote = true,
	slash = true,
	usermenu = false,
	servermenu = false,
	vote = false,
    serverfn = function(params, caller)
		local player = GLOBAL.UserToPlayer(caller.userid)
		if player ~= nil and player.prefab == "engineer" then
				player:PushEvent("emote", { anim = { "pre_rancho", "loop_rancho" }, loop = true })
		end
    end,
    localfn = function(params, caller)
		local player = GLOBAL.UserToPlayer(caller.userid)
		if player ~= nil and player.prefab == "engineer" then
				player:PushEvent("emote", { anim = { "pre_rancho", "loop_rancho" }, loop = true })
		end
	end,
})

local kazotskycommands = { "kazotsky", "kazotsky kick", "woowee" }
GLOBAL.AddModUserCommand("kazotsky", "kazotskykick", {
	aliases = kazotskycommands,
	prettyname = function(command) return "engineer emote" end,
	desc = function() return "Perform an emote!" end,
	permission = "USER",
	params = {},
	emote = true,
	slash = true,
	usermenu = false,
	servermenu = false,
	vote = false,
    serverfn = function(params, caller)
		local player = GLOBAL.UserToPlayer(caller.userid)
		if player ~= nil and player.prefab == "engineer" then
				player:PushEvent("emote", { anim = { "kazotsky_pre", "kazotsky_quick_loop" }, loop = true })
		end
    end,
    localfn = function(params, caller)
		local player = GLOBAL.UserToPlayer(caller.userid)
		if player ~= nil and player.prefab == "engineer" then
				player:PushEvent("emote", { anim = { "kazotsky_pre", "kazotsky_quick_loop" }, loop = true })
		end
	end,
})
