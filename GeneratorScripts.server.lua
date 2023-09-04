wait(1)

--[[for i,Engine in ipairs(game.Workspace:GetChildren()) do
	if Engine.Name == "Engine1" or Engine.Name == "Engine2" or Engine.Name == "Engine3" or Engine.Name == "Engine4" then
		local EN = true
		Engine.Enabled.Changed:connect(function()
			if EN == true then
				EN = false
				while wait(math.random(1200, 1800)) do
					Engine.Enabled.Value = false
					if Engine.Name == "Engine1" then
						game.Workspace.GeneratorControls.Lever1.LeverPos.Lever:SetPrimaryPartCFrame(game.Workspace.GeneratorControls.Lever1.LeverPos.LeverDown.PrimaryPart.CFrame)
					elseif Engine.Name == "Engine2" then
						game.Workspace.GeneratorControls.Lever2.LeverPos.Lever:SetPrimaryPartCFrame(game.Workspace.GeneratorControls.Lever2.LeverPos.LeverDown.PrimaryPart.CFrame)
					elseif Engine.Name == "Engine3" then
						game.Workspace.GeneratorControls.Lever3.LeverPos.Lever:SetPrimaryPartCFrame(game.Workspace.GeneratorControls.Lever3.LeverPos.LeverDown.PrimaryPart.CFrame)
					elseif Engine.Name == "Engine4" then
						game.Workspace.GeneratorControls.Lever4.LeverPos.Lever:SetPrimaryPartCFrame(game.Workspace.GeneratorControls.Lever4.LeverPos.LeverDown.PrimaryPart.CFrame)
					end
				end
			end
		end)
	end
end]]

for i,Engine in ipairs(game.Workspace:GetChildren()) do
	if Engine.Name == "Engine1" or Engine.Name == "Engine2" or Engine.Name == "Engine3" or Engine.Name == "Engine4" then
		local UD = true
		Engine.Enabled.Changed:connect(function()
			if Engine.Enabled.Value == true and Engine.Running.Value == false then
				Engine.Running.Value = true
				Engine.Soundbox.Sound.PlaybackSpeed = 0
				Engine.Soundbox.Sound:Play()
				for s = 1,20 do
					wait(0.5)
					Engine.Soundbox.Sound.PlaybackSpeed = Engine.Soundbox.Sound.PlaybackSpeed + 0.05
				end
				for g,Light in ipairs(game.Workspace:GetChildren()) do
					if Light.Name == "Light" then
						if game.Workspace.Engine1.Enabled.Value == true and game.Workspace.Engine2.Enabled.Value == true and game.Workspace.Engine3.Enabled.Value == true and game.Workspace.Engine4.Enabled.Value == true then
							Light.Lightpart.SurfaceLight.Enabled = true
							if Light:FindFirstChild("NeonLightPart") then
								Light.NeonLightPart.Material = Enum.Material.Neon
								Light.NeonLightPart.BrickColor = BrickColor.new("Quill grey")
							elseif Light.Model:FindFirstChild("NeonLightPart") then
								Light.Model.NeonLightPart.Material = Enum.Material.Plastic
								Light.Model.NeonLightPart.BrickColor = BrickColor.new("Quill grey")
							end
						end
					end
					if Light.Name == "Sign" and game.Workspace.Engine1.Enabled.Value == true and game.Workspace.Engine2.Enabled.Value == true and game.Workspace.Engine3.Enabled.Value == true and game.Workspace.Engine4.Enabled.Value == true and Light:FindFirstChild("SurfaceLight") then
						Light.SurfaceLight.Enabled = true
					end
				end
				while Engine.Running.Value == true do
					for i = 1,10 do
						wait()
						if UD == true then
							--[[for a,Piston in ipairs(Engine:GetChildren()) do
								if Piston.Name == "Piston" then
									Piston.CFrame = Piston.CFrame * CFrame.new(0, 0.05, 0)
								elseif Piston.Name == "APiston" then
									Piston.CFrame = Piston.CFrame * CFrame.new(0, 0.05, 0)
								end
							end]]
							if i == 10 then
								UD = false
							end
						elseif UD == false then
							--[[for a,Piston in ipairs(Engine:GetChildren()) do
								if Piston.Name == "Piston" then
									Piston.CFrame = Piston.CFrame * CFrame.new(0, -0.05, 0)
								elseif Piston.Name == "APiston" then
									Piston.CFrame = Piston.CFrame * CFrame.new(0, -0.05, 0)
								end
							end]]
							if i == 10 then
								if Engine.Enabled.Value == false then
									Engine.Soundbox.Sound.PlaybackSpeed = 1
									for s = 1,20 do
										wait(0.5)
										Engine.Soundbox.Sound.PlaybackSpeed = Engine.Soundbox.Sound.PlaybackSpeed - 0.05
									end
									Engine.Soundbox.Sound:Stop()
									Engine.Running.Value = false
									for g,Light in ipairs(game.Workspace:GetChildren()) do
										if Light.Name == "Light" then
											Light.Lightpart.SurfaceLight.Enabled = false
											if Light:FindFirstChild("NeonLightPart") then
												Light.NeonLightPart.Material = Enum.Material.Plastic
												Light.NeonLightPart.BrickColor = BrickColor.new("Really black")
											elseif Light.Model:FindFirstChild("NeonLightPart") then
												Light.Model.NeonLightPart.Material = Enum.Material.Plastic
												Light.Model.NeonLightPart.BrickColor = BrickColor.new("Really black")
											end
										end
										if Light.Name == "Sign" then
											Light.SurfaceLight.Enabled = false
										end
									end
								end
								UD = true
							end
						end
					end
				end
			end
		end)
		Engine.Enabled.Value = true
	end
