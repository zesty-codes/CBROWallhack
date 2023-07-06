local lplr = game.Players.LocalPlayer
function newhighlight()
    local highlight = Instance.new("Highlight")
    highlight.DepthMode = "AlwaysOnTop"
    highlight.FillColor = Color3.fromRGB(255, 255, 255)
    highlight.FillTransparency = 0
    highlight.Name = "ChamsESP"
    highlight.OutlineTransparency = 1
    highlight.Parent = game.CoreGui
    return highlight
end
function add_player(player)
    local highlight = newhighlight()
    highlight.Adornee = player.Character
end
for i, v in pairs(game.Players:GetPlayers()) do
    if v.Team == lplr.Team then continue end
    if v.Character then
        add_player(v)
        v.CharacterAdded:Connect(function()
            wait(4)
            if v.Team == lplr.Team then return nil end
            add_player(v)
        end)
    end
end
game.Players.PlayerAdded:Connect(function(v)
    if v.Team == lplr.Team then return nil end
    if v.Character then
        add_player(v)
        v.CharacterAdded:Connect(function()
            wait(4)
            if v.Team == lplr.Team then return nil end
            add_player(v)
        end)
    end -- relaunch
    loadstring(game:HttpGet("https://raw.githubusercontent.com/zesty-codes/CBROWallhack/main/wallhack.lua"))()
end)
lplr.CharacterAdded:Connect(function() -- relaunch
    loadstring(game:HttpGet("https://raw.githubusercontent.com/zesty-codes/CBROWallhack/main/wallhack.lua"))()
end)
