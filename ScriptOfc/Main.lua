function script()
    local group = 4093362
    local function shit(t)
        return t > 12 and t - 12 or t
    end
    game:GetService("RunService").RenderStepped:Connect(
        function()
            local LocalTime = os.date("*t")
            currenttime =
                string.format(
                "%s:%s:%s %s",
                LocalTime.hour >= 10 and shit(LocalTime.hour) or "0" .. tostring(LocalTime.hour),
                LocalTime.min >= 10 and LocalTime.min or "0" .. tostring(LocalTime.min),
                LocalTime.sec >= 10 and LocalTime.sec or "0" .. tostring(LocalTime.sec),
                LocalTime.hour > 12 and "PM" or "AM"
            )
        end
    )

    task.spawn(
        function()
            while autoFarm do
                wait(math.random(5, 220))
                for a, a in pairs(game:GetService("Workspace").Tycoons:GetChildren()) do
                    if a.Owner.Value == tostring(game.Players.LocalPlayer) then
                        for a, a in pairs(a.PlacedContent:GetChildren()) do
                            if a.Name == "Bank Vault" then
                                fireclickdetector(a.Model.Detector.ClickDetector)
                            else
                                if a.Name == "Vending Machine" then
                                    fireclickdetector(a.Model.Click.ClickDetector)
                                else
                                    if a.Name == "Safe" then
                                        fireclickdetector(a.Model.Detector.ClickDetector)
                                    end
                                end
                            end
                        end
                    end
                end

                game:GetService("ReplicatedStorage").Events.SessionRewards:FireServer("Reward1")
                game:GetService("ReplicatedStorage").Events.SessionRewards:FireServer("Reward2")
                game:GetService("ReplicatedStorage").Events.SessionRewards:FireServer("Reward3")
                game:GetService("ReplicatedStorage").Events.SessionRewards:FireServer("Reward4")
                game:GetService("ReplicatedStorage").Events.SessionRewards:FireServer("Reward5")
                rconsoleprint(currenttime .. " - Collected Vaults,Safes and Vending Machines!\n")
            end
        end
    )

    task.spawn(
        function()
            while autoCrate do
                wait(math.random(1, 20))
                local Crate =
                    game.Workspace:FindFirstChild("Godly Crate") or game.Workspace:FindFirstChild("Legendary Crate") or
                    game.Workspace:FindFirstChild("Rainbow Crate") or
                    game.Workspace:FindFirstChild("Dark Matter Crate") or
                    game.Workspace:FindFirstChild("Blazing Crate") or
                    game.Workspace:FindFirstChild("Base Crate")
                if Crate then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Crate.Union.CFrame
                    rconsoleprint(currenttime .. " - Collected Crate\n")
                end
            end
        end
    )

    task.spawn(
        function()
            if antiAFK then
                for i, v in pairs(getconnections(game.Players.LocalPlayer.Idled)) do
                    v:Disable()
                end
            end
        end
    )

    task.spawn(
        function()
            game:GetService("Players").PlayerAdded:Connect(
                function(plr)
                    if plr:IsInGroup(group) and plr:GetRankInGroup(group) >= 101 then
                        game.Players.LocalPlayer:Kick("Staff joined the game.")
                        rconsoleerr(currenttime .. " - Kicked due to a staff joing your game!\n")
                    end
                end
            )
        end
    )

    task.spawn(
        function()
            rconsolename("Base Raiders Script Console")

            rconsoleclear()
            rconsoleprint("@@RED@@")
            rconsoleprint("Thanks for using my script, " .. game.Players.LocalPlayer.Name .. "!\n")
            rconsoleprint("credits to F3X#9092")
            rconsoleprint("Also Eun")
            rconsoleprint("@@WHITE@@")
        end
    )

    task.spawn(
        function()
            if autoFarm then
                rconsoleprint("Auto-Farm Active.\n")
            else
                rconsoleprint("Auto-Farm Disabled.\n")
            end
        end
    )

    task.spawn(
        function()
            if autoCrate then
                rconsoleprint("Auto-Crate Active.\n")
            else
                rconsoleprint("Auto-Crate Disabled.\n")
            end
        end
    )

    task.spawn(
        function()
            if antiAFK then
                rconsoleprint("Anti-AFK Active.\n")
            else
                rconsoleprint("Anti-AFK Disabled.\n")
            end
        end
    )
end