end

function TurnOff()
	local Hint = Instance.new("Hint", game.Workspace)
	Hint.Text = ""
end

for b,Stat in ipairs(game.Workspace.GeneratorControls:GetChildren()) do
	if Stat.Name == "E2Stat" then
		game.Workspace.Engine2.Running.Changed:connect(function()
			if game.Workspace.Engine2.Running.Value == true then
				Stat.Off.Transparency = 1
				Stat.On.Transparency = 0
			end
			if game.Workspace.Engine2.Running.Value == false then
				Stat.Off.Transparency = 0
				Stat.On.Transparency = 1
			end
		end)
	end
	if Stat.Name == "E1Stat" then
		game.Workspace.Engine1.Running.Changed:connect(function()
			if game.Workspace.Engine1.Running.Value == true then
				Stat.Off.Transparency = 1
				Stat.On.Transparency = 0
			end
			if game.Workspace.Engine1.Running.Value == false then
				Stat.Off.Transparency = 0
				Stat.On.Transparency = 1
			end
		end)
	end
	if Stat.Name == "E3Stat" then
		game.Workspace.Engine3.Running.Changed:connect(function()
			if game.Workspace.Engine3.Running.Value == true then
				Stat.Off.Transparency = 1
				Stat.On.Transparency = 0
			end
			if game.Workspace.Engine3.Running.Value == false then
				Stat.Off.Transparency = 0
				Stat.On.Transparency = 1
			end
		end)
	end
	if Stat.Name == "E4Stat" then
		game.Workspace.Engine4.Running.Changed:connect(function()
			if game.Workspace.Engine4.Running.Value == true then
				Stat.Off.Transparency = 1
				Stat.On.Transparency = 0
			end
			if game.Workspace.Engine4.Running.Value == false then
				Stat.Off.Transparency = 0
				Stat.On.Transparency = 1
			end
		end)
	end
end

