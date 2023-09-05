local GamePass = game:GetService('GamePassService')
local MarketPlace = game:GetService('MarketplaceService')

game.ReplicatedStorage.ShopFE.ProductPurchase.OnServerEvent:connect(function(Player, ProductId)
	MarketPlace:PromptPurchase(Player, ProductId)
end)

MarketPlace.PromptPurchaseFinished:connect(function(Player, ProductId, Purchased)
	print(Purchased)
	if Purchased and ProductId == 1048041113 then
		local MusicPlayer = game.ServerStorage.GamepassItems.MusicPlayer:Clone()
		MusicPlayer.Parent = Player.PlayerGui
		Player.CharacterAdded:connect(function()
			local MusicPlayer = game.ServerStorage.GamepassItems.MusicPlayer:Clone()
			MusicPlayer.Parent = Player.PlayerGui
		end)
	end
	Player.CharacterAdded:connect(function()
		if Purchased and ProductId == 1050458244 then
			local Sledgehammer = game.ServerStorage.GamepassItems.Sledgehammer:Clone()
			--Sledgehammer:Clone().Parent = Player.StarterGear
			Sledgehammer.Parent = Player.Backpack
		end
		if Purchased and ProductId == 1067717392 then
			local Lockpick = game.ServerStorage.GamepassItems.Lockpick:Clone()
			--Lockpick:Clone().Parent = Player.StarterGear
			Lockpick.Parent = Player.Backpack
		end
		if Purchased and ProductId == 1125129377 then
			local Gun = game.ServerStorage.Guns["M1 Garand"]:Clone()
			--Gun:Clone().Parent = Player.StarterGear
			Gun.Parent = Player.Backpack
			local Gun = game.ServerStorage.Guns["Shotgun"]:Clone()
			--Gun:Clone().Parent = Player.StarterGear
			Gun.Parent = Player.Backpack
			local Gun = game.ServerStorage.Guns["Sniper"]:Clone()
			--Gun:Clone().Parent = Player.StarterGear
			Gun.Parent = Player.Backpack
		end
		if Purchased and ProductId == 1125132599 then
			local Gun = game.ServerStorage.Guns["M16"]:Clone()
			--Gun:Clone().Parent = Player.StarterGear
			Gun.Parent = Player.Backpack
			local Gun = game.ServerStorage.Guns["Thompson"]:Clone()
			--Gun:Clone().Parent = Player.StarterGear
			Gun.Parent = Player.Backpack
			local Gun = game.ServerStorage.Guns["UZI"]:Clone()
			--Gun:Clone().Parent = Player.StarterGear
			Gun.Parent = Player.Backpack
		end
		if Purchased and ProductId == 1125135607 then
			local Katana = game.ServerStorage.Melee["God's Claw"]:Clone()
			--Katana:Clone().Parent = Player.StarterGear
			Katana.Parent = Player.Backpack
		end
		if Purchased and ProductId == 1125147474 then
			local Item = game.ServerStorage.Melee["Crowbar"]:Clone()
			--Item:Clone().Parent = Player.StarterGear
			Item.Parent = Player.Backpack
			local Item = game.ServerStorage.Explosives.C4:Clone()
			--Item:Clone().Parent = Player.StarterGear
			Item.Parent = Player.Backpack
			local Item = game.ServerStorage.Explosives.Grenade:Clone()
			--Item:Clone().Parent = Player.StarterGear
			Item.Parent = Player.Backpack
		end
	end)
end)

game.Players.PlayerAdded:connect(function(Player)
	Player.CharacterAdded:connect(function()
		if GamePass:PlayerHasPass(Player, 1048041113) then
			local MusicPlayer = game.ServerStorage.GamepassItems.MusicPlayer:Clone()
			wait()
			MusicPlayer.Parent = Player.PlayerGui
		end
		if GamePass:PlayerHasPass(Player, 1050458244) then
			local Sledgehammer = game.ServerStorage.GamepassItems.Sledgehammer:Clone()
			wait()
			--Sledgehammer:Clone().Parent = Player.StarterGear
			Sledgehammer.Parent = Player.Backpack
		end
		if GamePass:PlayerHasPass(Player, 1067717392) then
			local Lockpick = game.ServerStorage.GamepassItems.Lockpick:Clone()
			wait()
			--Lockpick:Clone().Parent = Player.StarterGear
			Lockpick.Parent = Player.Backpack
		end
		if GamePass:PlayerHasPass(Player, 1125129377) then
			local Gun = game.ServerStorage.Guns["M1 Garand"]:Clone()
			wait()
			--Gun:Clone().Parent = Player.StarterGear
			Gun.Parent = Player.Backpack
			local Gun = game.ServerStorage.Guns["Shotgun"]:Clone()
			wait()
			--Gun:Clone().Parent = Player.StarterGear
			Gun.Parent = Player.Backpack
			local Gun = game.ServerStorage.Guns["Sniper"]:Clone()
			wait()
			--Gun:Clone().Parent = Player.StarterGear
			Gun.Parent = Player.Backpack
		end
		if GamePass:PlayerHasPass(Player, 1125132599) then
			local Gun = game.ServerStorage.Guns["M16"]:Clone()
			wait()
			--Gun:Clone().Parent = Player.StarterGear
			Gun.Parent = Player.Backpack
			local Gun = game.ServerStorage.Guns["Thompson"]:Clone()
			wait()
			--Gun:Clone().Parent = Player.StarterGear
			Gun.Parent = Player.Backpack
			local Gun = game.ServerStorage.Guns["UZI"]:Clone()
			wait()
			--Gun:Clone().Parent = Player.StarterGear
			Gun.Parent = Player.Backpack
		end
		if GamePass:PlayerHasPass(Player, 1125135607) then
			local Katana = game.ServerStorage.Melee["God's Claw"]:Clone()
			wait()
			--Katana:Clone().Parent = Player.StarterGear
			Katana.Parent = Player.Backpack
		end
		if GamePass:PlayerHasPass(Player, 1125147474) then
			local Item = game.ServerStorage.Melee["Crowbar"]:Clone()
			wait()
			--Item:Clone().Parent = Player.StarterGear
			Item.Parent = Player.Backpack
			local Item = game.ServerStorage.Explosives.C4:Clone()
			wait()
			--Item:Clone().Parent = Player.StarterGear
			Item.Parent = Player.Backpack
			local Item = game.ServerStorage.Explosives.Grenade:Clone()
			wait()
			--Item:Clone().Parent = Player.StarterGear
			Item.Parent = Player.Backpack
		end
	end)
end)