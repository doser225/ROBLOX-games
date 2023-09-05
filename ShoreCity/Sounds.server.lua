while wait(math.random(3, 15)) do
	game.Workspace.Shots.PlaybackSpeed = math.random(70, 100) / 100
	game.Workspace.Shots:Play()
end