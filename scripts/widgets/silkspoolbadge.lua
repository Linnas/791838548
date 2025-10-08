local Badge = require("widgets/badge")

local SilkspoolBadge = Class(Badge, function(self, owner)
    -- Use existing status_meter with sanity icon but white/silver tint for silk
    Badge._ctor(self, nil, owner, { 0.9, 0.9, 1, 1 }, "status_sanity", false, true)
    
    self.owner = owner
    self:SetScale(0.7, 0.7, 0.7)
    
    -- Initialize values
    self.current = 0
    self.max = 100
    
    -- Start updating
    self:StartUpdating()
end)

function SilkspoolBadge:UpdateSilkspool()
    if self.owner and self.owner.components.silkspool then
        local current = self.owner.components.silkspool:GetCurrent()
        local max = self.owner.components.silkspool:GetMax()
        
        if current ~= self.current or max ~= self.max then
            self.current = current
            self.max = max
            
            -- Update the badge percent (inverted because Badge uses 1-val for fill)
            local percent = current / max
            self:SetPercent(percent, max)
            
            -- Handle warning states based on silk amount
            if percent <= 0.2 then
                self:StartWarning(1, 0.2, 0.2, 1) -- Red warning when low
            elseif percent <= 0.5 then
                self:StopWarning()
            else
                self:StopWarning()
            end
            
            -- Pulse green when gaining silk
            if current > (self.last_current or 0) then
                self:PulseGreen()
            end
            
            self.last_current = current
        end
    end
end

function SilkspoolBadge:OnUpdate(dt)
    self:UpdateSilkspool()
end

return SilkspoolBadge
