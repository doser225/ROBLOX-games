 -- DO NOT UNDER ANY CIRCUMSTANCE CHANGE THE NAME OF THESE DATASTORES, WILL RESULT IN DATA LOSS

local Debris = game:GetService('Debris')

local PlayerData = game:GetService('DataStoreService'):GetDataStore('x2')

defaultPackage = {
	['TitanKills'] = 0,
	['Money'] = 0,
	['GasAmount'] = 4000,
	['BladeAmount'] = 8,
	['BladeStrength'] = 3,
	['BladeDamage'] = 50,
	['Faction'] = '',
	['Inventory'] = {},
	['InventorySpace'] = 5,
	['Level'] = 1,
	['EXP'] = 0,
	['Bounty'] = 0,
	['Shifter'] = false,
	['HorseType'] = 'Brown', -- insert 'Brown_Supplies' for supply variant
	['HorseSupplies'] = false,
	['ThunderSpears'] = false,
	['HookRange'] = 250,
	['ODMSpeed'] = 1900,
	
	['MP'] = false,
	['Rogue'] = false,
	['StatGuard'] = false,
	['Scouts'] = false
}

--[[spawn(function()
	while true do
		wait(1)
		for num,Val in pairs(game.Players:GetPlayers()) do
			for key,v in pairs(_G[Val.Name]) do
				print(key, ' ', v)
			end
		end
	end
end)]]

spawn(function()
	while true do
		wait(10)
		for num,Player in ipairs(game.Players:GetPlayers()) do
			if PlayerData:GetAsync(Player.UserId) == nil then
				_G[Player.Name] = defaultPackage
				PlayerData:SetAsync(Player.UserId, _G[Player.Name])
			else
				wait(0.5)
				local invTable = {}
				for num,Item in ipairs(Player.Inventory:GetChildren()) do
					if Item.Name ~= 'InventorySpace' then
						table.insert(invTable, Item.Name)
					end
				end
				_G[Player.Name]['Inventory'] = invTable
				PlayerData:UpdateAsync(Player.UserId, function()
					return _G[Player.Name]
				end)
			end
		end
	end
end)

local DefaultMeshes = {
	['LeftFoot'] = 'http://www.roblox.com/asset/?id=1699715602',
	['LeftHand'] = 'http://www.roblox.com/asset/?id=1699715537',
	['LeftLowerArm'] = 'http://www.roblox.com/asset/?id=1699715541',
	['LeftLowerLeg'] = 'http://www.roblox.com/asset/?id=1699715610',
	['LeftUpperArm'] = 'http://www.roblox.com/asset/?id=1699715550',
	['LeftUpperLeg'] = 'http://www.roblox.com/asset/?id=1699715616',
	['LowerTorso'] = 'http://www.roblox.com/asset/?id=1699715652',
	['RightFoot'] = 'http://www.roblox.com/asset/?id=1699715627',
	['RightHand'] = 'http://www.roblox.com/asset/?id=1699715557',
	['RightLowerArm'] = 'http://www.roblox.com/asset/?id=1699715562',
	['RightLowerLeg'] = 'http://www.roblox.com/asset/?id=1699715632',
	['RightUpperArm'] = 'http://www.roblox.com/asset/?id=1699715576',
	['RightUpperLeg'] = 'http://www.roblox.com/asset/?id=1699715641',
	['UpperTorso'] = 'http://www.roblox.com/asset/?id=1699715593',
}

