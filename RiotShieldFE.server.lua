Debris = game:GetService('Debris')

game.ReplicatedStorage.RiotShieldFE.WeldArm.OnServerEvent:connect(function(Player, RiotShield)
	local RArm = RiotShield.RArm
	RArm.Transparency = 1
	RArm.CFrame = Player.Character["Right Arm"].CFrame
	local Weld = Instance.new("ManualWeld", Player.Character["Right Arm"])
	Weld.Part0 = RArm
	Weld.Part1 = Player.Character["Right Arm"]
	Weld.C0 = RArm.CFrame
	Weld.C1 = Player.Character["Right Arm"].CFrame
	RiotShield.Parent.Parent.Parent.Parent.Unequipped:connect(function()
		Weld:Remove()
	end)
end)

game.ReplicatedStorage.RiotShieldFE.Bash.OnServerEvent:connect(function(Player, RiotShield, Victim)
	if game.Players:GetPlayerFromCharacter(Victim) ~= Player then
		Victim.Humanoid:TakeDamage(10)
		Victim.Humanoid.PlatformStand = true
		local Sound = Instance.new("Sound", Victim.Torso)
		Sound.SoundId = "rbxassetid://260430060"
		Sound:Play()
		Debris:AddItem(Sound, Sound.TimeLength)
		Victim.Torso.CFrame = CFrame.new(Victim.Torso.Position, Player.Character.Torso.Position)
		local Thrust = Instance.new("BodyThrust", Victim.Torso)
		Thrust.Force = Vector3.new(0, 0, 10000)
		wait(0.2)
		Thrust:Remove()
		Victim.Humanoid.PlatformStand = false
	end
end)