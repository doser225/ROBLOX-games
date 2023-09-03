maxTitans = 25



local TitanFolder = Instance.new('Folder')
TitanFolder.Parent = workspace
local TweenService = game:GetService('TweenService')
TitanFolder.Name = 'TitanFolder'
local RunService = game:GetService('RunService')
script:WaitForChild('Eyes')
local Debris = game:GetService('Debris')

local Pathfinding = game:GetService('PathfindingService')

Roars = {script:WaitForChild('Roar1'), script:WaitForChild('Roar2'), script:WaitForChild('Roar3')}

local function titanSlam(slam, size)
	local function tweenBall(Part)
		if Part.ClassName == 'MeshPart' then
			Part.CFrame = Part.CFrame * CFrame.Angles(math.rad(1,360), math.rad(1,360), math.rad(1,360))
			local CircleInfo = TweenInfo.new(3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)
			local Tween = TweenService:Create(Part, CircleInfo, {['Size'] = Vector3.new(size * 7.2, size * 7.2, 0.5), ['Transparency'] = 1})
			Tween:Play()
		elseif Part.ClassName == 'Part' then
			Part.CFrame = Part.CFrame * CFrame.Angles(math.rad(1,360), math.rad(1,360), math.rad(1,360))
			local CircleInfo = TweenInfo.new(3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)
			local Tween = TweenService:Create(Part, CircleInfo, {['Size'] = Vector3.new(size * 5, size * 5, size * 5), ['Transparency'] = 1})
			Tween:Play()	
		end
	end
	
	for num,Part in ipairs(slam:GetChildren()) do
		if Part:IsA('BasePart') then
			tweenBall(Part)
		end
	end
	wait(0.4)
	for num,Player in ipairs(game.Players:GetPlayers()) do
		pcall(function()
			if (Player.Character.HumanoidRootPart.Position - slam.PrimaryPart.Position).magnitude < size * 5 then
				Player.Character.Humanoid:TakeDamage(math.random(30,40))
				Player.Character.Humanoid.PlatformStand = true
				wait(0.1)
				Player.Character.Humanoid.PlatformStand = false
			end
		end)
	end
	for num,NPC in ipairs(game.Workspace.Pedestrians:GetChildren()) do
		local Player = NPC
		if (Player.HumanoidRootPart.Position - slam.PrimaryPart.Position).magnitude < size * 5 then
			Player.Humanoid:TakeDamage(math.random(100,150))
		end
	end
	
	slam.PrimaryPart.Sound:Play()
	wait(slam.PrimaryPart.Sound.TimeLength)
	slam:Destroy()
end