game.Players.PlayerAdded:connect(function(Player)
	Player.CharacterAdded:connect(function()
		wait()
		game.ServerStorage.AOTObjects:WaitForChild('Shifting')
		if _G[Player.Name]['Shifter'] == true then
			game.ServerStorage.AOTObjects.Shifting:Clone().Parent = Player.Backpack
		end
		if Player.Character.Name == Player.Name then
			game.ServerStorage.UI.CharCustomization:Clone().Parent = Player.PlayerGui
			Player.Character.Head:WaitForChild('face', 60):Destroy()
		end
	end)
	local SkipLoad = Instance.new('BoolValue', Player)
	SkipLoad.Name = 'SkipLoad'
	SkipLoad.Value = false
	local playerPackage = nil
	if PlayerData:GetAsync(Player.UserId) == nil then
		_G[Player.Name] = defaultPackage
	elseif PlayerData:GetAsync(Player.UserId) then
		playerPackage = PlayerData:GetAsync(Player.UserId)
		_G[Player.Name] = playerPackage
	end
	
	if game.Teams:FindFirstChild(_G[Player.Name]['Faction']) then
		Player.TeamColor = game.Teams:FindFirstChild(_G[Player.Name]['Faction']).TeamColor
	end
	
	local Inventory = Instance.new('Folder', Player)
	Inventory.Name = 'Inventory'
	local InventorySpace = Instance.new('NumberValue', Inventory)
	InventorySpace.Name = 'InventorySpace'
	InventorySpace.Value = _G[Player.Name]['InventorySpace']
	
	local PlayerHorse = Instance.new('Folder', Player)
	PlayerHorse.Name = 'PlayerHorse'
	local Cooldown = Instance.new('NumberValue', PlayerHorse)
	Cooldown.Name = 'Cooldown'
	Cooldown.Value = 0
	
	local MASTER_HORSE = game.ServerStorage.AOTObjects.Horses:FindFirstChild(_G[Player.Name]['HorseType']):Clone()
	MASTER_HORSE.Parent = PlayerHorse
	MASTER_HORSE.Name = Player.Name .. 'MASTER_HORSE'
	
	
	local invFile = {}
	
	if #_G[Player.Name]['Inventory'] > 0 then
		invFile = _G[Player.Name]['Inventory']
		for num,Item in ipairs(_G[Player.Name]['Inventory']) do
			if game.ServerStorage:WaitForChild('AOTObjects') and game.ServerStorage.AOTObjects:WaitForChild('Stealables') then
				if game.ServerStorage.AOTObjects.Stealables:FindFirstChild(Item) then
					game.ServerStorage.AOTObjects.Stealables:FindFirstChild(Item):Clone().Parent = Inventory
				end
			end
		end
	end
	
	local Level = Instance.new('NumberValue', Player)
	Level.Name = 'Level'
	Level.Value = _G[Player.Name]['Level']
	local EXP = Instance.new('NumberValue', Player)
	EXP.Name = 'EXP'
	EXP.Value = _G[Player.Name]['EXP']
	
	Level.Changed:connect(function()
		_G[Player.Name]['Level'] = Level.Value
	end)
	
	EXP.Changed:connect(function()
		_G[Player.Name]['EXP'] = EXP.Value
		if EXP.Value / (1000 * Level.Value) >= 1 then
			Level.Value = Level.Value + 1
			EXP.Value = 0
		end
	end)
	
	local TitanKills = Instance.new('NumberValue', Player)
	TitanKills.Name = 'TitanKills'
	TitanKills.Value = _G[Player.Name]['TitanKills']
	
	local CharData = Instance.new('Folder', Player)
	CharData.Name = 'CharData'
	local Hair = Instance.new('ObjectValue', CharData)
	Hair.Name = 'Hair'
	Hair.Value = game.ReplicatedStorage.Clothing.Hair:GetChildren()[math.random(1,#game.ReplicatedStorage.Clothing.Hair:GetChildren())]
	local Eyes = Instance.new('ObjectValue', CharData)
	Eyes.Name = 'Eyes'
	Eyes.Value = game.ReplicatedStorage.Clothing.Eyes:GetChildren()[math.random(1,#game.ReplicatedStorage.Clothing.Eyes:GetChildren())]
	local Mouth = Instance.new('ObjectValue', CharData)
	Mouth.Name = 'Mouth'
	Mouth.Value = game.ReplicatedStorage.Clothing.Mouth:GetChildren()[math.random(1,#game.ReplicatedStorage.Clothing.Mouth:GetChildren())]
	local Shirt = Instance.new('ObjectValue', CharData)
	Shirt.Name = 'Shirt'
	Shirt.Value = game.ReplicatedStorage.Clothing.Shirt:GetChildren()[math.random(1,#game.ReplicatedStorage.Clothing.Shirt:GetChildren())]
	local Pants = Instance.new('ObjectValue', CharData)
	Pants.Name = 'Pants'
	Pants.Value = game.ReplicatedStorage.Clothing.Pants:GetChildren()[math.random(1,#game.ReplicatedStorage.Clothing.Pants:GetChildren())]
	
	local Bounty = Instance.new('NumberValue', Player)
	Bounty.Name = 'Bounty'
	Bounty.Value = _G[Player.Name]['Bounty']
	local Faction = Instance.new('StringValue', Player)
	Faction.Name = 'Faction'
	Faction.Value = _G[Player.Name]['Faction']
	local Money = Instance.new('NumberValue', Player)
	Money.Name = 'Money'
	Money.Value = _G[Player.Name]['Money']
	Money.Changed:connect(function()
		_G[Player.Name]['Money'] = Money.Value
	end)
	local Gas = Instance.new('NumberValue', Player)
	Gas.Value = _G[Player.Name]['GasAmount']
	Gas.Name = 'Gas'
	local Blades = Instance.new('NumberValue', Player)
	Blades.Value = _G[Player.Name]['BladeAmount']
	Blades.Name = 'Blades'
	
	-- UpgradeRange
	-- UpgradeGas
	-- ThunderSpears
	-- IncreaseBagSpace
	-- BladeDamage
	-- BladeDurability
	-- BladeAmount
	-- UpgradeSpeed
	
	local ODMInfo = Instance.new('Folder', Player)
	ODMInfo.Name = 'ODMInfo'
	local ThunderSpears = Instance.new('BoolValue', ODMInfo)
	ThunderSpears.Value = _G[Player.Name]['ThunderSpears']
	ThunderSpears.Name = 'ThunderSpears'
	ThunderSpears.Changed:connect(function()
		_G[Player.Name]['ThunderSpears'] = ThunderSpears.Value
	end)
	
	local BladeDura = Instance.new('NumberValue', ODMInfo)
	BladeDura.Name = 'BladeDurability'
	BladeDura.Value = _G[Player.Name]['BladeStrength']
	BladeDura.Changed:connect(function()
		_G[Player.Name]['BladeStrength'] = BladeDura.Value
	end)
	
	local BladeDamage = Instance.new('NumberValue', ODMInfo)
	BladeDamage.Name = 'BladeDamage'
	BladeDamage.Value = _G[Player.Name]['BladeDamage']
	BladeDamage.Changed:connect(function()
		_G[Player.Name]['BladeDamage'] = BladeDamage.Value
	end)
	
	local HookRange = Instance.new('NumberValue', ODMInfo)
	HookRange.Name = 'HookRange'
	HookRange.Value = _G[Player.Name]['HookRange']
	HookRange.Changed:connect(function()
		_G[Player.Name]['HookRange'] = HookRange.Value
	end)
	
	local Speed = Instance.new('NumberValue', ODMInfo)
	Speed.Name = 'Speed'
	Speed.Value = _G[Player.Name]['ODMSpeed']
	Speed.Changed:connect(function()
		_G[Player.Name]['ODMSpeed'] = Speed.Value
	end)
	
	--[[Money.Changed:connect(function()
		MoneyData:UpdateAsync(Player.UserId, function()
			return Money.Value
		end)
	end)
	Faction.Changed:connect(function()
		FactionData:UpdateAsync(Player.UserId, function()
			return Faction.Value
		end)
	end)]]
	
	--[[Player.CharacterAdded:connect(function()
		if Player.SkipLoad.Value == false then
			wait(1)
			Player:ClearCharacterAppearance()
			Player.Character.Head:FindFirstChild('face'):Destroy()
			for num,Part in ipairs(Player.Character:GetChildren()) do
				if Part.ClassName == 'MeshPart' or Part.ClassName == 'Part' then
					Part.Color = Color3.fromRGB(244, 179, 148)
				end
			end
			if Player.Character:FindFirstChild('ShirtGraphic') then
				Player.Character.ShirtGraphic:Destroy()
			end
		end
	end)]]
	--[[spawn(function()
		while wait(100) do
			if Player.Backpack:FindFirstChild('LocalHandler') == nil then
				Player:Kick('ERROR: LocalHandler not detected! Please rejoin the game!')
			end
		end
	end)]]
end)

local MainEventsFolder = Instance.new('Folder', game.ReplicatedStorage)
MainEventsFolder.Name = 'MAINFE'
local StealItem = Instance.new('RemoteEvent', MainEventsFolder)
StealItem.Name = 'StealItem'
local SellAll = Instance.new('RemoteEvent', MainEventsFolder)
SellAll.Name = 'SellAll'
local CannonTurn = Instance.new('RemoteFunction', MainEventsFolder)
CannonTurn.Name = 'CannonTurn'
local CannonTurnUD = Instance.new('RemoteFunction', MainEventsFolder)
CannonTurnUD.Name = 'CannonTurnUD'
local CannonShoot = Instance.new('RemoteFunction', MainEventsFolder)
CannonShoot.Name = 'CannonShoot'
local OutfitAccept = Instance.new('RemoteEvent', MainEventsFolder)
OutfitAccept.Name = 'OutfitAccept'
local GasRefill = Instance.new('RemoteFunction', MainEventsFolder)
GasRefill.Name = 'GasRefill'
local CannonBallExplode = Instance.new('RemoteFunction', MainEventsFolder)
CannonBallExplode.Name = 'CannonBallExplode'

local ShopPurchase = Instance.new('RemoteFunction', MainEventsFolder)
ShopPurchase.Name = 'ShopPurchase'

local HorsePurchase = Instance.new('RemoteFunction', MainEventsFolder)
HorsePurchase.Name = 'HorsePurchase'

local TeamSelection = Instance.new('RemoteEvent', MainEventsFolder)
TeamSelection.Name = 'TeamSelection'

local KillPlayer = Instance.new('RemoteEvent', MainEventsFolder)
KillPlayer.Name = 'KillPlayer'
local GrabPlayer = Instance.new('RemoteFunction', MainEventsFolder)
GrabPlayer.Name = 'GrabPlayer'

local HoodEquip = Instance.new('RemoteFunction', MainEventsFolder)
HoodEquip.Name = 'HoodEquip'
local LightEquip = Instance.new('RemoteFunction', MainEventsFolder)
LightEquip.Name = 'LightEquip'

local Arrest =  Instance.new('RemoteEvent', MainEventsFolder)
Arrest.Name = 'Arrest'

Arrest.OnServerEvent:connect(function(Player, Player2)
	if (Player.Character.PrimaryPart.Position - Player2.PrimaryPart.Position).magnitude < 10 then
		print('Player in range')
		if Player.TeamColor == game.Teams["Military Police"].TeamColor and game.Players:GetPlayerFromCharacter(Player2).TeamColor == game.Teams.Rogue.TeamColor and Player2.Humanoid.Health < 50 then
			print('Arresting player')
			local Arrested = Instance.new('BoolValue', game.Players:GetPlayerFromCharacter(Player2))
			Arrested.Name = 'Arrested'
			game.Players:GetPlayerFromCharacter(Player2):LoadCharacter()
			Player2:SetPrimaryPartCFrame(game.Workspace.PlayerSpawns.PrisonSpawns:GetChildren()[math.random(1, #game.Workspace.PlayerSpawns.PrisonSpawns:GetChildren())].CFrame)
			spawn(function()
				while Player:FindFirstChild("Arrested") do
					wait(1)
					print('Moving arrested player position')
					if (Player.Character.PrimaryPart.Position - game.Workspace.PlayerSpawns.PrisonEscape.Position).magnitude > 50 then
						Player:SetPrimaryPartCFrame(game.Workspace.PlayerSpawns.PrisonSpawns:GetChildren()[math.random(1, #game.Workspace.PlayerSpawns.PrisonSpawns:GetChildren())].CFrame)
					end
				end
			end)
			wait(120)
			Player2:SetPrimaryPartCFrame(game.Workspace.PlayerSpawns.PrisonEscape.CFrame)
			Arrested:Destroy()
		end
	end
end)

spawn(function()
	game.Workspace:WaitForChild('Theft')
	game.Workspace:WaitForChild('ItemSpawnPoints')
	
	while true do
		wait(math.random(5,10))
		if #game.Workspace.Theft:GetChildren() < 50 then
			local Rarity = math.random(1,100)
			local Item
			if Rarity < 50 then
				local Selector = math.random(1, 2)
				if Selector == 1 then
					Item = game.ServerStorage.AOTObjects.Stealables.Cup:Clone()
				else
					Item = game.ServerStorage.AOTObjects.Stealables.Plate:Clone()
				end
			elseif Rarity > 50 and Rarity < 85 then
				local Selector = math.random(1, 3)
				if Selector == 1 then
					Item = game.ServerStorage.AOTObjects.Stealables.Pickaxe
				elseif Selector == 2 then
					Item = game.ServerStorage.AOTObjects.Stealables.Shovel
				else
					Item = game.ServerStorage.AOTObjects.Stealables.Musket
				end
			elseif Rarity > 85 and Rarity < 90 then
				Item = 	game.ServerStorage.AOTObjects.Stealables.GoldBar:Clone()
			elseif Rarity > 90 and Rarity < 95 then
				Item = 	game.ServerStorage.AOTObjects.Stealables.Ruby:Clone()
			elseif Rarity > 95 then
				Item = 	game.ServerStorage.AOTObjects.Stealables.Diamond:Clone()
			end
			if Item ~= nil then
				local ItemClone = Item:Clone()
				ItemClone.Parent = game.Workspace.Theft
				ItemClone:SetPrimaryPartCFrame(game.Workspace.ItemSpawnPoints:GetChildren()[math.random(1, #game.Workspace.ItemSpawnPoints:GetChildren())].CFrame)
			end
		end
	end
end)

function ShopPurchase.OnServerInvoke(Player, Item)
	local Success = false
	if Item:FindFirstAncestor('Shops') then
		print(Item)
		if Player.Money.Value > Item.Cost.Value and _G[Player.Name] and Item.Level.Value < Player.Level.Value then
			Player:WaitForChild('ODMInfo')
			--functionality
			-- UpgradeRange
			-- UpgradeGas
			-- ThunderSpears
			-- IncreaseBagSpace
			-- BladeDamage
			-- BladeDurability
			-- BladeAmount
			-- UpgradeSpeed
			
			--icons
			-- ODMUpgrade
			-- SwordUpgrade
			-- HealthBoost
			-- InventorySpace
			-- Clothing
			if Item.ItemFunction.Value == 'UpgradeRange' then
				if Player.ODMInfo.HookRange.Value < Item.IncreaseValue.Value then
					Player.ODMInfo.HookRange.Value = Item.IncreaseValue.Value
					Success = true
				end
			elseif Item.ItemFunction.Value == 'UpgradeGas' then
				if Player.Gas.Value < Item.IncreaseValue.Value then
					Player.Gas.Value = Item.IncreaseValue.Value
					Success = true
				end
			elseif Item.ItemFunction.Value == 'UpgradeSpeed' then
				if Player.Gas.Value < Item.IncreaseValue.Value then
					Player.ODMInfo.Speed.Value = Item.IncreaseValue.Value
					Success = true
				end
			elseif Item.ItemFunction.Value == 'ThunderSpears' then
				if Player.ODMInfo.ThunderSpears.Value == false then
					Player.ODMInfo.ThunderSpears.Value = true
					Success = true
				end
			elseif Item.ItemFunction.Value == 'IncreaseBagSpace' then
				if Player.Inventory.InventorySpace.Value < Item.IncreaseValue.Value then
					Player.Inventory.InventorySpace.Value = Item.IncreaseValue.Value
					Success = true
				end
			elseif Item.ItemFunction.Value == 'BladeDamage' then
				if Player.ODMInfo.BladeDamage.Value < Item.IncreaseValue.Value then
					Player.ODMInfo.BladeDamage.Value = Item.IncreaseValue.Value
					Success = true	
				end
			elseif Item.ItemFunction.Value == 'BladeDurability' then
				if Player.ODMInfo.BladeDurability.Value < Item.IncreaseValue.Value then
					Player.ODMInfo.BladeDurability.Value = Item.IncreaseValue.Value
					Success = true
				end
			elseif Item.ItemFunction.Value == 'BladeAmount' then
				if Player.Blades.Value < Item.IncreaseValue.Value then
					Player.Blades.Value = Item.IncreaseValue.Value
					Success = true
				end
			end
			if Success == true then
				Player.Money.Value = Player.Money.Value - Item.Cost.Value
			end
		end
	end
	return Success
end

local MusicIds = {846127615, 268529999, 3243908022, 3196863769, 753972633, 439761669, 441322721, 441319295, 3196755122, 3147184134, 913353064, 857970748, 3557154052}

local Music = Instance.new('Sound', game.Workspace)
Music.Name = 'Music'
Music.SoundId = "rbxassetid://" .. MusicIds[math.random(1, #MusicIds)]
Music.Volume = 1
Music:Play()

spawn(function()
	while true do
		wait(300)
		local temp = Music.SoundId
		repeat
			Music.SoundId = "rbxassetid://" .. MusicIds[math.random(1, #MusicIds)]
		until Music.SoundId ~= temp
		Music:Play()
	end
	--[[Music.Stopped:connect(function()
		local temp = Music.SoundId
		repeat
			Music.SoundId = "rbxassetid://" .. MusicIds[math.random(1, #MusicIds)]
		until Music.SoundId ~= temp
		Music:Play()
	end)]]
end)

function HorsePurchase.OnServerInvoke(Player, Horse, Supplies)
	-- Supplies bool
	-- Horse name
	if Player.Money.Value > game.ReplicatedStorage.Horses:FindFirstChild(Horse.Name).Cost.Value then
		Player.Money.Value = Player.Money.Value - game.ReplicatedStorage.Horses:FindFirstChild(Horse.Name).Cost.Value
		_G[Player.Name]['Horse'] = Horse.Name -- optional _Supplies
		if Supplies == true then
			_G[Player.Name]['Horse'] = Horse.Name .. '_Supplies'
		end
		return 'Purchased!'
	else
		return 'Insufficient funds'
	end
end

TeamSelection.OnServerEvent:connect(function(Player, Team)
	-- MP, Rogue, Scouts, StatGuard, Trainee
	
	if _G[Player.Name][Team] == true then
		if Team == 'MP' and Player.Money.Value >= 100 then
			Player.TeamColor = game.Teams["Military Police"].TeamColor
			Player.Character.Humanoid.Health = 0
			_G[Player.Name]['Faction'] = "Military Police"
			Player.Faction.Value = "Military Police"
		elseif Team == 'Rogue' and Player.Money.Value >= 100 then
			Player.TeamColor = game.Teams.Rogue.TeamColor
			Player.Character.Humanoid.Health = 0
			_G[Player.Name]['Faction'] = "Rogue"
			Player.Faction.Value = "Rogue"
		elseif Team == 'Scouts' and Player.Money.Value >= 100 then
			Player.TeamColor = game.Teams["Scouting Legion"].TeamColor
			Player.Character.Humanoid.Health = 0
			_G[Player.Name]['Faction'] = "Scouting Legion"
			Player.Faction.Value = "Scouting Legion"
		elseif Team == 'StatGuard' and Player.Money.Value >= 100 then
			Player.TeamColor = game.Teams["Stationary Guard"].TeamColor
			Player.Character.Humanoid.Health = 0
			_G[Player.Name]['Faction'] = "Stationary Guard"
			Player.Faction.Value = "Stationary Guard"
		end
	else
		if Team == 'MP' and Player.Money.Value >= 100 then
			_G[Player.Name][Team] = true
			Player.Money.Value = Player.Money.Value - 100
			Player.TeamColor = game.Teams["Military Police"].TeamColor
			Player.Character.Humanoid.Health = 0
			Player.Faction.Value = "Military Police"
		elseif Team == 'Rogue' and Player.Money.Value >= 100 then
			_G[Player.Name][Team] = true
			Player.Money.Value = Player.Money.Value - 100
			Player.TeamColor = game.Teams.Rogue.TeamColor
			Player.Character.Humanoid.Health = 0
			Player.Faction.Value = "Rogue"
		elseif Team == 'Scouts' and Player.Money.Value >= 100 then
			_G[Player.Name][Team] = true
			Player.Money.Value = Player.Money.Value - 100
			Player.TeamColor = game.Teams["Scouting Legion"].TeamColor
			Player.Character.Humanoid.Health = 0
			Player.Faction.Value = "Scouting Legion"
		elseif Team == 'StatGuard' and Player.Money.Value >= 100 then
			_G[Player.Name][Team] = true
			Player.Money.Value = Player.Money.Value - 100
			Player.TeamColor = game.Teams["Stationary Guard"].TeamColor
			Player.Character.Humanoid.Health = 0
			Player.Faction.Value = "Stationary Guard"
		elseif Team == 'Trainee' then
			Player.TeamColor = game.Teams["Trainee Corps"].TeamColor
			Player.Character.Humanoid.Health = 0
			Player.Faction.Value = "Trainee Corps"
		end
	end
	
end)

function GrabPlayer.OnServerInvoke(Player, Part, Titan, TitanPart)
	if (Player.Character.HumanoidRootPart.Position - TitanPart.Position).magnitude < 30 and Player.Character.Grabbed.Value == false then
		-- do stuff
		if Titan.GrabPlayer.Value == nil and Titan.Grabbing.Value == true and Titan.Humanoid.Health > 0 then
			Player.Character.Humanoid.Jump = true
			Titan.GrabPlayer.Value = Part:FindFirstAncestor(Player.Name)
			local Player = game.Players:GetPlayerFromCharacter(Part:FindFirstAncestor(Player.Name))
			if Player.Character:FindFirstChild('Grabbed') then
				Player.Character.Grabbed.Value = true
				Player.Character.Humanoid.PlatformStand = true
				Player.Character.Humanoid.WalkSpeed = 0 -- normal walkspeed is (obviously) 16
			end
			Titan.Humanoid.WalkSpeed = 0 -- normal walkspeed is 20
			local Weld = Instance.new("Weld")
			Weld.Name = 'GrabWeld'
			Weld.Part0 = TitanPart
			Weld.Part1 = Player.Character.HumanoidRootPart
			Weld.C0 = CFrame.new(0, TitanPart.Size.Y/2, -TitanPart.Size.Z/2) * CFrame.Angles(0,0,math.rad(180))
			Weld.Parent = TitanPart
			print(Weld.Parent)
			if TitanPart.Name == 'RightHand' then
				local Anim = Titan.Humanoid:LoadAnimation(game.ReplicatedStorage.TitanAnimations.RightEat)
				Anim:Play()
				wait(90/30)
			elseif TitanPart.Name == 'LeftHand' then
				local Anim = Titan.Humanoid:LoadAnimation(game.ReplicatedStorage.TitanAnimations.LeftEat)
				Anim:Play()
				wait(90/30)
			end
			if Titan.GrabPlayer.Value ~= nil and Titan.Humanoid.Health > 0 then
				Player.Character.Humanoid.Health = 0
				Weld:Destroy()
				Titan.Humanoid.WalkSpeed = 20
				GrabPlayer = false
			end
			Titan.GrabPlayer.Value = nil
		end
	end
end
KillPlayer.OnServerEvent:connect(function(Player, TitanPart)
	if (Player.Character.HumanoidRootPart.Position - TitanPart.Position).magnitude < 30 then
		Player.Character.Humanoid.Health = 0
	end
end)

function LightEquip.OnServerInvoke(Player)
	if Player.Character:FindFirstChild('ChestLight') == nil then
		local Clone = game.ServerStorage.AOTObjects.ChestLight:Clone()
		Clone.Parent = Player.Character
		local Weld = Instance.new('ManualWeld', Clone.PrimaryPart)
		Weld.Part0 = Player.Character.UpperTorso
		Weld.Part1 = Clone.PrimaryPart
		Weld.C0 = CFrame.new(0,0,0)
		Weld.C1 = CFrame.new(0,0,0)
		wait(1)
	elseif Player.Character:FindFirstChild('ChestLight') and Player.Character.ChestLight.Model.Model.LightPart.SpotLight.Enabled == true then
		Player.Character.ChestLight.Model.Model.LightPart.SpotLight.Enabled = false
		wait(3)
	elseif Player.Character:FindFirstChild('ChestLight') and Player.Character.ChestLight.Model.Model.LightPart.SpotLight.Enabled == false then
		Player.Character.ChestLight.Model.Model.LightPart.SpotLight.Enabled = true
		wait(3)
	end
end

function CannonBallExplode.OnServerInvoke(Player, CannonBall, Part)
	--print(Player.Name, ' fired a cannon')
	local ClosestTitan = nil
	for num,Titan in ipairs(game.Workspace:WaitForChild('TitanFolder'):GetChildren()) do
		if CannonBall and Titan:FindFirstChild('HumanoidRootPart') then
			local TitanDistance = (CannonBall.Position - Titan.HumanoidRootPart.Position).magnitude
			local CBPS = Titan.NapeHolder.Nape.CFrame:ToObjectSpace(CannonBall.CFrame)	
			if Part:FindFirstAncestor('Titan') then
				local Touch = Part.Touched:connect(function()
					for num,Part in ipairs(Part:GetTouchingParts()) do
						if Part.Name == CannonBall.Name then
							print('Found the cannonball touching the titan')
						end
					end
				end)
				Touch:Disconnect()
			end
			--print((Titan.NapeHolder.Nape.CFrame.p - CPos).magnitude)
			--if math.abs(CBPS.Z) < 15 and  math.abs(CBPS.Y) < 30 and  math.abs(CBPS.X) < 30 then
			if Part:FindFirstAncestor('Titan') then
				print('Titan taking damage from cannonball')
				Part:FindFirstAncestor('Titan').Humanoid:TakeDamage(math.random(30,50))
				Part:FindFirstAncestor('Titan').Head.TitanHealthUI.Frame.GreenBar.Size = UDim2.new(2.48 * Part:FindFirstAncestor('Titan').Humanoid.Health/Part:FindFirstAncestor('Titan').Humanoid.MaxHealth, 0, 0.31, 0)
			end
			if Part:FindFirstAncestor('Titan').Humanoid.Health <= 0 then
				local Monster = Part:FindFirstAncestor('Titan')
				Debris:AddItem(Monster, 15)
				for num,HandWeld in ipairs(Monster.RightHand:GetChildren()) do
					if HandWeld.Name == 'GrabWeld' and HandWeld.ClassName == 'ManualWeld' then
						HandWeld:Destroy()
					end
				end
				for num,HandWeld in ipairs(Monster.LeftHand:GetChildren()) do
					if HandWeld.Name == 'GrabWeld' and HandWeld.ClassName == 'ManualWeld' then
						HandWeld:Destroy()
					end
				end
				if Monster.GrabPlayer.Value ~= nil then
					Monster.GrabPlayer.Value.Humanoid.WalkSpeed = 16
					Monster.GrabPlayer.Value.Humanoid.PlatformStand = false
					Monster.GrabPlayer.Value.Grabbed.Value = false
					Monster.GrabPlayer.Value = nil
				end
				
				for num,Motor6D in ipairs(Monster:GetDescendants()) do
					if Motor6D:IsA('BasePart') and Motor6D.Name ~= 'Nape' and string.find(Motor6D.Name, 'WeakKnee') == nil then
						Motor6D.CanCollide = true
						Motor6D.Anchored = false
					end
					if Motor6D.ClassName == 'Motor6D' and Motor6D.Name ~= 'Neck' and string.find(Motor6D.Name, 'Wrist') == nil and string.find(Motor6D.Name, 'Ankle') == nil then
						local BallSocket = Instance.new('BallSocketConstraint', Motor6D.Parent)
						local motoName = Motor6D.Name
						local Attachment0 = Motor6D.Parent:FindFirstChild(motoName .. 'Attachment') or Motor6D.Parent:FindFirstChild(motoName .. 'RigAttachment')
						local Attachment1 = Motor6D.Part0:FindFirstChild(motoName .. 'Attachment') or Motor6D.Part0:FindFirstChild(motoName .. 'RigAttachment')
						if Attachment0 and Attachment1 then
							BallSocket.Attachment0 = Attachment0
							BallSocket.Attachment1 = Attachment1
							Motor6D:Destroy()
						end
						--Monster:SetPrimaryPartCFrame(Monster.PrimaryPart.CFrame * CFrame.Angles(math.rad(45),0,0))
					end
				end
				local oldPart = Monster
				Monster.NapeHolder:Destroy()
				oldPart.HumanoidRootPart:Destroy()
				oldPart.PrimaryPart = oldPart.Head
				if oldPart.Head:FindFirstChild('TitanHealthUI') then
					oldPart.Head.TitanHealthUI:Destroy()
				end
				oldPart.LWKHold:Destroy()
				oldPart.RWKHold:Destroy()
				oldPart.EyesHolder:Destroy()
				wait(5)
				for num,Steam in ipairs(oldPart:GetDescendants()) do
					if Steam.Name == 'Steam' and Steam.ClassName == 'ParticleEmitter' then
						Steam.Enabled = true
					end
				end
				wait(5)
				for num,Part in ipairs(oldPart:GetDescendants()) do
					if Part:IsA('BasePart') then
						Part.Color = Color3.fromRGB(0,0,0)
					end
				end
			end
		end
	end
	
	return nil
end

function HoodEquip.OnServerInvoke(Player)
	if Player.Character:FindFirstChild('Hood') == nil then
		Player.Character.Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
		local Clone = game.ServerStorage.AOTObjects.Hoods.SLHood:Clone()
		Clone.Name = 'Hood'
		Clone.Parent = Player.Character
		Clone.Color = Color3.fromRGB(16, 75, 5)
		local Weld = Instance.new('ManualWeld', Clone)
		Weld.Part0 = Player.Character.Head
		Weld.Part1 = Clone
		Weld.C0 = CFrame.new(0,0.1,0.1)
		Weld.C1 = CFrame.new(0,0,0)
		
		local Clone = game.ServerStorage.AOTObjects.Hoods.Cape:Clone()
		Clone.Name = 'Cape'
		Clone.Parent = Player.Character
		Clone.Color = Color3.fromRGB(16, 75, 5)
		local Weld = Instance.new('ManualWeld', Clone)
		Weld.Part0 = Player.Character.UpperTorso
		Weld.Part1 = Clone
		Weld.C0 = CFrame.new(0,0.3,0.4)
		Weld.C1 = CFrame.new(0,0,0)
		
		for num,Hat in ipairs(Player.Character:GetChildren()) do
			if Hat.ClassName == 'Hat' or Hat.ClassName == 'Accessory' then
				Hat.Handle.Transparency = 1
			end
		end
	elseif Player.Character:FindFirstChild('Hood') and Player.Character.Hood.Transparency == 0 then
		Player.Character.Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.Viewer
		Player.Character.Hood.Transparency = 1
		for num,Hat in ipairs(Player.Character:GetChildren()) do
			if Hat.ClassName == 'Hat' or Hat.ClassName == 'Accessory' then
				Hat.Handle.Transparency = 0
			end
		end
		wait(1)
	elseif Player.Character:FindFirstChild('Hood') and Player.Character.Hood.Transparency == 1 then
		Player.Character.Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
		Player.Character.Hood.Transparency = 0
		for num,Hat in ipairs(Player.Character:GetChildren()) do
			if Hat.ClassName == 'Hat' or Hat.ClassName == 'Accessory' then
				Hat.Handle.Transparency = 1
			end
		end
		wait(1)
	end
end

local TweenService = game:GetService('TweenService')
local CannonInfo = TweenInfo.new(0.25, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)

local CannonScript = nil

SellAll.OnServerEvent:connect(function(Player)
	print("Selling all items")
	if Player:FindFirstChild('Inventory') then
		for num,Item in ipairs(Player.Inventory:GetChildren()) do
			if Item:FindFirstChild('Worth') then
				local temp = Item.Worth.Value
				Player:WaitForChild('Money')
				Player.Money.Value = Player.Money.Value + temp
				Item:Destroy()
			end
		end
	end
end)

OutfitAccept.OnServerEvent:connect(function(Player, Items)
	
	Player.SkipLoad.Value = false
	Player.SkipLoad.Value = true
	local playerPackage = Player.Character.Humanoid:GetAppliedDescription()
	Player.Character.Humanoid.Health = 0
	--wait(0.5)
	playerPackage.Face = 0
	playerPackage.Head = 0
	playerPackage.LeftArm = 0
	playerPackage.LeftLeg = 0
	playerPackage.RightArm = 0
	playerPackage.RightLeg = 0
	playerPackage.Torso = 0
	local PlayerAdd = Player.CharacterAdded
	Player:LoadCharacterWithHumanoidDescription(playerPackage)
	Player:ClearCharacterAppearance()
	wait(1)
	for num,Part in ipairs(Player.Character:GetChildren()) do
		if Part.ClassName == 'MeshPart' or Part.ClassName == 'Part' and Part.Name ~= 'Hood' then
			Part.Color = Color3.fromRGB(244, 179, 148)
		end
	end
	if Player.Character:FindFirstChild('ShirtGraphic') then
		Player.Character.ShirtGraphic:Destroy()
	end
	for num,Article in ipairs(Items) do
		if Article.ClassName == 'Shirt' or Article.ClassName == 'Pants' then
			Article:Clone().Parent = Player.Character
		elseif Article.ClassName == 'Decal' then
			Article:Clone().Parent = Player.Character.Head
		elseif Article.ClassName == 'Accessory' or Article.ClassName == 'Hat' then
			local Clone = Article:Clone()
			Clone.Parent = Player.Character
			Player.Character.Humanoid:AddAccessory(Clone)
		end
	end
	local Clone = game.ServerStorage.UI.ButtonThing:Clone()
	Clone.Parent = Player.PlayerGui
	local Clone = game.ServerStorage.UI.CharInfo:Clone()
	Clone.Parent = Player.PlayerGui
	local Clone = game.ServerStorage.UI.Keybinding:Clone()
	Clone.Parent = Player.PlayerGui
	local Clone = game.ServerStorage.UI.TeamSelection:Clone()
	Clone.Parent = Player.PlayerGui
	local Clone = game.ServerStorage.UI.PlayerInventory:Clone()
	Clone.Parent = Player.PlayerGui
	local Clone = game.ServerStorage.UI.stats:Clone()
	Clone.Parent = Player.PlayerGui
	if Player.TeamColor == game.Teams["Military Police"].TeamColor then
		game.ServerStorage.UI.Bounty:Clone().Parent = Player.PlayerGui
		game.ServerStorage.AOTObjects.Arrest:Clone().Parent = Player.Backpack
	end
	for num,Team in ipairs(game.Teams:GetChildren()) do
		if Player.TeamColor == Team.TeamColor then
			Player.Character:SetPrimaryPartCFrame(game.Workspace.PlayerSpawns:FindFirstChild(Team.Name):GetChildren()[math.random(1, #game.Workspace.PlayerSpawns:FindFirstChild(Team.Name):GetChildren())].CFrame)
		end
	end
end)

function GasRefill.OnServerInvoke(Player, Gas)
	local Success = false
	Success = true
	--[[if Player.Money.Value - 100 >= 0 and Player.Faction.Value ~= 'Military Police' then
		Player.Money.Value = Player.Money.Value - 100
		Success = true
	elseif Player.Faction.Value == 'Military Police' then
		Success = true	
	end]]
	
	if Success == true then
		if Player.Character:FindFirstChild('BladeSupply') then
			Player.Character.BladeSupply.Value = _G[Player.Name]['BladeAmount']
			for num,Blade in ipairs(Player.Character.TorsoSec.LBladeHold:GetChildren()) do
				if Blade.Name == 'SPENT' then
					Blade.Transparency = 0
					Blade.Name = 'Blade'
				end
			end
			for num,Blade in ipairs(Player.Character.TorsoSec.RBladeHold:GetChildren()) do
				if Blade.Name == 'SPENT' then
					Blade.Transparency = 0
					Blade.Name = 'Blade'
				end
			end
			if _G[Player.Name]['ThunderSpears'] == true and Player.Character:FindFirstChild('ThunderSpear') == nil then
				local ThunderSpear = game.ServerStorage.AOTObjects.ThunderSpear:Clone()
				ThunderSpear.Parent = Player.Character
				ThunderSpear.Spear.Name = 'RightThunderSpear'
				local Weld = Instance.new("Weld",Player.Character.RightUpperArm)
				Weld.Name = 'RightThunderWeld'
				Weld.Part0 = ThunderSpear.PrimaryPart
				Weld.Part1 = Player.Character.RightLowerArm
				Weld.C0 = ThunderSpear.PrimaryPart.CFrame
				Weld.C1 = Player.Character.RightLowerArm.CFrame
				local ThunderSpear = game.ServerStorage.AOTObjects.ThunderSpear:Clone()
				ThunderSpear.Parent = Player.Character
				ThunderSpear.Spear.Name = 'LeftThunderSpear'
				local Weld = Instance.new("Weld",Player.Character.LeftLowerArm)
				Weld.Name = 'LeftThunderWeld'
				Weld.Part0 = ThunderSpear.PrimaryPart
				Weld.Part1 = Player.Character.LeftLowerArm
				Weld.C0 = ThunderSpear.PrimaryPart.CFrame
				Weld.C1 = Player.Character.LeftLowerArm.CFrame
			end
		elseif Player.Character:FindFirstChild('APGLoaded') then
			--!! reload ap guns
		end
		Player.Gas.Value = Player.Gas.Value + 1
		wait()
		Player.Gas.Value = Player.Gas.Value - 1
	end
	return nil
end

for num,Pulley in ipairs(game.Workspace:WaitForChild('Pulleys'):GetChildren()) do
	local DB = true
	local Up = true
	local CFVal = Instance.new('CFrameValue', Pulley.Cart)
	CFVal.Name = 'CFVal'
	CFVal.Value = Pulley.Cart.PrimaryPart.CFrame
	local PulleyInfo = TweenInfo.new(45, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
	local function moveUpDown(direction)
		if direction == true then
			Up = false
			local PulleyPull = TweenService:Create(Pulley.Cart.CFVal, PulleyInfo, {['Value'] = Pulley.Cart.PrimaryPart.CFrame * CFrame.new(0,-100,0)})
			PulleyPull:Play()
			PulleyPull.Completed:Wait()
			Pulley.Cart:SetPrimaryPartCFrame(Pulley.Cart.PrimaryPart.CFrame * CFrame.new(0,-120,0))
		elseif direction == false then
			Up = true
			local PulleyPull = TweenService:Create(Pulley.Cart.CFVal, PulleyInfo, {['Value'] = Pulley.Cart.PrimaryPart.CFrame * CFrame.new(0,100,0)})
			PulleyPull:Play()
			PulleyPull.Completed:Wait()
			Pulley.Cart:SetPrimaryPartCFrame(Pulley.Cart.PrimaryPart.CFrame * CFrame.new(0,120,0))
		end
	end
	Pulley.Cart.LeverBox.ClickPart.ClickDetector.MouseClick:connect(function()
		if DB == true then
			DB = false
			moveUpDown(Up)
			DB = true
		end
	end)
end


function CannonShoot.OnServerInvoke(Player)
	local Cannon = Player.Character.Humanoid.SeatPart.Parent 
	if Cannon.Firing.Value == false then
		Cannon.Firing.Value = true
		local CannonBall = game.ServerStorage.AOTObjects.CannonBall:Clone()
		Debris:AddItem(CannonBall, 60)
		CannonBall.Name = Player.UserId .. '_CannonBall'
		CannonBall.Parent = game.Workspace:WaitForChild('ProjectileFolder')
		CannonBall.CFrame = Cannon.Barrel.CannonEject.CFrame
		CannonBall:SetNetworkOwner(Player)
		Cannon.Barrel.CannonEject.Fire:Play()
		spawn(function()
			Cannon.Barrel.CannonEject.Explode.Enabled = true
			Cannon.Barrel.CannonEject.ExplodeLight.Enabled = true
			wait(0.3)
			Cannon.Barrel.CannonEject.Explode.Enabled = false
			Cannon.Barrel.CannonEject.Explode:Clear()
			Cannon.Barrel.CannonEject.ExplodeLight.Enabled = false
		end)
		Cannon.Barrel.CFValUD.Value = Cannon.Barrel.PrimaryPart.CFrame
		local CannonInfo = TweenInfo.new(0.01, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0)
		TweenY = TweenService:Create(Cannon.Barrel.CFValUD, CannonInfo, {['Value'] = Cannon.Barrel.PrimaryPart.CFrame * CFrame.new(1.8,0,0)})
		TweenY:Play()
		TweenY.Completed:Wait()
		Cannon.Barrel:SetPrimaryPartCFrame(Cannon.Barrel.PrimaryPart.CFrame * CFrame.new(1.8,0,0))
		TweenY:Cancel()
		local CannonInfo = TweenInfo.new(0.35, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0)
		TweenY = TweenService:Create(Cannon.Barrel.CFValUD, CannonInfo, {['Value'] = Cannon.Barrel.PrimaryPart.CFrame * CFrame.new(-1.8,0,0)})
		TweenY:Play()
		TweenY.Completed:Wait()
		Cannon.Barrel:SetPrimaryPartCFrame(Cannon.Barrel.PrimaryPart.CFrame * CFrame.new(-1.8,0,0))
		TweenY:Cancel()
		wait(0.5)
		Cannon.Firing.Value = false
	end
end

for num,Cannon in ipairs(game.Workspace.Cannons:GetChildren()) do
	local CFVal = Instance.new('CFrameValue', Cannon)
	CFVal.Name = 'CFVal'
	
	local TurnYMax = Instance.new('IntValue', Cannon)
	TurnYMax.Name = 'TurnYMax'
	
	
	--[[CFVal:GetPropertyChangedSignal('Value'):connect(function()
		Cannon:SetPrimaryPartCFrame(CFVal.Value)
	end)]]
	Cannon:WaitForChild('Barrel')
	local CFValUD = Instance.new('CFrameValue', Cannon.Barrel)
	CFValUD.Name = 'CFValUD'
	--[[CFValUD:GetPropertyChangedSignal('Value'):connect(function()
		Cannon.Barrel:SetPrimaryPartCFrame(CFVal.Value)
	end)]]
	--[[Cannon.CannonButton.ClickDetector.MouseClick:Connect(function()
		if Cannon.Firing.Value == false then
			Cannon.Firing.Value = true
			local CannonBall = game.ServerStorage.AOTObjects.CannonBall:Clone()
			CannonBall.Parent = game.Workspace:WaitForChild('ProjectileFolder')
			CannonBall.CFrame = Cannon.Barrel.CannonEject.CFrame
			Cannon.Barrel.CannonEject.Fire:Play()
			Cannon.Barrel.CFValUD.Value = Cannon.Barrel.PrimaryPart.CFrame
			local CannonInfo = TweenInfo.new(0.01, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0)
			TweenY = TweenService:Create(Cannon.Barrel.CFValUD, CannonInfo, {['Value'] = Cannon.Barrel.PrimaryPart.CFrame * CFrame.new(1.8,0,0)})
			TweenY:Play()
			TweenY.Completed:Wait()
			Cannon.Barrel:SetPrimaryPartCFrame(Cannon.Barrel.PrimaryPart.CFrame * CFrame.new(1.8,0,0))
			TweenY:Cancel()
			local CannonInfo = TweenInfo.new(0.35, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0)
			TweenY = TweenService:Create(Cannon.Barrel.CFValUD, CannonInfo, {['Value'] = Cannon.Barrel.PrimaryPart.CFrame * CFrame.new(-1.8,0,0)})
			TweenY:Play()
			TweenY.Completed:Wait()
			Cannon.Barrel:SetPrimaryPartCFrame(Cannon.Barrel.PrimaryPart.CFrame * CFrame.new(-1.8,0,0))
			TweenY:Cancel()
			wait(2)
			Cannon.Firing.Value = false
		end
	end)]]
	Cannon.Seat:GetPropertyChangedSignal('Occupant'):connect(function()
		if Cannon.Seat.Occupant ~= nil then
			game.ServerStorage.AOTObjects.FireCannon:Clone().Parent = game.Players:GetPlayerFromCharacter(Cannon.Seat.Occupant.Parent).PlayerGui
			if Cannon.Seat.Occupant.Parent:FindFirstChild('CannonTurn') then
				Cannon.Seat.Occupant.Parent.CannonTurn:Destroy()
			end
			CannonScript = script.CannonTurn:Clone()
			CannonScript.Parent = Cannon.Seat.Occupant.Parent
		elseif Cannon.Seat.Occupant == nil then
			if CannonScript ~= nil then
				CannonScript:Destroy()
			end
			if TweenX ~= nil then
				TweenX:Cancel()
			elseif TweenY ~= nil then
				TweenY:Cancel()	
			end
		end
	end)
end

StealItem.OnServerEvent:connect(function(Player, Item, Anim)
	if Anim ~= nil then
		Anim:Play()
	end
	if (Player.Character.HumanoidRootPart.Position - Item.PrimaryPart.Position).magnitude < 15 and Item.Parent.Name == 'Theft' and #Player.Inventory:GetChildren() - 1 < Player.Inventory.InventorySpace.Value then
		Item.Parent = Player.Inventory
	elseif (Player.Character.HumanoidRootPart.Position - Item.PrimaryPart.Position).magnitude < 5 and Item.Parent.Name == 'Pedestrians' then
		if Item:FindFirstChild('Wallet') then
			local temp = Item.Wallet.Value
			Item.Wallet:Destroy()
			Player.Money.Value = Player.Money.Value + temp
			if math.random(1,2) == 1 then
				local StolenFrom = Instance.new('ObjectValue', Item)
				StolenFrom.Name = 'StolenFrom'
				StolenFrom.Value = Player
				Player.Character.Humanoid.Died:connect(function()
					StolenFrom:Destroy()
				end)
			end
		end
	end
end)

function CannonTurn.OnServerInvoke(Player, Key)
	local CannonTurnDB = true
		if CannonTurnDB == true then
			CannonTurnDB = false
			local temp = nil
			Player.Character.Humanoid.SeatPart.Parent.CFVal.Value = Player.Character.Humanoid.SeatPart.Parent.PrimaryPart.CFrame
			if Key == Enum.KeyCode.A then
				--TweenX = TweenService:Create(Player.Character.Humanoid.SeatPart.Parent.PrimaryPart, CannonInfo, {['CFrame'] = Player.Character.Humanoid.SeatPart.Parent.PrimaryPart.CFrame * CFrame.Angles(0,math.rad(15),0)})
				TweenX = TweenService:Create(Player.Character.Humanoid.SeatPart.Parent.CFVal, CannonInfo, {['Value'] = Player.Character.Humanoid.SeatPart.Parent.PrimaryPart.CFrame * CFrame.Angles(0,math.rad(5),0)})
				temp = Player.Character.Humanoid.SeatPart.Parent.PrimaryPart.CFrame * CFrame.Angles(0,math.rad(5),0)
			elseif Key == Enum.KeyCode.D then
				TweenX = TweenService:Create(Player.Character.Humanoid.SeatPart.Parent.CFVal, CannonInfo, {['Value'] = Player.Character.Humanoid.SeatPart.Parent.PrimaryPart.CFrame * CFrame.Angles(0,-math.rad(5),0)})
				temp = Player.Character.Humanoid.SeatPart.Parent.PrimaryPart.CFrame * CFrame.Angles(0,-math.rad(5),0)
			end
			TweenX:Play()
			TweenX.Completed:Wait()
			Player.Character.Humanoid.SeatPart.Parent:SetPrimaryPartCFrame(temp)
			CannonTurnDB = true
		end
	return nil
end

function CannonTurnUD.OnServerInvoke(Player, Key)
	local CannonTurnDBUD = true
	if CannonTurnDBUD == true then
		CannonTurnDBUD = false
		local temp = nil
		Player.Character.Humanoid.SeatPart.Parent.Barrel.CFValUD.Value = Player.Character.Humanoid.SeatPart.Parent.Barrel.PrimaryPart.CFrame
		if Key == Enum.KeyCode.S and Player.Character.Humanoid.SeatPart.Parent:FindFirstChild('TurnYMax').Value < 15 then
			TweenY = TweenService:Create(Player.Character.Humanoid.SeatPart.Parent.Barrel.CFValUD, CannonInfo, {['Value'] = Player.Character.Humanoid.SeatPart.Parent.Barrel.PrimaryPart.CFrame * CFrame.Angles(0,0,math.rad(5))})
			temp = Player.Character.Humanoid.SeatPart.Parent.Barrel.PrimaryPart.CFrame * CFrame.Angles(0,0,math.rad(5))
			Player.Character.Humanoid.SeatPart.Parent:FindFirstChild('TurnYMax').Value = Player.Character.Humanoid.SeatPart.Parent:FindFirstChild('TurnYMax').Value + 1
		elseif Key == Enum.KeyCode.W and Player.Character.Humanoid.SeatPart.Parent:FindFirstChild('TurnYMax').Value > -5 then
			TweenY = TweenService:Create(Player.Character.Humanoid.SeatPart.Parent.Barrel.CFValUD, CannonInfo, {['Value'] = Player.Character.Humanoid.SeatPart.Parent.Barrel.PrimaryPart.CFrame * CFrame.Angles(0,0,-math.rad(5))})
			temp = Player.Character.Humanoid.SeatPart.Parent.Barrel.PrimaryPart.CFrame * CFrame.Angles(0,0,-math.rad(5))
			Player.Character.Humanoid.SeatPart.Parent:FindFirstChild('TurnYMax').Value = Player.Character.Humanoid.SeatPart.Parent:FindFirstChild('TurnYMax').Value - 1
		end
		TweenY:Play()
		TweenY.Completed:Wait()
		Player.Character.Humanoid.SeatPart.Parent.Barrel:SetPrimaryPartCFrame(temp)
		CannonTurnDBUD = true
	end
	return nil
end


	-- NPCS
	
	
	game.Workspace:WaitForChild('Pedestrians')
	
	totalPedestrians = 100

	local function moveNPC(NPC, WalkAnim)
		if NPC:FindFirstChild('Humanoid') and NPC:FindFirstChild('StolenFrom') == nil then
			NPC.Humanoid:Move(Vector3.new(math.random(-100,100)/100, math.random(-100,100)/100,math.random(-100,100)/100))
			spawn(function()
				wait(math.random(1,3))
				if NPC:FindFirstChild('Humanoid') then
					NPC.Humanoid:Move(Vector3.new(0,0,0))
					for num,Anim in ipairs(NPC.Humanoid:GetPlayingAnimationTracks()) do
						if Anim.Name ~= 'LanternHold' then
							Anim:Stop()
							Anim:Destroy()
						end
					end
				end
				if WalkAnim ~= nil then	
					WalkAnim:Stop()
				end
			end)
			--[[elseif NPC:FindFirstChild('StolenFrom') then
				NPC.Humanoid:MoveTo(NPC.StolenFrom.Value.Character.PrimaryPart.Position)
				spawn(function()
					NPC.Humanoid.MoveToFinished:Wait()
					for num,Anim in ipairs(NPC.Humanoid:GetPlayingAnimationTracks()) do
						--print(Anim.Name)
						if Anim.Name ~= 'LanternHold' then
							Anim:Stop()
							Anim:Destroy()
						end
					end
					if WalkAnim ~= nil then	
						WalkAnim:Stop()
					end
				end)]]
		end
	end

	spawn(function()
		while true do
			if #game.Workspace.Pedestrians:GetChildren() < totalPedestrians then
				for num = 1,totalPedestrians-#game.Workspace.Pedestrians:GetChildren() do
					if math.random(1,10) >= 8 then
						local Clone = game.ServerStorage.AOTObjects.Noble:Clone()
						spawn(function()
							local NPC = Clone	
							local WalkAnim = NPC.Humanoid:LoadAnimation(script.NPCWalk)
							NPC:WaitForChild('Humanoid', 15)
							while NPC:FindFirstChild('Humanoid') do
								wait(math.random(1,3))
								if NPC:WaitForChild('Humanoid', 15) then
									for num,Anim in ipairs(NPC.Humanoid:GetPlayingAnimationTracks()) do
										--print(Anim.Name)
										if Anim.Name ~= 'LanternHold' then
											Anim:Stop()
											Anim:Destroy()
										end
									end
									WalkAnim:Play()
									moveNPC(NPC, WalkAnim)
								end
							end
						end)
						if math.random(1,3) == 1 then
							local Wallet = Instance.new('NumberValue', Clone)
							Wallet.Name = 'Wallet'
							Wallet.Value = math.random(15, 50)
						end
						-- CLOTHING
						local Shirt = game.ReplicatedStorage.PedestrianClothing.Shirt:GetChildren()[math.random(1, #game.ReplicatedStorage.PedestrianClothing.Shirt:GetChildren())]:Clone()
						Shirt.Parent = Clone
						local Pants = game.ReplicatedStorage.PedestrianClothing.Pants:GetChildren()[math.random(1, #game.ReplicatedStorage.PedestrianClothing.Pants:GetChildren())]:Clone()
						Pants.Parent = Clone
						local randomFace = game.ReplicatedStorage.PedestrianClothing.Eyes:GetChildren()[math.random(1, #game.ReplicatedStorage.PedestrianClothing.Eyes:GetChildren())]:Clone()
						randomFace:Clone().Parent = Clone.Head
						local randomFace = game.ReplicatedStorage.PedestrianClothing.Mouths:GetChildren()[math.random(1, #game.ReplicatedStorage.PedestrianClothing.Mouths:GetChildren())]:Clone()
						randomFace:Clone().Parent = Clone.Head
						local Hair = game.ReplicatedStorage.PedestrianClothing.Hair:GetChildren()[math.random(1, #game.ReplicatedStorage.PedestrianClothing.Hair:GetChildren())]:Clone()
						Clone.Humanoid:AddAccessory(Hair)
						Hair.Handle.Color = Color3.fromRGB(math.random(1,255), math.random(1,255), math.random(1,255))
						-- CLOTHING
						Clone.Parent = game.Workspace.Pedestrians
						Clone:SetPrimaryPartCFrame(game.Workspace.PedestrianSpawns:GetChildren()[math.random(1, #game.Workspace.PedestrianSpawns:GetChildren())].CFrame)
					else
						local Clone = game.ServerStorage.AOTObjects.Peasant:Clone()
						spawn(function()
							local NPC = Clone	
							local WalkAnim = NPC.Humanoid:LoadAnimation(script.NPCWalk)
							NPC:WaitForChild('Humanoid', 15)
							while NPC:FindFirstChild('Humanoid') do
								wait(math.random(1,3))
								if NPC:WaitForChild('Humanoid', 15) then
									for num,Anim in ipairs(NPC.Humanoid:GetPlayingAnimationTracks()) do
										--print(Anim.Name)
										if Anim.Name ~= 'LanternHold' then
											Anim:Stop()
											Anim:Destroy()
										end
									end
									WalkAnim:Play()
									moveNPC(NPC, WalkAnim)
								end
							end
						end)
						if math.random(1,3) == 1 then
							local Wallet = Instance.new('NumberValue', Clone)
							Wallet.Name = 'Wallet'
							Wallet.Value = math.random(1, 200)
						end
						-- CLOTHING
						local Shirt = game.ReplicatedStorage.PedestrianClothing.Shirt:GetChildren()[math.random(1, #game.ReplicatedStorage.PedestrianClothing.Shirt:GetChildren())]:Clone()
						Shirt.Parent = Clone
						local Pants = game.ReplicatedStorage.PedestrianClothing.Pants:GetChildren()[math.random(1, #game.ReplicatedStorage.PedestrianClothing.Pants:GetChildren())]:Clone()
						Pants.Parent = Clone
						local randomFace = game.ReplicatedStorage.PedestrianClothing.Eyes:GetChildren()[math.random(1, #game.ReplicatedStorage.PedestrianClothing.Eyes:GetChildren())]:Clone()
						randomFace:Clone().Parent = Clone.Head
						local randomFace = game.ReplicatedStorage.PedestrianClothing.Mouths:GetChildren()[math.random(1, #game.ReplicatedStorage.PedestrianClothing.Mouths:GetChildren())]:Clone()
						randomFace:Clone().Parent = Clone.Head
						local Hair = game.ReplicatedStorage.PedestrianClothing.Hair:GetChildren()[math.random(1, #game.ReplicatedStorage.PedestrianClothing.Hair:GetChildren())]:Clone()
						Hair.Handle.Color = Color3.fromRGB(math.random(1,255), math.random(1,255), math.random(1,255))
						Clone.Humanoid:AddAccessory(Hair)
						-- CLOTHING
						Clone.Parent = game.Workspace.Pedestrians
						Clone:SetPrimaryPartCFrame(game.Workspace.PedestrianSpawns:GetChildren()[math.random(1, #game.Workspace.PedestrianSpawns:GetChildren())].CFrame)
					end
				end
			end
			wait(60)
		end
	end)
	

	
	-- CLOUDS
	
	local Debris = game:GetService('Debris')
	local Lights = true
	spawn(function()
		while true do
			wait(math.random(1,5))
			if Lights == false then
				local Cloud = game.ServerStorage.AOTObjects.Cloud:Clone()
				Debris:AddItem(Cloud, 300)
				local AGForce = Instance.new('BodyForce', Cloud.PrimaryPart)
				local Mass = 0
				for num,Part in ipairs(Cloud:GetChildren()) do
					Mass = Mass + Part:GetMass()
				end
				AGForce.Force = Vector3.new(0,game.Workspace.Gravity * Mass,game.Workspace.Gravity * Mass * -(math.random(6,8)/100))
				spawn(function()
					wait(3)
					AGForce.Force = Vector3.new(0,game.Workspace.Gravity * Mass,0)
				end)
				Cloud.Parent = game.Workspace
				Cloud:SetPrimaryPartCFrame(game.Workspace.CloudSpawner.CFrame * CFrame.new(math.random(-game.Workspace.CloudSpawner.Size.X,game.Workspace.CloudSpawner.Size.X),0,0) * CFrame.Angles(0,math.rad(math.random(-360,360)),0))
			end
		end
	end)
	
	
	
	
	-- CLOUDS
	
	
	game.Workspace:WaitForChild('LightsFolder')
	
	function randomGlass()
		local minimum = math.floor(#game.Workspace.LightsFolder.GlassFolder:GetChildren() * math.random(70, 85) / 100)
		for min = 1,minimum do
			local folder = game.Workspace.LightsFolder.GlassFolder:GetChildren()
			local Glass = folder[math.random(1, #folder)]
			if Glass.Name == 'Glass' and Glass.Material ~= Enum.Material.Neon and Glass.ClassName ~= 'ManualWeld' then
				Glass.Material = Enum.Material.Neon
				Glass.Color = colors2[math.random(1,#colors2)]
				Glass.GlassLight.Enabled = true
				--[[local GlassLight = game.ServerStorage.AOTObjects.GlassLight:Clone()
				GlassLight.Color = colors[math.random(1,#colors)]
				GlassLight.Parent = Glass]]
			elseif Glass.Name == 'FlameLightPart' then
				Glass.FlameLight.Enabled = true
				Glass.FlameParticle.Enabled = true
			end
			if min % 50 == 0 then
				wait()
			end
		end
		for num,NPC in ipairs(game.Workspace.Pedestrians:GetChildren()) do
			print('giving out lanterns')
			if NPC:FindFirstChild('NPCLantern') then
				NPC.NPCLantern:Destroy()
			end
			for num,Anim in ipairs(NPC.Humanoid:GetPlayingAnimationTracks()) do
				if Anim.Name == 'LanternHold' then
					Anim:Stop()
					Anim:Destroy()
				end
			end
		end
		for num,NPC in ipairs(game.Workspace.Pedestrians:GetChildren()) do
			local Clone = game.ServerStorage.AOTObjects.NPCLantern:Clone()
			Clone.Parent = NPC
			print(NPC, ' gets a lantern')
		end
		for num,Fire in ipairs(game.Workspace.LightsFolder:GetChildren()) do
			if Fire.Name == 'BigFlame' or Fire.Name == 'Flame' or Fire.Name == 'FlameLightPart' then
				if Fire:FindFirstChild('FlameLight') then
					Fire.FlameLight.Enabled = true
				end
				if Fire:FindFirstChild('FlameParticle') then
					Fire.FlameParticle.Enabled = true
				end
			end
		end
	end
		
	
	
	colors = {Color3.fromRGB(255, 214, 164), Color3.fromRGB(255, 202, 155), Color3.fromRGB(255, 212, 151), Color3.fromRGB(255, 198, 147), Color3.fromRGB(255, 201, 162)}
	
	colors2 = {Color3.new(118, 118, 118)}
	
	--[[local function allGlass()
		for num,Glass in ipairs(game.Workspace.LightsFolder:GetChildren()) do
			if Glass.Name == 'Glass' then
				Glass.Material = Enum.Material.Neon
				Glass.Color = colors2[math.random(1,#colors2)]
				local GlassLight = game.ServerStorage.AOTObjects.GlassLight:Clone()
				GlassLight.Color = colors[math.random(1,#colors)]
				GlassLight.Parent = Glass
			elseif Glass.Name == 'FlameLightPart' then
				Glass.FlameLight.Enabled = true
				Glass.FlameParticle.Enabled = true
			end
		end
	end]]
	
	function allOffGlass()
		for num,Glass in ipairs(game.Workspace.LightsFolder.GlassFolder:GetChildren()) do
			if Glass.Name == 'Glass' then
				Glass.Material = Enum.Material.Glass
				Glass.Color = Color3.new(0,0,0)
				--[[if Glass:FindFirstChild('GlassLight') then
					Glass:FindFirstChild('GlassLight'):Destroy()
				end]]
				Glass.GlassLight.Enabled = false
			elseif Glass.Name == 'FlameLightPart' then
				Glass.FlameLight.Enabled = false
				Glass.FlameParticle.Enabled = false
			end
		end
		for num,NPC in ipairs(game.Workspace.Pedestrians:GetChildren()) do
			if NPC:FindFirstChild('NPCLantern') then
				NPC.NPCLantern:Destroy()
			end
			for num,Anim in ipairs(NPC.Humanoid:GetPlayingAnimationTracks()) do
				if Anim.Name == 'LanternHold' then
					Anim:Stop()
					Anim:Destroy()
				end
			end
		end
		for num,Fire in ipairs(game.Workspace.LightsFolder:GetChildren()) do
			if Fire.Name == 'BigFlame' or Fire.Name == 'Flame' or Fire.Name == 'FlameLightPart' then
				if Fire:FindFirstChild('FlameLight') then
					Fire.FlameLight.Enabled = false
				end
				if Fire:FindFirstChild('FlameParticle') then
					Fire.FlameParticle.Enabled = false
				end
			end
		end
	end
	
	game.Lighting.ClockTime = 7.5
	
	local AmbientDay = script:WaitForChild('AmbientDay')
	local AmbientNight = script:WaitForChild('AmbientNight')
	
	spawn(function()
		while true do
			wait(10)
			game.Lighting.ClockTime = game.Lighting.ClockTime + 0.1
			spawn(function()
				if game.Lighting.ClockTime >= 6.3 and game.Lighting.ClockTime < 17.7 and Lights == true then	
					allOffGlass()
					Lights = false
					AmbientDay.Parent = game.Workspace
					AmbientDay:Play()
					AmbientNight:Stop()
					AmbientNight.Parent = script
				elseif game.Lighting.ClockTime >= 23.5 then
					game.Lighting.ClockTime = 0
				elseif game.Lighting.ClockTime >= 17.7 and Lights == false then
					randomGlass()
					game.Workspace.CloudFolder:ClearAllChildren()
					Lights = true
					AmbientNight.Parent = game.Workspace
					AmbientNight:Play()
					AmbientDay:Stop()
					AmbientDay.Parent = script
				end
			end)
		end
	end)
	wait(10)
	--[[for num,NPC in ipairs(game.Workspace.Pedestrians:GetChildren()) do
		local WalkAnim = NPC.Humanoid:LoadAnimation(script.NPCWalk)
		spawn(function()
			NPC:WaitForChild('Humanoid', 15)
			while NPC:FindFirstChild('Humanoid') do
				wait(math.random(1,3))
				if NPC:WaitForChild('Humanoid', 15) then
					for num,Anim in ipairs(NPC.Humanoid:GetPlayingAnimationTracks()) do
						--print(Anim.Name)
						if Anim.Name ~= 'LanternHold' then
							Anim:Stop()
							Anim:Destroy()
						end
					end
					WalkAnim:Play()
					moveNPC(NPC, WalkAnim)
				end
			end
		end)
	end]]
	--randomGlass()
	AmbientDay.Parent = game.Workspace
	AmbientDay:Play()
	AmbientNight:Stop()
	AmbientNight.Parent = script
