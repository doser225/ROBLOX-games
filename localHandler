--!! enable/disable each arms grab detection based on what anim is playing

function horseProcess(Player)
	print('Horse processing ', Player)
	repeat
		wait()
	until Player.Character
	Player.Character:WaitForChild('Humanoid')
	script:WaitForChild('HorseIdle1')
	local Single = true
	local SingleLoad = true
	local Seated = false
	local PlayerHorse = nil
	
	if Player.Character.Humanoid.SeatPart ~= nil then
			if Player.Character.Humanoid.SeatPart.Parent.Name == "Horse" or Player.Character.Humanoid.SeatPart.Parent.Name == Player.Name..'MASTER_HORSE' then
				Seated = true
				--Player.Character.Humanoid.SeatPart.Parent.Humanoid.Jump = true
				--if SingleLoad == true then
					Single = true
					PlayerHorse = Player.Character.Humanoid.SeatPart.Parent
					PlayerHorse:WaitForChild('Humanoid')
					for num,Anim in ipairs(PlayerHorse.Humanoid:GetPlayingAnimationTracks()) do
						if Anim.Name == "HorseIdle1" then
							Anim:Stop()
						end
					end
					if SingleLoad == true then
						SingleLoad = false
						Player.Character.Humanoid.SeatPart.Parent.Humanoid:LoadAnimation(script.HorseIdle1):Play()
					end
				--end
			end
		elseif Player.Character.Humanoid.SeatPart == nil then
			Seated = false
			if PlayerHorse ~= nil then
				for num,Anim in ipairs(PlayerHorse.Humanoid:GetPlayingAnimationTracks()) do
					if Anim.Name ~= "HorseIdle1" then
						Anim:Stop()
					end
				end
			end
			SingleLoad = true	
		end
	HorseChange = Player.Character.Humanoid:GetPropertyChangedSignal('SeatPart'):connect(function()
		if Player.Character.Humanoid.SeatPart ~= nil then
			if Player.Character.Humanoid.SeatPart.Parent.Name == "Horse" or Player.Character.Humanoid.SeatPart.Parent.Name == Player.Name..'MASTER_HORSE' then
				Seated = true
				--Player.Character.Humanoid.SeatPart.Parent.Humanoid.Jump = true
				--if SingleLoad == true then
					Single = true
					PlayerHorse = Player.Character.Humanoid.SeatPart.Parent
					PlayerHorse:WaitForChild('Humanoid')
					for num,Anim in ipairs(PlayerHorse.Humanoid:GetPlayingAnimationTracks()) do
						if Anim.Name == "HorseIdle1" then
							Anim:Stop()
						end
					end
					if SingleLoad == true then
						SingleLoad = false
						Player.Character.Humanoid.SeatPart.Parent.Humanoid:LoadAnimation(script.HorseIdle1):Play()
					end
				--end
			end
		elseif Player.Character.Humanoid.SeatPart == nil then
			Seated = false
			if PlayerHorse ~= nil then
				for num,Anim in ipairs(PlayerHorse.Humanoid:GetPlayingAnimationTracks()) do
					if Anim.Name ~= "HorseIdle1" then
						Anim:Stop()
					end
				end
			end
			SingleLoad = true	
		end
	end)
	HorseMove = Player.Character.Humanoid:GetPropertyChangedSignal('MoveDirection'):connect(function()
			if Player.Character.Humanoid.MoveDirection ~= Vector3.new(0,0,0) then
				if Player.Character.Humanoid.SeatPart ~= nil then
					if Player.Character.Humanoid.SeatPart.Parent.Name == "Horse" or Player.Character.Humanoid.SeatPart.Parent.Name == Player.Name .. "MASTER_HORSE" and Single == true and Seated == true then
						Single = false
						local Running = Player.Character.Humanoid.SeatPart.Parent.Humanoid:LoadAnimation(script.Running)
						Player.Character.Humanoid.SeatPart.Parent.HumanoidRootPart:WaitForChild('Walking'):Play()
						Running:Play()
					end
				end
			elseif Player.Character.Humanoid.MoveDirection == Vector3.new(0,0,0) and Single == false and Seated == true then
				Single = true
				if Player.Character.Humanoid.SeatPart ~= nil then
					for num,Anim in ipairs(Player.Character.Humanoid.SeatPart.Parent.Humanoid:GetPlayingAnimationTracks()) do
						if Anim.Name == "Running" or Anim.Name == 'Sprinting' or Anim.Name == 'Walking' then
							Anim:Stop()
						end
					end
					Player.Character.Humanoid.SeatPart.Parent.HumanoidRootPart:WaitForChild('Walking'):Stop()
				end
			end
	end)
	HorseSpeed = Player.Character.Humanoid:GetPropertyChangedSignal('WalkSpeed'):connect(function()
			if Player.Character.Humanoid.WalkSpeed == 40 and Seated == true then
				Player.Character.Humanoid.SeatPart.Parent.Humanoid:LoadAnimation(script.Sprinting):Play()
				Player.Character.Humanoid.SeatPart.Parent.HumanoidRootPart:WaitForChild('Walking').PlaybackSpeed = 0.8
			elseif Player.Character.Humanoid.WalkSpeed == 16 and Seated == true then
				Player.Character.Humanoid.SeatPart.Parent.HumanoidRootPart:WaitForChild('Walking').PlaybackSpeed = 1.3
				for num,Anim in ipairs(Player.Character.Humanoid.SeatPart.Parent.Humanoid:GetPlayingAnimationTracks()) do
					if Anim.Name == 'Sprinting' then
						Anim:Stop()
					end
				end
			end
	end)
	Player.Character.Humanoid:GetPropertyChangedSignal('Health'):connect(function()
		if Player.Character.Humanoid.Health <= 0 then
			HorseChange:Disconnect()
			HorseMove:Disconnect()
			HorseSpeed:Disconnect()
			if PlayerHorse then
				for num,Anim in ipairs(PlayerHorse.Humanoid:GetPlayingAnimationTracks()) do
					if Anim.Name ~= 'HorseIdle1' then
						Anim:Stop()
					end
				end
			end
		end
	end)
