-- Created by doser225
-- 1/12/2020
-- To be used for future TitanSlayers Roleplay game

wait(2.5)

local Player = game:GetService('Players').LocalPlayer

for num,Forces in ipairs(Player.Character:GetChildren()) do
	if Forces.Name == 'BodyPosition' or Forces.Name == 'BodyThrust' or Forces.Name == 'BodyGyro' then
		Forces:Destroy()
	end
end
Player:WaitForChild('ODMInfo')
local Range = Player.ODMInfo:WaitForChild('HookRange').Value
local OriginalSpeed = 150
local GasAmount = Player:WaitForChild('Gas')
GasAmount = GasAmount.Value

local Debris = game:GetService('Debris')
local PMouse = Player:GetMouse()
local UIS = game:GetService('UserInputService')
local TweenService = game:GetService('TweenService')
local RunService = game:GetService('RunService')
local BForce = Instance.new("BodyPosition")
local AForce = Instance.new("BodyThrust")
local Gyro = Instance.new("BodyGyro")
BForce.Name = 'BForce'
AForce.Name = 'AForce'
Gyro.Name = 'Gyro'
local YForce = 1900
local PMouse = Player:GetMouse()
local FEFolder = game.ReplicatedStorage:WaitForChild('3DMGFE')
local ServerGrapple = FEFolder:WaitForChild("ServerGrapple")
local StopGas = FEFolder:WaitForChild("StopGas")
local ReloadBlades = FEFolder:WaitForChild("ReloadBlades")
local KillTitan = FEFolder:WaitForChild("KillTitan")
local SlashEnemy = FEFolder:WaitForChild("SlashEnemy")
local FlareShot = FEFolder:WaitForChild("FlareShoot")
local ThunderShot = FEFolder:WaitForChild("ShootThunder")
local BoostEffect = FEFolder:WaitForChild("BoostEffect")
local BoostEffectStop = FEFolder:WaitForChild("BoostEffectStop")
local ServerGrappleDestroy = workspace:WaitForChild("ServerGrappleDestroy")
local FlyForward = Player.Character.Humanoid:LoadAnimation(script:WaitForChild("FlyForward"))
local RightTilt = Player.Character.Humanoid:LoadAnimation(script:WaitForChild("RightTilt"))
local LeftTilt = Player.Character.Humanoid:LoadAnimation(script:WaitForChild("LeftTilt"))
local RightTiltHold = Player.Character.Humanoid:LoadAnimation(script:WaitForChild("RightTiltHold"))
local LeftTiltHold = Player.Character.Humanoid:LoadAnimation(script:WaitForChild("LeftTiltHold"))
local SlashHold1 = Player.Character.Humanoid:LoadAnimation(script:WaitForChild("SlashHold1"))
local SpinSlash = Player.Character.Humanoid:LoadAnimation(script:WaitForChild("SpinSlash"))
local ForwardSlash = Player.Character.Humanoid:LoadAnimation(script:WaitForChild("ForwardSlash"))
local BladeReload = Player.Character.Humanoid:LoadAnimation(script:WaitForChild("BladeReload"))
local BoostAnim = Player.Character.Humanoid:LoadAnimation(script:WaitForChild("BoostAnim"))
local WallHold = Player.Character.Humanoid:LoadAnimation(script:WaitForChild("WallHold"))

local FOVTweenEffect = TweenInfo.new(0.3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)
local FOVTween = TweenService:Create(game.Workspace.Camera, FOVTweenEffect, {['FieldOfView']=90})

local MousePartQChange = nil
local MousePartEChange = nil

--[[local LTEffect = TweenInfo.new(0.3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)
local LeftTiltTween = TweenService:Create(game.Workspace.CurrentCamera, LTEffect, {['CFrame']=game.Workspace.CurrentCamera.CFrame * CFrame.Angles(0,-90,0)})

local RTEffect = TweenInfo.new(0.3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)
local RightTiltTween = TweenService:Create(game.Workspace.CurrentCamera, RTEffect, {['CFrame']=game.Workspace.CurrentCamera.CFrame * CFrame.Angles(90,0,0)})]]

local HookMesh = script:WaitForChild('HookMesh')
local Speed = OriginalSpeed
local MaxGas = GasAmount

if game.Workspace:FindFirstChild('WindSound') then
	game.Workspace.WindSound:Destroy()
end

local WindSound = Instance.new('Sound', game.Workspace)
WindSound.Name = 'WindSound'
WindSound.SoundId = 'rbxassetid://2020936390'
WindSound.Looped = true
WindSound.Volume = 3

Player.Gas.Changed:connect(function()
	GasAmount = Player.Gas.Value
end)

for num,Part in ipairs(Player.Character:GetDescendants()) do
	if Part.ClassName == "Part" then
		YForce = YForce + (Part:GetMass() * game.Workspace.Gravity)
	end
end
YForce = game.Players.LocalPlayer:WaitForChild('ODMInfo'):WaitForChild('Speed').Value

Gyro.Parent = Player.Character.HumanoidRootPart
BForce.Parent = Player.Character.HumanoidRootPart
AForce.Parent = Player.Character.HumanoidRootPart
BForce.MaxForce = Vector3.new(0, 0, 0)

local Grabbed = Player.Character:WaitForChild('Grabbed') -- TITAN GRIP
local QHold = false
local EHold = false
local AHold = false
local DHold = false
local HumanoidRootPartPos = Vector3.new(0, 0, 0)
local FlareDB = true
local QHit = nil
local EHit = nil
local MouseHit = CFrame.new()
local MousePartE, MousePartQ = nil, nil
local MousePosE, MousePosQ = nil, nil
local QDebounce = true
local EDebounce = true
local Boost = false
local SlashDB = true
local GasDisable = false
local BoostDB = true
local ThunderDB = true
-- WALLHOLDING VARS --
local WallHoldDB = true
local HookPosQ = nil
local HookPosE = nil
-- WALLHOLDING VARS --
local oldCharPos = nil
local oldVeloc = {}
-- LOWER TEMP --
local SHold = false
local SHoldPos = Vector3.new(0,0,0)
-- LOWER TEMP --
HookQ = nil
HookE = nil
HookCloneE = nil
HookCloneQ = nil
ReelDB = true

local Shifted = false

local ServerWires = {}

if Player.Character.Name == Player.Name then
	Player.CameraMinZoomDistance = 5
	Player.CameraMaxZoomDistance = 25
else
	script.Disabled = true
	script:Destroy()
	Shifted = true
end


