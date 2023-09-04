SCPs = {"SCP-017", "SCP-049", "SCP-106", "SCP-352", "SCP-457", "SCP096", "SCP-999"}

while wait(1200) do
	for i,v in ipairs(SCPs) do
		if game.Workspace:FindFirstChild(v) then
			if game.Workspace:FindFirstChild(v).ClassName == "Model" and game.Workspace:FindFirstChild(v).PrimaryPart ~= nil then
				game.Workspace:FindFirstChild(v):SetPrimaryPartCFrame(game.Workspace.SCPSpawns:FindFirstChild(v).CFrame)
			end
		end
	end
	local Message = Instance.new("Hint", game.Workspace)
	Message.Text = "SCPs have been placed back in their cells, this will occur every 20 minutes to reduce chaos"
	wait(5)
	Message:Destroy()
end