include('shared.lua')

ENT.CurScale = 1;
ENT.CurModel = ""

function ENT:Draw()	
	if (self.CurModel == "") then return end
	
	
	local destScale = self:GetNetScale();
	self.CurScale = destScale
	local curScale = self.CurScale;
	
	local mat = Matrix()
    mat:Scale(Vector(curScale, curScale, curScale))

	self:EnableMatrix("RenderMultiply", mat)
	local radius = self.BaseSize*self:GetNetScale();
	self:SetRenderBounds(Vector(-radius,-radius,-radius),Vector(radius,radius,radius))
	
	
	if (self:GetNWEntity("spec_owner") == LocalPlayer()) then 
		self:SetColor(255, 255, 255, 120)
	else
		self:SetColor(255, 255, 255, 255)
	end
	
	self:DrawModel()
	if (IsTTTAdmin(LocalPlayer()) && self:GetNWEntity("spec_owner") == NULL) then
		render.SetMaterial( Material("jim/melon") )
		render.DrawSprite( self:GetPos(), 8, 8, white)
	end
	
	
end

function ENT:Think()
	local curmodel = self:GetNWString("curmodel");
	if (curmodel && self.CurModel != curmodel) then
		self.CurModel = curmodel
		self:SetModel(curmodel)
	end
end

function ENT:DrawEntityOutline()
end