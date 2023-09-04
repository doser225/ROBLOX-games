wait(10)

WarheadCode = "5504"

DebR = game:GetService("Debris")

Activated = false
Explosions = game.ServerStorage.WarheadObjects.Explosions

game.ReplicatedStorage.Warheads.Code.OnServerEvent:connect(function(Player, Code)
	if Code == WarheadCode and game.ReplicatedStorage.Warheads.W1.Value == true and game.ReplicatedStorage.Warheads.W2.Value == true and game.ReplicatedStorage.Warheads.W3.Value == true and Activated == false then
		Activated = true
		game.Workspace.ExplosionPositions.Activated.Value = true
		game.ReplicatedStorage.Warheads.WarheadDetonation.Value = true
		game.Soundscape.Music.Volume = 0
		local Song = game.ServerStorage.WarheadObjects.Castanets:Clone()
		Song.Parent = game.Workspace
		Song:Play()
		local Song2 = game.ServerStorage.WarheadObjects.Rumble:Clone()
		Song2.Parent = game.Workspace
		Song2:Play()
		Explosions.Parent = game.Workspace
		Explosions:Play()
		game.Lighting.Warhead.Brightness = 0.5
		wait(90)
		local Alert = game.ServerStorage.WarheadObjects.Alert:Clone()
		Alert.Parent = game.Workspace
		Alert:Play()
		wait(159)
		game.Lighting.Warhead.Brightness = 1
		local FExplode = game.ServerStorage.WarheadObjects.FExplode:Clone()
		FExplode.Parent = game.Workspace
		FExplode:Play()
		wait(FExplode.TimeLength)
		for i,v in ipairs(game.Players:GetPlayers()) do
			v:Kick("The warheads were detonated. The facility is destroyed, please rejoin")
		end
	end
end)

