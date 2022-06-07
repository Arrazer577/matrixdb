repeat 
    wait()
until game:IsLoaded()
local enemy
local np = {}
game:GetService("Workspace").Others:WaitForChild("NPCSpawns")
for _, v in pairs(game:GetService("Workspace").Others.NPCSpawns:GetChildren()) do
    table.insert(np,v.Name)
end
local Venyx = loadstring(game:HttpGet("https://raw.githubusercontent.com/Stefanuk12/Venyx-UI-Library/main/source2.lua"))()
local UI = Venyx.new({
    title = "Matrix"
})

local Auto = UI:addPage({
    title = "Auto Farm",
    icon = 9839043920
})


local AutoFarm = Auto:addSection({
    title = "Auto Farm"
})
local AutoRebirth = Auto:addSection({
    title = "Auto Rebirth"
})
AutoFarm:addDropdown({
    title = "Enemigos",
    list = np,
    callback = function(np)
        enemy = np
    end
})


AutoFarm:addToggle({
    title = "Farm",
    callback = function(Farm)
        getgenv().farmear = Farm
        while getgenv().farmear == true  do
            wait()
            game:GetService("Workspace").Living:WaitForChild(enemy)
        for _, v2 in pairs(game:GetService("Workspace").Living:GetChildren()) do
            if getgenv().farmear == true then
                 if v2.Name == enemy then
                    if v2:FindFirstChild("LastHit") then
                        if v2.Humanoid.Health >= 0 then
                            repeat
                                if getgenv().farmear == true then
                                    wait()
                                for _, valor in pairs(game:GetService("ReplicatedStorage").Datas:GetChildren()) do
                                  if  getgenv().farmear == true then
                                    if tostring(valor) == tostring(game.Players.LocalPlayer.UserId) then
                                      for _, valor2 in pairs(valor:GetChildren()) do
                                        if valor2.Name == "Quest" then
                                          if valor2.Value == "" then
                                            if enemy == "X Fighter" then
                                                game:GetService("ReplicatedStorage").Package.Events.Qaction:InvokeServer(workspace.Others.NPCs["X Fighter Trainer"])
                                                wait()
                                            else game:GetService("ReplicatedStorage").Package.Events.Qaction:InvokeServer(workspace.Others.NPCs[enemy])
                                                wait()
                                            end
                                          end
                                        end
                                      end
                                    end
                                    end
                                  end
                                  task.spawn(function()
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v2.HumanoidRootPart.CFrame + v2.HumanoidRootPart.CFrame.lookVector * -1
                                    game:GetService("ReplicatedStorage").Package.Events.p:FireServer("Blacknwhite27",1)
                                    game:GetService("ReplicatedStorage").Package.Events.p:FireServer("Blacknwhite27",2)
                                    game:GetService("ReplicatedStorage").Package.Events.p:FireServer("Blacknwhite27",3)
                                    game:GetService("ReplicatedStorage").Package.Events.p:FireServer("Blacknwhite27",4)
                                  end)           
                                   end
                                until  getgenv().farmear == false or v2.Humanoid.Health <= 0
                                if v2.Humanoid.Health <= 0 then
                                v2.LastHit:Destroy()
                                end
                        end
                    end
                end
                end
            end
            end
    end
})
AutoRebirth:addToggle({
    title = "Rebirth",
    callback = function(Rebirth)
        getgenv().reb = Rebirth
        while getgenv().reb == true do
        wait(10)
        game:GetService("ReplicatedStorage").Package.Events.reb:InvokeServer()
        end

    end
})

UI:SelectPage({
    page = UI.pages[1], 
    toggle = true
})

local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   wait(1)
   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

game:GetService("RunService").RenderStepped:connect(function()
    
    local Themes = {
        Background = Color3.fromRGB(24, 24, 24),
        Glow = Color3.fromRGB(0, 0, 0),
        Accent = Color3.fromRGB(10, 10, 10),
        LightContrast = Color3.fromRGB(20, 20, 20),
        DarkContrast = Color3.fromRGB(14, 14, 14),  
        TextColor = Color3.fromHSV(tick() * 24 % 255/255, 1, 1)
    }
    
    for i, v in pairs(Themes) do
        UI:setTheme({
            theme = i,
            color3 = v
        })
    end
end)