function handleGrabs(Titan, ClosestPlayer, grabDB)
	if ClosestPlayer then
		local CPS = Titan.HumanoidRootPart.CFrame:ToObjectSpace(ClosestPlayer.HumanoidRootPart.CFrame)	
		if math.abs(CPS.Z) < 50 and math.abs(CPS.X) < 50 then
			local heightLevel = nil
			local leftRight = nil
			-- Negative X is left
			-- Positive X is right
			local behindFront = nil
			-- Positive Z is front
			-- Negative Z is behind
			local playerLocation = nil
			local function evaluate()
				local LsP = Titan.Head.CFrame:ToObjectSpace(ClosestPlayer.HumanoidRootPart.CFrame)
				if math.abs(LsP.Z) < Titan.Head.Size.Z and math.abs(LsP.X) < Titan.Head.Size.X then
					if LsP.Z < 0 and math.abs(LsP.Y) < Titan.Head.Size.Y/2 and math.abs(LsP.X) < (Titan.Head.Size.X/2) * 0.75 then
						playerLocation = 'Face'
					elseif math.abs(LsP.Z) < Titan.Head.Size.Z/2.3 and LsP.X > -Titan.Head.Size.X * 3/2 and LsP.X < 0 and math.abs(LsP.Y) < Titan.Head.Size.Y/2 then
						playerLocation = 'Left Shoulder'
					elseif math.abs(LsP.Z) < Titan.Head.Size.Z/2.3 and LsP.X < Titan.Head.Size.X * 3/2 and LsP.X > 0 and math.abs(LsP.Y) < Titan.Head.Size.Y/2 then
						playerLocation = 'Right Shoulder'
					elseif LsP.Y > -Titan.Head.Size.Y and LsP.Y < 0 and LsP.Z > 0 then
						playerLocation = 'Nape'
					elseif LsP.Y > Titan.Head.Size.Y/2 and LsP.Y < Titan.Head.Size.Y * 1.5 then
						playerLocation = 'Noggin'
					end
				end
				local LsP = Titan.HumanoidRootPart.CFrame:ToObjectSpace(ClosestPlayer.HumanoidRootPart.CFrame)
				if math.abs(LsP.Z) < Titan.HumanoidRootPart.Size.Z and math.abs(LsP.X) < Titan.HumanoidRootPart.Size.X then
					if LsP.Z < 0 and math.abs(LsP.Y) < (Titan.HumanoidRootPart.Size.Y/2) * 0.8 and math.abs(LsP.X) < Titan.HumanoidRootPart.Size.X * 0.85 then
						playerLocation = 'Stummy'
					elseif LsP.Z > 0 and math.abs(LsP.Y) < (Titan.HumanoidRootPart.Size.Y/2) * 0.8 and math.abs(LsP.X) < Titan.HumanoidRootPart.Size.X * 0.85 then
						playerLocation = 'Back'
					end
				end
				local CenterLegs = Titan.HumanoidRootPart.CFrame * CFrame.new(0,-Titan.HumanoidRootPart.Size.Y*3/2,0)
				local LsP = CenterLegs:ToObjectSpace(ClosestPlayer.HumanoidRootPart.CFrame)
				if math.abs(LsP.Z) < Titan.HumanoidRootPart.Size.Z * 2 and LsP.Z < 0 and math.abs(LsP.X) < Titan.HumanoidRootPart.Size.X and math.abs(LsP.Y) < Titan.HumanoidRootPart.Size.Y/2 then
					playerLocation = 'Front Legs'
				elseif math.abs(LsP.Z) < Titan.HumanoidRootPart.Size.Z * 2 and LsP.Z > 0 and math.abs(LsP.X) < Titan.HumanoidRootPart.Size.X and math.abs(LsP.Y) < Titan.HumanoidRootPart.Size.Y/2 then
					playerLocation = 'Back Legs'
				end
				local LsP = Titan.Head.CFrame:ToObjectSpace(ClosestPlayer.HumanoidRootPart.CFrame)
				if LsP.Y > Titan.Head.Size.Y/2 and LsP.Y > Titan.Head.Size.Y * 1.5 and math.abs(LsP.Z) < 15 and math.abs(LsP.X) < 15 then
					playerLocation = 'Sky'
				end
				return playerLocation
			end
			evaluate()
			local SkyReach = Titan.SkyReach.Value
			local SkyReachDB
			if SkyReach == true and evaluate() ~= 'Sky' then
				local function reach()
					SkyReachDB = false
					print('Turning off skyreach')
					wait(1)
					Titan.SkyReach.Value = false
					Titan.Occupied.Value = false
					for num,Animation in ipairs(Titan.Humanoid:GetPlayingAnimationTracks()) do
						if Animation.Name == 'TitanReach' then
							Animation:Stop()
						end
					end
					SkyReachDB = true
				end
				if SkyReachDB == nil then
					reach()
				elseif SkyReachDB == true then
					reach()
				end
			end
			
			local function eatAndEvaluate(Player, GrabPlayer)
				GrabPlayer.Value = Player
				Titan.Humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
				local Player = Player
				if Player.Character:FindFirstChild('Grabbed') then
					Player.Character.Grabbed.Value = true
					Player.Character.Humanoid.PlatformStand = true
					Player.Character.Humanoid.WalkSpeed = 0 -- normal walkspeed is (obviously) 16
				end
				if Titan.Aberrant.Value == true then
					Titan.Humanoid.WalkSpeed = math.random(30,35)
				else
					Titan.Humanoid.WalkSpeed = 20
				end
				local Weld = Instance.new("Weld")
				Weld.Part0 = Titan.RightHand
				Weld.Part1 = Player.Character.HumanoidRootPart
				Weld.C0 = CFrame.new(0, -2.5, -5) * CFrame.Angles(0, 0, math.rad(90))
				Weld.Parent = Titan.RightHand
				wait(3)
				if GrabPlayer.Value ~= nil then
					Player.Character.Humanoid.Health = 0
					Weld:Destroy()
					if Titan.Aberrant.Value == true then
						Titan.Humanoid.WalkSpeed = math.random(30,35)
					else
						Titan.Humanoid.WalkSpeed = 20
					end
					GrabPlayer = false
				end
			end
			if Titan.Occupied.Value == false and Titan.GrabPlayer.Value == nil then
				if playerLocation == 'Nape' then
					if Titan.Cooldown.Value == false then
						Titan.Cooldown.Value = true
						Titan.Occupied.Value = true
						Titan.Grabbing.Value = true
						local Anim = Titan.Humanoid:LoadAnimation(game.ReplicatedStorage.TitanAnimations.NapeGrabRight)
						Anim:Play()
						wait(58/30)
						--wait(29/30)
						Titan.Grabbing.Value = false
						Titan.Occupied.Value = false
						wait(Anim.Length)
						Titan.Cooldown.Value = false
					end
				elseif playerLocation == 'Face' then
					if Titan.Cooldown.Value == false then
						Titan.Occupied.Value = true
						Titan.Cooldown.Value = true
						local Anim = Titan.Humanoid:LoadAnimation(game.ReplicatedStorage.TitanAnimations.HeadEatFront)
						Anim:Play()
						wait(33/60)
						Titan.Occupied.Value = false
						wait(3)
						Titan.Cooldown.Value = false
					end
				elseif playerLocation == 'Right Shoulder' then
					if Titan.Cooldown.Value == false then
						Titan.Occupied.Value = true
						Titan.Cooldown.Value = true
						local Anim = Titan.Humanoid:LoadAnimation(game.ReplicatedStorage.TitanAnimations.HeadEatRight)
						Anim:Play()
						wait(27/30)
						Titan.Occupied.Value = false
						wait(1.5)
						Titan.Cooldown.Value = false
					end
				elseif playerLocation == 'Left Shoulder' then
					if Titan.Cooldown.Value == false then
						Titan.Occupied.Value = true
						Titan.Cooldown.Value = true
						local Anim = Titan.Humanoid:LoadAnimation(game.ReplicatedStorage.TitanAnimations.HeadEatLeft)
						Anim:Play()
						wait(27/30)
						Titan.Occupied.Value = false
						wait(1.5)
						Titan.Cooldown.Value = false
					end
				elseif playerLocation == 'Front Legs' then
					if Titan.Cooldown.Value == false then
						Titan.Occupied.Value = true
						Titan.Cooldown.Value = true
						local Anim = nil
						local AttackChoice = math.random(1,5)
						if AttackChoice == 1 then
							Anim = Titan.Humanoid:LoadAnimation(game.ReplicatedStorage.TitanAnimations.LeftStomp)
							Anim:Play()
							wait(27/30)
							local TitanSlam = game.ServerStorage.AOTObjects.TitanSlam:Clone()
							TitanSlam.Parent = game.Workspace.EffectsFolder
							TitanSlam:SetPrimaryPartCFrame(Titan.LeftFoot.CFrame)
							spawn(function()
								 titanSlam(TitanSlam, 10)
							end)
						elseif AttackChoice == 2 then
							Anim = Titan.Humanoid:LoadAnimation(game.ReplicatedStorage.TitanAnimations.RightStomp)
							Anim:Play()
							wait(17/30)
							local TitanSlam = game.ServerStorage.AOTObjects.TitanSlam:Clone()
							TitanSlam.Parent = game.Workspace.EffectsFolder
							TitanSlam:SetPrimaryPartCFrame(Titan.RightFoot.CFrame)
							spawn(function()
								 titanSlam(TitanSlam, 10)
							end)
						elseif AttackChoice >= 3 then
							Titan.Grabbing.Value = true
							Anim = Titan.Humanoid:LoadAnimation(game.ReplicatedStorage.TitanAnimations.FrontGrab)
							Anim:Play()
							wait(18/24)
							Titan.Grabbing.Value = false
							wait(1.5)
						end
						Titan.Occupied.Value = false
						wait(Anim.Length)
						Titan.Cooldown.Value = false
					end
				elseif playerLocation == 'Back Legs' then
					if Titan.Cooldown.Value == false then
						Titan.Occupied.Value = true
						Titan.Cooldown.Value = true
						local Anim = nil
						Titan.Grabbing.Value = true
						if math.random(1,2) == 1 then
							Anim = Titan.Humanoid:LoadAnimation(game.ReplicatedStorage.TitanAnimations.LeftStomp)
							Anim:Play()
							wait(27/30)
							local TitanSlam = game.ServerStorage.AOTObjects.TitanSlam:Clone()
							TitanSlam.Parent = game.Workspace.EffectsFolder
							TitanSlam:SetPrimaryPartCFrame(Titan.LeftFoot.CFrame)
							spawn(function()
								 titanSlam(TitanSlam, 10)
							end)
						else
							Anim = Titan.Humanoid:LoadAnimation(game.ReplicatedStorage.TitanAnimations.RightStomp)
							Anim:Play()
							wait(17/30)
							local TitanSlam = game.ServerStorage.AOTObjects.TitanSlam:Clone()
							TitanSlam.Parent = game.Workspace.EffectsFolder
							TitanSlam:SetPrimaryPartCFrame(Titan.RightFoot.CFrame)
							spawn(function()
								 titanSlam(TitanSlam, 10)
							end)
						end
						Titan.Grabbing.Value = false
						wait(1.5)
						Titan.Occupied.Value = false
						wait(Anim.Length)
						Titan.Cooldown.Value = false
					end
				elseif playerLocation == 'Stummy' then
					if Titan.Cooldown.Value == false then
						Titan.Occupied.Value = true
						Titan.Cooldown.Value = true
						local Anim = nil
						Titan.Grabbing.Value = true
						if math.random(1,2) == 1 then
							Anim = Titan.Humanoid:LoadAnimation(game.ReplicatedStorage.TitanAnimations.LeftStummySweep)
							Anim:Play()
							wait(24/30)
						else
							Anim = Titan.Humanoid:LoadAnimation(game.ReplicatedStorage.TitanAnimations.RightStummySweep)
							Anim:Play()
							wait(24/30)
						end
						Titan.Grabbing.Value = false
						wait(1.5)
						Titan.Occupied.Value = false
						wait(24/30)
						Titan.Cooldown.Value = false
					end
				elseif playerLocation == 'Back' then
					if Titan.Cooldown.Value == false then
						Titan.Occupied.Value = true
						Titan.Cooldown.Value = true
						local Anim = nil
						Titan.Grabbing.Value = true
						if math.random(1,2) == 1 then
							Anim = Titan.Humanoid:LoadAnimation(game.ReplicatedStorage.TitanAnimations.LeftBackSweep)
							Anim:Play()
							wait(24/30)
						else
							Anim = Titan.Humanoid:LoadAnimation(game.ReplicatedStorage.TitanAnimations.RightBackSweep)
							Anim:Play()
							wait(24/30)
						end
						Titan.Grabbing.Value = false
						wait(1.5)
						Titan.Occupied.Value = false
						wait(24/30)
						Titan.Cooldown.Value = false
					end
				elseif playerLocation == 'Noggin' then
					Titan.Occupied.Value = true
					Titan.Cooldown.Value = true
					Titan.Grabbing.Value = true
					local Anim = nil
					if math.random(1,2) == 1 then
						Anim = Titan.Humanoid:LoadAnimation(game.ReplicatedStorage.TitanAnimations.RightHeadSweep)
						Anim:Play()
						wait(29/30)
					else
						Anim = Titan.Humanoid:LoadAnimation(game.ReplicatedStorage.TitanAnimations.LeftHeadSweep)
						Anim:Play()
						wait(29/30)
					end
					
					Titan.Grabbing.Value = false
					wait(1.5)
					Titan.Occupied.Value = false
					wait(29/30)
					Titan.Cooldown.Value = false
				elseif playerLocation == 'Sky' then
					print('Skyreach on')
					Titan.SkyReach.Value = true
					Titan.Occupied.Value = true
					local TitanReach = Titan.Humanoid:LoadAnimation(game.ReplicatedStorage.TitanAnimations.TitanReach)
					TitanReach:Play()
				end
			end
		end
	end
