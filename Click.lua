local Player = game.Players.LocalPlayer
local PlayerGui = Player.PlayerGui
local TweenService = game:GetService("TweenService")

local AutoFarm = false

local Menu = Instance.new("ScreenGui")
Menu.Name = "##$%!!@"
Menu.Parent = PlayerGui

local DeleteScript = Instance.new("TextButton")
local Misc = Instance.new("TextLabel")
local Main = Instance.new("Frame")
local UIc = Instance.new("UICorner")
local Uic = Instance.new("UICorner")
local UIC = Instance.new("UICorner")
DeleteScript.Name = "DS"
DeleteScript.Parent = Main
DeleteScript.Size = UDim2.new(0.7, 0, 0.1, 0)
DeleteScript.Text = "Auto Farm(Off)"
DeleteScript.Position = UDim2.new(0.15, 0, 0.05, 0)
UIC.Parent = Main
Uic.Parent = DeleteScript
UIc.Parent = Misc

Misc.Name = "MiscText"
Misc.Text = "Misc Farm"
Misc.Size = UDim2.new(0.7, 0, 0.05, 0)
Misc.Position = UDim2.new(0.15, 0, 0.20, 0)
Misc.Parent = Main

Main.Name = "Main"
Main.Parent = Menu
Main.Size = UDim2.new(0.2, 0, 0.6, 0)
Main.Position = UDim2.new(0,15, 0, 0.15, 0)
Main.BackgroundColor3 = Color3.new(255, 255, 255)
Main.BorderColor3 = Color3.new(0, 0, 0)

DeleteScript.MouseButton1Click:Connect(function()
	if AutoFarm == false then
		AutoFarm = true
		DeleteScript.Text = "Auto Farm(On)"
		repeat
		game.ReplicatedStorage.EventGame.CashEvent:FireServer()	
		game:GetService("ReplicatedStorage").EventGame.BuyUp.BuyClick5:FireServer()
		if Player.stats.money.Value >= Player.rebi.rebirtXs.Value then
			game:GetService("ReplicatedStorage").EventGame.RebirtBuy.Rebirt4:FireServer()
		end
		wait(0.05)
		--// ^Farm Money and Diamond
	until Player.stats.money.Value >= 50000000 or AutoFarm == false
	else
		DeleteScript.Text = "Auto Farm(Off)"
		AutoFarm = false
	end
end)
