local timeOfDeath = nil
util.AddNetworkString("TimeUntilRespawn")

hook.Add("PlayerDeath", "identifier", function(ply)
    ply:GetTable().timeOfDeath = CurTime() + 5
    ply:ScreenFade(SCREENFADE.IN, Color(40,0,0,200),5,2.2)
end)

hook.Add("PlayerDeathThink", "StopSpawn", function(ply)
    local timeleft = math.abs(math.Round(CurTime() - ply:GetTable().timeOfDeath, 0))
    net.Start("TimeUntilRespawn")
    net.WriteInt(timeleft, 4)
    net.Send(ply)
    if timeleft == 0 then
        ply:Spawn()
    end
    return false
end)