local require = GLOBAL.require
local SilkspoolBadge = require("widgets/silkspoolbadge")

-- Add silkspool badge to player status display
AddPlayerPostInit(function(inst)
    if not GLOBAL.TheNet:IsDedicated() then
        inst:ListenForEvent("playeractivated", function()
            -- Wait a frame to ensure the controls are fully loaded
            inst:DoTaskInTime(0, function()
                local controls = inst.HUD.controls
                if controls and controls.status and not controls.status.silkspoolbadge then
                    -- Create the silkspool badge
                    local silkspoolbadge = controls.status:AddChild(SilkspoolBadge(inst))
                    
                    -- Position to the left of the hunger badge (column2 is -40, hunger is at column2, y=20)
                    -- We want to be more to the left, so use column1 position (-80) but same y as hunger
                    silkspoolbadge:SetPosition(-120, 20, 0)
                    
                    -- Store reference
                    controls.status.silkspoolbadge = silkspoolbadge
                end
            end)
        end)
    end
end)
