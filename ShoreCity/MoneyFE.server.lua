local Money = game:GetService('DataStoreService'):GetDataStore("Money")

game.Players.PlayerAdded:connect(function(Player)
	local PlayerCooldown = Instance.new("NumberValue", game.ReplicatedStorage.Bank.CooldownD)
	PlayerCooldown.Value = 0
	PlayerCooldown.Name = Player.UserId
	local PlayerCooldownW = PlayerCooldown:Clone()
	PlayerCooldownW.Parent = game.ReplicatedStorage.Bank.CooldownW
	DepositChange = PlayerCooldown.Changed:connect(function()
		if PlayerCooldown.Value == 200 then
			for i = 1,PlayerCooldown.Value do
				wait(1)
				PlayerCooldown.Value = PlayerCooldown.Value - 1
			end
		end
	end)
	WithdrawChange = PlayerCooldownW.Changed:connect(function()
		if PlayerCooldownW.Value == 10 then
			for i = 1,PlayerCooldownW.Value do
				wait(1)
				PlayerCooldownW.Value = PlayerCooldownW.Value - 1
			end
		end
	end)
	if Money:GetAsync(Player.UserId) == nil then
		Money:SetAsync(Player.UserId, 2000)
		local PlayerMoney = Instance.new("NumberValue", game.ReplicatedStorage.Money)
		PlayerMoney.Value = 0
		PlayerMoney.Name = Player.UserId
		local BankMoney = Instance.new("NumberValue", game.ReplicatedStorage.Bank)
		BankMoney.Value = 2000
		BankMoney.Name = Player.UserId
		Update = BankMoney.Changed:connect(function()
			Money:SetAsync(Player.UserId, BankMoney.Value)
		end)
		wait(1)
		local PlayerDie = Player.Character.Humanoid.Died:connect(function()
			PlayerMoney.Value = 0
		end)
		PlayerRemove = game.Players.PlayerRemoving:connect(function(PlayerR)
			if PlayerMoney.Name == PlayerR.UserId then
				PlayerMoney:Destroy()
				PlayerCooldown:Destroy()
				PlayerCooldownW:Destroy()
				WithdrawChange:Disconnect()
				DepositChange:Disconnect()
				PlayerRemove:Disconnect()
				Update:Disconnect()
				PlayerDie:Disconnect()
			end
		end)
	else
		local PlayerMoney = Instance.new("NumberValue", game.ReplicatedStorage.Money)
		PlayerMoney.Value = 0
		PlayerMoney.Name = Player.UserId
		local BankMoney = Instance.new("NumberValue", game.ReplicatedStorage.Bank)
		BankMoney.Value = Money:GetAsync(Player.UserId)
		BankMoney.Name = Player.UserId
		Update = BankMoney.Changed:connect(function()
			Money:SetAsync(Player.UserId, BankMoney.Value)
		end)
		wait(1)
		local PlayerDie = Player.Character.Humanoid.Died:connect(function()
			PlayerMoney.Value = 0
		end)
		PlayerRemove = game.Players.PlayerRemoving:connect(function(PlayerR)
			if PlayerMoney.Name == PlayerR.UserId then
				PlayerMoney:Destroy()
				PlayerCooldown:Destroy()
				PlayerCooldownW:Destroy()
				WithdrawChange:Disconnect()
				DepositChange:Disconnect()
				PlayerRemove:Disconnect()
				Update:Disconnect()
				PlayerDie:Disconnect()
			end
		end)
	end
end)

game.ReplicatedStorage.Bank.SaveMoney.OnServerEvent:connect(function(Player, Amount)
	if game.ReplicatedStorage.Bank:FindFirstChild(Player.UserId) and game.ReplicatedStorage.Money:FindFirstChild(Player.UserId) and game.ReplicatedStorage.Bank.CooldownD:FindFirstChild(Player.UserId).Value == 0 then
		if game.ReplicatedStorage.Money:FindFirstChild(Player.UserId).Value >= Amount then
			game.ReplicatedStorage.Bank:FindFirstChild(Player.UserId).Value = game.ReplicatedStorage.Bank:FindFirstChild(Player.UserId).Value + Amount
			game.ReplicatedStorage.Money:FindFirstChild(Player.UserId).Value = game.ReplicatedStorage.Money:FindFirstChild(Player.UserId).Value - Amount
			game.ReplicatedStorage.Bank.CooldownD:FindFirstChild(Player.UserId).Value = 200
		end
	end
end)
game.ReplicatedStorage.Bank.WithdrawMoney.OnServerEvent:connect(function(Player, Amount)
	if game.ReplicatedStorage.Bank:FindFirstChild(Player.UserId) and game.ReplicatedStorage.Money:FindFirstChild(Player.UserId) and game.ReplicatedStorage.Bank.CooldownW:FindFirstChild(Player.UserId).Value == 0 then
		if (game.ReplicatedStorage.Bank:FindFirstChild(Player.UserId).Value - Amount) >= 0 then
			game.ReplicatedStorage.Bank:FindFirstChild(Player.UserId).Value = game.ReplicatedStorage.Bank:FindFirstChild(Player.UserId).Value - Amount
			game.ReplicatedStorage.Money:FindFirstChild(Player.UserId).Value = game.ReplicatedStorage.Money:FindFirstChild(Player.UserId).Value + Amount
			game.ReplicatedStorage.Bank.CooldownW:FindFirstChild(Player.UserId).Value = 10
		end
	end
end)