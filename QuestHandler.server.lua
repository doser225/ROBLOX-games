-- Quest handler

game.Players.PlayerAdded:connect(function(Player)
	
	local PlayerHorse = Instance.new('Folder', Player)
	PlayerHorse.Name = 'PlayerHorse'
	local Cooldown = Instance.new('NumberValue', PlayerHorse)
	Cooldown.Name = 'Cooldown'
	Cooldown.Value = 0
	repeat
		wait(1)
	until _G[Player.Name]['HorseType'] ~= nil
	local MASTER_HORSE = game.ServerStorage.AOTObjects.Horses:FindFirstChild(_G[Player.Name]['HorseType']):Clone()
	MASTER_HORSE.Parent = PlayerHorse
	MASTER_HORSE.Name = Player.Name .. 'MASTER_HORSE'
	
	
	local QuestLine = Instance.new('Folder', Player)
	local QuestName = 'Attack on TinTan'
	QuestLine.Name = '-'..QuestName..'QUEST'
	local Objective = Instance.new('NumberValue', QuestLine)
	Objective.Name = 'kill 1 titan'
	Objective.Value = 1
	local Objective = Instance.new('NumberValue', QuestLine)
	Objective.Name = 'eat a singular apple'
	Objective.Value = 1
	
	local QuestLine = Instance.new('Folder', Player)
	local QuestName = 'a new journey'
	QuestLine.Name = '-'..QuestName..'QUEST'
	local Objective = Instance.new('NumberValue', QuestLine)
	Objective.Name = 'find your purpose in life'
	Objective.Value = 1
	
end)