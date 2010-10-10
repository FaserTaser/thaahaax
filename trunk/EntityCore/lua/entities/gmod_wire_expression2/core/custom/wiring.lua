--Some wirelink functions for entities by kna_rus

local function isWire(entity)
	if(entity.IsWire and entity.IsWire == true) then return true end
	if(entity.Inputs != nil or entity.Outputs != nil) then return true end
	if(entity.inputs != nil or entity.outputs != nil) then return true end
	return false
end

__e2setcost(5)

/******************************************************************************/

--- Returns a wirelink for that entity. Automatically creates output if there isn't any.
e2function wirelink entity:getWirelink()
	if !validEntity(this) then return end
	if !isWire(this) then return end
	if !isOwner(self,this) then return end
	if !this.extended then this.extended = true
		RefreshSpecialOutputs(this) end
	return this
end

/******************************************************************************/

--- Makes a wirelink output on entity.
e2function number entity:makeWirelink()
	if !validEntity(this) then return 0 end
	if !isWire(this) then return end
	if !isOwner(self,this) then return 0 end
	if this.extended then return 0 end
	this.extended = true
	RefreshSpecialOutputs(this)
	return 1
end

--- Removes wirelink output from entity.
e2function number entity:removeWirelink()
	if !validEntity(this) then return 0 end
	if !isWire(this) then return end
	if !isOwner(self,this) then return 0 end
	if !this.extended then return 0 end
	this.extended = false
	RefreshSpecialOutputs(this)
	return 1
end

__e2setcost(nil)