surface.CreateFont("Respawn_Text", {
    font = "Akbar",
    size = 60,
    weight = 500,
    antialias = true
})

surface.CreateFont("You_died", {
    font = "Roboto",
    size = 80,
    weight = 800,
    antialias = true,
    italic = true,
})

net.Receive("TimeUntilRespawn", function()
    local timeLeft = net.ReadInt(4)
    hook.Add("HUDPaint", "TimeLeft", function()
        draw.DrawText("You have died!", "You_died", ScrW() * 0.507, ScrH() * 0.52, Color(170,0,0,255), TEXT_ALIGN_CENTER)
        draw.DrawText("You will respawn in: ", "Respawn_Text", ScrW() * 0.5, ScrH() * 0.58, Color(210,210,210,255), TEXT_ALIGN_CENTER)
        draw.DrawText(timeLeft, "Respawn_Text", ScrW() * 0.61, ScrH() * 0.58, Color(170,0,0,255), TEXT_ALIGN_CENTER)
    end)
    if timeLeft == 0 then
        hook.Remove("HUDPaint", "TimeLeft")
    end
end)