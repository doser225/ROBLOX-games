local Debris = game:GetService('Debris')

game.ReplicatedStorage.ExplosiveFE.Unpin.OnServerEvent:connect(function(Player, Weld, Pin, Body, Sound, Tool)
	Debris:AddItem(Pin, 10)
	Debris:AddItem(Body, 10 + Sound.TimeLength)
	Weld:Destroy()
	Pin.Parent = game.Workspace
	wait(10)
	if Tool.Parent.Name == "Backpack" and Body.Parent == Tool and Body.Parent ~= nil then
		local Explosion = Instance.new("Explosion", game.Workspace)
		if game.Workspace.Ragdolls:FindFirstChild(Player.Name) then
			Explosion.Position = game.Workspace.Ragdolls:FindFirstChild(Player.Name).Torso.Position
		else
			Explosion.Position = Player.Character.Torso.Position
		end
	else
		local Explosion = Instance.new("Explosion", Body)
		Explosion.Position = Body.Position
		Sound:Play()
		wait(Sound.TimeLength)
		Body:Destroy()
		Tool:Destroy()
	end
end)

game.ReplicatedStorage.ExplosiveFE.Throw.OnServerEvent:connect(function(Player, Body, Weld, Tool, MousePos)
	Weld:Destroy()
	Body.Parent = game.Workspace
	local ThrowForce = Instance.new("BodyThrust", Body)
	ThrowForce.Force = Vector3.new(0, 300, -300)
	Tool.Grenade:SetPrimaryPartCFrame(CFrame.new(Tool.Grenade.PrimaryPart.Position, MousePos))
	wait(0.1)
	ThrowForce:Destroy()
end)

game.ReplicatedStorage.ExplosiveFE.C4Detonate.OnServerEvent:connect(function(Player, Body, Sound, Tool)
	for i,v in ipairs(Body:GetChildren()) do
		v.Anchored = true
	end
	local Explosion = Instance.new("Explosion", Body.Handle)
	Explosion.Position = Body.Handle.Position
	Sound:Play()
	wait(Sound.TimeLength)
	Body:Destroy()
	Tool:Destroy()
end)

game.ReplicatedStorage.ExplosiveFE.C4Throw.OnServerEvent:connect(function(Player, Body, Weld)
	Debris:AddItem(Body, 300)
	Weld:Destroy()
	Body.Parent = game.Workspace
	local ThrowForce = Instance.new("BodyThrust", Body.Handle)
	ThrowForce.Force = Vector3.new(0, 600, -600)
	wait(0.1)
	ThrowForce:Destroy()
end)