end

game.Players.PlayerAdded:Connect(function(Player)
	Player.CharacterAdded:connect(function()
		horseProcess(Player)
	end)
end)

for num,Player in ipairs(game.Players:GetPlayers()) do
	if Player.Name ~= game.Players.LocalPlayer.Name then
		horseProcess(Player)
	end
end



local Steal = game.ReplicatedStorage:WaitForChild('MAINFE')
Steal = Steal.StealItem
local KillPlayer = game.ReplicatedStorage.MAINFE.KillPlayer
local GPlayer = game.ReplicatedStorage.MAINFE.GrabPlayer
local RunService = game:GetService('RunService')
local TweenService = game:GetService('TweenService')
local Player = game.Players.LocalPlayer
local UIS = game:GetService('UserInputService')
local Debris = game:GetService('Debris')
local Distance = 0
local ShortestDistance = nil
local Talking = false
local FEFolder = game.ReplicatedStorage:WaitForChild('3DMGFE')
local ServerGrapple = FEFolder:WaitForChild("ServerGrapple")
local HorseMount = game.ReplicatedStorage:WaitForChild('HorseFE')
HorseMount:WaitForChild("HorseMount")
local HorseMount = game.ReplicatedStorage.HorseFE.HorseMount
local GasAmount = Player:WaitForChild('Gas')
local RefillGas = game.ReplicatedStorage.MAINFE.GasRefill
local CannonBallExplode = game.ReplicatedStorage.MAINFE.CannonBallExplode
local SpearExplode = game.ReplicatedStorage['3DMGFE']:WaitForChild('ThunderSpearDamage')
local Pickpocket = script:WaitForChild('Pickpocket')
repeat
	wait(1)
until Player.Character
Player.Character:WaitForChild('Humanoid')
local Pickpocket = Player.Character.Humanoid:LoadAnimation(Pickpocket)
--!! REFILL BLADES REMOTE EVENT MUST BE ADDED
--local RefillBlades = game.ReplicatedStorage.MAINFE.Refill
local ServerWires = {}
local HorseChange = nil
local GrabPlayer = false
local LTitans = {}
--!! FIX MEMORY LEAKS LATER ON

--local Whistle = Player.Character.Humanoid:LoadAnimation(script:WaitForChild('Whistle'))

local Shifted = false

--[[Player.Character.Humanoid.AnimationPlayed:connect(function(AnimTrack)
	print(AnimTrack.Animation.Name)
end)]]

if Player.Character.Name == Player.Name then
	Player.CameraMinZoomDistance = 5
	Player.CameraMaxZoomDistance = 25
else
	Shifted = true
end

