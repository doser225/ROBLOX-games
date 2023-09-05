function game.ReplicatedStorage.MusicFE.PlaySong.OnServerInvoke(Player, SongId)
	if game.Workspace.Ragdolls:FindFirstChild(Player.Name) ~= nil then
		local Song = Instance.new("Sound", game.Workspace.Ragdolls:FindFirstChild(Player.Name).Head)
		Song.SoundId = SongId
		Song.Volume = 0.5
		Song.Looped = true
		Song:Play()
		Song.Name = "Music"
	end
	local Song = Instance.new("Sound", Player.Character.Head)
	Song.SoundId = SongId
	Song.Volume = 0.5
	Song.Looped = true
	Song:Play()
	Song.Name = "Music"
end

function game.ReplicatedStorage.MusicFE.StopSong.OnServerInvoke(Player)
	if game.Workspace.Ragdolls:FindFirstChild(Player.Name) ~= nil then
		game.Workspace.Ragdolls:FindFirstChild(Player.Name).Head:FindFirstChild("Music"):Stop()
		game.Workspace.Ragdolls:FindFirstChild(Player.Name).Head:FindFirstChild("Music"):Destroy()
	else
		Player.Character.Head:FindFirstChild("Music"):Stop()
		Player.Character.Head:FindFirstChild("Music"):Destroy()
	end
end