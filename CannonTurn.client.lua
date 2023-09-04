UIS = game:GetService('UserInputService')
Player = game.Players.LocalPlayer
game.ReplicatedStorage:WaitForChild('MAINFE')
local CannonTurn = game.ReplicatedStorage.MAINFE:WaitForChild('CannonTurn')
local CannonTurnY = game.ReplicatedStorage.MAINFE:WaitForChild('CannonTurnUD')
local ConstantTurn = false
local ConstantTurnUD = false

UIS.InputBegan:connect(function(Key, Chatting)
	if (Key.KeyCode == Enum.KeyCode.A or Key.KeyCode == Enum.KeyCode.D) then
		ConstantTurn = true
		while ConstantTurn == true do
			CannonTurn:InvokeServer(Key.KeyCode)
		end
	end
	if (Key.KeyCode == Enum.KeyCode.W or Key.KeyCode == Enum.KeyCode.S) then
		ConstantTurnUD = true
		while ConstantTurnUD == true do
			CannonTurnY:InvokeServer(Key.KeyCode)
		end
	end
end)

UIS.InputEnded:connect(function(Key, Chatting)
	if (Key.KeyCode == Enum.KeyCode.A or Key.KeyCode == Enum.KeyCode.D) then
		ConstantTurn = false
	end
	if (Key.KeyCode == Enum.KeyCode.W or Key.KeyCode == Enum.KeyCode.S) then
		ConstantTurnUD = false
	end
end)