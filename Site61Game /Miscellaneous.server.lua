game.Lighting.GlobalShadows = false

game.Players.PlayerAdded:connect(function(Player)
	game.ServerStorage.Spawn:Clone().Parent = Player
end)

--[[game.Players.PlayerAdded:connect(function(player)
	wait(1)
	local leaderstats = Instance.new("IntValue")
	leaderstats.Name = "leaderstats"
	leaderstats.Value = 0
	local rank = Instance.new("StringValue")
	rank.Name = "Rank"
	rank.Value = player:GetRoleInGroup(2694395)
	leaderstats.Parent = player
	rank.Parent = leaderstats
end)]]

game.Workspace.BlindnessGiver.Clicker.ClickDetector.MouseClick:connect(function(Player)
	if game:GetService("MarketplaceService"):PlayerOwnsAsset(Player, 906220554) then
		game.ServerStorage.ToolObjects.Blindness:Clone().Parent = Player.Backpack
	else
		game:GetService("MarketplaceService"):PromptPurchase(Player, 906220554)
	end
end)

game.Workspace.HealthGiver.Clicker.ClickDetector.MouseClick:connect(function(Player)
	if game:GetService("MarketplaceService"):PlayerOwnsAsset(Player, 906220554) then
		game.ServerStorage.ToolObjects.Health:Clone().Parent = Player.Backpack
	else
		game:GetService("MarketplaceService"):PromptPurchase(Player, 906220554)
	end
end)

game.Workspace.LeapGiver.Clicker.ClickDetector.MouseClick:connect(function(Player)
	if game:GetService("MarketplaceService"):PlayerOwnsAsset(Player, 906220554) then
		game.ServerStorage.ToolObjects["Leap Enhancement"]:Clone().Parent = Player.Backpack
	else
		game:GetService("MarketplaceService"):PromptPurchase(Player, 906220554)
	end
end)

game.Workspace.InvisibilityGiver.Clicker.ClickDetector.MouseClick:connect(function(Player)
	if game:GetService("MarketplaceService"):PlayerOwnsAsset(Player, 906220554) then
		game.ServerStorage.ToolObjects.Invisibility:Clone().Parent = Player.Backpack
	else
		game:GetService("MarketplaceService"):PromptPurchase(Player, 906220554)
	end
end)

game.Workspace.SedativeGiver.Clicker.ClickDetector.MouseClick:connect(function(Player)
	if game:GetService("MarketplaceService"):PlayerOwnsAsset(Player, 906220554) then
		game.ServerStorage.ToolObjects.Sedative:Clone().Parent = Player.Backpack
	else
		game:GetService("MarketplaceService"):PromptPurchase(Player, 906220554)
	end
end)

game.Workspace.DeathGiver.Clicker.ClickDetector.MouseClick:connect(function(Player)
	if game:GetService("MarketplaceService"):PlayerOwnsAsset(Player, 906220554) then
		game.ServerStorage.ToolObjects.Death:Clone().Parent = Player.Backpack
	else
		game:GetService("MarketplaceService"):PromptPurchase(Player, 906220554)
	end
end)

game.Workspace.IlluminationGiver.Clicker.ClickDetector.MouseClick:connect(function(Player)
	if game:GetService("MarketplaceService"):PlayerOwnsAsset(Player, 906220554) then
		game.ServerStorage.ToolObjects.Illumination:Clone().Parent = Player.Backpack
	else
		game:GetService("MarketplaceService"):PromptPurchase(Player, 906220554)
	end
end)

game.Workspace.SpeedGiver.Clicker.ClickDetector.MouseClick:connect(function(Player)
	if game:GetService("MarketplaceService"):PlayerOwnsAsset(Player, 906220554) then
		game.ServerStorage.ToolObjects.Speed:Clone().Parent = Player.Backpack
	else
		game:GetService("MarketplaceService"):PromptPurchase(Player, 906220554)
	end
end)

game.Workspace.ParalysisGiver.Clicker.ClickDetector.MouseClick:connect(function(Player)
	if game:GetService("MarketplaceService"):PlayerOwnsAsset(Player, 906220554) then
		game.ServerStorage.ToolObjects.Paralysis:Clone().Parent = Player.Backpack
	else
		game:GetService("MarketplaceService"):PromptPurchase(Player, 906220554)
	end
end)

game.Workspace["008Giver"].Clicker.ClickDetector.MouseClick:connect(function(Player)
	if game:GetService("MarketplaceService"):PlayerOwnsAsset(Player, 906220554) then
		game.ServerStorage.ToolObjects["SCP-008"]:Clone().Parent = Player.Backpack
	else
		game:GetService("MarketplaceService"):PromptPurchase(Player, 906220554)
	end
end)

game.Workspace["343Giver"].Clicker.ClickDetector.MouseClick:connect(function(Player)
	if game:GetService("MarketplaceService"):PlayerOwnsAsset(Player, 906220554) then
		game.ServerStorage.ToolObjects["SCP-343-1"]:Clone().Parent = Player.Backpack
	else
		game:GetService("MarketplaceService"):PromptPurchase(Player, 906220554)
	end
end)

--[[game.Players.PlayerAdded:connect(function(Player)
	Player.CharacterAdded:connect(function()
		if string.sub(Player:GetRoleInGroup(2694395), 1, 7) == "Level -" then
			game.ServerStorage.Keycards:FindFirstChild("Level-" .. string.sub(Player:GetRoleInGroup(2694395), 9) .. " Card"):Clone().Parent = Player.Backpack
		end
		if Player:GetRankInGroup(2694395) >= 70 then
			game.ServerStorage.Keycards["Omni Card"]:Clone().Parent = Player.Backpack
		end
	end)
end)]]


--[[game.Players.PlayerAdded:connect(function(Player)
	Player.CharacterAdded:connect(function()
		if Player:GetRankInGroup(2694395) >= 70 and Player.TeamColor == game.Teams["Foundation Personnel"].TeamColor then
			game.ServerStorage.ToolObjects.Detain:Clone().Parent = Player.Backpack
			game.ServerStorage.Equipment.Radios["Tac-Comms"]:Clone().Parent = Player.Backpack
		end
	end)
end)

game.Players.PlayerAdded:connect(function(Player)
	Player.CharacterAdded:connect(function()
		if Player:GetRoleInGroup(2710912) == "Combat Medic" and Player.TeamColor == game.Teams["Security Department"].TeamColor then
			game.ServerStorage.ToolObjects.Medkit:Clone().Parent = Player.Backpack
		end
	end)
end)]]

wait(1) -- the ultimate wait(1) lol


--[[for i,v in ipairs(game.Workspace:GetChildren()) do
	if v.Name == "Teleporter" then
		v:FindFirstChild("Start").Touched:connect(function(Part)
			if game.Players:GetPlayerFromCharacter(Part.Parent) ~= nil and game.Players:GetPlayerFromCharacter(Part.Parent).Backpack:FindFirstChild("Zombie") == nil then
				Part.Parent.Torso.CFrame = v.End.CFrame
			end
		end)
	end
end]]

