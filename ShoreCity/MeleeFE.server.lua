wait(1)

Debris = game:GetService('Debris')

game.ReplicatedStorage.MeleeFE.WeldArm.OnServerEvent:connect(function(Player, RArm, Tool)
	RArm.Transparency = 1
	RArm.CFrame = Player.Character["Right Arm"].CFrame
	local Weld = Instance.new("ManualWeld", Player.Character["Right Arm"])
	Weld.Part0 = RArm
	Weld.Part1 = Player.Character["Right Arm"]
	Weld.C0 = RArm.CFrame
	Weld.C1 = Player.Character["Right Arm"].CFrame
	Tool.Unequipped:connect(function()
		Weld:Remove()
	end)
end)
function game.ReplicatedStorage.MeleeFE.Damage.OnServerInvoke(Player, Knife, Part, Damage)
	Knife.Hit:Play()
	if Part.Parent:FindFirstChild("Humanoid") then
		if Part.Parent:FindFirstChild("Humanoid").Health - Damage < 0 then
			Part.Parent.Humanoid.Health = 10
		elseif Part.Parent:FindFirstChild("Humanoid").Health - Damage > 0 then
			Part.Parent.Humanoid:TakeDamage(Damage)
			wait(0.4)
		end
	end
end

function game.ReplicatedStorage.MeleeFE.ATMSmash.OnServerInvoke(Player, ATM)
	local SmashedATM = game.ServerStorage.GameObjects.DestroyedATM:Clone()
	SmashedATM.Parent = game.Workspace
	SmashedATM:SetPrimaryPartCFrame(ATM.PrimaryPart.CFrame)
	ATM.Parent = game.ServerStorage
	local Explosion = Instance.new("Explosion", game.Workspace)
	Explosion.BlastPressure = 0
	Explosion.BlastRadius = 0
	Explosion.DestroyJointRadiusPercent = 0
	Explosion.Position = SmashedATM.PrimaryPart.Position
	local MoneyBag = game.ServerStorage.GameObjects.MoneyBag:Clone()
	Debris:AddItem(MoneyBag, 10)
	MoneyBag.Parent = game.Workspace
	MoneyBag.CFrame = SmashedATM.PrimaryPart.CFrame * CFrame.new(0, 2, -5)
	MoneyCollect = MoneyBag.ClickDetector.MouseClick:connect(function(PlayerClick)
		game.ReplicatedStorage.Money:FindFirstChild(PlayerClick.UserId).Value = game.ReplicatedStorage.Money:FindFirstChild(PlayerClick.UserId).Value + math.random(500, 2000)
		MoneyBag:Destroy()
		MoneyCollect:Disconnect()
	end)
	wait(100)
	ATM.Parent = game.Workspace
	ATM:SetPrimaryPartCFrame(SmashedATM.PrimaryPart.CFrame)
	SmashedATM:Destroy()
end

function game.ReplicatedStorage.MeleeFE.HammerDamage.OnServerInvoke(Player, HammerHead, Part, Damage)
	HammerHead.Crush:Play()
	local Force = Instance.new("BodyThrust", Part.Parent.Torso)
	Force.Force = Vector3.new(0, 0, 4500)
	Debris:AddItem(Force, 0.3)
	if Part.Parent:FindFirstChild("Humanoid") then
		if Part.Parent:FindFirstChild("Humanoid").Health - Damage < 0 then
			Part.Parent.Humanoid.Health = 10
		elseif Part.Parent:FindFirstChild("Humanoid").Health - Damage > 0 then
			Part.Parent.Humanoid:TakeDamage(Damage)
			wait(0.4)
		end
	end
end

function game.ReplicatedStorage.MeleeFE.WindowBreak.OnServerInvoke(Player, Glass)
	local BrokenGlass = game.ServerStorage.GameObjects.SmashedGlass:Clone()
	BrokenGlass.Parent = game.Workspace
	BrokenGlass:SetPrimaryPartCFrame(Glass.CFrame)
	BrokenGlass.PrimaryPart.Smash:Play()
	Glass.Parent = game.ServerStorage.GameObjects
	wait(10)
	Glass.Parent = game.Workspace
	Glass.CFrame = BrokenGlass.PrimaryPart.CFrame
	BrokenGlass:Destroy()
end

game.ReplicatedStorage.MeleeFE.Sound.OnServerEvent:connect(function(Player, Sound)
	Sound:Play()
end)