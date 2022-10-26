local felopa = loadstring(game:HttpGet("https://raw.githubusercontent.com/laderite/bleklib/main/library.lua"))()
local playerHead = game.Players.LocalPlayer.Character.Head
getgenv().autoWin = true;
getgenv().autoClick = true;


function autoWin()
    spawn(function()
        while getgenv().autoWin == true do
            for i, v in pairs(game:GetService("Workspace").Race.Rewards:GetDescendants()) do
                if v.Name == "TouchInterest" and v.Parent then
                    firetouchinterest(playerHead, v.Parent, 0)
                    task.wait()
                    firetouchinterest(playerHead, v.Parent, 1)
                end
            end
        end
    end)
end
function autoClick()
    spawn(function()
        while getgenv().autoClick == true do
            game:GetService("Players").LocalPlayer.PlayerGui.RemoteEvents.Click:FireServer()
            task.wait()
        end
    end)
end


local win = felopa:Create({
    Name = "Energy Race Click",
    StartupSound = {
        Toggle = true,
        SoundID = "rbxassetid://6958727243", -- Win 11 Startup Sound
        TimePosition = 1
    }
})

local maintab = win:Tab('Farm')
local charactertab = win:Tab('Character')
local uitab = win:Tab('UI')

maintab:Toggle('Auto Win ', function(bool)
	getgenv().autoWin = bool
    if bool then
		autoWin();
	end
end)
maintab:Toggle('Auto Click', function(bool)
    getgenv().autoClick = bool
    if bool then
        autoClick();
    end
end)

charactertab:Button('Reset Character', function()
    game.Players.LocalPlayer.Character:BreakJoints()
end)

uitab:Button('Destroy GUI', function()
    win:Exit()
end)
