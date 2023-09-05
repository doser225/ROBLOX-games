function game.ReplicatedStorage.ExecuteFE.ExecuteEnemy.OnServerInvoke(Player, Enemy)
	wait(0.7)
	if Enemy.Parent ~= nil then
		local Sound = Instance.new("Sound", Enemy.Parent.Torso)
		Sound.SoundId = "rbxassetid://260430079"
		Sound.Volume = 1
		Sound:Play()
		Enemy.Health = 0
		game.ReplicatedStorage.Money:FindFirstChild(Player.UserId).Value = game.ReplicatedStorage.Money:FindFirstChild(Player.UserId).Value + 100
		Player.leaderstats.Kills.Value = Player.leaderstats.Kills.Value + 1
	end
end

function game.ReplicatedStorage.ExecuteFE.RobEnemy.OnServerInvoke(Player, Enemy)
	if Enemy ~= nil and (Player.Character.Torso.Position - Enemy.Parent.Torso.Position).magnitude < 6 and Enemy.Health > 0 then
		local RobValue = math.random(150, 500)
		if RobValue > game.ReplicatedStorage.Money:FindFirstChild(game.Players:FindFirstChild(Enemy.Parent.Name).UserId).Value then
			game.ReplicatedStorage.Money:FindFirstChild(Player.UserId).Value = game.ReplicatedStorage.Money:FindFirstChild(Player.UserId).Value + game.ReplicatedStorage.Money:FindFirstChild(game.Players:FindFirstChild(Enemy.Parent.Name).UserId).Value
			game.ReplicatedStorage.Money:FindFirstChild(game.Players:FindFirstChild(Enemy.Parent.Name).UserId).Value = 0
		else
			game.ReplicatedStorage.Money:FindFirstChild(game.Players:FindFirstChild(Enemy.Parent.Name).UserId).Value = game.ReplicatedStorage.Money:FindFirstChild(game.Players:FindFirstChild(Enemy.Parent.Name).UserId).Value - RobValue
			game.ReplicatedStorage.Money:FindFirstChild(Player.UserId).Value = game.ReplicatedStorage.Money:FindFirstChild(Player.UserId).Value + RobValue
		end
	end
end

game.ReplicatedStorage.ExecuteFE.Reset.OnServerEvent:connect(function(Player)
	Player.Character.Humanoid.Health = 0
end)