game.Workspace.ExplosionPositions.Activated.Changed:connect(function()
	if game.Workspace.ExplosionPositions.Activated.Value == true then
		while wait(0.2) do
			local RandPart = game.Workspace.ExplosionPositions:GetChildren()[math.random(1, #game.Workspace.ExplosionPositions:GetChildren())]
			if RandPart.ClassName == "Part" then
				local Explosion = Instance.new("Explosion", game.Workspace)
				Explosion.Position = RandPart.Position
				local Debris = Instance.new("Part", game.Workspace)
				Debris.Size = Vector3.new(math.random(1, 10) / 10, math.random(1, 10) / 10, math.random(1, 10) / 10)
				Debris.CFrame = RandPart.CFrame
				Debris.TopSurface = Enum.SurfaceType.Smooth
				Debris.BottomSurface = Enum.SurfaceType.Smooth
				Debris.Material = Enum.Material.CorrodedMetal
				DebR:AddItem(Debris, 10)
				local Debris = Instance.new("Part", game.Workspace)
				Debris.Size = Vector3.new(math.random(1, 10) / 10, math.random(1, 10) / 10, math.random(1, 10) / 10)
				Debris.CFrame = RandPart.CFrame
				Debris.TopSurface = Enum.SurfaceType.Smooth
				Debris.BottomSurface = Enum.SurfaceType.Smooth
				Debris.Material = Enum.Material.CorrodedMetal
				DebR:AddItem(Debris, 10)
				local Debris = Instance.new("Part", game.Workspace)
				Debris.Size = Vector3.new(math.random(1, 10) / 10, math.random(1, 10) / 10, math.random(1, 10) / 10)
				Debris.CFrame = RandPart.CFrame
				Debris.TopSurface = Enum.SurfaceType.Smooth
				Debris.BottomSurface = Enum.SurfaceType.Smooth
				Debris.Material = Enum.Material.CorrodedMetal
				DebR:AddItem(Debris, 10)
			end
		end
	end
end)

SingleE = true

Explosions.Changed:connect(function()
	if Explosions.IsPlaying == true and SingleE == true then
		SingleE = false
		while wait(math.random(4.5, 9)) do
			Explosions:Play()
			Explosions.PlaybackSpeed = math.random(6, 10) / 10
		end
	end
end)




game.Workspace.WarheadControls.Warhead1Lever.Hitbox.ClickDetector.MouseClick:connect(function(Player)
	if game.ReplicatedStorage.Warheads.W1.Value == false then
		game.ReplicatedStorage.Warheads.W1.Value = true
		game.Workspace.WarheadControls.Warhead1Lever.LeverPos.Lever:SetPrimaryPartCFrame(game.Workspace.WarheadControls.Warhead1Lever.LeverPos.LeverUp.PrimaryPart.CFrame)
		for i,v in ipairs(game.Workspace.WarheadRoom.W1Lights:GetChildren()) do
			v.BrickColor = BrickColor.new("Really red")
		end
	elseif game.ReplicatedStorage.Warheads.W1.Value == true then
		game.ReplicatedStorage.Warheads.W1.Value = false
		game.Workspace.WarheadControls.Warhead1Lever.LeverPos.Lever:SetPrimaryPartCFrame(game.Workspace.WarheadControls.Warhead1Lever.LeverPos.LeverDown.PrimaryPart.CFrame)
		for i,v in ipairs(game.Workspace.WarheadRoom.W1Lights:GetChildren()) do
			v.BrickColor = BrickColor.new("Institutional white")
		end
	end
end)

game.Workspace.WarheadControls.Warhead2Lever.Hitbox.ClickDetector.MouseClick:connect(function(Player)
	if game.ReplicatedStorage.Warheads.W2.Value == false then
		game.ReplicatedStorage.Warheads.W2.Value = true
		game.Workspace.WarheadControls.Warhead2Lever.LeverPos.Lever:SetPrimaryPartCFrame(game.Workspace.WarheadControls.Warhead2Lever.LeverPos.LeverUp.PrimaryPart.CFrame)
		for i,v in ipairs(game.Workspace.WarheadRoom.W2Lights:GetChildren()) do
			v.BrickColor = BrickColor.new("Really red")
		end
	elseif game.ReplicatedStorage.Warheads.W2.Value == true then
		game.ReplicatedStorage.Warheads.W2.Value = false
		game.Workspace.WarheadControls.Warhead2Lever.LeverPos.Lever:SetPrimaryPartCFrame(game.Workspace.WarheadControls.Warhead2Lever.LeverPos.LeverDown.PrimaryPart.CFrame)
		for i,v in ipairs(game.Workspace.WarheadRoom.W2Lights:GetChildren()) do
			v.BrickColor = BrickColor.new("Institutional white")
		end
	end
end)
	
game.Workspace.WarheadControls.Warhead3Lever.Hitbox.ClickDetector.MouseClick:connect(function(Player)
	if game.ReplicatedStorage.Warheads.W3.Value == false then
		game.ReplicatedStorage.Warheads.W3.Value = true
		game.Workspace.WarheadControls.Warhead3Lever.LeverPos.Lever:SetPrimaryPartCFrame(game.Workspace.WarheadControls.Warhead3Lever.LeverPos.LeverUp.PrimaryPart.CFrame)
		for i,v in ipairs(game.Workspace.WarheadRoom.W3Lights:GetChildren()) do
			v.BrickColor = BrickColor.new("Really red")
		end
	elseif game.ReplicatedStorage.Warheads.W3.Value == true then
		game.ReplicatedStorage.Warheads.W3.Value = false
		game.Workspace.WarheadControls.Warhead3Lever.LeverPos.Lever:SetPrimaryPartCFrame(game.Workspace.WarheadControls.Warhead3Lever.LeverPos.LeverDown.PrimaryPart.CFrame)
		for i,v in ipairs(game.Workspace.WarheadRoom.W3Lights:GetChildren()) do
			v.BrickColor = BrickColor.new("Institutional white")
		end
	end
end)

game.Workspace.WarheadControls.Detonate.Button.ClickDetector.MouseClick:connect(function(Player)
	if game.ReplicatedStorage.Warheads.W1.Value == true and game.ReplicatedStorage.Warheads.W2.Value == true and game.ReplicatedStorage.Warheads.W3.Value == true then
		local GUI = game.ServerStorage.WarheadObjects.WarheadGUI:Clone()
		GUI.LocalScript.Disabled = false
		GUI.Parent = Player.PlayerGui
	end
end)
