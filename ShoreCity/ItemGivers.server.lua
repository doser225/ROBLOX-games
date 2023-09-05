wait(3)

GunGivers = {game.Workspace.M16Buy, game.Workspace.M1911Buy, game.Workspace.SniperBuy, game.Workspace.ShotgunBuy, game.Workspace.ThompsonBuy, game.Workspace.UZIBuy, game.Workspace.M1GarandBuy}
ItemGivers = {game.Workspace.AppleBuy, game.Workspace.MuffinBuy, game.Workspace.BurgerBuy, game.Workspace.PieBuy, game.Workspace.TurkeyBuy, game.Workspace.CrowbarBuy}
ExplosiveGivers = {game.Workspace.GrenadeBuy, game.Workspace.C4Buy}

for num, Part in ipairs(GunGivers) do
	Part.ClickDetector.MouseClick:connect(function(Player)
		if game.ReplicatedStorage.Money:FindFirstChild(Player.UserId) ~= nil then
			if game.ReplicatedStorage.Money:FindFirstChild(Player.UserId).Value >= Part.Price.Value and Player.Backpack:FindFirstChild(Part.Gun.Value.Name) == nil then
				game.ReplicatedStorage.Money:FindFirstChild(Player.UserId).Value = game.ReplicatedStorage.Money:FindFirstChild(Player.UserId).Value - Part.Price.Value
				Part.Gun.Value:Clone().Parent = Player.Backpack
				Part.Gun.Value:Clone().Parent = Player.StarterGear
			elseif game.ReplicatedStorage.Money:FindFirstChild(Player.UserId).Value >= Part.Price.Value / 2 and Player.Backpack:FindFirstChild(Part.Gun.Value.Name) ~= nil then
				Player.Backpack:FindFirstChild(Part.Gun.Value.Name).Ammo.Value = Player.Backpack:FindFirstChild(Part.Gun.Value.Name).Ammo.Value - 1
				Player.Backpack:FindFirstChild(Part.Gun.Value.Name).Ammo.Value = Player.Backpack:FindFirstChild(Part.Gun.Value.Name).Ammo.Value + 1
				game.ReplicatedStorage.Money:FindFirstChild(Player.UserId).Value = game.ReplicatedStorage.Money:FindFirstChild(Player.UserId).Value - Part.Price.Value / 2
			end
		end
	end)
end

for num, Part in ipairs(ItemGivers) do
	Part.ClickDetector.MouseClick:connect(function(Player)
		if game.ReplicatedStorage.Money:FindFirstChild(Player.UserId) ~= nil then
			if game.ReplicatedStorage.Money:FindFirstChild(Player.UserId).Value >= Part.Price.Value and Player.Backpack:FindFirstChild(Part.Object.Value.Name) == nil then
				game.ReplicatedStorage.Money:FindFirstChild(Player.UserId).Value = game.ReplicatedStorage.Money:FindFirstChild(Player.UserId).Value - Part.Price.Value
				Part.Object.Value:Clone().Parent = Player.Backpack
				if Part.Object.Value.Name == "Crowbar" then
					Part.Object.Value:Clone().Parent = Player.StarterGear
				end
			end
		end
	end)
end

for num, Part in ipairs(ExplosiveGivers) do
	Part.ClickDetector.MouseClick:connect(function(Player)
		if game.ReplicatedStorage.Money:FindFirstChild(Player.UserId) ~= nil then
			if game.ReplicatedStorage.Money:FindFirstChild(Player.UserId).Value >= Part.Price.Value then
				game.ReplicatedStorage.Money:FindFirstChild(Player.UserId).Value = game.ReplicatedStorage.Money:FindFirstChild(Player.UserId).Value - Part.Price.Value
				Part.Object.Value:Clone().Parent = Player.Backpack
			end
		end
	end)
end