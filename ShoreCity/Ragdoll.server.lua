--[[game.Players.PlayerAdded:connect(function(Player)
	Player.Chatted:connect(function(Message)
		if Message == "Damage" then
			Player.Character.Humanoid.Health = 10
		end
	end)
end)

game.Players.PlayerAdded:connect(function(Player)
	Player.Chatted:connect(function(Message)
		if Message == "Heal" and Player.Character.Humanoid.Health > 0 then
			Player.Character.Humanoid.Health = 70
		end
	end)
end)

game.Players.PlayerAdded:connect(function(Player)
	Player.Chatted:connect(function(Message)
		if Message == "Givemoney" then
			game.ReplicatedStorage.Money:FindFirstChild(Player.UserId).Value = game.ReplicatedStorage.Money:FindFirstChild(Player.UserId).Value + 1000
		end
	end)
end)]]

game.Players.PlayerRemoving:connect(function(Player)
	for i,v in ipairs(game.Workspace.Ragdolls:GetChildren()) do
		if v.Name == Player.Name then
			v:Destroy()
		end
	end
end)

game.Players.PlayerAdded:connect(function(Player)
	wait(1)
	Player.CharacterAdded:connect(function()
		for i,v in ipairs(game.Workspace.Ragdolls:GetChildren()) do
			if v.Name == Player.Name then
				v:Destroy()
			end
		end
		wait(1)
		repeat 
			Player.Character:FindFirstChild("Humanoid")
			wait()
		until Player.Character.Humanoid ~= nil
		OnDeath = Player.Character.Humanoid.Died:connect(function()
			for i,v in ipairs(game.Workspace.Ragdolls:GetChildren()) do
				if v.Name == Player.Name then
					v:BreakJoints()	
					wait(1)
					v:Destroy()
				end
			end
			OnDeath:Disconnect()
		end)
	end)
end)

game.Workspace.Ragdolls.ChildAdded:connect(function(Child)
	Child:WaitForChild("Humanoid")
	Child.Humanoid.Changed:connect(function()
		if Child:FindFirstChild("Humanoid") then
			if Child.Humanoid.Health <= 0 then
				Child:BreakJoints()
				wait(3)
				Child:Destroy()
			end
		end
	end)
end)

wait(1)

game.ReplicatedStorage.RagdollEvents.Recover.OnServerEvent:connect(function(Player)
	Player.Character.Humanoid.Health = 75
end)

game.ReplicatedStorage.RagdollEvents.MinimumRecover.OnServerEvent:connect(function(Player)
	Player.Character.Humanoid.Health = 40
end)

UniquePlayerObjects = {"Accessory", "CharacterMesh", "Shirt", "Pants", "ShirtGraphic", "BodyColors"}
PlayerLimbs = {"Right Arm", "Right Leg", "Left Arm", "Left Leg"}

function game.ReplicatedStorage.RagdollEvents.SwitchRagdoll.OnServerInvoke(Player, Command, Ragdoll)
	if Command == "Destroy" then
		Player.Character.Humanoid.Health = 75
		if game.Workspace.Ragdolls:FindFirstChild(Player.Name) then
			if game.Workspace.Ragdolls:FindFirstChild(Player.Name).Head:FindFirstChild("Music") and Player.Character.Head:FindFirstChild("Music") == nil then
				game.Workspace.Ragdolls:FindFirstChild(Player.Name).Head:FindFirstChild("Music").Parent = Player.Character.Head
			end
			if game.Workspace.Ragdolls:FindFirstChild(Player.Name).Head:FindFirstChild("ClanTag") and Player.Character.Head:FindFirstChild("ClanTag") == nil then
				game.Workspace.Ragdolls:FindFirstChild(Player.Name).Head:FindFirstChild("ClanTag").Parent = Player.Character.Head
			end
		end
		game.Workspace.Ragdolls:FindFirstChild(Player.Name):Destroy()
	else
		if Player.Character.PrimaryPart == nil then
			return nil
		end
		for i,v in ipairs(Player.Character:GetChildren()) do
			if v.ClassName == "Tool" then
				v.Parent = Player.Backpack
			end
		end
		local Ragdoll = game.ServerStorage.Ragdolls["Ragdoll"]:Clone()
		Ragdoll.Parent = game.Workspace.Ragdolls
		Ragdoll:SetPrimaryPartCFrame(Player.Character.PrimaryPart.CFrame * CFrame.Angles(0, 0, 0))
		Ragdoll.Humanoid.PlatformStand = true
		Ragdoll.Name = Player.Name
		Ragdoll.Humanoid.Health = Player.Character.Humanoid.Health
		if game.ReplicatedStorage.Money:FindFirstChild(Player.UserId).Value >= 500 then
			Ragdoll.Torso.Controls.TextLabel.Text = "B"
		end
		if Player.Character.Head:FindFirstChild("Music") then
			Player.Character.Head:FindFirstChild("Music").Parent = Ragdoll.Head
		end
		if Player.Character.Head:FindFirstChild("ClanTag") then
			Player.Character.Head:FindFirstChild("ClanTag").Parent = Ragdoll.Head
		end
		for num,Limb in ipairs(PlayerLimbs) do
			if Player.Character:FindFirstChild(Limb) == nil then
				Ragdoll:FindFirstChild(Limb):Destroy()
			end
		end
		RagConnect = Ragdoll.Humanoid.Died:connect(function()
			Player.Character.Humanoid.Health = 0
			RagConnect:Disconnect()
		end)
		for num,Object in ipairs(Player.Character:GetChildren()) do
			for num,ObjectType in ipairs(UniquePlayerObjects) do
				if Object.ClassName == ObjectType then
					Object:Clone().Parent = Ragdoll
				end
			end
		end
		Ragdoll.Head.Face:Destroy()
		Player.Character.Head.face:Clone().Parent = Ragdoll.Head
		return Ragdoll
	end
end