game.Workspace:WaitForChild('ProjectileFolder')
game.Workspace.ProjectileFolder.ChildAdded:connect(function(Child)
	if string.find(Child.Name, 'CannonBall') then
		Debris:AddItem(Child, 10)
		local SingleExplode = true
		spawn(function()
			local Distance = (Player.Character.HumanoidRootPart.CFrame.p - Child.CFrame.p).magnitude
			if Distance < 30 then
				cameraShake(5)
			end
		end)
		local Explode = Child.Touched:connect(function(Part)
			if Part.Name ~= 'CannonEject' and Part.Name ~= 'Hitbox' and Part.Name ~= Child.Name and SingleExplode == true then
				print(Part.Name)
				SingleExplode = false
				local Explosion = Instance.new('Explosion', game.Workspace)
				Explosion.BlastRadius = 0
				Explosion.Position = Child.Position 
				Child.Transparency = 1
				Child.Anchored = true
				Child.CanCollide = false
				Child.Sound:Play()
				if Child.Name == Player.UserId .. '_CannonBall' then
					CannonBallExplode:InvokeServer(Child, Part)
				end
				wait(1.5)
				Child.Transparency = 1
				wait(10)
				Child:Destroy()
			end
		end)
		wait(9)
		if SingleExplode == false then
			Explode:Disconnect()
		end
	elseif string.find(Child.Name, 'Spear') ~= nil then
		Debris:AddItem(Child, 120)
		local Exploded = false
		--[[Child.Effects.Flame.Enabled = true
		Child.Effects.Smoke.Enabled = true]]
		Child.Body.Trail.Enabled = true
		Child.Effects.SpearFlame.Enabled = true
		local Pos = Child:WaitForChild('Pos').Value
		local SpearTweenInfo = TweenInfo.new((Child.PrimaryPart.CFrame.p - Pos.p).magnitude/400, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
		Child:SetPrimaryPartCFrame(Child.SpearParent.Value.Holster.CFrame)
		Child:SetPrimaryPartCFrame(CFrame.new(Child.PrimaryPart.CFrame.p, Pos.p) * CFrame.Angles(0,math.rad(270),0))
		local SpearTween = TweenService:Create(Child.PrimaryPart, SpearTweenInfo, {['CFrame'] = CFrame.new(Child.PrimaryPart.CFrame.p, Pos.p) * CFrame.Angles(0,math.rad(270),0) * CFrame.new(-(Child.PrimaryPart.CFrame.p - Pos.p).magnitude + 1.5,0,0)})
		function exp()
			if Exploded == false then
				local Explosion = Instance.new('Explosion', game.Workspace)
				Explosion.BlastRadius = 0
				Exploded = true
				Explosion.Position = Child.Tip.Position
				for num,Part in ipairs(Child:GetChildren()) do
					if Part.ClassName == 'MeshPart' or Part.ClassName == 'UnionOperation' then
						Part.Transparency = 1
						Part.Anchored = true
					end
				end
				if string.find(Child.Name, Player.Name) ~= nil then
					SpearExplode:InvokeServer(Child, Child.PrimaryPart.CFrame)
				end
				Child.Effects.Explosion.Enabled = true
				Child.Effects.ExplodeNoise:Play()
				wait(0.8)
				Child.Effects.Explosion.Enabled = false
				--[[Child.Effects.Flame.Enabled = false
				Child.Effects.Smoke.Enabled = false]]
				Child.Body.Trail.Enabled = false
				Child.Effects.SpearFlame.Enabled = false
				wait(20)
				Child:Destroy()
			end
		end
		local ExplodeProcessing = RunService.Heartbeat:connect(function()
			if Exploded == false then
				local SpearRay = Ray.new(Child.Tip.CFrame.p, Pos.p)
				local Part, Position = workspace:FindPartOnRayWithIgnoreList(SpearRay, {Child.OP.Value, Child, Player.Character})
				local Distance = (Child.Tip.CFrame.p - Position).magnitude
				if Distance < 2 then
					exp()
				end
			end
		end)
		--[[for num = 1,100 do
			wait()
			Child:SetPrimaryPartCFrame(Child.OriginHolst.Value.CFrame:Lerp(Pos, num/1000) * CFrame.Angles(0,math.rad(270),0))
			print('lerping')
			--Child:SetPrimaryPartCFrame(Child.OriginHolst.Value.CFrame * CFrame.new(-0.08* num,0,0))
		end]]
		
		SpearTween:Play()
		Child.Effects.Launch:Play()
		SpearTween.Completed:connect(exp)
		wait(10)
		if Exploded == true then
			ExplodeProcessing:Disconnect()
		end
		ExplodeProcessing:Disconnect()
		SpearTween:Destroy()
	end
end)

for num,Pulley in ipairs(game.Workspace:WaitForChild('Pulleys'):GetChildren()) do
	function resizeRope(NPulley)
		--[[NPulley:WaitForChild('RopeA1')
		NPulley:WaitForChild('RopeA2')
		NPulley:WaitForChild('RopeB2')
		NPulley:WaitForChild('RopeB1')
		NPulley:WaitForChild('Supports')
		NPulley.Supports:WaitForChild('PulleyPointA')
		NPulley.Supports:WaitForChild('PulleyPointB')]]
		NPulley.RopeA1.Size = Vector3.new(0.2, (NPulley.Cart.RopeHoldA.Position - NPulley.Supports.PulleyPointA.Position).magnitude,0.2)
		NPulley.RopeA1.CFrame = NPulley.Cart.RopeHoldA.CFrame:Lerp(NPulley.Supports.PulleyPointA.CFrame, 0.5) * CFrame.new(0,0,0.15)
		NPulley.RopeB1.Size = Vector3.new(0.2, (NPulley.Cart.RopeHoldB.Position - NPulley.Supports.PulleyPointB.Position).magnitude,0.2)
		NPulley.RopeB1.CFrame = NPulley.Cart.RopeHoldB.CFrame:Lerp(NPulley.Supports.PulleyPointB.CFrame, 0.5) * CFrame.new(0,0,0.15)
		NPulley.RopeA2.Size = Vector3.new(0.2, (NPulley.Cart.RopeHoldA.Position - NPulley.Supports.PulleyPointA.Position).magnitude,0.2)
		NPulley.RopeA2.CFrame = NPulley.Cart.RopeHoldA.CFrame:Lerp(NPulley.Supports.PulleyPointA.CFrame, 0.5) * CFrame.new(0,0,-0.15)
		NPulley.RopeB2.Size = Vector3.new(0.2, (NPulley.Cart.RopeHoldB.Position - NPulley.Supports.PulleyPointB.Position).magnitude,0.2)
		NPulley.RopeB2.CFrame = NPulley.Cart.RopeHoldB.CFrame:Lerp(NPulley.Supports.PulleyPointB.CFrame, 0.5) * CFrame.new(0,0,-0.15)
	end
	resizeRope(Pulley)
	local BoxMove = Pulley.Cart:WaitForChild('CFVal')
	BoxMove:GetPropertyChangedSignal('Value'):connect(function()
		Pulley.Cart:SetPrimaryPartCFrame(BoxMove.Value)
		resizeRope(Pulley)
	end)
end

for num,Cannon in ipairs(game.Workspace:WaitForChild('Cannons'):GetChildren()) do
	local XTurn = Cannon:WaitForChild('CFVal')
	Cannon:WaitForChild('Barrel')
	local YTurn = Cannon.Barrel:WaitForChild('CFValUD')
	XTurn:GetPropertyChangedSignal('Value'):connect(function()
		Cannon:SetPrimaryPartCFrame(XTurn.Value)
	end)
	YTurn:GetPropertyChangedSignal('Value'):connect(function()
		Cannon.Barrel:SetPrimaryPartCFrame(YTurn.Value)
	end)
end

local playerLocation = nil
local function evaluate(Titan, ClosestPlayer)
	local LsP = Titan.Head.CFrame:ToObjectSpace(ClosestPlayer.Character.HumanoidRootPart.CFrame)
	if math.abs(LsP.Z) < Titan.Head.Size.Z and math.abs(LsP.X) < Titan.Head.Size.X then
		if LsP.Z < 0 and math.abs(LsP.Y) < Titan.Head.Size.Y/2 and math.abs(LsP.X) < (Titan.Head.Size.X/2) * 0.75 then
			playerLocation = 'Face'
		elseif math.abs(LsP.Z) < Titan.Head.Size.Z/2.3 and LsP.X > -Titan.Head.Size.X * 3/2 and LsP.X < 0 and math.abs(LsP.Y) < Titan.Head.Size.Y/2 then
			playerLocation = 'Left Shoulder'
		elseif math.abs(LsP.Z) < Titan.Head.Size.Z/2.3 and LsP.X < Titan.Head.Size.X * 3/2 and LsP.X > 0 and math.abs(LsP.Y) < Titan.Head.Size.Y/2 then
			playerLocation = 'Right Shoulder'
		elseif LsP.Y > -Titan.Head.Size.Y and LsP.Y < 0 and LsP.Z > 0 then
			playerLocation = 'Nape'
		end
	end
	local LsP = Titan.HumanoidRootPart.CFrame:ToObjectSpace(ClosestPlayer.Character.HumanoidRootPart.CFrame)
	if math.abs(LsP.Z) < Titan.HumanoidRootPart.Size.Z and math.abs(LsP.X) < Titan.HumanoidRootPart.Size.X then
		if LsP.Z < 0 and math.abs(LsP.Y) < (Titan.HumanoidRootPart.Size.Y/2) * 0.8 and math.abs(LsP.X) < Titan.HumanoidRootPart.Size.X * 0.85 then
			playerLocation = 'Stummy'
		elseif LsP.Z > 0 and math.abs(LsP.Y) < (Titan.HumanoidRootPart.Size.Y/2) * 0.8 and math.abs(LsP.X) < Titan.HumanoidRootPart.Size.X * 0.85 then
			playerLocation = 'Back'
		end
	end
	local CenterLegs = Titan.HumanoidRootPart.CFrame * CFrame.new(0,-Titan.HumanoidRootPart.Size.Y*3/2,0)
	local LsP = CenterLegs:ToObjectSpace(ClosestPlayer.Character.HumanoidRootPart.CFrame)
	if math.abs(LsP.Z) < Titan.HumanoidRootPart.Size.Z * 3 and LsP.Z < 0 and math.abs(LsP.X) < Titan.HumanoidRootPart.Size.X and math.abs(LsP.Y) < Titan.HumanoidRootPart.Size.Y/2 then
		playerLocation = 'Front Legs'
	elseif math.abs(LsP.Z) < Titan.HumanoidRootPart.Size.Z * 2 and LsP.Z > 0 and math.abs(LsP.X) < Titan.HumanoidRootPart.Size.X and math.abs(LsP.Y) < Titan.HumanoidRootPart.Size.Y/2 then
		playerLocation = 'Back Legs'
	end
	return playerLocation
end

function evaluateMovement(Animation, Titan)
	if Animation.Value == 'HeadEatLeft' then
		wait(11/30)
		if evaluate(Titan, Player) == 'Left Shoulder' then
			KillPlayer:FireServer(Titan.Head)
		end
	elseif Animation.Value == 'HeadEatRight' then
		wait(11/30)
		if evaluate(Titan, Player) == 'Right Shoulder' then
			KillPlayer:FireServer(Titan.Head)
		end
	elseif Animation.Value == 'HeadEatFront' then
		wait(30/60)
		if evaluate(Titan, Player) == 'Face' then
			KillPlayer:FireServer(Titan.Head)
		end
	end
end

function setupTitan(Titan)
	if Titan:WaitForChild('Humanoid', 120) then
		Titan:WaitForChild('AnimationPlaying')
		Titan.AnimationPlaying:WaitForChild('AnimLength')
		Titan.AnimationPlaying.Changed:connect(function()
			local animTrack = Titan.AnimationPlaying.Value
			spawn(function()
				evaluateMovement(Titan.AnimationPlaying, Titan)
			end)
		end)
		local DB = true
		local function reactR(Part)
			if Part:FindFirstAncestor(Player.Name) and DB == true then
				DB = false
				GPlayer:InvokeServer(Player.Character.HumanoidRootPart, Titan, Titan.RightHand)
				DB = true
			end
		end
		local function reactL(Part)
			if Part:FindFirstAncestor(Player.Name) and DB == true then
				DB = false
				GPlayer:InvokeServer(Player.Character.HumanoidRootPart, Titan, Titan.LeftHand)
				DB = true
			end
		end
		Titan:WaitForChild('RightHand')
		Titan:WaitForChild('RightLowerArm')
		Titan:WaitForChild('LeftHand')
		Titan:WaitForChild('LeftLowerArm')
		Titan.RightHand.Touched:connect(reactR)
		Titan.RightLowerArm.Touched:connect(reactR)
		Titan.LeftHand.Touched:connect(reactL)
		Titan.LeftLowerArm.Touched:connect(reactL)
	end
end

for num,Titan in ipairs(game.Workspace:WaitForChild('TitanFolder'):GetChildren()) do
	table.insert(LTitans, Titan)
	setupTitan(Titan)
end

game.Workspace.TitanFolder.ChildAdded:connect(function(Titan)
	Titan:WaitForChild('Humanoid')
	setupTitan(Titan)
end)
--local HorseLoad = game.ReplicatedStorage:WaitForChild('HorseFE'):WaitForChild('HorseAnimL')

ServerGrapple.OnClientEvent:connect(function(Hook, Position, Wire, Part)
	local ServerH = Hook:FindFirstAncestor(Player.Name)
	if ServerH == nil then
		table.insert(ServerWires, {Hook, Position, Wire, Part})
	end
end)

ShortestHorse = nil
local oldUI = script:WaitForChild('Key'):Clone()
local keyUI = script:WaitForChild('Key'):Clone()
keyUI.ImageLabel.TextLabel.Text = 'T'
ShortestItem = nil
local takeUI = script:WaitForChild('takeUI')
local Stealable = false
local Refillable = false
local Mountable = false
local Rob = false

local CShaking = false
local ClosestTitan = nil
local CShakeDB = true
function cameraShake(var)
	if game.Players.LocalPlayer:WaitForChild('SkipLoad').Value == false then
		game.Workspace.Camera.CameraType = Enum.CameraType.Custom
		for num = 1,15 do
			wait()
			game.Workspace.Camera.CFrame = game.Workspace.Camera.CFrame:Lerp(game.Workspace.Camera.CFrame * CFrame.Angles(math.rad(math.random(-var,var)),0,0), num/50) 
		end
	end
end

function tweenButton(UI)
	local tempPos = UI.Position
	local buttonInfo = TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In)	
	local buttonTween = nil
	if UI.ClassName == 'ImageLabel' then
		UI.Position = UDim2.new(tempPos.X.Scale, tempPos.X.Offset, -0.4, tempPos.Y.Offset)
		UI.ImageTransparency = 1
		buttonTween = TweenService:Create(UI, buttonInfo, 
		{
			['Position'] = tempPos,
			['ImageTransparency'] = 0
		})
		buttonTween:Play()
	elseif UI.ClassName == 'TextLabel' then
		UI.TextTransparency = 1
		buttonTween = TweenService:Create(UI, buttonInfo, {['TextTransparency'] = 0})	
		buttonTween:Play()
	end
