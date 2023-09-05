local RDS = Instance.new('Folder', game.Workspace)
RDS.Name = 'Ragdolls'

UniquePlayerObjects = {"Accessory", "CharacterMesh", "Shirt", "Pants", "ShirtGraphic", "BodyColors"}
PlayerLimbs = {"Right Arm", "Right Leg", "Left Arm", "Left Leg"}

function turnRagdoll(Player, Command, Ragdoll)
	if Command == "Destroy" then
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
		script:WaitForChild('Ragdoll')
		local Ragdoll = script.Ragdoll:Clone()
		Ragdoll.Parent = game.Workspace.Ragdolls
		Ragdoll:SetPrimaryPartCFrame(Player.Character.PrimaryPart.CFrame * CFrame.Angles(0, 0, 0))
		Ragdoll.Humanoid.PlatformStand = true
		Ragdoll.Name = Player.Name
		Ragdoll.Humanoid.MaxHealth = math.huge
		Ragdoll.Humanoid.Health = Ragdoll.Humanoid.MaxHealth
		for num,Limb in ipairs(PlayerLimbs) do
			if Player.Character:FindFirstChild(Limb) == nil then
				Ragdoll:FindFirstChild(Limb):Destroy()
			end
		end
		--[[RagConnect = Ragdoll.Humanoid.Died:connect(function()
			Player.Character.Humanoid.Health = 0
			RagConnect:Disconnect()
		end)]]
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


game.Players.PlayerRemoving:connect(function(Player)
	for i,v in ipairs(game.Workspace.Ragdolls:GetChildren()) do
		if v.Name == Player.Name then
			v:Destroy()
		end
	end
end)

local Debris = game:GetService('Debris')

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
			if Player.Character:FindFirstChild('InMatch') then
				Player.Character:SetPrimaryPartCFrame(Player.Character.PrimaryPart.CFrame * CFrame.new(0,100,0))
				turnRagdoll()
				OnDeath:Disconnect()
			end
		end)
	end)
end)

--[[game.Workspace.Ragdolls.ChildAdded:connect(function(Child)
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
end)]]

wait(1)

--[[game.ReplicatedStorage.RagdollEvents.Recover.OnServerEvent:connect(function(Player)
	Player.Character.Humanoid.Health = 75
end)

game.ReplicatedStorage.RagdollEvents.MinimumRecover.OnServerEvent:connect(function(Player)
	Player.Character.Humanoid.Health = 40
end)]]



