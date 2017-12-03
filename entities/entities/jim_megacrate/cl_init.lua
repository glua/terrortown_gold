include('shared.lua')

ENT.CurScale = 1;

local mat = Material("jim/melon")
function ENT:Draw()	
	if (IsTTTAdmin(LocalPlayer()) && !IsValid(self:GetNWEntity("spec_owner"))) then
		render.SetMaterial( mat )
		render.DrawSprite( self:GetPos(), 8, 8, Color(255, 255, 255))
	end
	
	if (self:GetNWEntity("spec_owner") == LocalPlayer()) then 
		self:SetColor(255, 255, 255, 175)
	else
		self:SetColor(255, 255, 255, 255)
	end
	
	self:DrawModel()
	
	local destScale = self:GetNetScale();
	self.CurScale = destScale
	local curScale = self.CurScale;

    local mat = Matrix()
    mat:Scale(Vector(curScale, curScale, curScale))

	self:EnableMatrix("RenderMultiply", mat)
	self:SetRenderBounds(Vector(-curScale,-curScale,-curScale),Vector(curScale,curScale,curScale))
end

function ENT:DrawEntityOutline()
end