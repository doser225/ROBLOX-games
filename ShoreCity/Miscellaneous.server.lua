
local Chat = game:GetService('Chat')
local Debris = game:GetService('Debris')

game.ReplicatedStorage.ClanFE.ClanTag.OnServerEvent:connect(function(Player, ClanText)
	if Player.Character.Head:FindFirstChild("ClanTag") then
		Player.Character.Head:FindFirstChild("ClanTag"):Destroy()
	end
	local ClanTag = game.ServerStorage.GameObjects.ClanTag:Clone()
	ClanTag.Parent = Player.Character.Head
	ClanTag.ClanText.Text = Chat:FilterStringForBroadcast(ClanText, Player)
	if game.Workspace.Ragdolls:FindFirstChild(Player.Name) then
		game.Workspace.Ragdolls:FindFirstChild(Player.Name).Head:FindFirstChild("ClanTag"):Destroy()
		local ClanTag = game.ServerStorage.GameObjects.ClanTag:Clone()
		ClanTag.Parent = game.Workspace.Ragdolls:FindFirstChild(Player.Name).Head
		ClanTag.ClanText.Text = Chat:FilterStringForBroadcast(ClanText, Player)
	end
end)

game.ReplicatedStorage.Doors.LockDoor.OnServerEvent:connect(function(Player, DoorModel)
	if DoorModel.DoorKnob.BrickColor == BrickColor.new("Bright yellow") then
		DoorModel.DoorKnob.BrickColor = BrickColor.new("Black")
	elseif DoorModel.DoorKnob.BrickColor == BrickColor.new("Black") then
		DoorModel.DoorKnob.BrickColor = BrickColor.new("Bright yellow")
	end
end)

game.Players.PlayerAdded:connect(function(Player)
	local leaderstats = Instance.new("Model", Player)
	leaderstats.Name = "leaderstats"
	local Kills = Instance.new("NumberValue", leaderstats)
	Kills.Name = "Kills"
	Kills.Value = 0
	wait(1)
	game.ServerStorage.Miscellaneous.StartMessage:Clone().Parent = Player.PlayerGui
end)

wait(10)

for num,Spawn in ipairs(game.Workspace.CrateSpawns:GetChildren()) do
	local Crate = game.ServerStorage.GameObjects.Crates:GetChildren()[math.random(1, #game.ServerStorage.GameObjects.Crates:GetChildren())]:Clone()
	Debris:AddItem(Crate, 280)
	Crate.Parent = game.Workspace
	Crate:SetPrimaryPartCFrame(Spawn.CFrame)
end

while wait(300) do
	for num,Spawn in ipairs(game.Workspace.CrateSpawns:GetChildren()) do
		local Crate = game.ServerStorage.GameObjects.Crates:GetChildren()[math.random(1, #game.ServerStorage.GameObjects.Crates:GetChildren())]:Clone()
		Debris:AddItem(Crate, 299)
		Crate.Parent = game.Workspace
		Crate:SetPrimaryPartCFrame(Spawn.CFrame)
	end
end