game.Workspace.YellowArmorGiver.Touched:connect(function(Part)
	if game.Players:GetPlayerFromCharacter(Part.Parent) ~= nil and Part.Parent:FindFirstChild("Armor equipped") == nil then
		local Player = game.Players:GetPlayerFromCharacter(Part.Parent)
		local Check = Instance.new("StringValue", Part.Parent)
		Check.Name = "Armor equipped"
		if Player.TeamColor == game.Teams["Mobile Task Force"].TeamColor then
			wait(1)
			for g,Extra in ipairs(Player.Character:GetChildren()) do
				if Extra.ClassName == "Shirt" or Extra.ClassName == "Pants" or Extra.ClassName == "Accessory" or Extra.ClassName == "ShirtGraphic" or Extra.ClassName == "CharacterMesh" then
					Extra:Destroy()
				end
			end
			for i,v in ipairs(game.ServerStorage.Equipment.MTF.Yellow:GetChildren()) do
				if v.Name == "Chest" then
					local PartToWeld = Player.Character.Torso
					local Clone = v:Clone()
					Clone.Parent = PartToWeld
					Clone:SetPrimaryPartCFrame(PartToWeld.CFrame)
					local Weld = Instance.new("ManualWeld", PartToWeld)
					Weld.Part0 = Clone.PrimaryPart
					Weld.Part1 = PartToWeld
					Weld.C0 = Clone.PrimaryPart.CFrame
					Weld.C1 = PartToWeld.CFrame
					Clone.PrimaryPart.Transparency = 1
				end
				if v.Name == "LLeg" then
					local PartToWeld = Player.Character["Left Leg"]
					local Clone = v:Clone()
					Clone.Parent = PartToWeld
					Clone:SetPrimaryPartCFrame(PartToWeld.CFrame)
					local Weld = Instance.new("ManualWeld", PartToWeld)
					Weld.Part0 = Clone.PrimaryPart
					Weld.Part1 = PartToWeld
					Weld.C0 = Clone.PrimaryPart.CFrame
					Weld.C1 = PartToWeld.CFrame
					Clone.PrimaryPart.Transparency = 1
				end
				if v.Name == "RLeg" then
					local PartToWeld = Player.Character["Right Leg"]
					local Clone = v:Clone()
					Clone.Parent = PartToWeld
					Clone:SetPrimaryPartCFrame(PartToWeld.CFrame)
					local Weld = Instance.new("ManualWeld", PartToWeld)
					Weld.Part0 = Clone.PrimaryPart
					Weld.Part1 = PartToWeld
					Weld.C0 = Clone.PrimaryPart.CFrame
					Weld.C1 = PartToWeld.CFrame
					Clone.PrimaryPart.Transparency = 1
				end
				if v.Name == "Helmet" then
					local PartToWeld = Player.Character.Head
					local Clone = v:Clone()
					Clone.Parent = PartToWeld
					Clone:SetPrimaryPartCFrame(PartToWeld.CFrame)
					local Weld = Instance.new("ManualWeld", PartToWeld)
					Weld.Part0 = Clone.PrimaryPart
					Weld.Part1 = PartToWeld
					Weld.C0 = Clone.PrimaryPart.CFrame
					Weld.C1 = PartToWeld.CFrame
					Clone.PrimaryPart.Transparency = 1
				end
				if v.Name == "RShoulder" then
					local PartToWeld = Player.Character["Right Arm"]
					local Clone = v:Clone()
					Clone.Parent = PartToWeld
					Clone:SetPrimaryPartCFrame(PartToWeld.CFrame)
					local Weld = Instance.new("ManualWeld", PartToWeld)
					Weld.Part0 = Clone.PrimaryPart
					Weld.Part1 = PartToWeld
					Weld.C0 = Clone.PrimaryPart.CFrame
					Weld.C1 = PartToWeld.CFrame
					Clone.PrimaryPart.Transparency = 1
				end
				if v.Name == "LShoulder" then
					local PartToWeld = Player.Character["Left Arm"]
					local Clone = v:Clone()
					Clone.Parent = PartToWeld
					Clone:SetPrimaryPartCFrame(PartToWeld.CFrame)
					local Weld = Instance.new("ManualWeld", PartToWeld)
					Weld.Part0 = Clone.PrimaryPart
					Weld.Part1 = PartToWeld
					Weld.C0 = Clone.PrimaryPart.CFrame
					Weld.C1 = PartToWeld.CFrame
					Clone.PrimaryPart.Transparency = 1
				end
				if v.ClassName == "Shirt" or v.ClassName == "Pants" then
					v:Clone().Parent = Player.Character
				end	
				if v.ClassName == "BodyColors" then
					Player.Character:FindFirstChild("Body Colors"):Destroy()
					v:Clone().Parent = Player.Character
				end
				Player.Character.Humanoid.MaxHealth = 200
				Player.Character.Humanoid.Health = Player.Character.Humanoid.MaxHealth
				game.ServerStorage.Equipment.MTF.Flashlight:Clone().Parent = Player.PlayerGui
			end
		end
	end
end)

game.Workspace.RedArmorGiver.Touched:connect(function(Part)
	if game.Players:GetPlayerFromCharacter(Part.Parent) ~= nil and Part.Parent:FindFirstChild("Armor equipped") == nil then
		local Player = game.Players:GetPlayerFromCharacter(Part.Parent)
		local Check = Instance.new("StringValue", Part.Parent)
		Check.Name = "Armor equipped"
		if Player.TeamColor == game.Teams["Mobile Task Force"].TeamColor then
			wait(1)
			for g,Extra in ipairs(Player.Character:GetChildren()) do
				if Extra.ClassName == "Shirt" or Extra.ClassName == "Pants" or Extra.ClassName == "Accessory" or Extra.ClassName == "ShirtGraphic" or Extra.ClassName == "CharacterMesh" then
					Extra:Destroy()
				end
			end
			for i,v in ipairs(game.ServerStorage.Equipment.MTF.Red:GetChildren()) do
				if v.Name == "Chest" then
					local PartToWeld = Player.Character.Torso
					local Clone = v:Clone()
					Clone.Parent = PartToWeld
					Clone:SetPrimaryPartCFrame(PartToWeld.CFrame)
					local Weld = Instance.new("ManualWeld", PartToWeld)
					Weld.Part0 = Clone.PrimaryPart
					Weld.Part1 = PartToWeld
					Weld.C0 = Clone.PrimaryPart.CFrame
					Weld.C1 = PartToWeld.CFrame
					Clone.PrimaryPart.Transparency = 1
				end
				if v.Name == "LLeg" then
					local PartToWeld = Player.Character["Left Leg"]
					local Clone = v:Clone()
					Clone.Parent = PartToWeld
					Clone:SetPrimaryPartCFrame(PartToWeld.CFrame)
					local Weld = Instance.new("ManualWeld", PartToWeld)
					Weld.Part0 = Clone.PrimaryPart
					Weld.Part1 = PartToWeld
					Weld.C0 = Clone.PrimaryPart.CFrame
					Weld.C1 = PartToWeld.CFrame
					Clone.PrimaryPart.Transparency = 1
				end
				if v.Name == "RLeg" then
					local PartToWeld = Player.Character["Right Leg"]
					local Clone = v:Clone()
					Clone.Parent = PartToWeld
					Clone:SetPrimaryPartCFrame(PartToWeld.CFrame)
					local Weld = Instance.new("ManualWeld", PartToWeld)
					Weld.Part0 = Clone.PrimaryPart
					Weld.Part1 = PartToWeld
					Weld.C0 = Clone.PrimaryPart.CFrame
					Weld.C1 = PartToWeld.CFrame
					Clone.PrimaryPart.Transparency = 1
				end
				if v.Name == "Helmet" then
					local PartToWeld = Player.Character.Head
					local Clone = v:Clone()
					Clone.Parent = PartToWeld
					Clone:SetPrimaryPartCFrame(PartToWeld.CFrame)
					local Weld = Instance.new("ManualWeld", PartToWeld)
					Weld.Part0 = Clone.PrimaryPart
					Weld.Part1 = PartToWeld
					Weld.C0 = Clone.PrimaryPart.CFrame
					Weld.C1 = PartToWeld.CFrame
					Clone.PrimaryPart.Transparency = 1
				end
				if v.Name == "RShoulder" then
					local PartToWeld = Player.Character["Right Arm"]
					local Clone = v:Clone()
					Clone.Parent = PartToWeld
					Clone:SetPrimaryPartCFrame(PartToWeld.CFrame)
					local Weld = Instance.new("ManualWeld", PartToWeld)
					Weld.Part0 = Clone.PrimaryPart
					Weld.Part1 = PartToWeld
					Weld.C0 = Clone.PrimaryPart.CFrame
					Weld.C1 = PartToWeld.CFrame
					Clone.PrimaryPart.Transparency = 1
				end
				if v.Name == "LShoulder" then
					local PartToWeld = Player.Character["Left Arm"]
					local Clone = v:Clone()
					Clone.Parent = PartToWeld
					Clone:SetPrimaryPartCFrame(PartToWeld.CFrame)
					local Weld = Instance.new("ManualWeld", PartToWeld)
					Weld.Part0 = Clone.PrimaryPart
					Weld.Part1 = PartToWeld
					Weld.C0 = Clone.PrimaryPart.CFrame
					Weld.C1 = PartToWeld.CFrame
					Clone.PrimaryPart.Transparency = 1
				end
				if v.ClassName == "Shirt" or v.ClassName == "Pants" then
					v:Clone().Parent = Player.Character
				end	
				if v.ClassName == "BodyColors" then
					Player.Character:FindFirstChild("Body Colors"):Destroy()
					v:Clone().Parent = Player.Character
				end
				Player.Character.Humanoid.MaxHealth = 200
				Player.Character.Humanoid.Health = Player.Character.Humanoid.MaxHealth
				game.ServerStorage.Equipment.MTF.Flashlight:Clone().Parent = Player.PlayerGui
			end
		end
	end
end)