for h,Lever in ipairs(game.Workspace.GeneratorControls:GetChildren()) do
	if Lever.Name == "Lever1" then
		local Debounce = true
		Lever.Hitbox.ClickDetector.MouseClick:connect(function(Player)
			if Debounce == true and game.Workspace["E1Breaker"].Destroyed.Value == false then
				Debounce = false
				if game.Workspace.Engine1.Enabled.Value == true then
					game.Workspace.Engine1.Enabled.Value = false
					Lever.LeverPos.Lever:SetPrimaryPartCFrame(Lever.LeverPos.LeverDown.PrimaryPart.CFrame)
				elseif game.Workspace.Engine1.Enabled.Value == false then
					game.Workspace.Engine1.Enabled.Value = true
					Lever.LeverPos.Lever:SetPrimaryPartCFrame(Lever.LeverPos.LeverUp.PrimaryPart.CFrame)
				end
				Debounce = true
			end
		end)
	end
	if Lever.Name == "Lever2" then
		local Debounce = true
		Lever.Hitbox.ClickDetector.MouseClick:connect(function(Player)
			if Debounce == true and game.Workspace["E2Breaker"].Destroyed.Value == false then
				Debounce = false
				if game.Workspace.Engine2.Enabled.Value == true then
					game.Workspace.Engine2.Enabled.Value = false
					Lever.LeverPos.Lever:SetPrimaryPartCFrame(Lever.LeverPos.LeverDown.PrimaryPart.CFrame)
				elseif game.Workspace.Engine2.Enabled.Value == false then
					game.Workspace.Engine2.Enabled.Value = true
					Lever.LeverPos.Lever:SetPrimaryPartCFrame(Lever.LeverPos.LeverUp.PrimaryPart.CFrame)
				end
				Debounce = true
			end
		end)
	end
	if Lever.Name == "Lever3" then
		local Debounce = true
		Lever.Hitbox.ClickDetector.MouseClick:connect(function(Player)
			if Debounce == true and game.Workspace["E3Breaker"].Destroyed.Value == false then
				Debounce = false
				if game.Workspace.Engine3.Enabled.Value == true then
					game.Workspace.Engine3.Enabled.Value = false
					Lever.LeverPos.Lever:SetPrimaryPartCFrame(Lever.LeverPos.LeverDown.PrimaryPart.CFrame)
				elseif game.Workspace.Engine3.Enabled.Value == false then
					game.Workspace.Engine3.Enabled.Value = true
					Lever.LeverPos.Lever:SetPrimaryPartCFrame(Lever.LeverPos.LeverUp.PrimaryPart.CFrame)
				end
				Debounce = true
			end
		end)
	end
	if Lever.Name == "Lever4" then
		local Debounce = true
		Lever.Hitbox.ClickDetector.MouseClick:connect(function(Player)
			if Debounce == true and game.Workspace["E4Breaker"].Destroyed.Value == false then
				Debounce = false
				if game.Workspace.Engine4.Enabled.Value == true then
					game.Workspace.Engine4.Enabled.Value = false
					Lever.LeverPos.Lever:SetPrimaryPartCFrame(Lever.LeverPos.LeverDown.PrimaryPart.CFrame)
				elseif game.Workspace.Engine4.Enabled.Value == false then
					game.Workspace.Engine4.Enabled.Value = true
					Lever.LeverPos.Lever:SetPrimaryPartCFrame(Lever.LeverPos.LeverUp.PrimaryPart.CFrame)
				end
				Debounce = true
			end
		end)
	end
	if Lever.Name == "LeverE" then
		local Debounce = true
		local OF = true
		Lever.Hitbox.ClickDetector.MouseClick:connect(function(Player)
			if Debounce == true then
				Debounce = false
				if OF == true then
					OF = false
					for i,v in ipairs(game.Workspace:GetChildren()) do
						if v.Name == "EmergencyLight" then
							v.EmergencyLightPart.PointLight.Enabled = true
						end
					end
					Lever.LeverPos.Lever:SetPrimaryPartCFrame(Lever.LeverPos.LeverDown.PrimaryPart.CFrame)
				elseif OF == false then
					OF = true
					for i,v in ipairs(game.Workspace:GetChildren()) do
						if v.Name == "EmergencyLight" then
							v.EmergencyLightPart.PointLight.Enabled = false
						end
					end
					Lever.LeverPos.Lever:SetPrimaryPartCFrame(Lever.LeverPos.LeverUp.PrimaryPart.CFrame)
				end
				Debounce = true
			end
		end)
	end
end

for i,Engine in ipairs(game.Workspace:GetChildren()) do
	if Engine.Name == "Engine1" or Engine.Name == "Engine2" or Engine.Name == "Engine3" or Engine.Name == "Engine4" then
		Engine.Enabled.Changed:connect(function()
			if game.Workspace.Engine1.Enabled.Value == true and game.Workspace.Engine2.Enabled.Value == true and game.Workspace.Engine3.Enabled.Value == true and game.Workspace.Engine4.Enabled.Value == true then
				game.Workspace.GeneratorControls.Panel.SurfaceGui.TextLabel.Text = "SYNC: " .. math.random(1, 1000000)
			elseif Engine.Enabled.Value == false then
				game.Workspace.GeneratorControls.Panel.SurfaceGui.TextLabel.Text = "ERROR: Power Down of Facility"
			end
		end)
	end
