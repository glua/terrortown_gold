include('shared.lua')

ENT.CurScale = 1;
ENT.CurModel = ""

function ENT:Draw()	
	
	local destScale = self:GetNetScale();
	self.CurScale = destScale
	local curScale = self.CurScale;
	
	local mat = Matrix()
    mat:Scale(Vector(curScale, curScale, curScale))

	self:EnableMatrix("RenderMultiply", mat)

	local sizeMin = self:GetBaseMin()
	local sizeMax = self:GetBaseMax()
	if (sizeMin && sizeMax) then self:SetRenderBounds(sizeMin,sizeMax) end
	
	
	if (self:GetNWEntity("spec_owner") == LocalPlayer()) then 
		self:SetColor(255, 255, 255, 120)
	else
		self:SetColor(255, 255, 255, 255)
	end
	
	self:DrawModel()
	
	if (IsTTTAdmin(LocalPlayer()) && self:GetNWEntity("spec_owner") == NULL) then
		render.SetMaterial( Material("jim/melon") )
		render.DrawSprite( self:GetPos(), 32, 32, white)
	end
	
	
end

function ENT:Think()
end

function ENT:DrawEntityOutline()
end