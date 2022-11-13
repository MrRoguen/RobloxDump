local FireEvents = {}

FireEvents.FireClickDetector = function(ClickDetector, Distance, Repeat)
    if ClickDetector:IsA("ClickDetector") then
        Distance = Distance or 0
        Repeat = Repeat or 1
        
        for i = 1, Repeat do
            fireclickdetector(ClickDetector, Distance)
        end
    else
        warn(ClickDetector.Name.." is not a ClickDetector")
    end
end

FireEvents.FireGuiButton = function(GuiButton, LeftClick, Repeat)
    if GuiButton:IsA("GuiButton") then
        Repeat = Repeat or 1
        
        for i = 1, Repeat do
            if LeftClick then
                firesignal(GuiButton.MouseButton1Click)
            else
                firesignal(GuiButton.MouseButton2Click)
            end
        end
    else
        warn(GuiButton.Name.." is not a GuiButton")
    end
end

FireEvents.FireProximityPrompt = function(ProximityPrompt, Skip, Repeat)
    if ProximityPrompt:IsA("ProximityPrompt") then
        local HoldDuration = ProximityPrompt.HoldDuration
        
        if Skip then
            ProximityPrompt.HoldDuration = 0
        end
        
        Repeat = Repeat or 1
        
        for i = 1, Repeat do
            ProximityPrompt:InputHoldBegin()
            
            if not Skip then
                wait(HoldDuration)
            end
            
            ProximityPrompt:InputHoldEnd()
        end
        
        ProximityPrompt.HoldDuration = HoldDuration
    else
        warn(ProximityPrompt.Name.." is not a ProximityPrompt")
    end
end

return FireEvents