Player:WaitForChild('Gas').Changed:connect(function()
	if Player.PlayerGui:FindFirstChild('CharInfo') then
		local CharInfo = Player.PlayerGui:FindFirstChild('CharInfo')
		--CharInfo.CharMainFrame.GasLeft.Size = UDim2.new(0.975 * (GasAmount / MaxGas), 0, 0.6, 0)
		--CharInfo.CharMainFrame.GasLeft.Position = UDim2.new(0.01 * (GasAmount / MaxGas) + ((CharInfo.CharMainFrame.GasLeft.Size.X.Scale * 0.01) * ((MaxGas - GasAmount)/MaxGas)), 0, 0.2, 0) --0.035
		CharInfo.CharMainFrame.GasLeft.Size = UDim2.new(0, math.ceil(244 * (GasAmount / MaxGas)), 0, 16)
		--CharInfo.CharMainFrame.GasLeft.Position = UDim2.new(0.843 * (GasAmount / MaxGas) + ((CharInfo.CharMainFrame.GasLeft.Size.X.Scale * 0.843) * ((MaxGas - GasAmount)/MaxGas)), 0, 1.19, 0) --0.035
	end
end)


if Shifted == false then
	ServerGrapple.OnClientEvent:connect(function(Hook, Position, Wire, Part)
		local ServerH = Hook:FindFirstAncestor(Player.Name)
		if ServerH == nil then
			table.insert(ServerWires, {Hook, Position, Wire, Part})
		end
	end)
	
	function leftHookStop()
		QHold = false
		QHit = nil
		MousePartQ = nil
		if MousePartQChange ~= nil then
			MousePartQChange:Disconnect()
			MousePartQChange = nil
		end
		if EHit ~= nil then
			MouseHit = EHit
			AForce.Force = Vector3.new(0, 0, -YForce * 5.5)
			Player.Character.Humanoid.PlatformStand = true
		elseif EHit == nil then
			cease()
		end
		if workspace:FindFirstChild("GrappleFolder") then
			while workspace.GrappleFolder:FindFirstChild("SERVERWIRE"..Player.Name.."Q") do
				for num,SERVERWIRE in ipairs(workspace:FindFirstChild("GrappleFolder"):GetChildren()) do
					if SERVERWIRE.Name == "SERVERWIRE"..Player.Name.."Q" then
						ServerGrappleDestroy:FireServer(SERVERWIRE, 'Q')
					end
				end
				wait(1)
			end
		end
	end
	
	function rightHookStop()
		EHold = false
		EHit = nil
		MousePartE = nil
		if MousePartEChange ~= nil then
			MousePartEChange:Disconnect()
			MousePartEChange = nil
		end
		if QHit ~= nil then
			MouseHit = QHit
			AForce.Force = Vector3.new(0, 0, -YForce * 5.5)
			Player.Character.Humanoid.PlatformStand = true
		elseif QHit == nil then
			cease()
		end
		if workspace:FindFirstChild("GrappleFolder") then
			while workspace.GrappleFolder:FindFirstChild("SERVERWIRE"..Player.Name.."E") do
				for num,SERVERWIRE in ipairs(workspace:FindFirstChild("GrappleFolder"):GetChildren()) do
					if SERVERWIRE.Name == "SERVERWIRE"..Player.Name.."E" then
						ServerGrappleDestroy:FireServer(SERVERWIRE, 'E')
					end
				end
				wait(1)
			end
		end
	end
	
	function siphonGas(amount)
		if GasAmount - amount <= 0 then
			GasAmount = 0
		else
			GasAmount = GasAmount - amount
		end
		spawn(function()
			if Player.PlayerGui:FindFirstChild('CharInfo') then
				local CharInfo = Player.PlayerGui:FindFirstChild('CharInfo')
				--CharInfo.CharMainFrame.GasLeft.Size = UDim2.new(0.975 * (GasAmount / MaxGas), 0, 0.6, 0)
				--CharInfo.CharMainFrame.GasLeft.Position = UDim2.new(0.01 * (GasAmount / MaxGas) + ((CharInfo.CharMainFrame.GasLeft.Size.X.Scale * 0.01) * ((MaxGas - GasAmount)/MaxGas)), 0, 0.2, 0) --0.035
				CharInfo.CharMainFrame.GasLeft.Size = UDim2.new(0, math.ceil(244 * (GasAmount / MaxGas)), 0, 16)
				--CharInfo.CharMainFrame.GasLeft.Position = UDim2.new(0.843 * (GasAmount / MaxGas) + ((CharInfo.CharMainFrame.GasLeft.Size.X.Scale * 0.843) * ((MaxGas - GasAmount)/MaxGas)), 0, 1.19, 0) --0.035
			end
		end)
	end
	
	function cease()
		QHold = false
		EHold = false
		if Player.Character.Humanoid.FloorMaterial == nil then
			Player.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Freefall)
		end
		Player.Character.LowerTorso.Anchored = false
		SHoldPos = Vector3.new(0,0,0)
		if Player.Character:FindFirstChild('GasPiece') and Player.Character.GasPiece:FindFirstChild('GasPart') then
			Player.Character.GasPiece.GasPart.GasSound:Stop()
		end
		FlyForward:Stop()
		StopGas:FireServer()
		LeftTilt:Stop()
		LeftTiltHold:Stop()
		RightTilt:Stop()
		RightTiltHold:Stop()
		Gyro.MaxTorque = Vector3.new()
		if Player.Character.Humanoid.PlatformStand == true then	
			Player.Character.Humanoid.PlatformStand = false
		end
		FOVTween:Cancel()
		BForce.MaxForce = Vector3.new()
		AForce.Force = Vector3.new()
		Speed = OriginalSpeed
		Boost = false
		game.Workspace.Camera.FieldOfView = 70
		BoostAnim:Stop()
		if (QHold == true or EHold == true) then
			FlyForward:Play()
		end
		BoostEffectStop:FireServer()
		if Player.Character:FindFirstChild('GasPiece') then
			Player.Character.GasPiece.GasPart.Gas.Enabled = false
			Player.Character.GasPiece.GasPart.ParticleEmitter:Clear()
			Player.Character.GasPiece.GasPart.ParticleEmitter.Size = NumberSequence.new(0.4)
			Player.Character.GasPiece.GasPart.ParticleEmitter.LockedToPart = true
		end
		if workspace:FindFirstChild("GrappleFolder") then
			while workspace.GrappleFolder:FindFirstChild("SERVERWIRE"..Player.Name.."Q") or workspace.GrappleFolder:FindFirstChild("SERVERWIRE"..Player.Name.."E") do
				for num,SERVERWIRE in ipairs(workspace:FindFirstChild("GrappleFolder"):GetChildren()) do
					if SERVERWIRE.Name == "SERVERWIRE"..Player.Name.."Q" then
						ServerGrappleDestroy:FireServer(SERVERWIRE, 'Q')
					elseif SERVERWIRE.Name == "SERVERWIRE"..Player.Name.."E" then
						ServerGrappleDestroy:FireServer(SERVERWIRE, 'E')
					end
				end
				wait(1)
			end
		end
	end
	
	function chunks(Part, Position)
		if Part ~= nil and game.ReplicatedStorage:WaitForChild('AOTObjects'):FindFirstChild('Chunk') then
			local BlackChunk = game.ReplicatedStorage.AOTObjects:FindFirstChild('Chunk'):Clone()
			BlackChunk.Transparency = 1
			BlackChunk.CFrame = CFrame.new(Position.X, Position.Y, Position.Z)
			BlackChunk.Anchored = true
			BlackChunk.CanCollide = false
			local BCSound = Instance.new("Sound", BlackChunk)
			BCSound.SoundId = "rbxassetid://851453784"
			BCSound.Volume = 1
			BCSound.PlaybackSpeed = math.random(70, 100) / 100
			Debris:AddItem(BlackChunk, 3)
			
			local Chunk1 = game.ReplicatedStorage.AOTObjects:FindFirstChild('Chunk'):Clone()
			local Chunk2 = game.ReplicatedStorage.AOTObjects:FindFirstChild('Chunk'):Clone()
			Chunk1.Parent = game.Workspace
			Chunk2.Parent = game.Workspace
			Chunk1.CFrame = CFrame.new(Position.X, Position.Y, Position.Z)
			Chunk2.CFrame = CFrame.new(Position.X, Position.Y, Position.Z)
			if Part.Parent:FindFirstChild('Humanoid') == nil then
				Chunk1.BrickColor = Part.BrickColor
				Chunk1.Material = Part.Material
				Chunk2.BrickColor = Part.BrickColor
				Chunk2.Material = Part.Material
				BCSound.SoundId = "rbxassetid://132758217"
			end
			BCSound:Play()
			Chunk1.BodyForce.Force = Vector3.new(5 * math.random(-1, 1), 5 * math.random(-1, 1), 5 * math.random(-1, 1))
			Chunk2.BodyForce.Force = Vector3.new(5 * math.random(-1, 1), 5 * math.random(-1, 1), 5 * math.random(-1, 1))
			Debris:AddItem(Chunk1, math.random(1, 3))
			Debris:AddItem(Chunk2, math.random(1, 3))
			Debris:AddItem(Chunk1.BodyForce, 0.2)
			Debris:AddItem(Chunk2.BodyForce, 0.2)
		end
	end
	
	function fireHook(Button)
		siphonGas(15)
		HumanoidRootPartPos = Player.Character.HumanoidRootPart.Position
		local ignoreList = {}
		game.Workspace:WaitForChild('TitanFolder')
		for num,Titan in ipairs(game.Workspace.TitanFolder:GetChildren()) do
			if Titan:FindFirstChild('HumanoidRootPart') then
				table.insert(ignoreList, Titan.HumanoidRootPart)
			end
			for num,Part in ipairs(Titan:GetDescendants()) do
				if Part.Name == 'Nape' or Part.Name == 'Eyes' or string.find(Part.Name, 'WeakKnee') or Part.Name == 'Handle' or Part.Name == 'Hitbox' then
					table.insert(ignoreList, Part)
				end
			end
			for num,Part in ipairs(game.Workspace:FindFirstChild('EffectsFolder'):GetChildren()) do
				table.insert(ignoreList, Part)
			end
		end
		table.insert(ignoreList, Player.Character)
		local Part,Position = game.Workspace:FindPartOnRayWithIgnoreList(Ray.new(Player.Character.PrimaryPart.Position, (PMouse.Hit.p - Player.Character.PrimaryPart.Position)*100), ignoreList)
	
		
		MouseHit = CFrame.new(Position.X, Position.Y, Position.Z)
		local MouseTarg = Part
		if Button == Enum.KeyCode.Q and HookQ == nil then
			
			MousePartQ = PMouse.Target 
			if MousePartQChange == nil then
				MousePartQChange = MousePartQ.AncestryChanged:connect(function(parent, parento)
					if not parento then
						leftHookStop()
						MousePartQ = nil
					end
				end)
			end
			HookQ = Instance.new("Part", workspace)
			HookQ.Shape = "Cylinder"
			local Distance = (Player.Character.TorsoSec.LeftHook.PrimaryPart.Position - PMouse.Hit.p).magnitude
			-- HOOK CLONE Q
			HookCloneQ = HookMesh:Clone()
			HookCloneQ.Parent = game.Workspace
			HookCloneQ:SetPrimaryPartCFrame(PMouse.Hit * CFrame.new(0,0,-0.1) * CFrame.Angles(0,math.rad(180),0))
			HookCloneQ.Name = "HookCloneQ"
			-- HOOK CLONE Q
			HookQ.BrickColor = BrickColor.Black()
			HookQ.CFrame = CFrame.new(Player.Character.TorsoSec.LeftHook.PrimaryPart.Position, MouseHit.p) * CFrame.Angles(0, -math.rad(90), 0) * CFrame.new(-Distance / 2, 0, 0)
			HookQ.Size = Vector3.new(Distance, 0.05, 0.05)
			HookQ.Parent = game.Workspace
			HookQ.Name = "Hook"
			HookQ.Anchored = true
			HookQ.CanCollide = false
			chunks(MouseTarg, MouseHit.p)
		elseif Button == Enum.KeyCode.E and HookE == nil then
			MousePartE = PMouse.Target
			if MousePartEChange == nil then
				MousePartEChange = MousePartE.AncestryChanged:connect(function(parent, parento)
					if not parento then
						rightHookStop()
						MousePartE = nil
					end
				end)
			end
			HookE = Instance.new("Part", workspace)
			HookE.Shape = "Cylinder"
			local Distance = (Player.Character.HumanoidRootPart.Position - PMouse.Hit.p).magnitude
			-- HOOK CLONE E
			HookCloneE = HookMesh:Clone()
			HookCloneE.Parent = game.Workspace
			HookCloneE:SetPrimaryPartCFrame(PMouse.Hit * CFrame.new(0,0,-0.1) * CFrame.Angles(0,math.rad(180),0))
			HookCloneE.Name = "HookCloneE"
			-- HOOK CLONE E
			HookE.BrickColor = BrickColor.Black()
			HookE.CFrame = CFrame.new(Player.Character.TorsoSec.RightHook.PrimaryPart.Position, MouseHit.p) * CFrame.Angles(0, -math.rad(90), 0) * CFrame.new(-Distance / 2, 0, 0)
			HookE.Size = Vector3.new(Distance, 0.05, 0.05)
			HookE.Parent = game.Workspace
			HookE.Name = "Hook"
			HookE.Anchored = true
			HookE.CanCollide = false
			chunks(MouseTarg, MouseHit.p)
		elseif Button == Enum.KeyCode.E and HookE ~= nil then
			MousePartE = PMouse.Target
			if MousePartEChange == nil then
				MousePartEChange = MousePartE.AncestryChanged:connect(function(parent, parento)
					if not parento then
						rightHookStop()
						MousePartE = nil
					end
				end)
			end
			HookE.Transparency = 1
			--HookE:Destroy()
			HookE = Instance.new("Part", workspace)
			HookE.Shape = "Cylinder"
			local Distance = (Player.Character.TorsoSec.RightHook.PrimaryPart.Position - PMouse.Hit.p).magnitude
			HookE.BrickColor = BrickColor.Black()
			HookE.CFrame = CFrame.new(Player.Character.TorsoSec.RightHook.PrimaryPart.Position, MouseHit.p) * CFrame.Angles(0, -math.rad(90), 0) * CFrame.new(-Distance / 2, 0, 0)
			HookE.Size = Vector3.new(Distance, 0.05, 0.05)
			HookE.Parent = game.Workspace
			HookE.Name = "Hook"
			HookE.Anchored = true
			HookE.CanCollide = false
			chunks(MouseTarg, MouseHit.p)
		elseif Button == Enum.KeyCode.Q and HookQ ~= nil then
			MousePartQ = PMouse.Target
			if MousePartQChange == nil then
				MousePartQChange = MousePartQ.AncestryChanged:connect(function(parent, parento)
					if not parento then
						leftHookStop()
						MousePartQ = nil
					end
				end)
			end
			HookQ.Transparency = 1
			--HookQ:Destroy()
			HookQ = Instance.new("Part", workspace)
			HookQ.Shape = "Cylinder"
			local Distance = (Player.Character.TorsoSec.LeftHook.PrimaryPart.Position - PMouse.Hit.p).magnitude
			HookQ.BrickColor = BrickColor.Black()
			HookQ.CFrame = CFrame.new(Player.Character.TorsoSec.LeftHook.PrimaryPart.Position, MouseHit.p) * CFrame.Angles(0, -math.rad(90), 0) * CFrame.new(-Distance / 2, 0, 0)
			HookQ.Size = Vector3.new(Distance, 0.05, 0.05)
			HookQ.Parent = game.Workspace
			HookQ.Name = "Hook"
			HookQ.Anchored = true
			HookQ.CanCollide = false
			chunks(MouseTarg, MouseHit.p)
		end
		spawn(function()
			local S = Instance.new("Sound", Player.Character.UpperTorso)
			S.SoundId = "rbxassetid://" .. 1078163908
			S.TimePosition = 0.15
			S:Play()
			wait(0.8)
			S:Stop()
			S:Destroy()
		end)
		Player.Character.GasPiece.GasPart.GasSound:Play()
		if Player.Character.Humanoid.SeatPart ~= nil then
			Player.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
		end
		Player.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Freefall)
		Player.Character.Humanoid.PlatformStand = true
		Player.Character:SetPrimaryPartCFrame(CFrame.new(Player.Character.PrimaryPart.Position, MouseHit.p))
		FlyForward:Play()
		Gyro.D = 500
		Gyro.P = 90000
		Gyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
		if Player.Character.HumanoidRootPart.CFrame.LookVector.Y < 0 then
			AForce.Force = Vector3.new(0, YForce, -YForce * 5.5)
		else
			AForce.Force = Vector3.new(0, 0, -YForce * 5.5)
		end
		BForce.MaxForce = Vector3.new(0, YForce * 5.5, 0)
		BForce.Position = MouseHit.p
		BForce.D = 1050
	end
	
	
	
	UIS.InputBegan:connect(function(Key, Chatting)
		Distance = (PMouse.Hit.p - Player.Character.HumanoidRootPart.Position).magnitude
		if Key.UserInputType == Enum.UserInputType.MouseButton1 and Chatting == false and SlashDB == true then
			SlashDB = false
			if Player.Character:FindFirstChild("Blade") then
				local SingleSlash = true
				if math.random(1,2) == 1 then
					SpinSlash:Play()	
				else
					ForwardSlash:Play()
				end
				for num, Blade in ipairs(Player.Character:GetChildren()) do
					if Blade.Name == "Blade" then
						Blade.Trail.Enabled = true
						Blade.Material = Enum.Material.Neon
						Blade.Color = Color3.fromRGB(149, 177, 223)
					end
				end
				local BladeTouch = Player.Character:FindFirstChild("Blade").Touched:connect(function(Part)
					if (Part.Name == "Nape" or Part.Name == 'RightWeakKnee' or Part.Name == 'LeftWeakKnee' or Part.Name == 'Eyes') and SingleSlash == true then
						SingleSlash = false
						KillTitan:FireServer(Part)
					end
					for num,Player in ipairs(game.Players:GetPlayers()) do
						if Part:FindFirstAncestor(Player.Name) and SingleSlash == true then
							SingleSlash = false
							SlashEnemy:FireServer(Part:FindFirstAncestor(Player.Name))
						end
					end
				end)
				wait(0.7)
				BladeTouch:Disconnect()
				for num, Blade in ipairs(Player.Character:GetChildren()) do
					if Blade.Name == "Blade" then
						Blade.Trail.Enabled = false
						Blade.Material = Enum.Material.Metal
						Blade.Color = Color3.fromRGB(223, 223, 222)
					end
				end
				wait(0.5)
			end
			SlashDB = true
		end
		if Key.KeyCode == Enum.KeyCode.R and FlareDB == true and Chatting == false then
			ReloadBlades:FireServer(script.BladeReload)
		end
		if Key.KeyCode == Enum.KeyCode.S and (QHold == true or EHold == true) and Chatting == false then
			SHold = true
			spawn(function()
				while SHold == true and Boost == false do
					wait()
					if (Vector3.new(0,0,0) - SHoldPos).magnitude > 75 then
						SHoldPos = Vector3.new(0,75,0)
					else
						SHoldPos = SHoldPos + Vector3.new(0,2,0)
					end
				end
			end)
		end
		if Key.KeyCode == Enum.KeyCode.C and FlareDB == true and Chatting == false and Player.Character:FindFirstChild('ThunderSpear') ~= nil then
			if PMouse.Hit ~= nil and Player.Character:FindFirstChild('ThunderSpear'):FindFirstChild('RightThunderSpear') ~= nil and ThunderDB == true then
				ThunderDB = false
				ThunderShot:FireServer(Player.Character:FindFirstChild('ThunderSpear'):FindFirstChild('RightThunderSpear'), PMouse.Hit)	
				wait(3)
				ThunderDB = true
			elseif PMouse.Hit ~= nil and Player.Character:FindFirstChild('ThunderSpear'):FindFirstChild('LeftThunderSpear') ~= nil and ThunderDB == true then
				ThunderDB = false
				ThunderShot:FireServer(Player.Character:FindFirstChild('ThunderSpear'):FindFirstChild('LeftThunderSpear'), PMouse.Hit)	
				wait(3)
				ThunderDB = true
			end
		end
		if Key.KeyCode == Enum.KeyCode.G and FlareDB == true and Chatting == false and Player.Character:FindFirstChild('Blade') == nil then
			FlareDB = false
			cease()
			if Player:FindFirstChild('FlareColor') then
				print('Flareshot')
				local Msg = FlareShot:InvokeServer(Player.FlareColor.Value)
			else
				local Msg = FlareShot:InvokeServer()
			end
			FlareDB = true
		end
		
		local ignoreList = {}
		game.Workspace:WaitForChild('TitanFolder')
		for num,Titan in ipairs(game.Workspace.TitanFolder:GetChildren()) do
			if Titan:FindFirstChild('HumanoidRootPart') then
				table.insert(ignoreList, Titan.HumanoidRootPart)
			end
			for num,Part in ipairs(Titan:GetDescendants()) do
				if Part.Name == 'Nape' or Part.Name == 'Eyes' or string.find(Part.Name, 'WeakKnee') or Part.Name == 'Handle' or Part.Name == 'Hitbox' then
					table.insert(ignoreList, Part)
				end
			end
			for num,Part in ipairs(game.Workspace:FindFirstChild('EffectsFolder'):GetChildren()) do
				table.insert(ignoreList, Part)
			end
		end
		table.insert(ignoreList, Player.Character)
		if PMouse.Target ~= nil then
			if PMouse.Target:FindFirstAncestor('EffectsFolder') then
				PMouse.TargetFilter = PMouse.Target:FindFirstAncestor('EffectsFolder')
			end
			if PMouse.Target.Name == 'HumanoidRootPart' or PMouse.Target.Name == 'Nape' or PMouse.Target.Name == 'Eyes' or string.find(PMouse.Target.Name, 'WeakKnee') or PMouse.Target.Name == 'Handle' or PMouse.Target.Name == 'Hitbox' then
				PMouse.TargetFilter = PMouse.Target
			end
		end
		local Part,Position = game.Workspace:FindPartOnRayWithIgnoreList(Ray.new(Player.Character.PrimaryPart.Position, (PMouse.Hit.p - Player.Character.PrimaryPart.Position)*100), ignoreList)
		if Key.KeyCode == Enum.KeyCode.Q and Chatting == false and Distance <= Range then
			if QDebounce == true and Grabbed.Value == false and GasDisable == false and FlareDB == true and Part ~= nil and (Part.Name ~= 'Hook' and Part.Name ~= 'Chunk' --[[and PMouse.Target.Transparency ~= 1]]) and string.match(Part.Parent.Name, "Horse") == nil then
				QDebounce = false
				QHold = true
				fireHook(Key.KeyCode)
				QHit = MouseHit
				MousePosQ = MousePartQ.CFrame:ToObjectSpace(QHit)
				MouseHit = MousePartQ.CFrame * MousePosQ
				oldCharPos = Player.Character.HumanoidRootPart.Position
				-- {Hook, Position, Wire, Part}
				-- SERVER
				ServerGrapple:FireServer(Player.Character:FindFirstChild("TorsoSec").LeftHook, MousePartQ.CFrame:ToObjectSpace(QHit), MousePartQ)
				-- SERVER
				wait(0.4)
				QDebounce = true
			end
		end
		if Key.KeyCode == Enum.KeyCode.E and Chatting == false and Distance <= Range then
			if EDebounce == true and Grabbed.Value == false and GasDisable == false and FlareDB == true and Part ~= nil and (Part.Name ~= 'Hook' and Part.Name ~= 'Chunk' --[[and PMouse.Target.Transparency ~= 1]]) and string.match(Part.Parent.Name, "Horse") == nil then
				EDebounce = false
				EHold = true
				fireHook(Key.KeyCode)
				EHit = MouseHit
				MousePosE = MousePartE.CFrame:ToObjectSpace(EHit)
				MouseHit = MousePartE.CFrame * MousePosE
				oldCharPos = Player.Character.HumanoidRootPart.Position
				ServerGrapple:FireServer(Player.Character:FindFirstChild("TorsoSec").RightHook, MousePartE.CFrame:ToObjectSpace(EHit), MousePartE)
				wait(0.4)
				EDebounce = true
			end
		end
		if Key.KeyCode == Enum.KeyCode.Space and Chatting == false and (QHold == true or EHold == true) and BoostDB == true then
			Boost = true
			SHoldPos = Vector3.new(0,0,0)
			FlyForward:Stop()
			BoostAnim:Play()
			game.Workspace.Camera.FieldOfView = 70
			Player.Character.GasPiece.GasPart.Gas.Enabled = true
			Player.Character.GasPiece.GasPart.ParticleEmitter.Size = NumberSequence.new(1)
			Player.Character.GasPiece.GasPart.ParticleEmitter.LockedToPart = false
			BoostEffect:FireServer()
			Speed = Speed * 1.6
			AForce.Force = Vector3.new(0, YForce * 4.5, -YForce * 8.5)
			FOVTween:Play()
			spawn(function()
				while Boost == true do
					wait(0.5)
					siphonGas(30)
				end
			end)
			wait(0.3)
			FOVTween:Cancel()
			game.Workspace.Camera.FieldOfView = 90
		end
		if Key.KeyCode == Enum.KeyCode.W and Chatting == false and (QHold == true or EHold == true) and ReelDB == true then
			ReelDB = false
			FlyForward:Stop()
			BoostAnim:Play()
			siphonGas(20)
			Player.Character.GasPiece.GasPart.Burst:Play()
			local LB = script.LeanBurst:Clone()
			LB.Parent = Player.Character:FindFirstChild('GasPiece').GasPart
			LB.Effects.Disabled = false
			for num = 1,25 do
				Player.Character.HumanoidRootPart.Velocity = Player.Character.HumanoidRootPart.Velocity + (((Player.Character.HumanoidRootPart.CFrame.LookVector * Speed / 2.5) / 25) * num)
			end
			wait(0.3)
			FlyForward:Play()
			BoostAnim:Stop()
			wait(2.2)
			ReelDB = true
		end
		if Key.KeyCode == Enum.KeyCode.A and Chatting == false and (QHold == true or EHold == true) then
			AHold = true
			FlyForward:Stop()
			RightTilt:Stop()
			LeftTilt:Play()
			LeftTiltHold:Play()
			siphonGas(20)
			Player.Character.GasPiece.GasPart.Burst:Play()
			for num = 1,25 do
				if AHold == true and DHold == true and (QHold == true or EHold == true) then
					if num == 1 then
						LeftTilt:Stop()
						if Boost == true and (QHold == true or EHold == true) then
							FlyForward:Stop()
							BoostAnim:Play()
						elseif Boost == false and (QHold == true or EHold == true) then
							BoostAnim:Stop()
							FlyForward:Play()
						end
					end
				elseif AHold == true and (QHold == true or EHold == true) then
					if num == 1 then
						local LB = script.LeanBurst:Clone()
						LB.Parent = Player.Character:FindFirstChild('GasPiece').GasPart
						LB.Effects.Disabled = false
					end
					wait()
					Player.Character.HumanoidRootPart.Velocity = Player.Character.HumanoidRootPart.Velocity + (((Player.Character.HumanoidRootPart.CFrame.RightVector * -Speed / 2.5) / 25) * num)
				else
					break
				end
			end
			if Boost == true and (QHold == true or EHold == true) then
				FlyForward:Stop()
				BoostAnim:Play()
			elseif Boost == false and (QHold == true or EHold == true) then
				BoostAnim:Stop()
				FlyForward:Play()
			end
		end
		if Key.KeyCode == Enum.KeyCode.D and Chatting == false and (QHold == true or EHold == true) then
			DHold = true
			FlyForward:Stop()
			LeftTilt:Stop()
			RightTilt:Play()
			RightTiltHold:Play()
			siphonGas(20)
			Player.Character.GasPiece.GasPart.Burst:Play()
			for num = 1,25 do
				if DHold == true and AHold == true and (QHold == true or EHold == true) then
					if num == 1 then
						RightTilt:Stop()
						if Boost == true and (QHold == true or EHold == true) then
							FlyForward:Stop()
							BoostAnim:Play()
						elseif Boost == false and (QHold == true or EHold == true) then
							BoostAnim:Stop()
							FlyForward:Play()
						end
					end
				elseif DHold == true and (QHold == true or EHold == true) then
					if num ==1 then
						local LB = script.LeanBurst:Clone()
						LB.Parent = Player.Character:FindFirstChild('GasPiece').GasPart
						LB.Effects.Disabled = false
						Player.Character.GasPiece.GasPart.Burst:Play()
					end
					wait()
					Player.Character.HumanoidRootPart.Velocity = Player.Character.HumanoidRootPart.Velocity + (((Player.Character.HumanoidRootPart.CFrame.RightVector * Speed / 2.5) / 25) * num)
				else
					break
				end
			end
			if Boost == true and (QHold == true or EHold == true) then
				FlyForward:Stop()
				BoostAnim:Play()
			elseif Boost == false and (QHold == true or EHold == true) then
				BoostAnim:Stop()
				FlyForward:Play()
			end
		end
		if QHold and EHold == true then
			MouseHit = QHit:Lerp(EHit, 0.5)
		end
	end)
	
	UIS.InputEnded:connect(function(Key, Chatting)
		-- SLASH HOLD FUNCTION, WILL POSSIBLY USE IN FUTURE --
		--[[if Key.UserInputType == Enum.UserInputType.MouseButton1 and Chatting == false then
			if Player.Character:FindFirstChild("Blade") then
				SlashHold1:Stop()
				SpinSlash:Play()
				local BladeTouch = Player.Character:FindFirstChild("Blade").Touched:connect(function(Part)
					if Part.Name == "Nape" then
						KillTitan:FireServer(Part)
					end
				end)
				wait(0.3)
				BladeTouch:Disconnect()
				for num, Blade in ipairs(Player.Character:GetChildren()) do
					if Blade.Name == "Blade" then
						Blade.Trail.Enabled = false
					end
				end
			end
		end]]
		-- SLASH HOLD FUNCTION, WILL POSSIBLY USE IN FUTURE --
		if Key.KeyCode == Enum.KeyCode.S then
			SHold = false
		end
		if Key.KeyCode == Enum.KeyCode.Space and BoostDB == true then
			--BoostDB = false
			Speed = OriginalSpeed
			Boost = false
			game.Workspace.Camera.FieldOfView = 70
			BoostAnim:Stop()
			if (QHold == true or EHold == true) then
				FlyForward:Play()
			end
			BoostEffectStop:FireServer()
			Player.Character.GasPiece.GasPart.Gas.Enabled = false
			Player.Character.GasPiece.GasPart.ParticleEmitter:Clear()
			Player.Character.GasPiece.GasPart.ParticleEmitter.Size = NumberSequence.new(0.4)
			Player.Character.GasPiece.GasPart.ParticleEmitter.LockedToPart = true
			--wait(0.3)
			--BoostDB = true
		end
		if Key.KeyCode == Enum.KeyCode.Q then
			leftHookStop()
		end
		if Key.KeyCode == Enum.KeyCode.E then
			rightHookStop()
		end
		if Key.KeyCode == Enum.KeyCode.A and (QHold == true or EHold == true) then
			AHold = false
			if Boost == true and (QHold == true or EHold == true) then
				FlyForward:Stop()
				BoostAnim:Play()
			elseif Boost == false and (QHold == true or EHold == true) then
				BoostAnim:Stop()
				FlyForward:Play()
			end
			LeftTilt:Stop()
			LeftTiltHold:Stop()
			for num = 1,25 do
				if DHold == true and AHold == true and (QHold == true or EHold == true) then
					--Player.Character.HumanoidRootPart.Velocity = Player.Character.HumanoidRootPart.Velocity - Player.Character.HumanoidRootPart.Velocity * 25 / num
					--wait()
				elseif DHold == true and (QHold == true or EHold == true) then
					if num == 1 then
						local LB = script.LeanBurst:Clone()
						LB.Parent = Player.Character:FindFirstChild('GasPiece').GasPart
						LB.Effects.Disabled = false
						Player.Character.GasPiece.GasPart.Burst:Play()
					end
					wait()
					if num == 1 then
						RightTilt:Play()
						FlyForward:Stop()
					end
					Player.Character.HumanoidRootPart.Velocity = Player.Character.HumanoidRootPart.Velocity + ((Player.Character.HumanoidRootPart.CFrame.RightVector * Speed / 2.5) / 25) * num
				else
					break
				end
			end
			if Boost == true and (QHold == true or EHold == true) then
				FlyForward:Stop()
				BoostAnim:Play()
			elseif Boost == false and (QHold == true or EHold == true) then
				BoostAnim:Stop()
				FlyForward:Play()
			end
		elseif Key.KeyCode == Enum.KeyCode.A then
			AHold = false
			AForce.Force = Vector3.new()
		end
		
		if Key.KeyCode == Enum.KeyCode.D and (QHold == true or EHold == true) then
			DHold = false
			if Boost == true and (QHold == true or EHold == true) then
				FlyForward:Stop()
				BoostAnim:Play()
			elseif Boost == false and (QHold == true or EHold == true) then
				BoostAnim:Stop()
				FlyForward:Play()
			end
			RightTilt:Stop()
			RightTiltHold:Stop()
			for num = 1,25 do
				if AHold == true and DHold == true and (QHold == true or EHold == true) then
					--Player.Character.HumanoidRootPart.Velocity = Player.Character.HumanoidRootPart.Velocity - Player.Character.HumanoidRootPart.Velocity * 25 / num
					--wait()
				elseif AHold == true and (QHold == true or EHold == true) then
					if num == 1 then
						local LB = script.LeanBurst:Clone()
						LB.Parent = Player.Character:FindFirstChild('GasPiece').GasPart
						LB.Effects.Disabled = false
					end
					wait()
					if num == 1 then
						LeftTilt:Play()
						FlyForward:Stop()
						Player.Character.GasPiece.GasPart.Burst:Play()
					end
					Player.Character.HumanoidRootPart.Velocity = Player.Character.HumanoidRootPart.Velocity + ((Player.Character.HumanoidRootPart.CFrame.RightVector * -Speed / 2.5) / 25) * num
				else
					break
				end
			end
			if Boost == true and (QHold == true or EHold == true) then
				FlyForward:Stop()
				BoostAnim:Play()
			elseif Boost == false and (QHold == true or EHold == true) then
				BoostAnim:Stop()
				FlyForward:Play()
			end
		elseif Key.KeyCode == Enum.KeyCode.D then
			DHold = false
			AForce.Force = Vector3.new()
		end
	end)
	
	--DownPos = nil
	
	local function wallHolding(MousePart, MousePos, QE)
		local Distance = (Player.Character.HumanoidRootPart.Position - (MousePart.CFrame * MousePos.p)).magnitude
		if Distance < 2 and WallHoldDB == true and Player.Character.HumanoidRootPart.Velocity.magnitude < 5 then
			WallHoldDB = false
			wait(0.5)
			if Distance < 2 then
				WallHold:Play()
				Player.Character.GasPiece.GasPart.Gas.Enabled = false	
				Player.Character.GasPiece.GasPart.ParticleEmitter.Enabled = false
				Player.Character.GasPiece.GasPart.GasSound:Stop()
			end
		elseif Distance > 2 and WallHoldDB == false and Player.Character.HumanoidRootPart.Velocity.magnitude > 5 then
			WallHoldDB = true
			WallHold:Stop()
			if (QHold or EHold) then
				Player.Character.GasPiece.GasPart.GasSound:Play()
				Player.Character.GasPiece.GasPart.ParticleEmitter.Enabled = true
			end
		end
	end
	
	local CurrentSpeed = 0
	
	RunService.Heartbeat:connect(function()
		Distance = 0
		if Player.Character:FindFirstChild('HumanoidRootPart') ~= nil then
			Distance = (MouseHit.p - Player.Character.HumanoidRootPart.Position).magnitude
			if (Player.Character.HumanoidRootPart.Velocity).magnitude > Speed and (QHold == true or EHold == true) then
				Player.Character.HumanoidRootPart.Velocity = Player.Character.HumanoidRootPart.Velocity.Unit * Speed
			end
			if (Player.Character.HumanoidRootPart.Velocity).magnitude > Speed * 0.5 and WindSound.IsPlaying == false then
				WindSound:Play()
			elseif WindSound.IsPlaying == true and (Player.Character.HumanoidRootPart.Velocity).magnitude < Speed * 0.5 then
				WindSound:Stop()
			end
		end
		if PMouse.Target ~= nil then
			if PMouse.Target:FindFirstAncestor('EffectsFolder') then
				PMouse.TargetFilter = PMouse.Target:FindFirstAncestor('EffectsFolder')
			end
			if PMouse.Target.Name == 'HumanoidRootPart' or PMouse.Target.Name == 'Nape' or PMouse.Target.Name == 'Eyes' or string.find(PMouse.Target.Name, 'WeakKnee') or PMouse.Target.Name == 'Handle' or PMouse.Target.Name == 'Hitbox' then
				PMouse.TargetFilter = PMouse.Target
			end
		end
		for num,Forces in ipairs(Player.Character:GetChildren()) do
			if Forces.Name == 'BodyPosition' or Forces.Name == 'BodyThrust' or Forces.Name == 'BodyGyro' then
				Forces:Destroy()
			end
		end
		--[[print((Player.Character.PrimaryPart.Velocity.magnitude / Speed))
		if CurrentSpeed > math.floor((30 * (Player.Character.PrimaryPart.Velocity.magnitude / Speed * 1.6))) then
			CurrentSpeed = CurrentSpeed - 1
		elseif CurrentSpeed < math.floor((30 * (Player.Character.PrimaryPart.Velocity.magnitude / Speed * 1.6))) then
			CurrentSpeed = CurrentSpeed + 1
		end
		game.Workspace.CurrentCamera.FieldOfView = 70 + CurrentSpeed]]
		--[[for num,ServerWire in ipairs(ServerWires) do
			if ServerWire[1].Parent == nil or ServerWire[2] == nil or ServerWire[3].Parent == nil or ServerWire[4] == nil then
				table.remove(ServerWires, num)
			else
				local Dist = (ServerWire[1].PrimaryPart.Position - ServerWire[4].CFrame * ServerWire[2].p).magnitude
				ServerWire[3].CFrame = CFrame.new(ServerWire[1].PrimaryPart.Position, ServerWire[4].CFrame * ServerWire[2].p) * CFrame.Angles(0, -math.rad(90), 0) * CFrame.new(-Dist / 2, 0, 0)
				ServerWire[3].Size = Vector3.new(Dist, ServerWire[3].Size.Y, ServerWire[3].Size.Z)
			end
		end]]
		if QHold == false and EHold == false then
			if FlyForward.IsPlaying == true then
				FlyForward:Stop()
			end
			if WallHold.IsPlaying == true then
				WallHold:Stop()
			end
		end
		if WallHold.IsPlaying and WallHoldDB == true then
			WallHold:Stop()
		end
		-- REMOVE ABOVE LATER -- 
		if (QHold == true or EHold == true) and Player.Character.Humanoid.PlatformStand == false then
			Player.Character.Humanoid.PlatformStand = true
		end
		if Grabbed.Value == true then
			cease()
		end
		if Distance < 15 and Boost == false and (QHold == true or EHold == true) then
			BForce.MaxForce = Vector3.new(YForce * 5.5, YForce * 5.5, YForce * 5.5)
			AForce.Force = Vector3.new(0, 0, -YForce * 5.5)
			if AHold == false and DHold == false then
				Player.Character.HumanoidRootPart.Velocity = Player.Character.HumanoidRootPart.Velocity * 0.8
			end
			BForce.D = 550
			Gyro.D = 3000
		elseif Boost == false and (QHold == true or EHold == true) then
			if Player.Character.HumanoidRootPart.CFrame.LookVector.Y < 0 then
				AForce.Force = Vector3.new(0, YForce * 5.5, -YForce * 5.5)
			else
				AForce.Force = Vector3.new(0, YForce * 0.8, -YForce * 5.5)
			end
			BForce.MaxForce = Vector3.new(0, YForce * 5.5, 0)
			BForce.D = 1050
			BForce.P = 20000
			Gyro.D = 500
		end
		if GasAmount <= 0 and GasDisable == false then
			GasDisable = true
			cease()
			spawn(function()
				if Player.PlayerGui:FindFirstChild('CharInfo') then
					local CharInfo = Player.PlayerGui:FindFirstChild('CharInfo')
					--CharInfo.CharMainFrame.GasLeft.Size = UDim2.new(0.975 * (GasAmount / MaxGas), 0, 0.6, 0)
					--CharInfo.CharMainFrame.GasLeft.Position = UDim2.new(0.01 * (GasAmount / MaxGas) + ((CharInfo.CharMainFrame.GasLeft.Size.X.Scale * 0.01) * ((MaxGas - GasAmount)/MaxGas)), 0, 0.2, 0) --0.035
					CharInfo.CharMainFrame.GasLeft.Size = UDim2.new(0, math.ceil(244 * (GasAmount / MaxGas)), 0, 16)
					--CharInfo.CharMainFrame.GasLeft.Position = UDim2.new(0.843 * (GasAmount / MaxGas) + ((CharInfo.CharMainFrame.GasLeft.Size.X.Scale * 0.843) * ((MaxGas - GasAmount)/MaxGas)), 0, 1.19, 0) --0.035
				end
			end)
		elseif GasAmount > 0 and GasDisable == true then
			GasDisable = false
		end
		if (QHold == true or EHold == true) and Distance > Range then
			cease()
		end
		if QHold == true or EHold == true then
			if QHold == true and EHold == false then
				Gyro.CFrame = CFrame.new(Player.Character.PrimaryPart.Position, MousePartQ.CFrame * MousePosQ.p)
				BForce.Position = MousePartQ.CFrame * MousePosQ.p - SHoldPos
			elseif QHold == false and EHold == true then
				Gyro.CFrame = CFrame.new(Player.Character.PrimaryPart.Position, MousePartE.CFrame * MousePosE.p)
				BForce.Position = MousePartE.CFrame * MousePosE.p - SHoldPos
			elseif QHold == true and EHold == true then
				local QP = MousePartQ.CFrame * MousePosQ
				local EP = MousePartE.CFrame * MousePosE
				local QEP = QP:Lerp(EP, 0.5)
				Gyro.CFrame = CFrame.new(Player.Character.PrimaryPart.Position, QEP.p)
				BForce.Position = QEP.p - SHoldPos
			end
			if HookQ ~= nil and QHit ~= nil then
				local Distance = (Player.Character.TorsoSec.LeftHook.PrimaryPart.Position - MousePartQ.CFrame * MousePosQ.p).magnitude
				HookQ.CFrame = CFrame.new(Player.Character.TorsoSec.LeftHook.PrimaryPart.Position, MousePartQ.CFrame * MousePosQ.p) * CFrame.Angles(0, -math.rad(90), 0) * CFrame.new(-Distance / 2, 0, 0)
				HookQ.Size = Vector3.new(Distance, HookQ.Size.Y, HookQ.Size.Z)
			end
			if HookE ~= nil and EHit ~= nil then
				local Distance = (Player.Character.TorsoSec.RightHook.PrimaryPart.Position - MousePartE.CFrame * MousePosE.p).magnitude
				HookE.CFrame = CFrame.new(Player.Character.TorsoSec.RightHook.PrimaryPart.Position, MousePartE.CFrame * MousePosE.p) * CFrame.Angles(0, -math.rad(90), 0) * CFrame.new(-Distance / 2, 0, 0)
				HookE.Size = Vector3.new(Distance, HookE.Size.Y, HookE.Size.Z)
			end
			local Normal = nil
			if HookCloneQ ~= nil and QHit ~= nil and oldCharPos ~= nil then
				HookCloneQ:SetPrimaryPartCFrame(CFrame.new(MousePartQ.CFrame * MousePosQ.p))
				local Raycast = Ray.new(oldCharPos - (oldCharPos.unit * 3), ((MousePartQ.CFrame * MousePosQ.p) - oldCharPos).unit * 999)
				_,HookPosQ,Normal = workspace:FindPartOnRayWithIgnoreList(Raycast, {game.Players.LocalPlayer.Character, HookQ, HookCloneQ})
				HookCloneQ:SetPrimaryPartCFrame(CFrame.new(HookCloneQ.PrimaryPart.CFrame.p, (HookCloneQ.PrimaryPart.CFrame.p) + Normal))
				
				
				--local Distance = (Player.Character.TorsoSec.LeftHook.PrimaryPart.Position - MousePartQ.CFrame * MousePosQ.p).magnitude
				--HookCloneQ:SetPrimaryPartCFrame(CFrame.new(Player.Character.TorsoSec.LeftHook.PrimaryPart.Position, MousePartQ.CFrame * MousePosQ.p) * CFrame.new(0, 0, -Distance + 0.05) * CFrame.Angles(0,math.rad(180),0))
			end
			if HookCloneE ~= nil and EHit ~= nil and oldCharPos ~= nil then
				HookCloneE:SetPrimaryPartCFrame(CFrame.new(MousePartE.CFrame * MousePosE.p))
				local Raycast = Ray.new(oldCharPos - (oldCharPos.unit * 3), ((MousePartE.CFrame * MousePosE.p) - oldCharPos).unit * 999)
				_,HookPosE,Normal = workspace:FindPartOnRayWithIgnoreList(Raycast, {game.Players.LocalPlayer.Character, HookE, HookCloneE})
				HookCloneE:SetPrimaryPartCFrame(CFrame.new(HookCloneE.PrimaryPart.CFrame.p, (HookCloneE.PrimaryPart.CFrame.p) + Normal))
				
				
				
				--local Distance = (Player.Character.TorsoSec.RightHook.PrimaryPart.Position - MousePartE.CFrame * MousePosE.p).magnitude
				--HookCloneE:SetPrimaryPartCFrame(CFrame.new(Player.Character.TorsoSec.RightHook.PrimaryPart.Position, MousePartE.CFrame * MousePosE.p) * CFrame.new(0, 0, -Distance + 0.05) * CFrame.Angles(0,math.rad(180),0))
			end
		end
		if (QHold == true or EHold == true) --[[and (QHold == true and EHold == true) == false]] then
			if QHold == true then
				wallHolding(MousePartQ, MousePosQ, 'Q')
			elseif EHold == true then
				wallHolding(MousePartE, MousePosE, 'E')
			end
		elseif WallHold.IsPlaying == true then
			WallHold:Stop()
		end
		if HookQ ~= nil and QHold == false then
			--HookQ:Destroy()
			HookQ.Transparency = 1
			if HookCloneQ ~= nil then
				HookCloneQ:Destroy()
			end
			HookQ = nil
		end
		if HookE ~= nil and EHold == false then
			HookE.Transparency = 1
			--HookE:Destroy()
			if HookCloneE ~= nil then
				HookCloneE:Destroy()
			end
			HookE = nil
		end
		if FOVTween.PlaybackState == Enum.PlaybackState.Playing and Boost == false then
			FOVTween:Cancel()
		end
	end)
	
	spawn(function()
		while true do
			wait(1)
			if (QHold == true or EHold == true) and WallHoldDB == false then
				siphonGas(5)
			end
		end
	end)
end
