game.ReplicatedStorage.SyringeFE.Sedative.OnServerEvent:connect(function(Player, Victim)
	Victim.Character.Humanoid.WalkSpeed = 10
	game.ServerStorage.SyringeObjects.Blur:Clone().Parent = Victim.Backpack.LocalHandler
end)

game.ReplicatedStorage.SyringeFE.Dispose.OnServerEvent:connect(function(Player, Tool)
	Tool.Name = "[EMPTY]"
	Tool.Fluid.Transparency = 1
end)

game.ReplicatedStorage.SyringeFE.Jump.OnServerEvent:connect(function(Player, Victim)
	Victim.Character.Humanoid.JumpPower = 100
end)

game.ReplicatedStorage.SyringeFE.Paralyze.OnServerEvent:connect(function(Player, Victim)
	Victim.Character:SetPrimaryPartCFrame(Victim.Character.Torso.CFrame * CFrame.Angles(math.rad(90), 0, 0))
	for i = 1,60 do
		wait(1)
		Victim.Character.Humanoid.PlatformStand = true
		if i == 60 then
			Victim.Character.Humanoid.PlatformStand = false
		end
	end
end)

game.ReplicatedStorage.SyringeFE.Medkit.OnServerEvent:connect(function(Player, Victim)
	Victim.Character.Humanoid.Health = Victim.Character.Humanoid.Health + 30
end)

game.ReplicatedStorage.SyringeFE["008G"].OnServerEvent:connect(function(Player, Victim)
	local Zombie = game.ServerStorage.SyringeObjects.Zombie:Clone()
	Zombie.Parent = Victim.Backpack
	Zombie.Disabled = false
end)

game.ReplicatedStorage.SyringeFE.DeathG.OnServerEvent:connect(function(Player, Victim)
	Victim.Character.Humanoid.Health = 0
end)

game.ReplicatedStorage.SyringeFE.DeathG.DeathS.OnServerEvent:connect(function(Player)
	Player.Character.Humanoid.Health = 0
end)

game.ReplicatedStorage.SyringeFE["008G"]["008S"].OnServerEvent:connect(function(Player)
	local Zombie = game.ServerStorage.SyringeObjects.Zombie:Clone()
	Zombie.Parent = Player.Backpack
	Zombie.Disabled = false
end)

game.ReplicatedStorage.SyringeFE.GodBloodG.OnServerEvent:connect(function(Player, Victim)
	local ForceField = Instance.new("ForceField", Victim.Character)
	Victim.Character.Humanoid.MaxHealth = math.huge
	Victim.Character.Humanoid.Health = math.huge
	wait(30)
	if Victim.Character.Humanoid ~= nil then
		ForceField:Destroy()
		Victim.Character.Humanoid.MaxHealth = 100
		Victim.Character.Humanoid.Health = 100
	end
end)

game.ReplicatedStorage.SyringeFE.GodBloodG.GodBloodS.OnServerEvent:connect(function(Player)
	local ForceField = Instance.new("ForceField", Player.Character)
	Player.Character.Humanoid.MaxHealth = math.huge
	Player.Character.Humanoid.Health = math.huge
	wait(30)
	if Player.Character.Humanoid ~= nil then
		ForceField:Destroy()
		Player.Character.Humanoid.MaxHealth = 100
		Player.Character.Humanoid.Health = 100
	end
end)

game.ReplicatedStorage.SyringeFE.Blindness.OnServerEvent:connect(function(Player, Victim)
	local Blind = game.ServerStorage.SyringeObjects.Blind:Clone()
	Blind.Parent = Victim.PlayerGui
	Blind.BlindScript.Disabled = false
end)

game.ReplicatedStorage.SyringeFE.InvisibilityG.OnServerEvent:connect(function(Player, Victim)
	for i,Part in ipairs(Victim.Character:GetChildren()) do
		if Part.ClassName == "Part" and Part.Name ~= "HumanoidRootPart" then
			Part.Transparency = 1
		end
		if Part.ClassName == "Accessory" then
			Part.Handle.Transparency = 1
		end
		Victim.Character.Head.face.Transparency = 1
	end
	wait(30)
	for i,Part in ipairs(Victim.Character:GetChildren()) do
		if Part.ClassName == "Part" and Part.Name ~= "HumanoidRootPart" then
			Part.Transparency = 0
		end
		if Part.ClassName == "Accessory" then
			Part.Handle.Transparency = 0
		end
		Victim.Character.Head.face.Transparency = 0
	end
end)

game.ReplicatedStorage.SyringeFE.InvisibilityG.InvisibilityS.OnServerEvent:connect(function(Player)
	for i,Part in ipairs(Player.Character:GetChildren()) do
		if Part.ClassName == "Part" and Part.Name ~= "HumanoidRootPart" then
			Part.Transparency = 1
		end
		if Part.ClassName == "Accessory" then
			Part.Handle.Transparency = 1
		end
		Player.Character.Head.face.Transparency = 1
	end
	wait(30)
	for i,Part in ipairs(Player.Character:GetChildren()) do
		if Part.ClassName == "Part" and Part.Name ~= "HumanoidRootPart" then
			Part.Transparency = 0
		end
		if Part.ClassName == "Accessory" then
			Part.Handle.Transparency = 0
		end
		Player.Character.Head.face.Transparency = 0
	end
end)

game.ReplicatedStorage.SyringeFE.IlluminateG.OnServerEvent:connect(function(Player, Victim)
	local Light = game.ServerStorage.SyringeObjects.Illuminate:Clone()
	Light.Parent = Victim.Character.Torso
	wait(60)
	if Light ~= nil then
		Light:Destroy()
	end
end)

game.ReplicatedStorage.SyringeFE.IlluminateG.IlluminateS.OnServerEvent:connect(function(Player)
	local Light = game.ServerStorage.SyringeObjects.Illuminate:Clone()
	Light.Parent = Player.Character.Torso
	wait(60)
	Light:Destroy()
end)

game.ReplicatedStorage.SyringeFE.HealthG.OnServerEvent:connect(function(Player, Victim)
	Victim.Character.Humanoid.MaxHealth = 200
	Victim.Character.Humanoid.Health = Victim.Character.Humanoid.MaxHealth
	wait(60)
	if Victim.Character.Humanoid ~= nil then
		Victim.Character.Humanoid.MaxHealth = 100
	end
end)

game.ReplicatedStorage.SyringeFE.HealthG.HealthS.OnServerEvent:connect(function(Player)
	Player.Character.Humanoid.MaxHealth = 200
	Player.Character.Humanoid.Health = Player.Character.Humanoid.MaxHealth
end)

game.ReplicatedStorage.SyringeFE.SpeedG.OnServerEvent:connect(function(Player, Victim)
	Victim.Character.Humanoid.WalkSpeed = 22
	wait(60)
	if Victim.Character.Humanoid ~= nil then
		Victim.Character.Humanoid.WalkSpeed = 16
	end
end)

game.ReplicatedStorage.SyringeFE.SpeedG.SpeedS.OnServerEvent:connect(function(Player)
	Player.Character.Humanoid.WalkSpeed = 22
	wait(60)
	if Player.Character.Humanoid ~= nil then
		Player.Character.Humanoid.WalkSpeed = 16
	end
end)