end

--[[for i,Breaker in ipairs(game.Workspace:GetChildren()) do
	if Breaker.Name == "E1Breaker" or Breaker.Name == "E2Breaker" or Breaker.Name == "E3Breaker" or Breaker.Name == "E4Breaker" then
		Breaker.ClickDetector.MouseClick:connect(function(Player)
			if Player.Backpack:FindFirstChild("Charge") or Player.Character:FindFirstChild("Charge") then
				if Breaker.Usable.Value == false and Breaker.Destroyed.Value == false then
					if Player.Backpack:FindFirstChild("Charge") then
						Player.Backpack.Charge:Destroy()
					end
					if Player.Character:FindFirstChild("Charge") then
						Player.Character.Charge:Destroy()
					end
					Breaker.Usable.Value = true
					local Charge = game.ServerStorage.Equipment.CI["C4"]:Clone()
					Charge.Parent = game.Workspace
					Charge:SetPrimaryPartCFrame(Breaker.CFrame * CFrame.new(0, 0.8, 0))
					Charge.Main.Sound:Play()
					for i = 1,10 do
						Charge.Armed.PointLight.Enabled = false
						Charge.Disarmed.Material = Enum.Material.Plastic
						Charge.Armed.Material = Enum.Material.Plastic
						wait(1)
						Charge.Armed.PointLight.Enabled = true
						Charge.Disarmed.Material = Enum.Material.Plastic
						Charge.Armed.Material = Enum.Material.Neon
					end
					local Explosion = Instance.new("Explosion", game.Workspace)
					Explosion.Position = Breaker.Position
					if Breaker.Name == "E1Breaker" then
						for i,Part in ipairs(game.Workspace.Engine1:GetChildren()) do
							game.Workspace.Engine1.Enabled.Value = false
							if Part.ClassName == "Part" or Part.ClassName == "WedgePart" then
								if Part.BrickColor == BrickColor.new("Deep orange") then
									Part.Material = Enum.Material.CorrodedMetal
								end
							end
						end
					end
					if Breaker.Name == "E2Breaker" then
						for i,Part in ipairs(game.Workspace.Engine2:GetChildren()) do
							game.Workspace.Engine2.Enabled.Value = false
							if Part.ClassName == "Part" or Part.ClassName == "WedgePart" then
								if Part.BrickColor == BrickColor.new("Deep orange") then
									Part.Material = Enum.Material.CorrodedMetal
								end
							end
						end
					end
					if Breaker.Name == "E3Breaker" then
						for i,Part in ipairs(game.Workspace.Engine3:GetChildren()) do
							game.Workspace.Engine3.Enabled.Value = false
							if Part.ClassName == "Part" or Part.ClassName == "WedgePart" then
								if Part.BrickColor == BrickColor.new("Deep orange") then
									Part.Material = Enum.Material.CorrodedMetal
								end
							end
						end
					end
					if Breaker.Name == "E4Breaker" then
						for i,Part in ipairs(game.Workspace.Engine4:GetChildren()) do
							game.Workspace.Engine4.Enabled.Value = false
							if Part.ClassName == "Part" or Part.ClassName == "WedgePart" then
								if Part.BrickColor == BrickColor.new("Deep orange") then
									Part.Material = Enum.Material.CorrodedMetal
								end
							end
						end
					end
					if Breaker.Name == "E1Breaker" then
						game.Workspace.GeneratorControls.Lever1.LeverPos.Lever:SetPrimaryPartCFrame(game.Workspace.GeneratorControls.Lever1.LeverPos.LeverDown.PrimaryPart.CFrame)
					elseif Breaker.Name == "E2Breaker" then
						game.Workspace.GeneratorControls.Lever2.LeverPos.Lever:SetPrimaryPartCFrame(game.Workspace.GeneratorControls.Lever2.LeverPos.LeverDown.PrimaryPart.CFrame)
					elseif Breaker.Name == "E3Breaker" then
						game.Workspace.GeneratorControls.Lever3.LeverPos.Lever:SetPrimaryPartCFrame(game.Workspace.GeneratorControls.Lever3.LeverPos.LeverDown.PrimaryPart.CFrame)
					elseif Breaker.Name == "E4Breaker" then
						game.Workspace.GeneratorControls.Lever4.LeverPos.Lever:SetPrimaryPartCFrame(game.Workspace.GeneratorControls.Lever4.LeverPos.LeverDown.PrimaryPart.CFrame)
					end
					Charge.Main.Sound:Stop()
					Charge:Destroy()
					Breaker.Usable.Value = false
					Breaker.Destroyed.Value = true
				end
			end
		end)
	end
end]]

