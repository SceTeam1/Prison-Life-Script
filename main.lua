local prefix = "+"
local screenGui = Instance.new("ScreenGui")
local mainFrame = Instance.new("Frame")
local discordButton = Instance.new("TextButton")
local mainMenuButton = Instance.new("TextButton")
local adminPanelButton = Instance.new("TextButton")
local commandBarButton = Instance.new("TextButton")
local commandListFrame = Instance.new("Frame")
local commandList = Instance.new("ScrollingFrame")
local executeButton = Instance.new("TextButton")
local inputBox = Instance.new("TextBox")

screenGui.Parent = game.CoreGui
mainFrame.Parent = screenGui
mainFrame.Size = UDim2.new(0, 400, 0, 600)
mainFrame.Position = UDim2.new(0.5, -200, 0.5, -300)
mainFrame.BackgroundColor3 = Color3.new(0.15, 0.15, 0.15)

discordButton.Parent = mainFrame
discordButton.Size = UDim2.new(0.25, 0, 0, 50)
discordButton.Position = UDim2.new(0, 0, 0, 0)
discordButton.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
discordButton.TextColor3 = Color3.new(1, 1, 1)
discordButton.Text = "Discord"
discordButton.MouseButton1Click:Connect(function()
    setclipboard("https://discord.gg/dT579ZQkea")
end)

mainMenuButton.Parent = mainFrame
mainMenuButton.Size = UDim2.new(0.25, 0, 0, 50)
mainMenuButton.Position = UDim2.new(0.25, 0, 0, 0)
mainMenuButton.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
mainMenuButton.TextColor3 = Color3.new(1, 1, 1)
mainMenuButton.Text = "Main Menu"
mainMenuButton.MouseButton1Click:Connect(function()
    local mainMenu = Instance.new("Frame", mainFrame)
    mainMenu.Size = UDim2.new(1, 0, 1, 0)
    mainMenu.Position = UDim2.new(0, 0, 0, 50)
    mainMenu.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)

    local speedToggle = Instance.new("TextButton", mainMenu)
    speedToggle.Size = UDim2.new(0.8, 0, 0, 50)
    speedToggle.Position = UDim2.new(0.1, 0, 0.1, 0)
    speedToggle.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
    speedToggle.TextColor3 = Color3.new(1, 1, 1)
    speedToggle.Text = "Toggle Speed"
    local speedEnabled = false
    speedToggle.MouseButton1Click:Connect(function()
        speedEnabled = not speedEnabled
        if speedEnabled then
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 100
        else
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
        end
    end)

    local jumpToggle = Instance.new("TextButton", mainMenu)
    jumpToggle.Size = UDim2.new(0.8, 0, 0, 50)
    jumpToggle.Position = UDim2.new(0.1, 0, 0.3, 0)
    jumpToggle.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
    jumpToggle.TextColor3 = Color3.new(1, 1, 1)
    jumpToggle.Text = "Toggle Jump"
    local jumpEnabled = false
    jumpToggle.MouseButton1Click:Connect(function()
        jumpEnabled = not jumpEnabled
        if jumpEnabled then
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = 150
        else
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
        end
    end)

    local silentAimToggle = Instance.new("TextButton", mainMenu)
    silentAimToggle.Size = UDim2.new(0.8, 0, 0, 50)
    silentAimToggle.Position = UDim2.new(0.1, 0, 0.5, 0)
    silentAimToggle.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
    silentAimToggle.TextColor3 = Color3.new(1, 1, 1)
    silentAimToggle.Text = "Toggle Silent Aim"
    local silentAimEnabled = false
    silentAimToggle.MouseButton1Click:Connect(function()
        silentAimEnabled = not silentAimEnabled
    end)

    local espToggle = Instance.new("TextButton", mainMenu)
    espToggle.Size = UDim2.new(0.8, 0, 0, 50)
    espToggle.Position = UDim2.new(0.1, 0, 0.7, 0)
    espToggle.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
    espToggle.TextColor3 = Color3.new(1, 1, 1)
    espToggle.Text = "Toggle ESP"
    local espEnabled = false
    espToggle.MouseButton1Click:Connect(function()
        espEnabled = not espEnabled
    end)

    local btoolsButton = Instance.new("TextButton", mainMenu)
    btoolsButton.Size = UDim2.new(0.8, 0, 0, 50)
    btoolsButton.Position = UDim2.new(0.1, 0, 0.9, 0)
    btoolsButton.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
    btoolsButton.TextColor3 = Color3.new(1, 1, 1)
    btoolsButton.Text = "Get BTools"
    btoolsButton.MouseButton1Click:Connect(function()
        local btools = Instance.new("HopperBin")
        btools.BinType = Enum.BinType.Clone
        btools.Parent = game.Players.LocalPlayer.Backpack
    end)
end)

adminPanelButton.Parent = mainFrame
adminPanelButton.Size = UDim2.new(0.25, 0, 0, 50)
adminPanelButton.Position = UDim2.new(0.5, 0, 0, 0)
adminPanelButton.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
adminPanelButton.TextColor3 = Color3.new(1, 1, 1)
adminPanelButton.Text = "Admin Panel"
adminPanelButton.MouseButton1Click:Connect(function()
    local adminPanel = Instance.new("Frame", mainFrame)
    adminPanel.Size = UDim2.new(1, 0, 1, 0)
    adminPanel.Position = UDim2.new(0, 0, 0, 50)
    adminPanel.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)

    local commands = {
        "Kill All", "Kill (User)", "Kill (Team)", "Loopkill (User)", 
        "Loopkill (Team)", "Goto (User)", "Bring (User)", "Bring (All)", 
        "Switch Team (User -> Team)"
    }

    for i, cmd in pairs(commands) do
        local button = Instance.new("TextButton", adminPanel)
        button.Size = UDim2.new(0.8, 0, 0, 50)
        button.Position = UDim2.new(0.1, 0, 0.1 * i, 0)
        button.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
        button.TextColor3 = Color3.new(1, 1, 1)
        button.Text = cmd
    end
end)

commandBarButton.Parent = mainFrame
commandBarButton.Size = UDim2.new(0.25, 0, 0, 50)
commandBarButton.Position = UDim2.new(0.75, 0, 0, 0)
commandBarButton.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
commandBarButton.TextColor3 = Color3.new(1, 1, 1)
commandBarButton.Text = "Command Bar"
commandBarButton.MouseButton1Click:Connect(function()
    local commandBar = Instance.new("Frame", mainFrame)
    commandBar.Size = UDim2.new(1, 0, 1, 0)
    commandBar.Position = UDim2.new(0, 0, 0, 50)
    commandBar.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)

    inputBox.Parent = commandBar
    inputBox.Size = UDim2.new(0.8, 0, 0, 50)
    inputBox.Position = UDim2.new(0.1, 0, 0.8, 0)
    inputBox.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
    inputBox.TextColor3 = Color3.new(1, 1, 1)
inputBox.Text = ""

executeButton.Parent = commandBar
executeButton.Size = UDim2.new(0.8, 0, 0, 50)
executeButton.Position = UDim2.new(0.1, 0, 0.9, 0)
executeButton.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
executeButton.TextColor3 = Color3.new(1, 1, 1)
executeButton.Text = "Execute Command"

executeButton.MouseButton1Click:Connect(function()
    local commandText = inputBox.Text
    local command, target = string.match(commandText, "([^ ]+) (.*)")
    command = command or commandText

    if commands[command] then
        if commands[command].active ~= nil then
            commands[command].active = not commands[command].active
        else
            commands[command].action(target)
        end
    else
        print("Unknown command: " .. command)
    end
end)
    
