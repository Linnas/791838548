---@diagnostic disable: undefined-global

local require = GLOBAL.require
local STRINGS = GLOBAL.STRINGS
local TimeEvent = GLOBAL.TimeEvent
local FRAMES = GLOBAL.FRAMES
local EventHandler = GLOBAL.EventHandler
local State = GLOBAL.State

-- Stategraph ----------------------------

AddStategraphActionHandler("wilson", GLOBAL.ActionHandler(GLOBAL.ACTIONS.ENGIETELEPORT, "doshortaction"))
AddStategraphActionHandler("wilson_client", GLOBAL.ActionHandler(GLOBAL.ACTIONS.ENGIETELEPORT, "doshortaction"))

AddStategraphActionHandler("wilson", GLOBAL.ActionHandler(GLOBAL.ACTIONS.ENGIEWORKABLE, --Workaround for previous hammer conflicts ect
        function(inst)
            if inst:HasTag("beaver") then
                return not inst.sg:HasStateTag("gnawing") and "gnaw" or nil
            end
            return not inst.sg:HasStateTag("prehammer")
                and (inst.sg:HasStateTag("hammering") and
                    "hammer" or
                    "hammer_start")
                or nil
end))

AddStategraphActionHandler("wilson_client", GLOBAL.ActionHandler(GLOBAL.ACTIONS.ENGIEWORKABLE,
        function(inst)
            if inst:HasTag("beaver") then
                return not inst.sg:HasStateTag("gnawing") and "gnaw" or nil
            end
            return not inst.sg:HasStateTag("prehammer") and "hammer_start" or nil
end))

function EngieSGPostInit(inst)
	local _castspell_actionhandler = inst.actionhandlers[GLOBAL.ACTIONS.CASTSPELL].deststate
	inst.actionhandlers[GLOBAL.ACTIONS.CASTSPELL].deststate = function(inst, action, ...)
		return action.invobject ~= nil
            and ( (action.invobject:HasTag("engiepda") and "engiepdacastspell")
				or _castspell_actionhandler(inst, action, ...)
				)
	end
end
AddStategraphPostInit("wilson", EngieSGPostInit)
AddStategraphPostInit("wilson_client", EngieSGPostInit)

AddStategraphState("wilson",
    State{
        name = "engiepdacastspell",
        tags = { "doing", "busy", "canrotate"  },

        onenter = function(inst)
            inst.AnimState:PlayAnimation("useitem_pre")
            inst.AnimState:PushAnimation("pocketwatch_portal", false)

            inst.components.locomotor:Stop()

            local watch = inst.bufferedaction ~= nil and inst.bufferedaction.invobject
			if watch ~= nil then
		        inst.AnimState:OverrideSymbol("watchprop", watch.AnimState:GetBuild(), "pdaprop")
			end

        end,

        timeline =
        {
            TimeEvent(18 * FRAMES, function(inst)
				if not inst:PerformBufferedAction() then
	                inst.SoundEmitter:PlaySound("dontstarve/wilson/hit")
				else
	                inst.SoundEmitter:PlaySound("yotb_2021/common/heel_click")
                end
            end),
        },

        events =
        {
            EventHandler("animqueueover", function(inst)
                if inst.AnimState:AnimDone() then
		            inst.AnimState:PlayAnimation("useitem_pst", false)
					inst.sg:GoToState("idle", true)
                end
            end),
        },        
    }
)

AddStategraphState("wilson_client",
    State{
        name = "engiepdacastspell",
        tags = { "doing", "busy", "canrotate"  },

        onenter = function(inst)
            inst.components.locomotor:Stop()
            inst.AnimState:PlayAnimation("useitem_pre")
            inst.AnimState:PushAnimation("useitem_lag", false)

            inst:PerformPreviewBufferedAction()
            inst.sg:SetTimeout(2)
        end,   

        onupdate = function(inst)
            if inst:HasTag("doing") then
                if inst.entity:FlattenMovementPrediction() then
                    inst.sg:GoToState("idle", "noanim")
                end
            elseif inst.bufferedaction == nil then
                inst.sg:GoToState("idle")
            end
        end,

        ontimeout = function(inst)
            inst:ClearBufferedAction()
            inst.sg:GoToState("idle")
        end,
    }
)
