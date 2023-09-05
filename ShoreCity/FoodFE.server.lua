function game.ReplicatedStorage.FoodFE.Eat.OnServerInvoke(Player, Healing, Tool)
	Player.Character.Humanoid.Health = Player.Character.Humanoid.Health + Healing
	Tool:Destroy()
end