for i,Breaker in ipairs(game.Workspace:GetChildren()) do
	if Breaker.Name == "E1Breaker" or Breaker.Name == "E2Breaker" or Breaker.Name == "E3Breaker" or Breaker.Name == "E4Breaker" then
		Breaker.ClickDetector.MouseClick:connect(function(Player)
			if Player.Backpack:FindFirstChild("Repair") or Player.Character:FindFirstChild("Repair") then
				if Breaker.Usable.Value == false and Breaker.Destroyed.Value == true then
					Breaker.Usable.Value = true
					game.ServerStorage.Equipment["E&T"].Repairing:Clone().Parent = Player.PlayerGui
					Player.Character.Humanoid.WalkSpeed = 0
					wait(10)
					if Breaker.Name == "E1Breaker" then
						for i,Part in ipairs(game.Workspace.Engine1:GetChildren()) do
							game.Workspace.Engine1.Enabled.Value = true
							if Part.ClassName == "Part" or Part.ClassName == "WedgePart" then
								if Part.BrickColor == BrickColor.new("Deep orange") then
									Part.Material = Enum.Material.Metal
								end
							end
						end
					end
					if Breaker.Name == "E2Breaker" then
						for i,Part in ipairs(game.Workspace.Engine2:GetChildren()) do
							game.Workspace.Engine2.Enabled.Value = true
							if Part.ClassName == "Part" or Part.ClassName == "WedgePart" then
								if Part.BrickColor == BrickColor.new("Deep orange") then
									Part.Material = Enum.Material.Metal
								end
							end
						end
					end
					if Breaker.Name == "E3Breaker" then
						for i,Part in ipairs(game.Workspace.Engine3:GetChildren()) do
							game.Workspace.Engine3.Enabled.Value = true
							if Part.ClassName == "Part" or Part.ClassName == "WedgePart" then
								if Part.BrickColor == BrickColor.new("Deep orange") then
									Part.Material = Enum.Material.Metal
								end
							end
						end
					end
					if Breaker.Name == "E4Breaker" then
						for i,Part in ipairs(game.Workspace.Engine4:GetChildren()) do
							game.Workspace.Engine4.Enabled.Value = true
							if Part.ClassName == "Part" or Part.ClassName == "WedgePart" then
								if Part.BrickColor == BrickColor.new("Deep orange") then
									Part.Material = Enum.Material.Metal
								end
							end
						end
					end
					if Breaker.Name == "E1Breaker" then
						game.Workspace.GeneratorControls.Lever1.LeverPos.Lever:SetPrimaryPartCFrame(game.Workspace.GeneratorControls.Lever1.LeverPos.LeverUp.PrimaryPart.CFrame)
					elseif Breaker.Name == "E2Breaker" then
						game.Workspace.GeneratorControls.Lever2.LeverPos.Lever:SetPrimaryPartCFrame(game.Workspace.GeneratorControls.Lever2.LeverPos.LeverUp.PrimaryPart.CFrame)
					elseif Breaker.Name == "E3Breaker" then
						game.Workspace.GeneratorControls.Lever3.LeverPos.Lever:SetPrimaryPartCFrame(game.Workspace.GeneratorControls.Lever3.LeverPos.LeverUp.PrimaryPart.CFrame)
					elseif Breaker.Name == "E4Breaker" then
						game.Workspace.GeneratorControls.Lever4.LeverPos.Lever:SetPrimaryPartCFrame(game.Workspace.GeneratorControls.Lever4.LeverPos.LeverUp.PrimaryPart.CFrame)
					end
					Breaker.Usable.Value = false
					Breaker.Destroyed.Value = false
					Player.Character.Humanoid.WalkSpeed = 16
				end
			end
		end)
	end
end