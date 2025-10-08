local Silkspool = Class(function(self, inst)
    self.inst = inst
    self.max = 100
    self.current = 0
    self.silkperhit = 1
    
    -- Network variables
    self.networkvar = net_byte(self.inst.GUID, "silkspool._current", "silkspooldirty")
    self.networkvar:set(self.current)
    
    -- Listen for change events
    self.inst:ListenForEvent("silkspooldirty", function()
        self.current = self.networkvar:value()
        if self.onchangedfn then
            self.onchangedfn(self.inst, self.current)
        end
    end)
end)

function Silkspool:SetMax(max)
    self.max = max
    if self.current > max then
        self:SetCurrent(max)
    end
end

function Silkspool:SetCurrent(amount)
    local old = self.current
    self.current = math.max(0, math.min(amount, self.max))
    self.networkvar:set(self.current)
    
    if self.onchangedfn then
        self.onchangedfn(self.inst, self.current)
    end
end

function Silkspool:DoDelta(delta)
    self:SetCurrent(self.current + delta)
end

function Silkspool:GetCurrent()
    return self.current
end

function Silkspool:GetMax()
    return self.max
end

function Silkspool:GetPercent()
    return self.current / self.max
end

function Silkspool:IsEmpty()
    return self.current <= 0
end

function Silkspool:IsFull()
    return self.current >= self.max
end

function Silkspool:OnEntityAttacked(attacker, target)
    if attacker == self.inst and target and target.components.health then
        self:DoDelta(self.silkperhit)
    end
end

function Silkspool:OnRemoveEntity()
    self.inst:RemoveEventCallback("onattackother", self._onattackotherfn, self.inst) 
end

function Silkspool:OnLoad(data)
    if data and data.current then
        self:SetCurrent(data.current)
    end
end

function Silkspool:OnSave(data)
    data.current = self.current
end

function Silkspool:SetOnChangeFn(fn)
    self.onchangedfn = fn
end

function Silkspool:Initialize()
    self._onattackotherfn = function(inst, data) self:OnEntityAttacked(inst, data.target) end
    self.inst:ListenForEvent("onattackother", self._onattackotherfn, self.inst)
end

return Silkspool