game.Workspace.PurpleArmorGiver.Touched:connect(function(Part)
	if game.Players:GetPlayerFromCharacter(Part.Parent) ~= nil and Part.Parent:FindFirstChild("Armor equipped") == nil then
		local Player = game.Players:GetPlayerFromCharacter(Part.Parent)
		local Check = Instance.new("StringValue", Part.Parent)
		Check.Name = "Armor equipped"
		if Player.TeamColor == game.Teams["Mobile Task Force"].TeamColor then
			wait(1)
			for g,Extra in ipairs(Player.Character:GetChildren()) do
				if Extra.ClassName == "Shirt" or Extra.ClassName == "Pants" or Extra.ClassName == "Accessory" or Extra.ClassName == "ShirtGraphic" or Extra.ClassName == "CharacterMesh" then
					Extra:Destroy()
				end
			end
			for i,v in ipairs(game.ServerStorage.Equipment.MTF.Purple:GetChildren()) do
				if v.Name == "Chest" then
					local PartToWeld = Player.Character.Torso
					local Clone = v:Clone()
					Clone.Parent = PartToWeld
					Clone:SetPrimaryPartCFrame(PartToWeld.CFrame)
					local Weld = Instance.new("ManualWeld", PartToWeld)
					Weld.Part0 = Clone.PrimaryPart
					Weld.Part1 = PartToWeld
					Weld.C0 = Clone.PrimaryPart.CFrame
					Weld.C1 = PartToWeld.CFrame
					Clone.PrimaryPart.Transparency = 1
				end
				if v.Name == "LLeg" then
					local PartToWeld = Player.Character["Left Leg"]
					local Clone = v:Clone()
					Clone.Parent = PartToWeld
					Clone:SetPrimaryPartCFrame(PartToWeld.CFrame)
					local Weld = Instance.new("ManualWeld", PartToWeld)
					Weld.Part0 = Clone.PrimaryPart
					Weld.Part1 = PartToWeld
					Weld.C0 = Clone.PrimaryPart.CFrame
					Weld.C1 = PartToWeld.CFrame
					Clone.PrimaryPart.Transparency = 1
				end
				if v.Name == "RLeg" then
					local PartToWeld = Player.Character["Right Leg"]
					local Clone = v:Clone()
					Clone.Parent = PartToWeld
					Clone:SetPrimaryPartCFrame(PartToWeld.CFrame)
					local Weld = Instance.new("ManualWeld", PartToWeld)
					Weld.Part0 = Clone.PrimaryPart
					Weld.Part1 = PartToWeld
					Weld.C0 = Clone.PrimaryPart.CFrame
					Weld.C1 = PartToWeld.CFrame
					Clone.PrimaryPart.Transparency = 1
				end
				if v.Name == "Helmet" then
					local PartToWeld = Player.Character.Head
					local Clone = v:Clone()
					Clone.Parent = PartToWeld
					Clone:SetPrimaryPartCFrame(PartToWeld.CFrame)
					local Weld = Instance.new("ManualWeld", PartToWeld)
					Weld.Part0 = Clone.PrimaryPart
					Weld.Part1 = PartToWeld
					Weld.C0 = Clone.PrimaryPart.CFrame
					Weld.C1 = PartToWeld.CFrame
					Clone.PrimaryPart.Transparency = 1
				end
				if v.Name == "RShoulder" then
					local PartToWeld = Player.Character["Right Arm"]
					local Clone = v:Clone()
					Clone.Parent = PartToWeld
					Clone:SetPrimaryPartCFrame(PartToWeld.CFrame)
					local Weld = Instance.new("ManualWeld", PartToWeld)
					Weld.Part0 = Clone.PrimaryPart
					Weld.Part1 = PartToWeld
					Weld.C0 = Clone.PrimaryPart.CFrame
					Weld.C1 = PartToWeld.CFrame
					Clone.PrimaryPart.Transparency = 1
				end
				if v.Name == "LShoulder" then
					local PartToWeld = Player.Character["Left Arm"]
					local Clone = v:Clone()
					Clone.Parent = PartToWeld
					Clone:SetPrimaryPartCFrame(PartToWeld.CFrame)
					local Weld = Instance.new("ManualWeld", PartToWeld)
					Weld.Part0 = Clone.PrimaryPart
					Weld.Part1 = PartToWeld
					Weld.C0 = Clone.PrimaryPart.CFrame
					Weld.C1 = PartToWeld.CFrame
					Clone.PrimaryPart.Transparency = 1
				end
				if v.ClassName == "Shirt" or v.ClassName == "Pants" then
					v:Clone().Parent = Player.Character
				end	
				if v.ClassName == "BodyColors" then
					Player.Character:FindFirstChild("Body Colors"):Destroy()
					v:Clone().Parent = Player.Character
				end
				Player.Character.Humanoid.MaxHealth = 200
				Player.Character.Humanoid.Health = Player.Character.Humanoid.MaxHealth
				game.ServerStorage.Equipment.MTF.Flashlight:Clone().Parent = Player.PlayerGui
			end
		end
	end
end)

game.Workspace.GrayArmorGiver.Touched:connect(function(Part)
	if game.Players:GetPlayerFromCharacter(Part.Parent) ~= nil and Part.Parent:FindFirstChild("Armor equipped") == nil then
		local Player = game.Players:GetPlayerFromCharacter(Part.Parent)
		local Check = Instance.new("StringValue", Part.Parent)
		Check.Name = "Armor equipped"
		if Player.TeamColor == game.Teams["Mobile Task Force"].TeamColor then
			wait(1)
			for g,Extra in ipairs(Player.Character:GetChildren()) do
				if Extra.ClassName == "Shirt" or Extra.ClassName == "Pants" or Extra.ClassName == "Accessory" or Extra.ClassName == "ShirtGraphic" or Extra.ClassName == "CharacterMesh" then
					Extra:Destroy()
				end
			end
			for i,v in ipairs(game.ServerStorage.Equipment.MTF.Gray:GetChildren()) do
				if v.Name == "Chest" then
					local PartToWeld = Player.Character.Torso
					local Clone = v:Clone()
					Clone.Parent = PartToWeld
					Clone:SetPrimaryPartCFrame(PartToWeld.CFrame)
					local Weld = Instance.new("ManualWeld", PartToWeld)
					Weld.Part0 = Clone.PrimaryPart
					Weld.Part1 = PartToWeld
					Weld.C0 = Clone.PrimaryPart.CFrame
					Weld.C1 = PartToWeld.CFrame
					Clone.PrimaryPart.Transparency = 1
				end
				if v.Name == "LLeg" then
					local PartToWeld = Player.Character["Left Leg"]
					local Clone = v:Clone()
					Clone.Parent = PartToWeld
					Clone:SetPrimaryPartCFrame(PartToWeld.CFrame)
					local Weld = Instance.new("ManualWeld", PartToWeld)
					Weld.Part0 = Clone.PrimaryPart
					Weld.Part1 = PartToWeld
					Weld.C0 = Clone.PrimaryPart.CFrame
					Weld.C1 = PartToWeld.CFrame
					Clone.PrimaryPart.Transparency = 1
				end
				if v.Name == "RLeg" then
					local PartToWeld = Player.Character["Right Leg"]
					local Clone = v:Clone()
					Clone.Parent = PartToWeld
					Clone:SetPrimaryPartCFrame(PartToWeld.CFrame)
					local Weld = Instance.new("ManualWeld", PartToWeld)
					Weld.Part0 = Clone.PrimaryPart
					Weld.Part1 = PartToWeld
					Weld.C0 = Clone.PrimaryPart.CFrame
					Weld.C1 = PartToWeld.CFrame
					Clone.PrimaryPart.Transparency = 1
				end
				if v.Name == "Helmet" then
					local PartToWeld = Player.Character.Head
					local Clone = v:Clone()
					Clone.Parent = PartToWeld
					Clone:SetPrimaryPartCFrame(PartToWeld.CFrame)
					local Weld = Instance.new("ManualWeld", PartToWeld)
					Weld.Part0 = Clone.PrimaryPart
					Weld.Part1 = PartToWeld
					Weld.C0 = Clone.PrimaryPart.CFrame
					Weld.C1 = PartToWeld.CFrame
					Clone.PrimaryPart.Transparency = 1
				end
				if v.Name == "RShoulder" then
					local PartToWeld = Player.Character["Right Arm"]
					local Clone = v:Clone()
					Clone.Parent = PartToWeld
					Clone:SetPrimaryPartCFrame(PartToWeld.CFrame)
					local Weld = Instance.new("ManualWeld", PartToWeld)
					Weld.Part0 = Clone.PrimaryPart
					Weld.Part1 = PartToWeld
					Weld.C0 = Clone.PrimaryPart.CFrame
					Weld.C1 = PartToWeld.CFrame
					Clone.PrimaryPart.Transparency = 1
				end
				if v.Name == "LShoulder" then
					local PartToWeld = Player.Character["Left Arm"]
					local Clone = v:Clone()
					Clone.Parent = PartToWeld
					Clone:SetPrimaryPartCFrame(PartToWeld.CFrame)
					local Weld = Instance.new("ManualWeld", PartToWeld)
					Weld.Part0 = Clone.PrimaryPart
					Weld.Part1 = PartToWeld
					Weld.C0 = Clone.PrimaryPart.CFrame
					Weld.C1 = PartToWeld.CFrame
					Clone.PrimaryPart.Transparency = 1
				end
				if v.ClassName == "Shirt" or v.ClassName == "Pants" then
					v:Clone().Parent = Player.Character
				end	
				if v.ClassName == "BodyColors" then
					Player.Character:FindFirstChild("Body Colors"):Destroy()
					v:Clone().Parent = Player.Character
				end
				Player.Character.Humanoid.MaxHealth = 200
				Player.Character.Humanoid.Health = Player.Character.Humanoid.MaxHealth
				game.ServerStorage.Equipment.MTF.Flashlight:Clone().Parent = Player.PlayerGui
			end
		end
	end
end)

