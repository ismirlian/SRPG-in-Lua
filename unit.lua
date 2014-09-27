UnitClass = {} -- the table representing the class, which will double as the metatable for the instances
UnitClass.__index = UnitClass -- failed table lookups on the instances should fallback to the class table, to get methods

-- syntax equivalent to "UnitClass.new = function..."
function UnitClass:news(owner, attack, defense, movement, health, move_func, attack_func, special_func, sprite, xpos, ypos, bullshit)
  local self = setmetatable({}, UnitClass)
  self.owner = owner
  self.attack = attack
  self.defense = defense
  self.movement = movement
  self.health = health
  self.movement_function = move_func
  self.attack_function = attack_func
  self.special_function = special_func
  self.sprite = sprite
  self.xpos = xpos
  self.ypos = ypos
  self.is_selected = false
  return self
end

function UnitClass:new(owner, unitType, xpos, ypos)
	if(unitType == 'Knight') then
		KnightSprite = 1
		return UnitClass.news(owner, 5, 5, 5, 5, 7, 7, 7, KnightSprite, KnightSprite, xpos, ypos)
	elseif unitType == 'Archer' then
		ArcherSprite = 4
		return self
	elseif unitType == 'Guardian' then
		GuardianSprite = 5
		return self
	elseif unitType == 'Mage' then
		MageSprite = 6
		return self
	end
end

-- function UnitClass.set_value(self, newval)
--   self.value = newval
-- end

-- function UnitClass.get_value(self)
--   return self.value
-- end

function UnitClass:getSpriteValue()
	print (self.sprite)
	print (self.xpos)
	return self.sprite
end

function UnitClass:getX()
	return self.xpos
end

function UnitClass:getY()
	return self.ypos
end

function UnitClass:normalMovement(movement)

end

function UnitClass:adjacentAttack(attack)

end

function UnitClass:rangedAttack(attack, range)

end

function UnitClass:specialAttackOne(attack, range)

end