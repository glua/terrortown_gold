ENT.Type = "anim"
ENT.BaseSize = 9
ENT.ResizableProp = true

function ENT:SetupDataTables()
	self:NetworkVar("Float", 0, "NetScale")
	self:NetworkVar("Bool", 0, "Resized")
end

function ENT:ModScale( mod )
	local curScale = self:GetNetScale();
	if (curScale < 1) then mod = mod/4 else mod = mod*2 end
	curScale = curScale+mod
	curScale = math.Clamp(curScale,0.01,100)
	self:SetNetScale(curScale);
end