end


RunService.Heartbeat:connect(function()
	-- HEAD MOVEMENT
	
	--[[local PMouse = game.Players.LocalPlayer:GetMouse()
	local p = Instance.new('Part', game.Workspace)
	p.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,2)
	p.CanCollide = false
	p.Size = Vector3.new(0.2,0.2,0.2)
	local headCenter = PMouse.Hit:ToObjectSpace(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
	local LR = math.atan(-headCenter.Z / -headCenter.X) * (180/math.pi)
	local UD = math.atan(headCenter.Y / headCenter.Z) * (180/math.pi)
	print(LR)
	
	local degrees = (1/math.tan(((game.Players.LocalPlayer.Character.Head.CFrame.p - PMouse.Hit.p).X / (game.Players.LocalPlayer.Character.Head.CFrame.p - PMouse.Hit.p).Z)) * math.pi) / 180
	
	if LR < 60 and LR > -60 then
		--Player.Character.Head.Neck.C0 = Player.Character.Head.Neck.Part0.CFrame:inverse() * CFrame.new((Player.Character.Head.Neck.Part0.CFrame * Player.Character.Head.Neck.C0.p), PMouse.Hit.p)
		--Player.Character.Head.Neck.C0 = Player.Character.Head.Neck.Part0.CFrame:inverse() * CFrame.new((Player.Character.Head.Neck.Part0.CFrame * Player.Character.Head.Neck.C0.p), PMouse.Hit.p)
	end
	
	if (PMouse.Hit.p - (game.Players.LocalPlayer.Character.Head.CFrame * CFrame.new(0,0,-10)).p).X < 10 and (PMouse.Hit.p - (game.Players.LocalPlayer.Character.Head.CFrame * CFrame.new(0,0,-10)).p).X > -10 then
		if (PMouse.Hit.p - (game.Players.LocalPlayer.Character.Head.CFrame * CFrame.new(0,0,-10)).p).Y < 5 and (PMouse.Hit.p - (game.Players.LocalPlayer.Character.Head.CFrame * CFrame.new(0,0,-10)).p).Y > -5 then
			--Player.Character.Head.Neck.C0 = Player.Character.Head.Neck.Part0.CFrame:inverse() * CFrame.new((Player.Character.Head.Neck.Part0.CFrame * Player.Character.Head.Neck.C0.p), PMouse.Hit.p)
		end
		
		--print('super far dud')
	end]]
	
	if takeUI == nil then
		takeUI = script.takeUI:Clone()
	end
	if oldUI == nil then
		oldUI = script.Key:Clone()
	end
	
	-- STEALABLES
	
	if Player.Character:FindFirstChild('HumanoidRootPart') and Shifted == false then
		for num,Item in ipairs(game.Workspace.Theft:GetChildren()) do
			if Item.PrimaryPart ~= nil then
				if ShortestItem == nil then
					ShortestItem = Item
					--takeUI.Parent = ShortestItem.PrimaryPart
				elseif (Player.Character.HumanoidRootPart.Position - Item.PrimaryPart.Position).magnitude < (Player.Character.HumanoidRootPart.Position - ShortestItem.PrimaryPart.Position).magnitude then
					ShortestItem = Item
					--takeUI.Parent = ShortestItem.PrimaryPart
				end
			end
		end
		for num,Pedestrian in ipairs(game.Workspace:WaitForChild('Pedestrians'):GetChildren()) do
			if Pedestrian.PrimaryPart ~= nil and Pedestrian:FindFirstChild('Wallet') ~= nil then
				if ShortestItem == nil then
					ShortestItem = Pedestrian
					--takeUI.Parent = ShortestItem.PrimaryPart
				elseif (Player.Character.HumanoidRootPart.Position - Pedestrian.PrimaryPart.Position).magnitude < (Player.Character.HumanoidRootPart.Position - ShortestItem.PrimaryPart.Position).magnitude then
					ShortestItem = Pedestrian
					--takeUI.Parent = ShortestItem.PrimaryPart
				end
			end
		end
		for num,Refill in ipairs(game.Workspace.RefillPoints:GetChildren()) do
			if ShortestItem == nil and Player.Character:FindFirstChild('ODMLoaded') then
				ShortestItem = Refill
			elseif (Player.Character.HumanoidRootPart.Position - Refill.PrimaryPart.Position).magnitude < (Player.Character.HumanoidRootPart.Position - ShortestItem.PrimaryPart.Position).magnitude and Player.Character:FindFirstChild('ODMLoaded') then
				ShortestItem = Refill
			end
		end
		if ShortestItem ~= nil and ShortestItem.Parent then
			if ShortestItem.Parent.Name == 'Pedestrians' and (ShortestItem:FindFirstChild('Wallet') == nil or (Player.Character.HumanoidRootPart.Position - ShortestItem.PrimaryPart.Position).magnitude > 5)  then
				takeUI.Enabled = false
				Stealable = false
				Refillable = false
				Rob = false	
			elseif (Player.Character.HumanoidRootPart.Position - ShortestItem.PrimaryPart.Position).magnitude < 15 then
				if takeUI.Parent == ShortestItem.PrimaryPart and takeUI.Enabled == false then
					if ShortestItem.Parent.Name == 'Pedestrians' and (Player.Character.HumanoidRootPart.Position - ShortestItem.PrimaryPart.Position).magnitude < 5 and ShortestItem:FindFirstChild('Wallet') then
						takeUI.Enabled = true
						takeUI.Parent = ShortestItem.PrimaryPart
						tweenButton(takeUI.ImageLabel)
						tweenButton(takeUI.ImageLabel.TextLabel)
					elseif ShortestItem.Parent.Name == 'Theft' and #Player.Inventory:GetChildren() - 1 < Player.Inventory.InventorySpace.Value then
						takeUI.Enabled = true
						takeUI.Parent = ShortestItem.PrimaryPart
						tweenButton(takeUI.ImageLabel)
						tweenButton(takeUI.ImageLabel.TextLabel)
					elseif ShortestItem.Parent.Name == 'RefillPoints' then
						takeUI.Enabled = true
						takeUI.Parent = ShortestItem.PrimaryPart
						tweenButton(takeUI.ImageLabel)
						tweenButton(takeUI.ImageLabel.TextLabel)
					end
				end
				if ShortestItem.Parent.Name == 'Theft' and #Player.Inventory:GetChildren() - 1 < Player.Inventory.InventorySpace.Value and takeUI.Parent ~= ShortestItem.PrimaryPart then
					takeUI.ImageLabel.TextLabel.Text = '[F] Take'
					Stealable = true
					Refillable = false
					Rob = false
					takeUI.Enabled = true
					takeUI.Parent = ShortestItem.PrimaryPart
					tweenButton(takeUI.ImageLabel)
					tweenButton(takeUI.ImageLabel.TextLabel)
				elseif ShortestItem.Parent.Name == 'RefillPoints' and takeUI.Parent ~= ShortestItem.PrimaryPart then
					takeUI.ImageLabel.TextLabel.Text = '[F] Refill Gas and Blades'
					Stealable = false
					Refillable = true
					Rob = false
					takeUI.Enabled = true
					takeUI.Parent = ShortestItem.PrimaryPart
					tweenButton(takeUI.ImageLabel)
					tweenButton(takeUI.ImageLabel.TextLabel)
				elseif ShortestItem.Parent.Name == 'Pedestrians' and (Player.Character.HumanoidRootPart.Position - ShortestItem.PrimaryPart.Position).magnitude < 5 and ShortestItem:FindFirstChild('Wallet') and takeUI.Parent ~= ShortestItem.PrimaryPart then
					takeUI.ImageLabel.TextLabel.Text = '[F] Rob'
					Stealable = false
					Refillable = false
					print('Setting rob to true')
					Rob = true
					takeUI.Enabled = true
					takeUI.Parent = ShortestItem.PrimaryPart
					tweenButton(takeUI.ImageLabel)
					tweenButton(takeUI.ImageLabel.TextLabel)
				end
			elseif (Player.Character.HumanoidRootPart.Position - ShortestItem.PrimaryPart.Position).magnitude > 15 and takeUI.Parent ~= nil then
				takeUI.Enabled = false
				Stealable = false
				Refillable = false
				Rob = false
			end
		elseif (Player.Character.HumanoidRootPart.Position - ShortestItem.PrimaryPart.Position).magnitude > 15 then
			Stealable = false
			Refillable = false
			Rob = false
			takeUI.Enabled = false
		end
	end
	
	
	
	if Player.Character:FindFirstChild('HumanoidRootPart') and Shifted == false then
		-- M Key
		for num,Horse in ipairs(game.Workspace.Horses:GetChildren()) do
			if Horse.Name == Player.Name.."MASTER_HORSE" or Horse.Name == 'Horse' then
				if ShortestHorse == nil then
					ShortestHorse = Horse
				elseif Horse.PrimaryPart ~= nil and ShortestHorse.PrimaryPart ~= nil and (Player.Character.HumanoidRootPart.Position - Horse.PrimaryPart.Position).magnitude < (Player.Character.HumanoidRootPart.Position - ShortestHorse.PrimaryPart.Position).magnitude then
					ShortestHorse = Horse
					--[[print('Setting oldUI')
					oldUI.Parent = ShortestHorse]]
				end
			end
		end
		for num,Cannon in ipairs(game.Workspace.Cannons:GetChildren()) do
			if ShortestHorse == nil then
				ShortestHorse = Cannon
			elseif Cannon.PrimaryPart ~= nil and ShortestHorse.PrimaryPart ~= nil and (Player.Character.HumanoidRootPart.Position - Cannon.PrimaryPart.Position).magnitude < (Player.Character.HumanoidRootPart.Position - ShortestHorse.PrimaryPart.Position).magnitude then
				ShortestHorse = Cannon
				--[[print('Setting oldUI')
				oldUI.Parent = ShortestHorse.PrimaryPart]]
			end
		end
		if ShortestHorse ~= nil then
			Distance = 100
			if Player.Character:FindFirstChild('HumanoidRootPart') then
				Distance = (Player.Character.HumanoidRootPart.Position - ShortestHorse.PrimaryPart.Position).magnitude
			end
			if Distance > 15 or (Player.Character:FindFirstChild('Humanoid').SeatPart ~= nil and oldUI.Enabled == true) then
				Mountable = false
				oldUI.Enabled = false
			elseif (Distance < 15 and ShortestHorse.Seat.Occupant == nil and oldUI.Parent ~= ShortestHorse) or (Distance < 15 and ShortestHorse.Seat.Occupant == nil and oldUI.Parent == ShortestHorse and oldUI.Enabled == false) then
				Mountable = true
				oldUI.Enabled = true
				oldUI.Parent = ShortestHorse
				tweenButton(oldUI.ImageLabel)
				tweenButton(oldUI.ImageLabel.TextLabel)
			end
		end
	
		
		-- NPC
		for num,NPC in ipairs(game.Workspace.NPCFolder:GetChildren()) do
			--print(NPC.Name)
			--print(Player.Character.Name)
			if ShortestDistance == nil then
				ShortestDistance = NPC
			elseif (Player.Character.HumanoidRootPart.Position - NPC.HumanoidRootPart.Position).magnitude < (Player.Character.HumanoidRootPart.Position - ShortestDistance.HumanoidRootPart.Position).magnitude and (Player.Character.HumanoidRootPart.Position - NPC.HumanoidRootPart.Position).magnitude < 15 then
				ShortestDistance = NPC
			end
		end
		Distance = (Player.Character.HumanoidRootPart.Position - ShortestDistance.HumanoidRootPart.Position).magnitude
		if keyUI ~= nil then
			if Distance > 15 and keyUI.Enabled == true then
				keyUI.Enabled = false
			elseif (Distance < 15 and keyUI.Parent ~= ShortestDistance.Head) or (Distance < 15 and keyUI.Parent == ShortestDistance.Head and keyUI.Enabled == false) then
				keyUI.Enabled = true
				keyUI.Parent = ShortestDistance.Head
				tweenButton(keyUI.ImageLabel)
				tweenButton(keyUI.ImageLabel.TextLabel)
			end
		end
		if Distance > 15 and Talking == true then
			for num,UI in ipairs(Player.PlayerGui:GetChildren()) do
				if UI.Name == "NPCUI" then
					UI:Destroy()
				end
			end
			game.Workspace.Camera.CameraType = Enum.CameraType.Custom
			Talking = false
		end
	end
	for num,ServerWire in ipairs(ServerWires) do
		if ServerWire[1].Parent == nil or ServerWire[2] == nil or ServerWire[3].Parent == nil or ServerWire[4] == nil then
			table.remove(ServerWires, num)
		else
			local Dist = (ServerWire[1].PrimaryPart.Position - ServerWire[4].CFrame * ServerWire[2].p).magnitude
			ServerWire[3].CFrame = CFrame.new(ServerWire[1].PrimaryPart.Position, ServerWire[4].CFrame * ServerWire[2].p) * CFrame.Angles(0, -math.rad(90), 0) * CFrame.new(-Dist / 2, 0, 0)
			ServerWire[3].Size = Vector3.new(Dist, ServerWire[3].Size.Y, ServerWire[3].Size.Z)
		end
	end
	for num,Titan in ipairs(game.Workspace:WaitForChild('TitanFolder'):GetChildren()) do
		if game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart') and Titan:FindFirstChild('HumanoidRootPart') then
			local TitanDistance = (Player.Character.HumanoidRootPart.Position - Titan.HumanoidRootPart.Position).magnitude
			if ClosestTitan == nil then
				ClosestTitan = Titan
			elseif ClosestTitan ~= nil and ClosestTitan:FindFirstChild('HumanoidRootPart') ~= nil and TitanDistance < (Player.Character.HumanoidRootPart.Position - ClosestTitan.HumanoidRootPart.Position).magnitude then
				ClosestTitan = Titan
			end
		end
	end
	if ClosestTitan ~= nil and game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart') and ClosestTitan:FindFirstChild('HumanoidRootPart') then
		if ClosestTitan ~= nil and (Player.Character.HumanoidRootPart.Position - ClosestTitan.HumanoidRootPart.Position).magnitude < 100 and CShaking == false then
			CShaking = true
		elseif ClosestTitan ~= nil and (Player.Character.HumanoidRootPart.Position - ClosestTitan.HumanoidRootPart.Position).magnitude > 100 and CShaking == true then
			CShaking = false
		end
	end
	if CShaking == true then
		if ClosestTitan:FindFirstChild('HumanoidRootPart') and ClosestTitan.HumanoidRootPart.Stomping.IsPlaying == true and ClosestTitan.HumanoidRootPart.Stomping.TimePosition < 0.2 and CShakeDB == true then
			CShakeDB = false
			cameraShake(5)
			CShakeDB = true
		end
	end
end)