end

local Path = Pathfinding:CreatePath(
	{
		['AgentCanJump'] = false,
		['AgentRadius'] = 5,
	}
)

local function moveTitan(Titan, TitanPoint, SingleDisable)
	local ClosestPlayer = nil
	for num,Player in ipairs(game.Players:GetChildren()) do
		if Player.Character.Humanoid.Health > 0 then
			if ClosestPlayer == nil then
				ClosestPlayer = Player.Character
			elseif Player.Name ~= ClosestPlayer.Name and (Titan.HumanoidRootPart.CFrame.p - Player.Character.HumanoidRootPart.CFrame.p).magnitude < (Titan.HumanoidRootPart.CFrame.p - ClosestPlayer.HumanoidRootPart.CFrame.p).magnitude then
				ClosestPlayer = Player.Character
			end
		end
	end
	-- Pedestrian config v
	for num,NPC in ipairs(game.Workspace.Pedestrians:GetChildren()) do
		if NPC.Humanoid.Health > 0 then
			if ClosestPlayer == nil then
				ClosestPlayer = NPC
			elseif NPC.Name ~= ClosestPlayer.Name and (Titan.HumanoidRootPart.CFrame.p - NPC.HumanoidRootPart.CFrame.p).magnitude < (Titan.HumanoidRootPart.CFrame.p - ClosestPlayer.HumanoidRootPart.CFrame.p).magnitude then
				ClosestPlayer = NPC
			end
		end
	end
	-- Pedestrian config ^ 
	if ClosestPlayer and Titan.Occupied.Value == false and ClosestPlayer.HumanoidRootPart and Titan.GrabPlayer.Value == nil then
		if Titan.HumanoidRootPart.Stomping.IsPlaying == false then
			Titan.HumanoidRootPart.Stomping:Play()
		end
		local SingleWalk = false
		for num,Animation in ipairs(Titan.Humanoid:GetPlayingAnimationTracks()) do
			if Animation.Name == 'TitanWalk' or Animation.Name == 'AberrantRun1' or Animation.Name == 'AberrantRun2' or Animation.Name == 'AberrantRun3' then
				SingleWalk = true
			end
		end
		if SingleWalk == false then
			if Titan.Aberrant.Value == true then
				local TitanWalk = Titan.Humanoid:LoadAnimation(script['AberrantRun'..math.random(1,3)])
				TitanWalk:Play()
			else
				local TitanWalk = Titan.Humanoid:LoadAnimation(script.TitanWalk)
				TitanWalk:Play()
			end
		end
		Titan.Humanoid:MoveTo(ClosestPlayer.HumanoidRootPart.CFrame.p, ClosestPlayer.HumanoidRootPart)
		TitanPoint.CFrame = CFrame.new(Titan.HumanoidRootPart.Position, Vector3.new(ClosestPlayer.HumanoidRootPart.Position.X, Titan.HumanoidRootPart.Position.Y, ClosestPlayer.HumanoidRootPart.Position.Z))
	elseif Titan.Occupied.Value == true or Titan.Cooldown.Value == true then
		for num,Animation in ipairs(Titan.Humanoid:GetPlayingAnimationTracks()) do
			if Animation.Name == 'TitanWalk' or Animation.Name == 'AberrantRun1' or Animation.Name == 'AberrantRun2' or Animation.Name == 'AberrantRun3' then
				Animation:Stop()
			end
		end
		Titan.HumanoidRootPart.Stomping:Stop()
		TitanPoint.CFrame = Titan.PrimaryPart.CFrame
		Titan.Humanoid:MoveTo(Titan.PrimaryPart.CFrame.p,Titan.PrimaryPart)
	end