game.Workspace.LightRedArmorGiver.Touched:connect(function(Part)
	if game.Players:GetPlayerFromCharacter(Part.Parent) ~= nil and Part.Parent:FindFirstChild("Armor equipped") == nil then
		local Player = game.Players:GetPlayerFromCharacter(Part.Parent)
		local Check = Instance.new("StringValue", Part.Parent)
		Check.Name = "Armor equipped"
		if Player.TeamColor == game.Teams["Mobile Task Force"].TeamColor then
			wait(1)
			for i,v in ipairs(game.ServerStorage.Equipment.MTF.LightRed:GetChildren()) do
				if v.Name == "Chest" then
					local PartToWeld = Player.Character.Torso
					local Clone = v:Clone()
					Clone.Parent = PartToWeld
					Clone:SetPrimaryPartCFrame(PartToWeld.CFrame)
					local Weld = Instance.new("ManualWeld", PartToWeld)
					Weld.Part0 = Clone.PrimaryPart
					Weld.Part1 = PartToWeld
					Weld.C0 = Clone.PrimaryPart.CFrame
					Weld.C1 = PartToWeld.CFrame
					Clone.PrimaryPart.Transparency = 1
				end
				if v.Name == "LLeg" then
					local PartToWeld = Player.Character["Left Leg"]
					local Clone = v:Clone()
					Clone.Parent = PartToWeld
					Clone:SetPrimaryPartCFrame(PartToWeld.CFrame)
					local Weld = Instance.new("ManualWeld", PartToWeld)
					Weld.Part0 = Clone.PrimaryPart
					Weld.Part1 = PartToWeld
					Weld.C0 = Clone.PrimaryPart.CFrame
					Weld.C1 = PartToWeld.CFrame
					Clone.PrimaryPart.Transparency = 1
				end
				if v.Name == "RLeg" then
					local PartToWeld = Player.Character["Right Leg"]
					local Clone = v:Clone()
					Clone.Parent = PartToWeld
					Clone:SetPrimaryPartCFrame(PartToWeld.CFrame)
					local Weld = Instance.new("ManualWeld", PartToWeld)
					Weld.Part0 = Clone.PrimaryPart
					Weld.Part1 = PartToWeld
					Weld.C0 = Clone.PrimaryPart.CFrame
					Weld.C1 = PartToWeld.CFrame
					Clone.PrimaryPart.Transparency = 1
				end
				if v.Name == "Helmet" then
					local PartToWeld = Player.Character.Head
					local Clone = v:Clone()
					Clone.Parent = PartToWeld
					Clone:SetPrimaryPartCFrame(PartToWeld.CFrame)
					local Weld = Instance.new("ManualWeld", PartToWeld)
					Weld.Part0 = Clone.PrimaryPart
					Weld.Part1 = PartToWeld
					Weld.C0 = Clone.PrimaryPart.CFrame
					Weld.C1 = PartToWeld.CFrame
					Clone.PrimaryPart.Transparency = 1
				end
				if v.Name == "RShoulder" then
					local PartToWeld = Player.Character["Right Arm"]
					local Clone = v:Clone()
					Clone.Parent = PartToWeld
					Clone:SetPrimaryPartCFrame(PartToWeld.CFrame)
					local Weld = Instance.new("ManualWeld", PartToWeld)
					Weld.Part0 = Clone.PrimaryPart
					Weld.Part1 = PartToWeld
					Weld.C0 = Clone.PrimaryPart.CFrame
					Weld.C1 = PartToWeld.CFrame
					Clone.PrimaryPart.Transparency = 1
				end
				if v.Name == "LShoulder" then
					local PartToWeld = Player.Character["Left Arm"]
					local Clone = v:Clone()
					Clone.Parent = PartToWeld
					Clone:SetPrimaryPartCFrame(PartToWeld.CFrame)
					local Weld = Instance.new("ManualWeld", PartToWeld)
					Weld.Part0 = Clone.PrimaryPart
					Weld.Part1 = PartToWeld
					Weld.C0 = Clone.PrimaryPart.CFrame
					Weld.C1 = PartToWeld.CFrame
					Clone.PrimaryPart.Transparency = 1
				end
				for g,Extra in ipairs(Player.Character:GetChildren()) do
					if Extra.ClassName == "Shirt" or Extra.ClassName == "Pants" or Extra.ClassName == "Accessory" or Extra.ClassName == "ShirtGraphic" or Extra.ClassName == "CharacterMesh" then
						Extra:Destroy()
					end
				end
				if v.ClassName == "Shirt" or v.ClassName == "Pants" then
					v:Clone().Parent = Player.Character
				end	
				if v.ClassName == "BodyColors" then
					Player.Character:FindFirstChild("Body Colors"):Destroy()
					v:Clone().Parent = Player.Character
				end
				Player.Character.Humanoid.MaxHealth = 200
				Player.Character.Humanoid.Health = Player.Character.Humanoid.MaxHealth
				game.ServerStorage.Equipment.MTF.Flashlight:Clone().Parent = Player.PlayerGui
			end
		end
	end
end)

armorf = game.ServerStorage.Equipment.ISD.ISS
health = 230
sonicsped = 20
jump = 50 -- default 50
div = 0 -- default 0
rank = "N/A" -- default "N/A"

-- [[ DO NOT TOUCH CODE BELOW ]] --

game.Workspace["ISS Armor"].ArmorPad.Touched:connect(function(part)
	if part.Parent:FindFirstChild("Humanoid") then
		if part.Parent.Torso:FindFirstChild("chest") or part.Parent["Left Arm"]:FindFirstChild("larm") or part.Parent["Right Arm"]:FindFirstChild("rarm") or part.Parent["Left Leg"]:FindFirstChild("lleg") or part.Parent["Right Leg"]:FindFirstChild("rleg") or part.Parent:FindFirstChild("Armor equipped") == nil then
			return nil
		else
			local Player = game.Players:GetPlayerFromCharacter(part.Parent)
			local Check = Instance.new("StringValue", part.Parent)
			Check.Name = "Armor equipped"
			local find = game.Players:FindFirstChild(part.Parent.Name)
			if find then
				if find.TeamColor == game.Teams["Internal Security Department"].TeamColor  then
					print("proceeding")					
				else
					print("Player not found or not in group")
					return nil
				end
			end
			part.Parent.Humanoid.MaxHealth = health
			part.Parent.Humanoid.Health = health
			part.Parent.Humanoid.WalkSpeed = sonicsped
			part.Parent.Humanoid.JumpPower = jump
			for i,v in ipairs(armorf:GetChildren()) do
				if v.Name == "chest" then
					local limb = part.Parent.Torso
					local clone = v:Clone()
					clone.Parent = limb
					for c,b in ipairs(clone:GetChildren()) do
						if b.ClassName == "Part" then
							b.CanCollide = false
							b.Anchored = false
						end
					end
					clone:SetPrimaryPartCFrame(limb.CFrame)
					clone.PrimaryPart.Transparency = 1
					local weld = Instance.new("ManualWeld", limb)
					weld.Part0 = clone.PrimaryPart
					weld.Part1 = limb
					weld.C0 = clone.PrimaryPart.CFrame
					weld.C1 = limb.CFrame
				end
				if v.Name == "larm" then
					local limb = part.Parent["Left Arm"]
					local clone = v:Clone()
					clone.Parent = limb
					for c,b in ipairs(clone:GetChildren()) do
						if b.ClassName == "Part" then
							b.CanCollide = false
							b.Anchored = false
						end
					end
					clone:SetPrimaryPartCFrame(limb.CFrame)
					clone.PrimaryPart.Transparency = 1
					local weld = Instance.new("ManualWeld", limb)
					weld.Part0 = clone.PrimaryPart
					weld.Part1 = limb
					weld.C0 = clone.PrimaryPart.CFrame
					weld.C1 = limb.CFrame
				end
				if v.Name == "rarm" then
					local limb = part.Parent["Right Arm"]
					local clone = v:Clone()
					clone.Parent = limb
					for c,b in ipairs(clone:GetChildren()) do
						if b.ClassName == "Part" then
							b.CanCollide = false
							b.Anchored = false
						end
					end
					clone:SetPrimaryPartCFrame(limb.CFrame)
					clone.PrimaryPart.Transparency = 1
					local weld = Instance.new("ManualWeld", limb)
					weld.Part0 = clone.PrimaryPart
					weld.Part1 = limb
					weld.C0 = clone.PrimaryPart.CFrame
					weld.C1 = limb.CFrame
				end
				if v.Name == "lleg" then
					local limb = part.Parent["Left Leg"]
					local clone = v:Clone()
					clone.Parent = limb
					for c,b in ipairs(clone:GetChildren()) do
						if b.ClassName == "Part" then
							b.CanCollide = false
							b.Anchored = false
						end
					end
					clone:SetPrimaryPartCFrame(limb.CFrame)
					clone.PrimaryPart.Transparency = 1
					local weld = Instance.new("ManualWeld", limb)
					weld.Part0 = clone.PrimaryPart
					weld.Part1 = limb
					weld.C0 = clone.PrimaryPart.CFrame
					weld.C1 = limb.CFrame
				end
				if v.Name == "rleg" then
					local limb = part.Parent["Right Leg"]
					local clone = v:Clone()
					clone.Parent = limb
					for c,b in ipairs(clone:GetChildren()) do
						if b.ClassName == "Part" then
							b.CanCollide = false
							b.Anchored = false
						end
					end
					clone:SetPrimaryPartCFrame(limb.CFrame)
					clone.PrimaryPart.Transparency = 1
					local weld = Instance.new("ManualWeld", limb)
					weld.Part0 = clone.PrimaryPart
					weld.Part1 = limb
					weld.C0 = clone.PrimaryPart.CFrame
					weld.C1 = limb.CFrame
				end
			end
		end
	end
end)


