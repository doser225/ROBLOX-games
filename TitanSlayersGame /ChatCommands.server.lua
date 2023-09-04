game.Players.PlayerAdded:connect(function(Player)
	if Player.Name == 'doser225' or Player.Name == 'Kyodo' or Player.Name == 'Player1' or Player.Name == 'Player2' then
		Player.Chatted:connect(function(msg)
			
				if msg == 'shifter' then
					_G[Player.Name]['Shifter'] = true
				end
				if msg == 'kill' then
					Player.Character.Humanoid.Health = 0
				end
				if msg == 'money' then
					Player.Money.Value = math.huge
				end
				if msg == 'refill' then
					if Player.Character:FindFirstChild('BladeSupply') then
						Player.Character.BladeSupply.Value = _G[Player.Name]['BladeAmount']
						for num,Blade in ipairs(Player.Character.TorsoSec.LBladeHold:GetChildren()) do
							if Blade.Name == 'SPENT' then
								Blade.Transparency = 0
								Blade.Name = 'Blade'
							end
						end
						for num,Blade in ipairs(Player.Character.TorsoSec.RBladeHold:GetChildren()) do
							if Blade.Name == 'SPENT' then
								Blade.Transparency = 0
								Blade.Name = 'Blade'
							end
						end
					elseif Player.Character:FindFirstChild('APGLoaded') then
						--!! reload ap guns
					end
					Player.Gas.Value = Player.Gas.Value + 1
					wait()
					Player.Gas.Value = Player.Gas.Value - 1
				end
		end)
	end
end)
