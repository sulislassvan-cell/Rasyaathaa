-- RASYAATHAA AUTO SCRIPT
-- Status + GUI Indicator

-- ===== LOADED CHECK =====
print("Rasyaathaa script loaded")

pcall(function()
    game.StarterGui:SetCore("SendNotification", {
        Title = "Rasyaathaa",
        Text = "Script berhasil dijalankan",
        Duration = 5
    })
end)

-- ===== SERVICES =====
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LP = Players.LocalPlayer

-- ===== STATE =====
local RUNNING = false

-- ===== GUI =====
local gui = Instance.new("ScreenGui")
gui.Name = "RasyaathaaGUI"
gui.Parent = LP:WaitForChild("PlayerGui")

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.fromScale(0.2, 0.15)
frame.Position = UDim2.fromScale(0.4, 0.4)
frame.BackgroundColor3 = Color3.fromRGB(30,30,30)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true

local btn = Instance.new("TextButton", frame)
btn.Size = UDim2.fromScale(0.9, 0.6)
btn.Position = UDim2.fromScale(0.05, 0.2)
btn.Text = "AUTO: OFF"
btn.TextScaled = true
btn.BackgroundColor3 = Color3.fromRGB(180,60,60)
btn.TextColor3 = Color3.new(1,1,1)

-- ===== AUTO FUNCTION (CONTOH COLLECT) =====
task.spawn(function()
    while true do
        if RUNNING then
            -- ganti RemoteEvent sesuai game kamu
            local events = ReplicatedStorage:FindFirstChild("GameEvents")
            if events and events:FindFirstChild("Crops") then
                local collect = events.Crops:FindFirstChild("Collect")
                if collect then
                    collect:FireServer()
                    print("Rasyaathaa: Collect fired")
                end
            end
        end
        task.wait(2)
    end
end)

-- ===== BUTTON =====
btn.MouseButton1Click:Connect(function()
    RUNNING = not RUNNING
    if RUNNING then
        btn.Text = "AUTO: ON"
        btn.BackgroundColor3 = Color3.fromRGB(60,180,60)
        print("Rasyaathaa AUTO ON")
    else
        btn.Text = "AUTO: OFF"
        btn.BackgroundColor3 = Color3.fromRGB(180,60,60)
        print("Rasyaathaa AUTO OFF")
    end
end)