UIS.InputBegan:connect(function(Input, Chatting)
	--[[if Input.KeyCode == Enum.KeyCode.V and Chatting == false and Talking == false then
		game.ReplicatedStorage.HorseFE.HorseCall:InvokeServer()
	end]]
	local Tween = nil
	if Input.KeyCode == Enum.KeyCode.T and Distance < 15 and ShortestDistance ~= nil and Talking == false and Chatting == false then
		Talking = true
		for num,UI in ipairs(Player.PlayerGui:GetChildren()) do
			if UI.Name == "NPCUI" then
				UI:Destroy()
			end
		end
		local GUI = script.NPCUI:Clone()
		GUI.Parent = Player.PlayerGui
		GUI.NPC.Value = ShortestDistance
		GUI.LocalScript.Disabled = false
		local TI = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.In)
		Tween = TweenService:Create(game.Workspace.Camera, TI, {['CFrame'] = ShortestDistance.Head.CFrame * CFrame.new(0,0,-8) * CFrame.Angles(0,math.rad(180),0)})
		Tween:Play()
		Tween.Completed:Wait()
		if Talking == true then
			game.Workspace.Camera.CameraType = Enum.CameraType.Scriptable
			game.Workspace.Camera.CFrame = ShortestDistance.Head.CFrame * CFrame.new(0,0,-8) * CFrame.Angles(0,math.rad(180),0)
			ShortestDistance.Humanoid:LoadAnimation(script.NPCEmotes:GetChildren()[math.random(1, #script.NPCEmotes:GetChildren())]):Play()
			Tween:Destroy()
		end
	elseif Input.KeyCode == Enum.KeyCode.T and Talking == true and Chatting == false then
		if Tween ~= nil then
			Tween:Cancel()
			Tween:Destroy()
		end
		for num,UI in ipairs(Player.PlayerGui:GetChildren()) do
			if UI.Name == "NPCUI" then
				UI:Destroy()
			end
		end
		game.Workspace.Camera.CameraType = Enum.CameraType.Custom
		Talking = false
	elseif Input.KeyCode == Enum.KeyCode.X and Chatting == false and Mountable == true and Talking == false then
		HorseMount:FireServer(ShortestHorse)
	elseif Input.KeyCode == Enum.KeyCode.F and Chatting == false and Talking == false then
		if Player.Character.Humanoid.SeatPart == nil then
			print(Rob, Stealable, Refillable)
			if ShortestItem:FindFirstAncestor('Theft') and #Player.Inventory:GetChildren() - 1 < Player.Inventory.InventorySpace.Value and Stealable == true then
				Steal:FireServer(ShortestItem, Pickpocket)
			elseif ShortestItem:FindFirstAncestor('Pedestrians') and Rob then
				Steal:FireServer(ShortestItem)
			elseif ShortestItem:FindFirstAncestor('RefillPoints') and (Player.Character:FindFirstChild('ODMLoaded') or Player.Character:FindFirstChild('APGLoaded')) and Refillable then
				RefillGas:InvokeServer(GasAmount.Value)
			end
		end
	--[[elseif Input.KeyCode == Enum.KeyCode.F and Chatting == false and Stealable == false and Talking == false and Refillable == true then
		if Player.Character.Humanoid.SeatPart == nil then
			RefillGas:InvokeServer(GasAmount.Value)
		end]]
	end
end)



game.Workspace:WaitForChild('APBulletsFolder').ChildAdded:connect(function(Child)
	local SingleTouch = true
	if Child.Name == Player.Name then
		Child.Transparency = 1
		local Tween = TweenService:Create(Child, TweenInfo.new(15, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {['CFrame'] = Child.CFrame * CFrame.new(800,0,0)})
		Tween:Play()
		BulletTouch = Child.Touched:connect(function(TouchPart)
			if TouchPart.Name ~= 'APBullet' and TouchPart.Name ~= Player.Name and SingleTouch == true then
				SingleTouch = false
				for num,Player in ipairs(game.Players:GetPlayers()) do
					if TouchPart:FindFirstAncestor(Player.Name) and TouchPart:FindFirstAncestor(Player.Name).Humanoid and Player.Name ~= game.Players.LocalPlayer.Name then
						FEFolder.APGunDamage:FireServer(TouchPart:FindFirstAncestor(Player.Name), Child)
					end
				end
				BulletTouch:Disconnect()
			end
		end)
	else
		local Tween = TweenService:Create(Child, TweenInfo.new(15, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {['Transparency'] = 1})
		Tween:Play()
	end
end)

Player.Character:WaitForChild('Humanoid')
Player.Character.Humanoid:GetPropertyChangedSignal('Health'):connect(function()
	if Player.Character.Humanoid.Health == 0 then
		oldUI:Destroy()
		keyUI:Destroy()
		takeUI:Destroy()
	end
end)

--[[wait(5)
HoodEquip = game.ReplicatedStorage.MAINFE.HoodEquip
HoodEquip:FireServer()]]
-- DELETE THIS LAST PORTION LATER
