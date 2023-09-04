-- Scripted by doser225
-- Comments, questions, concerns, let me know through a PM although it might be rare I'll get back to you
local ChatFilter = game:GetService("Chat")
game.ReplicatedStorage.RadioFE.sound.OnServerEvent:connect(function(player, sound)
	sound:Play()
end)

game.ReplicatedStorage.RadioFE.color.OnServerEvent:connect(function(player, color, brick)
	brick.BrickColor = BrickColor.new(color)
end)

game.ReplicatedStorage.RadioFE.chat.OnServerEvent:connect(function(player, msg)
	game.ReplicatedStorage.RadioFE.givegui.Radio.Frame.L7.Value = game.ReplicatedStorage.RadioFE.givegui.Radio.Frame.L6.Value
	game.ReplicatedStorage.RadioFE.givegui.Radio.Frame.L6.Value = game.ReplicatedStorage.RadioFE.givegui.Radio.Frame.L5.Value
	game.ReplicatedStorage.RadioFE.givegui.Radio.Frame.L5.Value = game.ReplicatedStorage.RadioFE.givegui.Radio.Frame.L4.Value
	game.ReplicatedStorage.RadioFE.givegui.Radio.Frame.L4.Value = game.ReplicatedStorage.RadioFE.givegui.Radio.Frame.L3.Value
	game.ReplicatedStorage.RadioFE.givegui.Radio.Frame.L3.Value = game.ReplicatedStorage.RadioFE.givegui.Radio.Frame.L2.Value
	game.ReplicatedStorage.RadioFE.givegui.Radio.Frame.L2.Value = game.ReplicatedStorage.RadioFE.givegui.Radio.Frame.L1.Value
	game.ReplicatedStorage.RadioFE.givegui.Radio.Frame.L1.Value = player.Name .. ": " .. ChatFilter:FilterStringForBroadcast(msg, player)
end)

game.ReplicatedStorage.TacRadioFE.sound.OnServerEvent:connect(function(player, sound)
	sound:Play()
end)

game.ReplicatedStorage.TacRadioFE.color.OnServerEvent:connect(function(player, color, brick)
	brick.BrickColor = BrickColor.new(color)
end)

game.ReplicatedStorage.TacRadioFE.chat.OnServerEvent:connect(function(player, msg)
	game.ReplicatedStorage.TacRadioFE.givegui.Radio.Frame.L7.Value = game.ReplicatedStorage.TacRadioFE.givegui.Radio.Frame.L6.Value
	game.ReplicatedStorage.TacRadioFE.givegui.Radio.Frame.L6.Value = game.ReplicatedStorage.TacRadioFE.givegui.Radio.Frame.L5.Value
	game.ReplicatedStorage.TacRadioFE.givegui.Radio.Frame.L5.Value = game.ReplicatedStorage.TacRadioFE.givegui.Radio.Frame.L4.Value
	game.ReplicatedStorage.TacRadioFE.givegui.Radio.Frame.L4.Value = game.ReplicatedStorage.TacRadioFE.givegui.Radio.Frame.L3.Value
	game.ReplicatedStorage.TacRadioFE.givegui.Radio.Frame.L3.Value = game.ReplicatedStorage.TacRadioFE.givegui.Radio.Frame.L2.Value
	game.ReplicatedStorage.TacRadioFE.givegui.Radio.Frame.L2.Value = game.ReplicatedStorage.TacRadioFE.givegui.Radio.Frame.L1.Value
	game.ReplicatedStorage.TacRadioFE.givegui.Radio.Frame.L1.Value = player.Name .. ": " .. ChatFilter:FilterStringForBroadcast(msg, player)
	--script.givegui.Radio.Frame.L1.Value = player.Name .. ": " .. ChatFilter:FilterStringAsync(msg, player, player)
end)

game.ReplicatedStorage.CIRadioFE.sound.OnServerEvent:connect(function(player, sound)
	sound:Play()
end)

game.ReplicatedStorage.CIRadioFE.color.OnServerEvent:connect(function(player, color, brick)
	brick.BrickColor = BrickColor.new(color)
end)

game.ReplicatedStorage.CIRadioFE.chat.OnServerEvent:connect(function(player, msg)
	game.ReplicatedStorage.CIRadioFE.givegui.Radio.Frame.L7.Value = game.ReplicatedStorage.CIRadioFE.givegui.Radio.Frame.L6.Value
	game.ReplicatedStorage.CIRadioFE.givegui.Radio.Frame.L6.Value = game.ReplicatedStorage.CIRadioFE.givegui.Radio.Frame.L5.Value
	game.ReplicatedStorage.CIRadioFE.givegui.Radio.Frame.L5.Value = game.ReplicatedStorage.CIRadioFE.givegui.Radio.Frame.L4.Value
	game.ReplicatedStorage.CIRadioFE.givegui.Radio.Frame.L4.Value = game.ReplicatedStorage.CIRadioFE.givegui.Radio.Frame.L3.Value
	game.ReplicatedStorage.CIRadioFE.givegui.Radio.Frame.L3.Value = game.ReplicatedStorage.CIRadioFE.givegui.Radio.Frame.L2.Value
	game.ReplicatedStorage.CIRadioFE.givegui.Radio.Frame.L2.Value = game.ReplicatedStorage.CIRadioFE.givegui.Radio.Frame.L1.Value
	game.ReplicatedStorage.CIRadioFE.givegui.Radio.Frame.L1.Value = player.Name .. ": " .. ChatFilter:FilterStringForBroadcast(msg, player)
end)