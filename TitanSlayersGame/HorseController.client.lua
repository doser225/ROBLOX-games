local Player = game.Players.LocalPlayer
local UIS = game:GetService('UserInputService')
local RunService = game:GetService('RunService')
--local HorseLoad = game.ReplicatedStorage.HorseFE.HorseAnimL
local HorseStop = game.ReplicatedStorage:WaitForChild('HorseFE'):WaitForChild('HorseAnimS')
--local HorseStart = game.ReplicatedStorage.HorseFE.HorseStart
local HorseRun = game.ReplicatedStorage:WaitForChild('HorseFE'):WaitForChild('HorseRun')
local HorseNoise = game.ReplicatedStorage:WaitForChild('HorseFE'):WaitForChild('HorseNoise')
local W,A,S,D = 0,0,0,0
local Single = false
local Sprint = false
local Horse = nil
local NoiseDB = true

game.Workspace:WaitForChild(Player.Name):WaitForChild('Humanoid')
script:WaitForChild('HorseIdle1')
script:WaitForChild('Running')

function animate()
	if W+S == 0 and D+A == 0 and Single == true then
		Single = false
		for num,Anim in ipairs(Horse.Humanoid:GetPlayingAnimationTracks()) do
			if Anim.Name == "Running" or Anim.Name == "Sprinting" then
				Anim:Stop()
			end
		end
		Horse.HumanoidRootPart:WaitForChild('Walking'):Stop()
	elseif Single == false and (W+S ~= 0 or D+A ~= 0) then
		Single = true
		Horse.HumanoidRootPart:WaitForChild('Walking'):Play()
		Horse.Humanoid:LoadAnimation(script.Running):Play()
		local PlayerCanter = Player.Character.Humanoid:LoadAnimation(script.PlayerCanter)
		PlayerCanter:Play()
	end
end

if Player.Character.Humanoid.SeatPart ~= nil then
	Horse = Player.Character.Humanoid.SeatPart.Parent
	Horse.Humanoid:LoadAnimation(script.HorseIdle1):Play()
	Horse.Humanoid.WalkSpeed = 16
	Horse.HumanoidRootPart:WaitForChild('Walking').PlaybackSpeed = 0.8
	--HorseStart:FireServer(Horse, Horse.Running)
	UIS.InputBegan:connect(function(Input, Chatting)
		if Input.KeyCode == Enum.KeyCode.W and Chatting == false then
			W = -1
			animate()
		end
		if Input.KeyCode == Enum.KeyCode.A and Chatting == false then
			A = -1
			animate()
		end
		if Input.KeyCode == Enum.KeyCode.S and Chatting == false then
			S = 1
			animate()
		end
		if Input.KeyCode == Enum.KeyCode.D and Chatting == false then
			D = 1
			animate()
		end
		if Input.KeyCode == Enum.KeyCode.LeftShift and Chatting == false and (W+S ~= 0 or D+A ~= 0) then
			Sprint = true
			Player.Character.Humanoid.WalkSpeed = 40
			Horse.Humanoid.WalkSpeed = 40
			HorseRun:FireServer(Horse.Humanoid)
			Horse.HumanoidRootPart:WaitForChild('Walking').PlaybackSpeed = 1.3
			Horse.Humanoid:LoadAnimation(script.Sprinting):Play()
			local PlayerGallop = Player.Character.Humanoid:LoadAnimation(script.PlayerGallop)
			PlayerGallop:Play()
		end
		if Input.KeyCode == Enum.KeyCode.H and Chatting == false and NoiseDB == true then
			NoiseDB = false
			spawn(function()if Horse.HumanoidRootPart:FindFirstChild('Neigh') then
				HorseNoise:InvokeServer(Horse.HumanoidRootPart.Neigh)
			end
			end)
			wait(5)
			NoiseDB = true
		end
	end)
	UIS.InputEnded:connect(function(Input, Chatting)
		if Input.KeyCode == Enum.KeyCode.W then
			W = 0
			animate()
		end
		if Input.KeyCode == Enum.KeyCode.A then
			A = 0
			animate()
		end
		if Input.KeyCode == Enum.KeyCode.S then
			S = 0
			animate()
		end
		if Input.KeyCode == Enum.KeyCode.D then
			D = 0
			animate()
		end
		if Input.KeyCode == Enum.KeyCode.LeftShift and Chatting == false then
			Sprint = false
			Player.Character.Humanoid.WalkSpeed = 16
			Horse.Humanoid.WalkSpeed = 16
			HorseStop:FireServer(Horse.Humanoid)
			Horse.HumanoidRootPart:WaitForChild('Walking').PlaybackSpeed = 0.8
			for num,Anim in ipairs(Horse.Humanoid:GetPlayingAnimationTracks()) do
				if Anim.Name == "Sprinting" then
					Anim:Stop()
				end
			end
			for num,Anim in ipairs(Player.Character.Humanoid:GetPlayingAnimationTracks()) do
				if Anim.Name == "PlayerGallop" then
					Anim:Stop()
				end
			end
		end
	end)
end

RunService.Heartbeat:connect(function()
	if Player.Character.Humanoid.SeatPart == nil then
		Player.Character.Humanoid.WalkSpeed = 16
		if Horse ~= nil then
			Horse.Humanoid:Move(Vector3.new(0,0,0), false)
		end
		W,A,S,D = 0,0,0,0
		for num,Anim in ipairs(Player.Character.Humanoid:GetPlayingAnimationTracks()) do
			if Anim.Name == "PlayerGallop" or Anim.Name == 'PlayerCanter' then
				Anim:Stop()
			end
		end
		animate()
		script:Destroy()
	else
		if Horse == nil then
			Horse = Player.Character.Humanoid.SeatPart.Parent
		end
		Horse.Humanoid:Move(Vector3.new(D+A,0,S+W), true)
	end
end)
print('Horse controller fully loaded')