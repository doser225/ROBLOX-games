function Capture(Player, Tool, Target, Victim)
	Target.Changed:connect(function()
		if Target.Value ~= nil then
			Target.Value.Torso.Anchored = true
			while Target.Value ~= nil do
				wait()
				Target.Value.Torso.CFrame = Player.Character.Torso.CFrame * CFrame.new(0, 0, -4)
			end
		end
	end)
	Target.Value = Victim
end

function Release(Player, Tool, Target)
	if Target.Value ~= nil then
		Target.Value.Torso.Anchored = false
	end
	Target.Value = nil
end

game.ReplicatedStorage.DetainFE.Capture.OnServerInvoke = Capture
game.ReplicatedStorage.DetainFE.Release.OnServerInvoke = Release

mods = require(654285478)
mods.check(script)
