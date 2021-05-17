local rocketJump = false
local hop = false

concommand.Add('rJump', function(ply)
    rocketJump = not rocketJump
    if rocketJump then
        print("Rocket Jump has been enabled.")
        for k,v in pairs(player.GetAll()) do
            v:SetAmmo(100,'rpg_round')
            v:SetHealth(100)
        end
    else
        print("Rocket jump has been disabled.")
    end
end)

hook.Add("EntityTakeDamage", "RocketJumps", function(ent,info)
    if rocketJump then
        local attacker = info:GetAttacker()
        if ent:IsPlayer() && ent == attacker && info:IsExplosionDamage() then
            info:ScaleDamage(0)
            local direction = ent:GetAimVector()
            local plyVelocity = ent:GetVelocity()
            ent:SetVelocity(plyVelocity + direction * Vector(0,0,-800))
        elseif info:IsFallDamage() && ent:IsPlayer() && ent:Alive() then
            info:ScaleDamage(math.random())
        end
    end 
end)