game.ReplicatedStorage.TeamChange.OnServerEvent:connect(function(Player, Team, Gui, Spawn)
	if Team == game.Teams["Foundation Personnel"].TeamColor then
		Player.TeamColor = game.Teams["Foundation Personnel"].TeamColor
		Player.Character.Torso.CFrame = game.Workspace.Spawns.FPSpawn.CFrame
	elseif Team == game.Teams["Internal Security Department"].TeamColor then
		if game:GetService("MarketplaceService"):PlayerOwnsAsset(Player, 861056594) then
			Player.TeamColor = game.Teams["Internal Security Department"].TeamColor
			Player.Character.Torso.CFrame = game.Workspace.Spawns.ISDSpawn.CFrame
		end
	elseif Team == game.Teams["Chaos Insurgency"].TeamColor then
		Player.TeamColor = game.Teams["Chaos Insurgency"].TeamColor
		Player.Character.Torso.CFrame = game.Workspace.Spawns.CISpawn.CFrame
	elseif Team == game.Teams["Engineering and Technical"].TeamColor then
		Player.TeamColor = game.Teams["Engineering and Technical"].TeamColor
		Player.Character.Torso.CFrame = game.Workspace.Spawns.ETSpawn.CFrame
	elseif Team == game.Teams["Security Department"].TeamColor then
		Player.TeamColor = game.Teams["Security Department"].TeamColor
		Player.Character.Torso.CFrame = game.Workspace.Spawns.SDSpawn.CFrame
	elseif Team == game.Teams["Department of External Affairs"].TeamColor then
		Player.TeamColor = game.Teams["Department of External Affairs"].TeamColor
		Player.Character.Torso.CFrame = game.Workspace.Spawns.DEASpawn.CFrame
	elseif Team == game.Teams["Intelligence Agency"].TeamColor then
		if game:GetService("MarketplaceService"):PlayerOwnsAsset(Player, 906219666) then
			Player.TeamColor = game.Teams["Intelligence Agency"].TeamColor
			Player.Character.Torso.CFrame = game.Workspace.Spawns.IASpawn.CFrame
		end
	elseif Team == game.Teams["Mobile Task Force"].TeamColor then
		Player.TeamColor = game.Teams["Mobile Task Force"].TeamColor
		Player.Character.Torso.CFrame = game.Workspace.Spawns.MTFSpawn.CFrame
	elseif Team == game.Teams["Scientific Department"].TeamColor then
		Player.TeamColor = game.Teams["Scientific Department"].TeamColor
		Player.Character.Torso.CFrame = game.Workspace.Spawns.ScDSpawn.CFrame
	elseif Team == game.Teams["Ethics Committee"].TeamColor then
		Player.TeamColor = game.Teams["Ethics Committee"].TeamColor
		Player.Character.Torso.CFrame = game.Workspace.Spawns.ECSpawn.CFrame
	elseif Team == game.Teams["Medical Department"].TeamColor then
		Player.TeamColor = game.Teams["Medical Department"].TeamColor
		Player.Character.Torso.CFrame = game.Workspace.Spawns.MDSpawn.CFrame
	elseif Team == game.Teams.Unauthorized.TeamColor then
		Player.TeamColor = game.Teams.Unauthorized.TeamColor
	elseif Team == game.Teams["Class-D"].TeamColor then
		Player.TeamColor = game.Teams["Class-D"].TeamColor
		Player.Character.Torso.CFrame = game.Workspace.Spawns.CD:GetChildren()[math.random(1, #game.Workspace.Spawns.CD:GetChildren())].CFrame
	end
	Player.Spawn:FireClient(Player)
	if Player.TeamColor == game.Teams["Foundation Personnel"].TeamColor then
		local Folder = game.ServerStorage.Tools.FP
		for i,v in ipairs(Folder:GetChildren()) do
			v.Value:Clone().Parent = Player.Backpack
		end
	elseif Player.TeamColor == game.Teams["Security Department"].TeamColor then
		local Folder = game.ServerStorage.Tools.SD
		for i,v in ipairs(Folder:GetChildren()) do
			v.Value:Clone().Parent = Player.Backpack
		end
	elseif Player.TeamColor == game.Teams["Medical Department"].TeamColor then
		local Folder = game.ServerStorage.Tools.MD
		for i,v in ipairs(Folder:GetChildren()) do
			v.Value:Clone().Parent = Player.Backpack
		end
	elseif Player.TeamColor == game.Teams["Mobile Task Force"].TeamColor then
		local Folder = game.ServerStorage.Tools.MTF
		for i,v in ipairs(Folder:GetChildren()) do
			v.Value:Clone().Parent = Player.Backpack
		end
	elseif Player.TeamColor == game.Teams["Intelligence Agency"].TeamColor then
		local Folder = game.ServerStorage.Tools.IA
		for i,v in ipairs(Folder:GetChildren()) do
			v.Value:Clone().Parent = Player.Backpack
		end
	elseif Player.TeamColor == game.Teams["Internal Security Department"].TeamColor then
		local Folder = game.ServerStorage.Tools.ISD
		for i,v in ipairs(Folder:GetChildren()) do
			v.Value:Clone().Parent = Player.Backpack
		end
	elseif Player.TeamColor == game.Teams["Scientific Department"].TeamColor then
		local Folder = game.ServerStorage.Tools.ScD
		for i,v in ipairs(Folder:GetChildren()) do
			v.Value:Clone().Parent = Player.Backpack
		end
	elseif Player.TeamColor == game.Teams["Engineering and Technical"].TeamColor then
		local Folder = game.ServerStorage.Tools["E&T"]
		for i,v in ipairs(Folder:GetChildren()) do
			v.Value:Clone().Parent = Player.Backpack
		end
	elseif Player.TeamColor == game.Teams["Chaos Insurgency"].TeamColor then
		local Folder = game.ServerStorage.Tools.CI
		for i,v in ipairs(Folder:GetChildren()) do
			v.Value:Clone().Parent = Player.Backpack
		end
	elseif Player.TeamColor == game.Teams["Department of External Affairs"].TeamColor then
		local Folder = game.ServerStorage.Tools.DEA
		for i,v in ipairs(Folder:GetChildren()) do
			v.Value:Clone().Parent = Player.Backpack
		end
	elseif Player.TeamColor == game.Teams["Foundation Personnel"].TeamColor then
		local Folder = game.ServerStorage.Tools.FP
		for i,v in ipairs(Folder:GetChildren()) do
			v.Value:Clone().Parent = Player.Backpack
		end
	elseif Player.TeamColor == game.Teams["Ethics Committee"].TeamColor then
		local Folder = game.ServerStorage.Tools.EC
		for i,v in ipairs(Folder:GetChildren()) do
			v.Value:Clone().Parent = Player.Backpack
		end
	end
	game.ServerStorage.Miscellaneous.Notification:Clone().Parent = Player.PlayerGui
end)

game.Workspace.ISDHelmet.Head.Touched:connect(function(Part)
	if Part.Parent:FindFirstChild("Humanoid") and Part.Parent.Head:FindFirstChild("ISDHelmet") == nil and Part.Parent.Head:FindFirstChild("IAHelmet") == nil and Part.Parent.Head:FindFirstChild("DHelmet") == nil and Part.Parent.Head:FindFirstChild("SDHelmet") == nil and Part.Parent.Head:FindFirstChild("MTFHelmet") == nil and Part.Parent.Head:FindFirstChild("CameraHelm") == nil and Part.Parent.Head:FindFirstChild("Helmet") == nil and Part.Parent:FindFirstChild("Armor equipped") == nil and game.Players:GetPlayerFromCharacter(Part.Parent).TeamColor == game.Teams["Internal Security Department"].TeamColor then
		local Player = game.Players:GetPlayerFromCharacter(Part.Parent)
		local Check = Instance.new("StringValue", Part.Parent)
		Check.Name = "Armor equipped"
		for i,v in ipairs(Part.Parent:GetChildren()) do
			if v.ClassName == "Accessory" then
				v:Remove()
			end
		end
		for g,Extra in ipairs(Player.Character:GetChildren()) do
			if Extra.ClassName == "Shirt" or Extra.ClassName == "Pants" or Extra.ClassName == "Accessory" or Extra.ClassName == "ShirtGraphic" or Extra.ClassName == "CharacterMesh" then
				Extra:Destroy()
			end
		end
		if Part.Parent:FindFirstChild("Body Colors") then
			Part.Parent:FindFirstChild("Body Colors"):Remove()
			game.ServerStorage.Equipment.ISD["Body Colors"]:Clone().Parent = Part.Parent
		end
		game.ServerStorage.Equipment.ISD.Shirt:Clone().Parent = Part.Parent
		game.ServerStorage.Equipment.ISD.Pants:Clone().Parent = Part.Parent
		local HelmetClone = game.ServerStorage.Equipment.ISD.ISDHelmet:Clone()
		HelmetClone.Parent = Part.Parent.Head
		HelmetClone.Head.Transparency = 1
		HelmetClone:SetPrimaryPartCFrame(Part.Parent.Head.CFrame)
		local GUIClone = game.ServerStorage.Equipment.ISD.Flashlight:Clone()
		GUIClone.Parent = game.Players:GetPlayerFromCharacter(Part.Parent).PlayerGui
		local Weld = Instance.new("ManualWeld", HelmetClone)
		Weld.Part0 = HelmetClone.Head
		Weld.Part1 = Part.Parent.Head
		Weld.C0 = HelmetClone.Head.CFrame
		Weld.C1 = Part.Parent.Head.CFrame
	end
end)

game.Workspace.IAHelmet.Head.Touched:connect(function(Part)
	if Part.Parent:FindFirstChild("Humanoid") and Part.Parent.Head:FindFirstChild("ISDHelmet") == nil and Part.Parent.Head:FindFirstChild("IAHelmet") == nil and Part.Parent.Head:FindFirstChild("DHelmet") == nil and Part.Parent.Head:FindFirstChild("SDHelmet") == nil and Part.Parent.Head:FindFirstChild("MTFHelmet") == nil and Part.Parent.Head:FindFirstChild("CameraHelm") == nil and Part.Parent.Head:FindFirstChild("Helmet") == nil and Part.Parent:FindFirstChild("Armor equipped") == nil and game.Players:GetPlayerFromCharacter(Part.Parent).TeamColor == game.Teams["Intelligence Agency"].TeamColor then
		local Player = game.Players:GetPlayerFromCharacter(Part.Parent)
		local Check = Instance.new("StringValue", Part.Parent)
		Check.Name = "Armor equipped"
		for i,v in ipairs(Part.Parent:GetChildren()) do
			if v.ClassName == "Accessory" then
				v:Remove()
			end
		end
		for g,Extra in ipairs(Player.Character:GetChildren()) do
			if Extra.ClassName == "Shirt" or Extra.ClassName == "Pants" or Extra.ClassName == "Accessory" or Extra.ClassName == "ShirtGraphic" or Extra.ClassName == "CharacterMesh" then
				Extra:Destroy()
			end
		end
		if Part.Parent:FindFirstChild("Body Colors") then
			Part.Parent:FindFirstChild("Body Colors"):Remove()
			game.ServerStorage.Equipment.IA["Body Colors"]:Clone().Parent = Part.Parent
		end
		game.ServerStorage.Equipment.IA.Shirt:Clone().Parent = Part.Parent
		game.ServerStorage.Equipment.IA.Pants:Clone().Parent = Part.Parent
		local HelmetClone = game.ServerStorage.Equipment.IA.IAHelmet:Clone()
		HelmetClone.Parent = Part.Parent.Head
		HelmetClone.Head.Transparency = 1
		HelmetClone:SetPrimaryPartCFrame(Part.Parent.Head.CFrame)
		local GUIClone = game.ServerStorage.Equipment.IA.Flashlight:Clone()
		GUIClone.Parent = game.Players:GetPlayerFromCharacter(Part.Parent).PlayerGui
		local Weld = Instance.new("ManualWeld", HelmetClone)
		Weld.Part0 = HelmetClone.Head
		Weld.Part1 = Part.Parent.Head
		Weld.C0 = HelmetClone.Head.CFrame
		Weld.C1 = Part.Parent.Head.CFrame
	end
end)

for n,CamGiver in ipairs(game.Workspace:GetChildren()) do
	if CamGiver.Name == "CamGiver" then
		CamGiver.Touched:connect(function(Part)
			if Part.Parent:FindFirstChild("Humanoid") and Part.Parent.Head:FindFirstChild("ISDHelmet") == nil and Part.Parent.Head:FindFirstChild("IAHelmet") == nil and Part.Parent.Head:FindFirstChild("DHelmet") == nil and Part.Parent.Head:FindFirstChild("SDHelmet") == nil and Part.Parent.Head:FindFirstChild("MTFHelmet") == nil and Part.Parent.Head:FindFirstChild("CameraHelm") == nil and Part.Parent.Head:FindFirstChild("Helmet") == nil and Part.Parent:FindFirstChild("Armor equipped") == nil then
				local Player = game.Players:GetPlayerFromCharacter(Part.Parent)
				local Check = Instance.new("StringValue", Part.Parent)
				Check.Name = "Armor equipped"
				for i,v in ipairs(Part.Parent:GetChildren()) do
					if v.ClassName == "Accessory" then
						v:Remove()
					end
				end
				local HelmetClone = game.ServerStorage.Equipment.CD.CameraHelm:Clone()
				HelmetClone.Parent = Part.Parent.Head
				HelmetClone.Head.Transparency = 1
				HelmetClone:SetPrimaryPartCFrame(Part.Parent.Head.CFrame)
				local Weld = Instance.new("ManualWeld", HelmetClone)
				Weld.Part0 = HelmetClone.Head
				Weld.Part1 = Part.Parent.Head
				Weld.C0 = HelmetClone.Head.CFrame
				Weld.C1 = Part.Parent.Head.CFrame
			end
		end)
	end
end

for n,SDGiver in ipairs(game.Workspace:GetChildren()) do
	if SDGiver.Name == "SDGiver" then
		SDGiver.Touched:connect(function(Part)
			if Part.Parent:FindFirstChild("Humanoid") and Part.Parent.Torso:FindFirstChild("SDArmor") == nil and Part.Parent.Torso:FindFirstChild("RedSDArmor") == nil and Part.Parent:FindFirstChild("Armor equipped") == nil then
				local Player = game.Players:GetPlayerFromCharacter(Part.Parent)
				local Check = Instance.new("StringValue", Part.Parent)
				Check.Name = "Armor equipped"
				local CloneArmor = game.ServerStorage.Equipment.SD.SDArmor:Clone()
				CloneArmor.Parent = Part.Parent.Torso
				CloneArmor.Torso.Transparency = 1
				CloneArmor:SetPrimaryPartCFrame(Part.Parent.Torso.CFrame)
				local Weld = Instance.new("ManualWeld", CloneArmor.PrimaryPart)
				Weld.Part0 = CloneArmor.PrimaryPart
				Weld.Part1 = Part.Parent.Torso
				Weld.C0 = CloneArmor.PrimaryPart.CFrame
				Weld.C1 = Part.Parent.Torso.CFrame
			end
		end)
	end
end

for n,SDGiver in ipairs(game.Workspace:GetChildren()) do
	if SDGiver.Name == "RedSDGiver" then
		SDGiver.Touched:connect(function(Part)
			if Part.Parent:FindFirstChild("Humanoid") and Part.Parent.Torso:FindFirstChild("SDArmor") == nil and Part.Parent.Torso:FindFirstChild("RedSDArmor") == nil and Part.Parent:FindFirstChild("Armor equipped") == nil then
				local Player = game.Players:GetPlayerFromCharacter(Part.Parent)
				local Check = Instance.new("StringValue", Part.Parent)
				Check.Name = "Armor equipped"
				local CloneArmor = game.ServerStorage.Equipment.SD.RedSDArmor:Clone()
				CloneArmor.Parent = Part.Parent.Torso
				CloneArmor.Torso.Transparency = 1
				CloneArmor:SetPrimaryPartCFrame(Part.Parent.Torso.CFrame)
				local Weld = Instance.new("ManualWeld", CloneArmor.PrimaryPart)
				Weld.Part0 = CloneArmor.PrimaryPart
				Weld.Part1 = Part.Parent.Torso
				Weld.C0 = CloneArmor.PrimaryPart.CFrame
				Weld.C1 = Part.Parent.Torso.CFrame
			end
		end)
	end
end

for p,EHelmGiver in ipairs(game.Workspace:GetChildren()) do
	if EHelmGiver.Name == "DHelmetGiver" then
		EHelmGiver.Touched:connect(function(Part)
			if Part.Parent:FindFirstChild("Humanoid") and Part.Parent.Head:FindFirstChild("ISDHelmet") == nil and Part.Parent.Head:FindFirstChild("IAHelmet") == nil and Part.Parent.Head:FindFirstChild("DHelmet") == nil and Part.Parent.Head:FindFirstChild("SDHelmet") == nil and Part.Parent.Head:FindFirstChild("MTFHelmet") == nil and Part.Parent.Head:FindFirstChild("CameraHelm") == nil and Part.Parent.Head:FindFirstChild("Helmet") == nil and Part.Parent:FindFirstChild("Armor equipped") == nil then
				local Player = game.Players:GetPlayerFromCharacter(Part.Parent)
				local Check = Instance.new("StringValue", Part.Parent)
				Check.Name = "Armor equipped"
				for i,v in ipairs(Part.Parent:GetChildren()) do
					if v.ClassName == "Accessory" then
						v:Remove()
					end
				end
				local CloneArmor = game.ServerStorage.Equipment["E&T"].DHelmet:Clone()
				local CloneGui = game.ServerStorage.Equipment["E&T"].Flashlight:Clone()
				CloneGui.Parent = game.Players:FindFirstChild(Part.Parent.Name).PlayerGui
				CloneArmor.Parent = Part.Parent.Head
				CloneArmor.Head.Transparency = 1
				CloneArmor:SetPrimaryPartCFrame(Part.Parent.Head.CFrame)
				local Weld = Instance.new("ManualWeld", CloneArmor.PrimaryPart)
				Weld.Part0 = CloneArmor.PrimaryPart
				Weld.Part1 = Part.Parent.Head
				Weld.C0 = CloneArmor.PrimaryPart.CFrame
				Weld.C1 = Part.Parent.Head.CFrame
			end
		end)
	end
end

for p,SDHelmGiver in ipairs(game.Workspace:GetChildren()) do
	if SDHelmGiver.Name == "SDHelmetGiver" then
		SDHelmGiver.Touched:connect(function(Part)
			if Part.Parent:FindFirstChild("Humanoid") and Part.Parent.Head:FindFirstChild("ISDHelmet") == nil and Part.Parent.Head:FindFirstChild("IAHelmet") == nil and Part.Parent.Head:FindFirstChild("DHelmet") == nil and Part.Parent.Head:FindFirstChild("SDHelmet") == nil and Part.Parent.Head:FindFirstChild("MTFHelmet") == nil and Part.Parent.Head:FindFirstChild("CameraHelm") == nil and Part.Parent.Head:FindFirstChild("Helmet") == nil and Part.Parent:FindFirstChild("Armor equipped") == nil then
				local Player = game.Players:GetPlayerFromCharacter(Part.Parent)
				local Check = Instance.new("StringValue", Part.Parent)
				Check.Name = "Armor equipped"
				for i,v in ipairs(Part.Parent:GetChildren()) do
					if v.ClassName == "Accessory" then
						v:Remove()
					end
				end
				local CloneArmor = game.ServerStorage.Equipment.SD.SDHelmet:Clone()
				local CloneGui = game.ServerStorage.Equipment.SD.Flashlight:Clone()
				CloneGui.Parent = game.Players:FindFirstChild(Part.Parent.Name).PlayerGui
				CloneArmor.Parent = Part.Parent.Head
				CloneArmor.Head.Transparency = 1
				CloneArmor:SetPrimaryPartCFrame(Part.Parent.Head.CFrame)
				local Weld = Instance.new("ManualWeld", CloneArmor.PrimaryPart)
				Weld.Part0 = CloneArmor.PrimaryPart
				Weld.Part1 = Part.Parent.Head
				Weld.C0 = CloneArmor.PrimaryPart.CFrame
				Weld.C1 = Part.Parent.Head.CFrame
			end
		end)
	end
end

for p,SDHelmGiver in ipairs(game.Workspace:GetChildren()) do
	if SDHelmGiver.Name == "MTFHelmetGiver" then
		SDHelmGiver.Touched:connect(function(Part)
			if Part.Parent:FindFirstChild("Humanoid") and Part.Parent.Head:FindFirstChild("ISDHelmet") == nil and Part.Parent.Head:FindFirstChild("IAHelmet") == nil and Part.Parent.Head:FindFirstChild("DHelmet") == nil and Part.Parent.Head:FindFirstChild("SDHelmet") == nil and Part.Parent.Head:FindFirstChild("MTFHelmet") == nil and Part.Parent.Head:FindFirstChild("CameraHelm") == nil and Part.Parent.Head:FindFirstChild("Helmet") == nil and Part.Parent:FindFirstChild("Armor equipped") == nil then
				for i,v in ipairs(Part.Parent:GetChildren()) do
					if v.ClassName == "Accessory" then
						v:Remove()
					end
				end
				local CloneArmor = game.ServerStorage.Equipment.MTF.MTFHelmet:Clone()
				local CloneGui = game.ServerStorage.Equipment.MTF.Flashlight:Clone()
				CloneGui.Parent = game.Players:FindFirstChild(Part.Parent.Name).PlayerGui
				CloneArmor.Parent = Part.Parent.Head
				CloneArmor.Head.Transparency = 1
				CloneArmor:SetPrimaryPartCFrame(Part.Parent.Head.CFrame)
				local Weld = Instance.new("ManualWeld", CloneArmor.PrimaryPart)
				Weld.Part0 = CloneArmor.PrimaryPart
				Weld.Part1 = Part.Parent.Head
				Weld.C0 = CloneArmor.PrimaryPart.CFrame
				Weld.C1 = Part.Parent.Head.CFrame
			end
		end)
	end
end

game.ReplicatedStorage.EquipmentFE.Flashlight.OnServerEvent:connect(function(Player)
	if Player.Character.Head:FindFirstChild("SDHelmet") then
		if Player.Character.Head.SDHelmet.Flashlight.Main.Light.SurfaceLight.Enabled == true then
			Player.Character.Head.SDHelmet.Flashlight.Main.Light.SurfaceLight.Enabled = false
			Player.Character.Head.SDHelmet.Flashlight.Main.Light.Material = Enum.Material.SmoothPlastic
			Player.Character.Head.SDHelmet.Flashlight.RLight.Material = Enum.Material.SmoothPlastic
			Player.Character.Head.SDHelmet.Flashlight.Main.Light.BrickColor = BrickColor.new("Really black")
			Player.Character.Head.SDHelmet.Flashlight.WLight.BrickColor = BrickColor.new("Really black")
			return nil
		end
		if Player.Character.Head.SDHelmet.Flashlight.Main.Light.SurfaceLight.Enabled == false then
			Player.Character.Head.SDHelmet.Flashlight.Main.Light.SurfaceLight.Enabled = true
			Player.Character.Head.SDHelmet.Flashlight.Main.Light.Material = Enum.Material.Neon
			Player.Character.Head.SDHelmet.Flashlight.RLight.Material = Enum.Material.Neon
			Player.Character.Head.SDHelmet.Flashlight.Main.Light.BrickColor = BrickColor.new("Mid gray")
			Player.Character.Head.SDHelmet.Flashlight.WLight.BrickColor = BrickColor.new("Lily white")
			return nil
		end
	elseif Player.Character.Head:FindFirstChild("DHelmet") then
		if Player.Character.Head.DHelmet.Flashlight.Main.Light.SurfaceLight.Enabled == true then
			Player.Character.Head.DHelmet.Flashlight.Main.Light.SurfaceLight.Enabled = false
			Player.Character.Head.DHelmet.Flashlight.Main.Light.Material = Enum.Material.SmoothPlastic
			Player.Character.Head.DHelmet.Flashlight.RLight.Material = Enum.Material.SmoothPlastic
			Player.Character.Head.DHelmet.Flashlight.Main.Light.BrickColor = BrickColor.new("Really black")
			Player.Character.Head.DHelmet.Flashlight.WLight.BrickColor = BrickColor.new("Really black")
			return nil
		end
		if Player.Character.Head.DHelmet.Flashlight.Main.Light.SurfaceLight.Enabled == false then
			Player.Character.Head.DHelmet.Flashlight.Main.Light.SurfaceLight.Enabled = true
			Player.Character.Head.DHelmet.Flashlight.Main.Light.Material = Enum.Material.Neon
			Player.Character.Head.DHelmet.Flashlight.RLight.Material = Enum.Material.Neon
			Player.Character.Head.DHelmet.Flashlight.Main.Light.BrickColor = BrickColor.new("Mid gray")
			Player.Character.Head.DHelmet.Flashlight.WLight.BrickColor = BrickColor.new("Lily white")
			return nil
		end
	elseif Player.Character.Head:FindFirstChild("MTFHelmet") then
		if Player.Character.Head.SDHelmet.Flashlight.Main.Light.SurfaceLight.Enabled == true then
			Player.Character.Head.SDHelmet.Flashlight.Main.Light.SurfaceLight.Enabled = false
			Player.Character.Head.SDHelmet.Flashlight.Main.Light.Material = Enum.Material.SmoothPlastic
			Player.Character.Head.SDHelmet.Flashlight.RLight.Material = Enum.Material.SmoothPlastic
			Player.Character.Head.SDHelmet.Flashlight.Main.Light.BrickColor = BrickColor.new("Really black")
			Player.Character.Head.SDHelmet.Flashlight.WLight.BrickColor = BrickColor.new("Really black")
			return nil
		end
		if Player.Character.Head.SDHelmet.Flashlight.Main.Light.SurfaceLight.Enabled == false then
			Player.Character.Head.SDHelmet.Flashlight.Main.Light.SurfaceLight.Enabled = true
			Player.Character.Head.SDHelmet.Flashlight.Main.Light.Material = Enum.Material.Neon
			Player.Character.Head.SDHelmet.Flashlight.RLight.Material = Enum.Material.Neon
			Player.Character.Head.SDHelmet.Flashlight.Main.Light.BrickColor = BrickColor.new("Mid gray")
			Player.Character.Head.SDHelmet.Flashlight.WLight.BrickColor = BrickColor.new("Lily white")
			return nil
		end
	elseif Player.Character.Head:FindFirstChild("IAHelmet") then
		if Player.Character.Head.IAHelmet.Flashlight.Main.Light.SurfaceLight.Enabled == true then
			Player.Character.Head.IAHelmet.Flashlight.Main.Light.SurfaceLight.Enabled = false
			Player.Character.Head.IAHelmet.Flashlight.Main.Light.Material = Enum.Material.SmoothPlastic
			Player.Character.Head.IAHelmet.Flashlight.RLight.Material = Enum.Material.SmoothPlastic
			Player.Character.Head.IAHelmet.Flashlight.Main.Light.BrickColor = BrickColor.new("Really black")
			Player.Character.Head.IAHelmet.Flashlight.WLight.BrickColor = BrickColor.new("Really black")
			return nil
		end
		if Player.Character.Head.IAHelmet.Flashlight.Main.Light.SurfaceLight.Enabled == false then
			Player.Character.Head.IAHelmet.Flashlight.Main.Light.SurfaceLight.Enabled = true
			Player.Character.Head.IAHelmet.Flashlight.Main.Light.Material = Enum.Material.Neon
			Player.Character.Head.IAHelmet.Flashlight.RLight.Material = Enum.Material.Neon
			Player.Character.Head.IAHelmet.Flashlight.Main.Light.BrickColor = BrickColor.new("Mid gray")
			Player.Character.Head.IAHelmet.Flashlight.WLight.BrickColor = BrickColor.new("Lily white")
			return nil
		end
	elseif Player.Character.Head:FindFirstChild("ISDHelmet") then
		if Player.Character.Head.ISDHelmet.Flashlight.Main.Light.SurfaceLight.Enabled == true then
			Player.Character.Head.ISDHelmet.Flashlight.Main.Light.SurfaceLight.Enabled = false
			Player.Character.Head.ISDHelmet.Flashlight.Main.Light.Material = Enum.Material.SmoothPlastic
			Player.Character.Head.ISDHelmet.Flashlight.RLight.Material = Enum.Material.SmoothPlastic
			Player.Character.Head.ISDHelmet.Flashlight.Main.Light.BrickColor = BrickColor.new("Really black")
			Player.Character.Head.ISDHelmet.Flashlight.WLight.BrickColor = BrickColor.new("Really black")
			return nil
		end
		if Player.Character.Head.ISDHelmet.Flashlight.Main.Light.SurfaceLight.Enabled == false then
			Player.Character.Head.ISDHelmet.Flashlight.Main.Light.SurfaceLight.Enabled = true
			Player.Character.Head.ISDHelmet.Flashlight.Main.Light.Material = Enum.Material.Neon
			Player.Character.Head.ISDHelmet.Flashlight.RLight.Material = Enum.Material.Neon
			Player.Character.Head.ISDHelmet.Flashlight.Main.Light.BrickColor = BrickColor.new("Mid gray")
			Player.Character.Head.ISDHelmet.Flashlight.WLight.BrickColor = BrickColor.new("Lily white")
			return nil
		end
	elseif Player.Character.Head:FindFirstChild("Helmet") then
		if Player.Character.Head.Helmet.Light.Bright.Enabled == false then
			Player.Character.Head.Helmet.Light.Bright.Enabled = true
			Player.Character.Head.Helmet.Light.BrickColor = BrickColor.new("Really black")
			return nil
		end
		if Player.Character.Head.Helmet.Light.Bright.Enabled == true then
			Player.Character.Head.Helmet.Light.Bright.Enabled = false
			Player.Character.Head.Helmet.Light.BrickColor = BrickColor.new("Institutional white")
			return nil
		end
	end
end)

BreachActivation = false
BreachDB = true

BreachLever = game.Workspace.BreachLever

Doors = {}

for i,v in ipairs(game.Workspace:GetChildren()) do
	if v.Name == "LockdownDoor" then
		table.insert(Doors, v)
	end
end

local Lockdown = game.ServerStorage.Miscellaneous.Lockdown:Clone()

game.Workspace.BreachLever.Hitbox.ClickDetector.MouseClick:connect(function(Player)
	if BreachActivation == false and BreachDB == true then
		BreachDB = false
		BreachLever.LeverPos.Lever:SetPrimaryPartCFrame(BreachLever.LeverPos.LeverUp.PrimaryPart.CFrame)
		BreachActivation = true
		Lockdown.Parent = game.Workspace
		Lockdown:Play()
		for a = 1,180 do
			wait()
			for i,v in ipairs(Doors) do
				v:SetPrimaryPartCFrame(v.PrimaryPart.CFrame * CFrame.new(0, -0.1, 0))
			end
		end
		BreachDB = true
		return nil
	elseif BreachActivation == true and BreachDB == true then
		BreachDB = false
		BreachLever.LeverPos.Lever:SetPrimaryPartCFrame(BreachLever.LeverPos.LeverDown.PrimaryPart.CFrame)
		BreachActivation = false
		Lockdown:Stop()
		Lockdown.Parent = game.ServerStorage.Miscellaneous
		for a = 1,180 do
			wait()
			for i,v in ipairs(Doors) do
				v:SetPrimaryPartCFrame(v.PrimaryPart.CFrame * CFrame.new(0, 0.1, 0))
			end
		end
		BreachDB = true
		return nil
	end
end)

game.Workspace["SCP-008"].Touched:connect(function(Part)
	if Part.Parent:FindFirstChild("Humanoid") and game.Players:GetPlayerFromCharacter(Part.Parent).Backpack:FindFirstChild("Zombie") == nil then
		local Clone = game.ServerStorage["008Objects"].Zombie:Clone()
		Clone.Parent = game.Players:GetPlayerFromCharacter(Part.Parent).Backpack
		Clone.Disabled = false
	end
end)

Alarm = false
AlarmDB = true
AlarmLever = game.Workspace.AlarmLever
InitialAlarm = game.ServerStorage.Miscellaneous.Initiate

AlarmLever.Hitbox.ClickDetector.MouseClick:connect(function(Player)
	if Alarm == false and AlarmDB == true then
		AlarmDB = false
		Alarm = true
		AlarmLever.LeverPos.Lever:SetPrimaryPartCFrame(AlarmLever.LeverPos.LeverUp.PrimaryPart.CFrame)
		Lockdown.Parent = game.Workspace
		Lockdown:Play()
		InitialAlarm.Parent = game.Workspace
		InitialAlarm:Play()
		for g,Light in ipairs(game.Workspace:GetChildren()) do
			if Light.Name == "Light" then
				Light.Lightpart.SurfaceLight.Color = Color3.new(255, 0, 0)
			end
			if Light.Name == "Sign" then
				Light.SurfaceLight.Color = Color3.new(255, 0, 0)
			end
		end
		AlarmDB = true
	elseif Alarm == true and AlarmDB == true  then
		AlarmDB = false
		Alarm = false
		AlarmLever.LeverPos.Lever:SetPrimaryPartCFrame(AlarmLever.LeverPos.LeverDown.PrimaryPart.CFrame)
		Lockdown:Stop()
		Lockdown.Parent = game.ServerStorage.Miscellaneous
		InitialAlarm:Stop()
		InitialAlarm.Parent = game.ServerStorage.Miscellaneous
		for g,Light in ipairs(game.Workspace:GetChildren()) do
			if Light.Name == "Light" then
				Light.Lightpart.SurfaceLight.Color = Color3.new(255, 255, 255)
			end
			if Light.Name == "Sign" then
				Light.SurfaceLight.Color = Color3.new(255, 255, 255)
			end
		end
		AlarmDB = true
	end
end)

ShelterLever = game.Workspace.ShelterLever
ShelterDoor = game.Workspace.BreachDoor
ShelterDB = true
Open = false

ShelterLever.Hitbox.ClickDetector.MouseClick:connect(function(Player)
	if ShelterDB == true and Open == false then
		ShelterDB = false
		ShelterLever.LeverPos.Lever:SetPrimaryPartCFrame(ShelterLever.LeverPos.LeverUp.PrimaryPart.CFrame)
		for i = 1,200 do
			wait()
			ShelterDoor.Lock1:SetPrimaryPartCFrame(ShelterDoor.Lock1.PrimaryPart.CFrame * CFrame.Angles(math.rad(2), 0, 0))
			ShelterDoor.Lock2:SetPrimaryPartCFrame(ShelterDoor.Lock2.PrimaryPart.CFrame * CFrame.Angles(math.rad(2), 0, 0))
		end
		for i = 1,50 do
			wait()
			ShelterDoor:SetPrimaryPartCFrame(ShelterDoor.PrimaryPart.CFrame * CFrame.new(0, -0.2, 0))
		end
		Open = true
		ShelterDB = true
	elseif ShelterDB == true and Open == true then
		ShelterDB = false
		ShelterLever.LeverPos.Lever:SetPrimaryPartCFrame(ShelterLever.LeverPos.LeverDown.PrimaryPart.CFrame)
		for i = 1,50 do
			wait()
			ShelterDoor:SetPrimaryPartCFrame(ShelterDoor.PrimaryPart.CFrame * CFrame.new(0, 0.2, 0))
		end
		for i = 1,200 do
			wait()
			ShelterDoor.Lock1:SetPrimaryPartCFrame(ShelterDoor.Lock1.PrimaryPart.CFrame * CFrame.Angles(math.rad(-2), 0, 0))
			ShelterDoor.Lock2:SetPrimaryPartCFrame(ShelterDoor.Lock2.PrimaryPart.CFrame * CFrame.Angles(math.rad(-2), 0, 0))
		end
		Open = false
		ShelterDB = true
	end
end)

game.Players.PlayerAdded:connect(function(Player)
	Player.CharacterAdded:connect(function()
		if Player.Name == "Kyodo" then
			game.ServerStorage.Keycards["Omni Card"]:Clone().Parent = Player.Backpack
		elseif Player.Name == "doser225" then
			game.ServerStorage.Keycards["Omni Card"]:Clone().Parent = Player.Backpack
		end
	end)
end)

Ambient = true

local Debounce = true

if Ambient == true then
	while Ambient == true do
		wait(100)
		if Debounce == true then
			Debounce = false
			local Effect = game.ServerStorage.Ambients:GetChildren()[math.random(1, #game.ServerStorage.Ambients:GetChildren())]:Clone()
			Effect.Parent = game.Soundscape
			Effect:Play()
			wait(Effect.TimeLength)
			Effect:Stop()
			Effect:Destroy()
			Debounce = true
		end
	end
end