end

uniqueTitan = 0

function loadTitans()
	for num,Titan in ipairs(TitanFolder:GetChildren()) do
		if Titan:FindFirstChild('TitanLoaded') == nil and Titan:FindFirstChild('HumanoidRootPart') then
			uniqueTitan = uniqueTitan + 1
			local TitanLoaded = Instance.new('NumberValue', Titan)
			TitanLoaded.Name = 'TitanLoaded'
			local Occupied = Instance.new('BoolValue', Titan)
			Occupied.Name = 'Occupied'
			local Cooldown = Instance.new('BoolValue', Titan)
			Cooldown.Name = 'Cooldown'
			local Grabbing = Instance.new('BoolValue', Titan)
			Grabbing.Name = 'Grabbing'
			local GrabPlayer = Instance.new('ObjectValue', Titan)
			GrabPlayer.Name = 'GrabPlayer'
			local SkyReach = Instance.new('BoolValue', Titan)
			SkyReach.Name = 'SkyReach'
			
			local Toga = game.ServerStorage.SaveAOT.Toga:Clone()
			Toga.Parent = Titan
			
			local Aberrant = Instance.new('BoolValue', Titan)
			Aberrant.Name = 'Aberrant'
			local randomScale = math.random(5,11)
			
			if math.random(1,5) == 1 then
				Aberrant.Value = true
				Titan:WaitForChild('HumanoidRootPart')
				Titan.HumanoidRootPart.Stomping.PlaybackSpeed = 1.6
				Titan.Humanoid.MaxHealth = (50 * randomScale) - 200
				Titan.Humanoid.Health = Titan.Humanoid.MaxHealth
			end
			
			local AnimationPlaying = Instance.new('StringValue', Titan)
			AnimationPlaying.Name = 'AnimationPlaying'
			local AnimLength = Instance.new('NumberValue', AnimationPlaying)
			AnimLength.Name = 'AnimLength'
			Titan.Humanoid.AnimationPlayed:connect(function(animTrack)
				AnimLength.Value = animTrack.Length
				AnimationPlaying.Value = animTrack.Name
			end)
			
			TitanLoaded.Value = uniqueTitan
			Titan.Humanoid.BodyWidthScale.Value = randomScale
			Titan.Humanoid.BodyHeightScale.Value = randomScale * 1.3
			Titan.Humanoid.BodyDepthScale.Value = randomScale
			Titan.Humanoid.HeadScale.Value = randomScale
			
			Titan.Humanoid.MaxHealth = 50
			Titan.Humanoid.Health = Titan.Humanoid.MaxHealth
			
			local function touchNPC(Part, TitanPart)
				if Part:FindFirstAncestor('Pedestrians') and Titan.GrabPlayer.Value == nil and Titan.Occupied.Value == true then
					local NPC = Part:FindFirstAncestor('Noble') or Part:FindFirstAncestor('Peasant')
					if (NPC.HumanoidRootPart.Position - TitanPart.Position).magnitude < 30 and NPC:FindFirstChild('Humanoid') then
						-- do stuff
						if Titan.GrabPlayer.Value == nil and Titan.Grabbing.Value == true and Titan.Humanoid.Health > 0 then
							NPC.Humanoid.Jump = true
							Titan.GrabPlayer.Value = Part:FindFirstAncestor(NPC.Name)
							NPC.Humanoid.PlatformStand = true
							NPC.Humanoid.WalkSpeed = 0 -- normal walkspeed is (obviously) 16
							Titan.Humanoid.WalkSpeed = 0 -- normal walkspeed is 20
							local Weld = Instance.new("Weld")
							Weld.Name = 'GrabWeld'
							Weld.Part0 = TitanPart
							Weld.Part1 = NPC.PrimaryPart
							Weld.C0 = CFrame.new(0, TitanPart.Size.Y/2, -TitanPart.Size.Z/2) * CFrame.Angles(0,0,math.rad(180))
							Weld.Parent = Titan.RightHand
							print(Weld, ' Weld is active!')
							local Screams = {138167455, 916566946, 5169626214}
							local ScreamNoise = Instance.new('Sound', NPC.PrimaryPart)
							Debris:AddItem(ScreamNoise, 5)
							ScreamNoise.SoundId = "rbxassetid://" .. Screams[math.random(1, #Screams)]
							ScreamNoise:Play()
							if TitanPart.Name == 'RightHand' then
								local Anim = Titan.Humanoid:LoadAnimation(game.ReplicatedStorage.TitanAnimations.RightEat)
								Anim:Play()
								--wait(90/30)
							elseif TitanPart.Name == 'LeftHand' then
								local Anim = Titan.Humanoid:LoadAnimation(game.ReplicatedStorage.TitanAnimations.LeftEat)
								Anim:Play()
								--wait(90/30)
							end
							wait(90/30)
							print(Weld.Parent, ' is still here!')
							if Titan.GrabPlayer.Value ~= nil and Titan.Humanoid.Health > 0 and NPC:FindFirstChild("Humanoid") then
								NPC.Humanoid.Health = 0
								Weld:Destroy()
								Titan.Humanoid.WalkSpeed = 20
								GrabPlayer = false
							end
							Titan.GrabPlayer.Value = nil
						end
					end
				end
			end
			Titan.RightHand.Touched:connect(function(Part)
				touchNPC(Part, Titan.RightHand)
			end)
			Titan.RightLowerArm.Touched:connect(function(Part)
				touchNPC(Part, Titan.RightHand)
			end)
			Titan.LeftHand.Touched:connect(function(Part)
				touchNPC(Part, Titan.LeftHand)
			end)
			Titan.LeftLowerArm.Touched:connect(function(Part)
				touchNPC(Part, Titan.LeftHand)
			end)
			
			local TitanHair = game.ServerStorage.AOTObjects.TitanHair:GetChildren()[math.random(1,#game.ServerStorage.AOTObjects.TitanHair:GetChildren())]:Clone()
			TitanHair.Handle.Color = Color3.fromRGB(math.random(1,255), math.random(1,255), math.random(1,255))
			Titan.Humanoid:AddAccessory(TitanHair)
			
			Titan:WaitForChild('LegboxHolder')
			local LeftLegSize = Titan.LeftFoot.Size.X + Titan.LeftFoot.Size.X + Titan.LeftUpperLeg.Size.X
			local RightLegSize = Titan.RightFoot.Size.X + Titan.RightFoot.Size.X + Titan.RightUpperLeg.Size.X
			Titan.LegboxHolder.Hitbox.Size = Vector3.new(
				(Titan.RightFoot.Size.X + Titan.RightFoot.Size.X + Titan.RightUpperLeg.Size.X),
				60,
				Titan.RightFoot.Size.Z * 2
			)
			Titan.LegboxHolder.Hitbox.CFrame = Titan.RightFoot.CFrame * CFrame.new(Titan.RightFoot.Size.X/2,Titan.HumanoidRootPart.Size.Y + Titan.LegboxHolder.Hitbox.Size.Y/2,0)
			local Weld = Instance.new('ManualWeld', Titan.HumanoidRootPart)
			Weld.Part0 = Titan.HumanoidRootPart
			Weld.Part1 = Titan.LegboxHolder.Hitbox
			Weld.C0 = CFrame.new()
			Weld.C1 = CFrame.new()
			
			local randomFace = script.Eyes:GetChildren()[math.random(1,#script.Eyes:GetChildren())]
			randomFace:Clone().Parent = Titan.Head
			local randomMouth = script.Mouths:GetChildren()[math.random(1,#script.Mouths:GetChildren())]
			randomMouth:Clone().Parent = Titan.Head
			Titan.Head.TitanHealthUI.Frame.TextLabel.Text = 'Titan ' .. '[' .. randomScale .. 'm]'
			if Titan.Aberrant.Value == true then
				Titan.Head.TitanHealthUI.Frame.TextLabel.Text = 'Aberrant ' .. '[' .. randomScale .. 'm]'
			end
			
			local EyesHolder = Instance.new('Model', Titan)
			EyesHolder.Name = 'EyesHolder'
			local Eyes = Instance.new('Part', EyesHolder)
			Eyes.Transparency = 1
			Eyes.CanCollide = false
			Eyes.Size = Vector3.new(1 * randomScale, 0.5 * randomScale, 0.1 * randomScale)
			Eyes.Name = 'Eyes'
			
			local Weld = Instance.new('ManualWeld', Titan.Head)
			Weld.Part0 = Titan.Head
			Weld.Part1 = Eyes
			Weld.C0 = CFrame.new(0,Titan.Head.Size.Y * 0.25, (-Titan.Head.Size.Z/2) - (Eyes.Size.Z/2))
			Weld.C1 = CFrame.new(0,0,0)
			Weld.Name = 'EyesWeld'
			
			local NapeHolder = Instance.new('Model', Titan)
			NapeHolder.Name = 'NapeHolder'
			local Nape = Instance.new('Part', NapeHolder)
			Nape.CanCollide = false
			Nape.Transparency = 1
			Nape.Size = Vector3.new(1 * randomScale, 1 * randomScale,0.3 * randomScale)
			Nape.Name = 'Nape'
			Nape.BrickColor = Titan.Head.BrickColor
			
			local Weld = Instance.new('ManualWeld', Titan.UpperTorso)
			Weld.Part0 = Titan.UpperTorso
			Weld.Part1 = Nape
			Weld.C0 = CFrame.new(0,Titan.UpperTorso.Size.Y/2, (Titan.UpperTorso.Size.Z/2) - (Nape.Size.Z/2))
			Weld.C1 = CFrame.new(0,0,0)
			Weld.Name = 'NapeWeld'
			
			local LWKHold = Instance.new('Model', Titan)
			LWKHold.Name = 'LWKHold'
			local LeftWeakKnee = Instance.new('Part', LWKHold)
			LeftWeakKnee.CanCollide = false
			LeftWeakKnee.Transparency = 1
			LeftWeakKnee.Size = Vector3.new(1 * randomScale, 1 * randomScale,0.3 * randomScale)
			LeftWeakKnee.BrickColor = Titan.Head.BrickColor
			LeftWeakKnee.Name = 'LeftWeakKnee'
			
			local Weld = Instance.new('ManualWeld', Titan.LeftUpperLeg)
			Weld.Part0 = Titan.LeftUpperLeg
			Weld.Part1 = LeftWeakKnee
			Weld.C0 = CFrame.new(0,-Titan.LeftUpperLeg.Size.Y/2, (Titan.LeftUpperLeg.Size.Z/2) - (LeftWeakKnee.Size.Z/2))
			Weld.C1 = CFrame.new(0,0,0)
			
			
			local RWKHold = Instance.new('Model', Titan)
			RWKHold.Name = 'RWKHold'
			local RightWeakKnee = Instance.new('Part', RWKHold)
			RightWeakKnee.CanCollide = false
			RightWeakKnee.Transparency = 1
			RightWeakKnee.Size = Vector3.new(1 * randomScale, 1 * randomScale,0.3 * randomScale)
			RightWeakKnee.BrickColor = Titan.Head.BrickColor
			RightWeakKnee.Name = 'RightWeakKnee'
			
			local Weld = Instance.new('ManualWeld', Titan.RightUpperLeg)
			Weld.Part0 = Titan.RightUpperLeg
			Weld.Part1 = RightWeakKnee
			Weld.C0 = CFrame.new(0,-Titan.RightUpperLeg.Size.Y/2, (Titan.RightUpperLeg.Size.Z/2) - (RightWeakKnee.Size.Z/2))
			Weld.C1 = CFrame.new(0,0,0)
			
			
			local ClosestPlayer = nil
			local GrabPlayer = false
			Titan:WaitForChild('Humanoid')
			Titan.Humanoid.WalkSpeed = 20
			if Titan.Aberrant.Value == true then
				local TitanWalk = Titan.Humanoid:LoadAnimation(script['AberrantRun'..math.random(1,3)])
				TitanWalk:Play()
				Titan.Humanoid.WalkSpeed = math.random(30,35)
			else
				local TitanWalk = Titan.Humanoid:LoadAnimation(script.TitanWalk)
				TitanWalk:Play()
			end
			
			
			for num,Part in ipairs(Titan:GetDescendants()) do
				if Part:IsA('BasePart') then
					Part:SetNetworkOwner(nil)
				end
			end
			local TitanPoint = Instance.new('BodyGyro', Titan.HumanoidRootPart)
			TitanPoint.MaxTorque = Vector3.new(200,math.huge,200)
			TitanPoint.P = 1500
			TitanPoint.D = 500
			
			
			local TForce = 0
			for num,Part in ipairs(Titan:GetDescendants()) do
				if Part:IsA('BasePart') then
					TForce = TForce + Part:GetMass()
				end
			end
			
			Titan.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
			Titan.Humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding, false)
			Titan.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing, false)
			Titan.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying, false)
			Titan.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming, false)
			Titan.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
			Titan.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
			Titan.Humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics, false)
			Titan.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running, false)
			for num,Steam in ipairs(Titan:GetDescendants()) do
				if Steam.Name == 'Steam' and Steam.ClassName == 'ParticleEmitter' then
					Steam.Enabled = true
				end
			end
			spawn(function()
				Titan:WaitForChild('Humanoid')
				local Enabled = true
				while Enabled == true do
					if Titan:FindFirstChild('Humanoid') == nil then
						Enabled = false
						print('Disabling titan roars!')
					end
					wait(math.random(60,120))
					if Titan:FindFirstChild('Head') and Titan.Occupied.Value == false and Titan.GrabPlayer.Value == nil and Titan.Humanoid.Health > 0 and math.random(1,50) == 7 then
						Titan.Occupied.Value = true
						local Clone = Roars[math.random(1,#Roars)]:Clone()
						Debris:AddItem(Clone, 5)
						local randFactor = math.random(7,10)/10
						Clone.PlaybackSpeed = randFactor
						Clone.Parent = Titan.Head
						Clone:Play()
						local Anim = Titan.Humanoid:LoadAnimation(game.ReplicatedStorage.TitanAnimations.TitanRoar)
						Anim:Play()
						wait(25/30)
						local TitanSlam = game.ServerStorage.AOTObjects.TitanSlam:Clone()
						TitanSlam.Parent = game.Workspace.EffectsFolder
						TitanSlam:SetPrimaryPartCFrame(Titan.Head.CFrame)
						spawn(function()
							 titanSlam(TitanSlam, 10)
						end)
						wait(Clone.TimeLength * (randFactor+1))
						--Clone:Destroy()
						Titan.Occupied.Value = false
					end
				end
			end)
			wait(5)
			for num,Steam in ipairs(Titan:GetDescendants()) do
				if Steam.Name == 'Steam' and Steam.ClassName == 'ParticleEmitter' then
					Steam.Enabled = false
				end
			end
		end
	end
end

wait(5)

game.Workspace:WaitForChild('TitanSpawns')

spawn(function()
	while true do
		if #TitanFolder:GetChildren() < maxTitans then
			for num = #TitanFolder:GetChildren(),maxTitans-1 do
				wait(3)
				local Titan = script.Titan:Clone()
				Titan.Parent = TitanFolder
				local tSp = game.Workspace.TitanSpawns:GetChildren()[math.random(1, #game.Workspace.TitanSpawns:GetChildren())]
				if tSp:IsA('BasePart') then
					Titan:SetPrimaryPartCFrame(tSp.CFrame)
				elseif tSp:IsA('Folder') then
					Titan:SetPrimaryPartCFrame(tSp:GetChildren()[math.random(1, #tSp:GetChildren())].CFrame)
				end
				loadTitans()
			end
		end
		for num,Titan in ipairs(TitanFolder:GetChildren()) do
			if Titan.PrimaryPart == nil then
				Titan:Destroy()
			end
		end
		wait(15)
	end
end)

spawn(function()
	while true do
		wait()
		for num,Titan in ipairs(TitanFolder:GetChildren()) do
			pcall(function()
				local ClosestPlayer = nil
				if Titan:FindFirstChild('Head') and Titan.Head:FindFirstChild('TitanHealthUI') then
					Titan.Head.TitanHealthUI.Frame.GreenBar.Size = UDim2.new(2.48 * Titan.Humanoid.Health/Titan.Humanoid.MaxHealth, 0, 0.31, 0)	
				end
				for num,Player in ipairs(game.Players:GetChildren()) do
					if #game.Players:GetChildren() > 0 and Player.Character.Humanoid.Health > 0 then
						if ClosestPlayer == nil then
							ClosestPlayer = Player.Character
						elseif Player.Name ~= ClosestPlayer.Name and (Titan.HumanoidRootPart.CFrame.p - Player.Character.HumanoidRootPart.CFrame.p).magnitude < (Titan.HumanoidRootPart.CFrame.p - ClosestPlayer.HumanoidRootPart.CFrame.p).magnitude then
							ClosestPlayer = Player.Character
						end
					end
				end
				for num,NPC in ipairs(game.Workspace.Pedestrians:GetChildren()) do
					if NPC.Humanoid.Health > 0 then
						if ClosestPlayer == nil then
							ClosestPlayer = NPC
						elseif NPC.Name ~= ClosestPlayer.Name and (Titan.HumanoidRootPart.CFrame.p - NPC.HumanoidRootPart.CFrame.p).magnitude < (Titan.HumanoidRootPart.CFrame.p - ClosestPlayer.HumanoidRootPart.CFrame.p).magnitude then
							ClosestPlayer = NPC
						end
					end
				end
				--[[if Titan.HumanoidRootPart.Velocity.magnitude > 20 then
					Titan.HumanoidRootPart.Velocity = Titan.HumanoidRootPart.Velocity.unit * 20
				end]]
				if Titan.HumanoidRootPart:FindFirstChild('BodyGyro') then
					spawn(function()
						pcall(function()
							if math.random(1,20) == 1 then
								wait(1)
							end
							moveTitan(Titan, Titan.HumanoidRootPart.BodyGyro)
							handleGrabs(Titan, ClosestPlayer)
						end)
					end)
				end
			end)
		end
	end
end)
