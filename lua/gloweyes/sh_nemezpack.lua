if not ( glowEyes ) then
    error("[glowEyes: Nemez Combine Soldiers Pack] GlowEyes is not installed!")
end

print("[GlowEyes] Nemez Combine Soldiers Pack made by eon (bloodycop)")

glowEyes:Register("models/nemez/combine_soldiers/combine_soldier_beta_h.mdl", {
    serverInit = function(self, ent)
        if not ( IsValid(ent) ) then
            return
        end
        
        if ( IsValid(ent.worldGlowSprite) ) then
            ent.worldGlowSprite:Remove()
        end
        
        if ( IsValid(ent.leftEyeGlow) ) then
            ent.leftEyeGlow:Remove()
        end
        
        if ( IsValid(ent.rightEyeGlow) ) then
            ent.rightEyeGlow:Remove()
        end
        
        local attachment = ent:GetAttachment(ent:LookupAttachment("eyes"))
        
        if not ( attachment ) then
            return
        end
        
        local pos = attachment.Pos
        
        local leftEyePos = attachment.Pos
        leftEyePos = leftEyePos + attachment.Ang:Right() * -1.7
        leftEyePos = leftEyePos + attachment.Ang:Forward() * -0.2
        
        local rightEyePos = attachment.Pos
        rightEyePos = rightEyePos + attachment.Ang:Right() * 1.7
        rightEyePos = rightEyePos + attachment.Ang:Forward() * -0.2
        
        local lColor, rColor, gColor = Color(0, 255, 255), Color(0, 255, 255), Color(0, 255, 255)

        if ( self.color and isfunction(self.color) ) then
            lColor, rColor, gColor = self:color(ent)
        end

        ent.leftEyeGlow = ents.Create("env_sprite")
        ent.leftEyeGlow:SetPos(leftEyePos)
        ent.leftEyeGlow:SetParent(ent, ent:LookupAttachment("eyes"))
        ent.leftEyeGlow:SetKeyValue("rendermode", "9")
        ent.leftEyeGlow:SetKeyValue("renderamt", "255")
        ent.leftEyeGlow:SetKeyValue("rendercolor", lColor.r .. " " .. lColor.g .. " " .. lColor.b)
        ent.leftEyeGlow:SetKeyValue("renderfx", "0")
        ent.leftEyeGlow:SetKeyValue("HDRColorScale", "0.5")
        ent.leftEyeGlow:SetKeyValue("model", "sprites/light_glow02_add_noz.vmt")
        ent.leftEyeGlow:SetKeyValue("scale", "0.05")
        ent.leftEyeGlow:Spawn()
        
        ent.rightEyeGlow = ents.Create("env_sprite")
        ent.rightEyeGlow:SetPos(rightEyePos)
        ent.rightEyeGlow:SetParent(ent, ent:LookupAttachment("eyes"))
        ent.rightEyeGlow:SetKeyValue("rendermode", "9")
        ent.rightEyeGlow:SetKeyValue("renderamt", "255")
        ent.rightEyeGlow:SetKeyValue("rendercolor", rColor.r .. " " .. rColor.g .. " " .. rColor.b)
        ent.rightEyeGlow:SetKeyValue("renderfx", "0")
        ent.rightEyeGlow:SetKeyValue("HDRColorScale", "0.5")
        ent.rightEyeGlow:SetKeyValue("model", "sprites/light_glow02_add_noz.vmt")
        ent.rightEyeGlow:SetKeyValue("scale", "0.05")
        ent.rightEyeGlow:Spawn()
        
        ent.worldGlowSprite = ents.Create("env_sprite")
        ent.worldGlowSprite:SetPos(pos)
        ent.worldGlowSprite:SetParent(ent, ent:LookupAttachment("eyes"))
        ent.worldGlowSprite:SetKeyValue("rendermode", "9")
        ent.worldGlowSprite:SetKeyValue("renderamt", "60")
        ent.worldGlowSprite:SetKeyValue("rendercolor", gColor.r .. " " .. gColor.g .. " " .. gColor.b)
        ent.worldGlowSprite:SetKeyValue("renderfx", "0")
        ent.worldGlowSprite:SetKeyValue("HDRColorScale", "1")
        ent.worldGlowSprite:SetKeyValue("model", "sun/overlay.vmt")
        ent.worldGlowSprite:SetKeyValue("scale", "0.2")
        ent.worldGlowSprite:Spawn()

        timer.Simple(0.1, function()
            local glowTable = {}

            if ( IsValid(ent.leftEyeGlow) ) then
                glowTable[#glowTable + 1] = ent.leftEyeGlow
            end

            if ( IsValid(ent.rightEyeGlow) ) then
                glowTable[#glowTable + 1] = ent.rightEyeGlow
            end

            if ( IsValid(ent.worldGlowSprite) ) then
                glowTable[#glowTable + 1] = ent.worldGlowSprite
            end

            net.Start("glowEyes.NetworkLightsToClientside")
                net.WriteEntity(ent)
                net.WriteTable(glowTable)
            net.Broadcast()

            ent.glowEyesTable = glowTable
        end)
    end,
    color = function(self, ent)
        return Color(255, 85, 0), Color(255, 85, 0), Color(255, 85, 0)
    end
})

glowEyes:Register("models/nemez/combine_soldiers/combine_soldier_border_patrol_h.mdl", {
    serverInit = function(self, ent)
        if not ( IsValid(ent) ) then
            return
        end
        
        if ( IsValid(ent.worldGlowSprite) ) then
            ent.worldGlowSprite:Remove()
        end
        
        if ( IsValid(ent.leftEyeGlow) ) then
            ent.leftEyeGlow:Remove()
        end
        
        if ( IsValid(ent.rightEyeGlow) ) then
            ent.rightEyeGlow:Remove()
        end
        
        local attachment = ent:GetAttachment(ent:LookupAttachment("eyes"))
        
        if not ( attachment ) then
            return
        end
        
        local pos = attachment.Pos
        
        local leftEyePos = attachment.Pos
        leftEyePos = leftEyePos + attachment.Ang:Right() * -1.7
        leftEyePos = leftEyePos + attachment.Ang:Forward() * -0.2
        
        local rightEyePos = attachment.Pos
        rightEyePos = rightEyePos + attachment.Ang:Right() * 1.7
        rightEyePos = rightEyePos + attachment.Ang:Forward() * -0.2
        
        local lColor, rColor, gColor = Color(0, 255, 255), Color(0, 255, 255), Color(0, 255, 255)

        if ( self.color and isfunction(self.color) ) then
            lColor, rColor, gColor = self:color(ent)
        end

        ent.leftEyeGlow = ents.Create("env_sprite")
        ent.leftEyeGlow:SetPos(leftEyePos)
        ent.leftEyeGlow:SetParent(ent, ent:LookupAttachment("eyes"))
        ent.leftEyeGlow:SetKeyValue("rendermode", "9")
        ent.leftEyeGlow:SetKeyValue("renderamt", "255")
        ent.leftEyeGlow:SetKeyValue("rendercolor", lColor.r .. " " .. lColor.g .. " " .. lColor.b)
        ent.leftEyeGlow:SetKeyValue("renderfx", "0")
        ent.leftEyeGlow:SetKeyValue("HDRColorScale", "0.5")
        ent.leftEyeGlow:SetKeyValue("model", "sprites/light_glow02_add_noz.vmt")
        ent.leftEyeGlow:SetKeyValue("scale", "0.05")
        ent.leftEyeGlow:Spawn()
        
        ent.rightEyeGlow = ents.Create("env_sprite")
        ent.rightEyeGlow:SetPos(rightEyePos)
        ent.rightEyeGlow:SetParent(ent, ent:LookupAttachment("eyes"))
        ent.rightEyeGlow:SetKeyValue("rendermode", "9")
        ent.rightEyeGlow:SetKeyValue("renderamt", "255")
        ent.rightEyeGlow:SetKeyValue("rendercolor", rColor.r .. " " .. rColor.g .. " " .. rColor.b)
        ent.rightEyeGlow:SetKeyValue("renderfx", "0")
        ent.rightEyeGlow:SetKeyValue("HDRColorScale", "0.5")
        ent.rightEyeGlow:SetKeyValue("model", "sprites/light_glow02_add_noz.vmt")
        ent.rightEyeGlow:SetKeyValue("scale", "0.05")
        ent.rightEyeGlow:Spawn()
        
        ent.worldGlowSprite = ents.Create("env_sprite")
        ent.worldGlowSprite:SetPos(pos)
        ent.worldGlowSprite:SetParent(ent, ent:LookupAttachment("eyes"))
        ent.worldGlowSprite:SetKeyValue("rendermode", "9")
        ent.worldGlowSprite:SetKeyValue("renderamt", "60")
        ent.worldGlowSprite:SetKeyValue("rendercolor", gColor.r .. " " .. gColor.g .. " " .. gColor.b)
        ent.worldGlowSprite:SetKeyValue("renderfx", "0")
        ent.worldGlowSprite:SetKeyValue("HDRColorScale", "1")
        ent.worldGlowSprite:SetKeyValue("model", "sun/overlay.vmt")
        ent.worldGlowSprite:SetKeyValue("scale", "0.2")
        ent.worldGlowSprite:Spawn()

        timer.Simple(0.1, function()
            local glowTable = {}

            if ( IsValid(ent.leftEyeGlow) ) then
                glowTable[#glowTable + 1] = ent.leftEyeGlow
            end

            if ( IsValid(ent.rightEyeGlow) ) then
                glowTable[#glowTable + 1] = ent.rightEyeGlow
            end

            if ( IsValid(ent.worldGlowSprite) ) then
                glowTable[#glowTable + 1] = ent.worldGlowSprite
            end

            net.Start("glowEyes.NetworkLightsToClientside")
                net.WriteEntity(ent)
                net.WriteTable(glowTable)
            net.Broadcast()

            ent.glowEyesTable = glowTable
        end)
    end,
    color = function(self, ent)
        return Color(255, 120, 0), Color(255, 120, 0), Color(255, 120, 0)
    end
})

glowEyes:Register("models/nemez/combine_soldiers/combine_soldier_coordinator_h.mdl", {
    serverInit = function(self, ent)
        if not ( IsValid(ent) ) then
            return
        end
        
        if ( IsValid(ent.worldGlowSprite) ) then
            ent.worldGlowSprite:Remove()
        end
        
        if ( IsValid(ent.leftEyeGlow) ) then
            ent.leftEyeGlow:Remove()
        end
        
        if ( IsValid(ent.rightEyeGlow) ) then
            ent.rightEyeGlow:Remove()
        end
        
        local attachment = ent:GetAttachment(ent:LookupAttachment("eyes"))
        
        if not ( attachment ) then
            return
        end
        
        local pos = attachment.Pos
        
        local leftEyePos = attachment.Pos
        leftEyePos = leftEyePos + attachment.Ang:Right() * -1.7
        leftEyePos = leftEyePos + attachment.Ang:Forward() * -0.2
        
        local rightEyePos = attachment.Pos
        rightEyePos = rightEyePos + attachment.Ang:Right() * 1.7
        rightEyePos = rightEyePos + attachment.Ang:Forward() * -0.2
        
        local lColor, rColor, gColor = Color(0, 255, 255), Color(0, 255, 255), Color(0, 255, 255)

        if ( self.color and isfunction(self.color) ) then
            lColor, rColor, gColor = self:color(ent)
        end

        ent.leftEyeGlow = ents.Create("env_sprite")
        ent.leftEyeGlow:SetPos(leftEyePos)
        ent.leftEyeGlow:SetParent(ent, ent:LookupAttachment("eyes"))
        ent.leftEyeGlow:SetKeyValue("rendermode", "9")
        ent.leftEyeGlow:SetKeyValue("renderamt", "255")
        ent.leftEyeGlow:SetKeyValue("rendercolor", lColor.r .. " " .. lColor.g .. " " .. lColor.b)
        ent.leftEyeGlow:SetKeyValue("renderfx", "0")
        ent.leftEyeGlow:SetKeyValue("HDRColorScale", "0.5")
        ent.leftEyeGlow:SetKeyValue("model", "sprites/light_glow02_add_noz.vmt")
        ent.leftEyeGlow:SetKeyValue("scale", "0.05")
        ent.leftEyeGlow:Spawn()
        
        ent.rightEyeGlow = ents.Create("env_sprite")
        ent.rightEyeGlow:SetPos(rightEyePos)
        ent.rightEyeGlow:SetParent(ent, ent:LookupAttachment("eyes"))
        ent.rightEyeGlow:SetKeyValue("rendermode", "9")
        ent.rightEyeGlow:SetKeyValue("renderamt", "255")
        ent.rightEyeGlow:SetKeyValue("rendercolor", rColor.r .. " " .. rColor.g .. " " .. rColor.b)
        ent.rightEyeGlow:SetKeyValue("renderfx", "0")
        ent.rightEyeGlow:SetKeyValue("HDRColorScale", "0.5")
        ent.rightEyeGlow:SetKeyValue("model", "sprites/light_glow02_add_noz.vmt")
        ent.rightEyeGlow:SetKeyValue("scale", "0.05")
        ent.rightEyeGlow:Spawn()
        
        ent.worldGlowSprite = ents.Create("env_sprite")
        ent.worldGlowSprite:SetPos(pos)
        ent.worldGlowSprite:SetParent(ent, ent:LookupAttachment("eyes"))
        ent.worldGlowSprite:SetKeyValue("rendermode", "9")
        ent.worldGlowSprite:SetKeyValue("renderamt", "60")
        ent.worldGlowSprite:SetKeyValue("rendercolor", gColor.r .. " " .. gColor.g .. " " .. gColor.b)
        ent.worldGlowSprite:SetKeyValue("renderfx", "0")
        ent.worldGlowSprite:SetKeyValue("HDRColorScale", "1")
        ent.worldGlowSprite:SetKeyValue("model", "sun/overlay.vmt")
        ent.worldGlowSprite:SetKeyValue("scale", "0.2")
        ent.worldGlowSprite:Spawn()

        timer.Simple(0.1, function()
            local glowTable = {}

            if ( IsValid(ent.leftEyeGlow) ) then
                glowTable[#glowTable + 1] = ent.leftEyeGlow
            end

            if ( IsValid(ent.rightEyeGlow) ) then
                glowTable[#glowTable + 1] = ent.rightEyeGlow
            end

            if ( IsValid(ent.worldGlowSprite) ) then
                glowTable[#glowTable + 1] = ent.worldGlowSprite
            end

            net.Start("glowEyes.NetworkLightsToClientside")
                net.WriteEntity(ent)
                net.WriteTable(glowTable)
            net.Broadcast()

            ent.glowEyesTable = glowTable
        end)
    end,
    color = function(self, ent)
        return Color(0, 255, 255), Color(0, 255, 255), Color(0, 255, 255)
    end
})

glowEyes:Register("models/nemez/combine_soldiers/combine_soldier_elite_h.mdl", {
    serverInit = function(self, ent)
        if not ( IsValid(ent) ) then
            return
        end
        
        if ( IsValid(ent.worldGlowSprite) ) then
            ent.worldGlowSprite:Remove()
        end
        
        if ( IsValid(ent.leftEyeGlow) ) then
            ent.leftEyeGlow:Remove()
        end
        
        if ( IsValid(ent.rightEyeGlow) ) then
            ent.rightEyeGlow:Remove()
        end
        
        local attachment = ent:GetAttachment(ent:LookupAttachment("eyes"))
        
        if not ( attachment ) then
            return
        end
        
        local pos = attachment.Pos
        pos = pos + attachment.Ang:Forward() * -0.2
        pos = pos + attachment.Ang:Up() * 1
        
        local eyePos = attachment.Pos
        eyePos = eyePos + attachment.Ang:Forward() * -0.2
        eyePos = eyePos + attachment.Ang:Up() * 0.4
        
        local eColor, gColor = Color(255, 0, 0), Color(255, 0, 0)

        if ( self.color and isfunction(self.color) ) then
            eColor, gColor = self:color(ent)
        end

        ent.leftEyeGlow = ents.Create("env_sprite")
        ent.leftEyeGlow:SetPos(eyePos)
        ent.leftEyeGlow:SetParent(ent, ent:LookupAttachment("eyes"))
        ent.leftEyeGlow:SetKeyValue("rendermode", "9")
        ent.leftEyeGlow:SetKeyValue("renderamt", "255")
        ent.leftEyeGlow:SetKeyValue("rendercolor", eColor.r .. " " .. eColor.g .. " " .. eColor.b)
        ent.leftEyeGlow:SetKeyValue("renderfx", "0")
        ent.leftEyeGlow:SetKeyValue("HDRColorScale", "0.5")
        ent.leftEyeGlow:SetKeyValue("model", "sprites/light_glow02_add_noz.vmt")
        ent.leftEyeGlow:SetKeyValue("scale", "0.05")
        ent.leftEyeGlow:Spawn()
        
        ent.worldGlowSprite = ents.Create("env_sprite")
        ent.worldGlowSprite:SetPos(pos)
        ent.worldGlowSprite:SetParent(ent, ent:LookupAttachment("eyes"))
        ent.worldGlowSprite:SetKeyValue("rendermode", "9")
        ent.worldGlowSprite:SetKeyValue("renderamt", "110")
        ent.worldGlowSprite:SetKeyValue("rendercolor", gColor.r .. " " .. gColor.g .. " " .. gColor.b)
        ent.worldGlowSprite:SetKeyValue("renderfx", "0")
        ent.worldGlowSprite:SetKeyValue("HDRColorScale", "1")
        ent.worldGlowSprite:SetKeyValue("model", "sun/overlay.vmt")
        ent.worldGlowSprite:SetKeyValue("scale", "0.2")
        ent.worldGlowSprite:Spawn()
        
        timer.Simple(0.1, function()
            local glowTable = {}

            if ( IsValid(ent.leftEyeGlow) ) then
                glowTable[#glowTable + 1] = ent.leftEyeGlow
            end

            if ( IsValid(ent.worldGlowSprite) ) then
                glowTable[#glowTable + 1] = ent.worldGlowSprite
            end
    
            net.Start("glowEyes.NetworkLightsToClientside")
                net.WriteEntity(ent)
                net.WriteTable(glowTable)
            net.Broadcast()

            ent.glowEyesTable = glowTable
        end)
    end,
    color = function(self, ent)
        return Color(255, 0, 0), Color(255, 0, 0)
    end
})

glowEyes:Register("models/nemez/combine_soldiers/combine_soldier_h.mdl", {
    serverInit = function(self, ent)
        if not ( IsValid(ent) ) then
            return
        end
        
        if ( IsValid(ent.worldGlowSprite) ) then
            ent.worldGlowSprite:Remove()
        end
        
        if ( IsValid(ent.leftEyeGlow) ) then
            ent.leftEyeGlow:Remove()
        end
        
        if ( IsValid(ent.rightEyeGlow) ) then
            ent.rightEyeGlow:Remove()
        end
        
        local attachment = ent:GetAttachment(ent:LookupAttachment("eyes"))
        
        if not ( attachment ) then
            return
        end
        
        local pos = attachment.Pos
        
        local leftEyePos = attachment.Pos
        leftEyePos = leftEyePos + attachment.Ang:Right() * -1.7
        leftEyePos = leftEyePos + attachment.Ang:Forward() * -0.2
        
        local rightEyePos = attachment.Pos
        rightEyePos = rightEyePos + attachment.Ang:Right() * 1.7
        rightEyePos = rightEyePos + attachment.Ang:Forward() * -0.2
        
        local lColor, rColor, gColor = Color(0, 255, 255), Color(0, 255, 255), Color(0, 255, 255)

        if ( self.color and isfunction(self.color) ) then
            lColor, rColor, gColor = self:color(ent)
        end

        ent.leftEyeGlow = ents.Create("env_sprite")
        ent.leftEyeGlow:SetPos(leftEyePos)
        ent.leftEyeGlow:SetParent(ent, ent:LookupAttachment("eyes"))
        ent.leftEyeGlow:SetKeyValue("rendermode", "9")
        ent.leftEyeGlow:SetKeyValue("renderamt", "255")
        ent.leftEyeGlow:SetKeyValue("rendercolor", lColor.r .. " " .. lColor.g .. " " .. lColor.b)
        ent.leftEyeGlow:SetKeyValue("renderfx", "0")
        ent.leftEyeGlow:SetKeyValue("HDRColorScale", "0.5")
        ent.leftEyeGlow:SetKeyValue("model", "sprites/light_glow02_add_noz.vmt")
        ent.leftEyeGlow:SetKeyValue("scale", "0.05")
        ent.leftEyeGlow:Spawn()
        
        ent.rightEyeGlow = ents.Create("env_sprite")
        ent.rightEyeGlow:SetPos(rightEyePos)
        ent.rightEyeGlow:SetParent(ent, ent:LookupAttachment("eyes"))
        ent.rightEyeGlow:SetKeyValue("rendermode", "9")
        ent.rightEyeGlow:SetKeyValue("renderamt", "255")
        ent.rightEyeGlow:SetKeyValue("rendercolor", rColor.r .. " " .. rColor.g .. " " .. rColor.b)
        ent.rightEyeGlow:SetKeyValue("renderfx", "0")
        ent.rightEyeGlow:SetKeyValue("HDRColorScale", "0.5")
        ent.rightEyeGlow:SetKeyValue("model", "sprites/light_glow02_add_noz.vmt")
        ent.rightEyeGlow:SetKeyValue("scale", "0.05")
        ent.rightEyeGlow:Spawn()
        
        ent.worldGlowSprite = ents.Create("env_sprite")
        ent.worldGlowSprite:SetPos(pos)
        ent.worldGlowSprite:SetParent(ent, ent:LookupAttachment("eyes"))
        ent.worldGlowSprite:SetKeyValue("rendermode", "9")
        ent.worldGlowSprite:SetKeyValue("renderamt", "60")
        ent.worldGlowSprite:SetKeyValue("rendercolor", gColor.r .. " " .. gColor.g .. " " .. gColor.b)
        ent.worldGlowSprite:SetKeyValue("renderfx", "0")
        ent.worldGlowSprite:SetKeyValue("HDRColorScale", "1")
        ent.worldGlowSprite:SetKeyValue("model", "sun/overlay.vmt")
        ent.worldGlowSprite:SetKeyValue("scale", "0.2")
        ent.worldGlowSprite:Spawn()

        timer.Simple(0.1, function()
            local glowTable = {}

            if ( IsValid(ent.leftEyeGlow) ) then
                glowTable[#glowTable + 1] = ent.leftEyeGlow
            end

            if ( IsValid(ent.rightEyeGlow) ) then
                glowTable[#glowTable + 1] = ent.rightEyeGlow
            end

            if ( IsValid(ent.worldGlowSprite) ) then
                glowTable[#glowTable + 1] = ent.worldGlowSprite
            end

            net.Start("glowEyes.NetworkLightsToClientside")
                net.WriteEntity(ent)
                net.WriteTable(glowTable)
            net.Broadcast()

            ent.glowEyesTable = glowTable
        end)
    end,
    color = function(self, ent)
        if ( ent:GetSkin() == 1 ) then
            return Color(255, 100, 0), Color(255, 100, 0), Color(255, 100, 0)
        end

        return Color(0, 255, 255), Color(0, 255, 255), Color(0, 255, 255)
    end,
    serverThink = function(self, ent)
        if not ( IsValid(ent) ) then
            return
        end

        if ( ent.glowEyesTable ) then
            for k, v in pairs(ent.glowEyesTable) do
                if not ( IsValid(v) ) then
                    continue
                end

                if ( ent:GetSkin() == 1 ) then
                    v:SetKeyValue("rendercolor", "255 100 0")
                else
                    v:SetKeyValue("rendercolor", "0 255 255")
                end
            end
        end
    end
})

glowEyes:Register("models/nemez/combine_soldiers/combine_soldier_nova_h.mdl", {
    serverInit = function(self, ent)
        if not ( IsValid(ent) ) then
            return
        end
        
        if ( IsValid(ent.worldGlowSprite) ) then
            ent.worldGlowSprite:Remove()
        end
        
        if ( IsValid(ent.leftEyeGlow) ) then
            ent.leftEyeGlow:Remove()
        end
        
        if ( IsValid(ent.rightEyeGlow) ) then
            ent.rightEyeGlow:Remove()
        end
        
        local attachment = ent:GetAttachment(ent:LookupAttachment("eyes"))
        
        if not ( attachment ) then
            return
        end
        
        local pos = attachment.Pos
        
        local leftEyePos = attachment.Pos
        leftEyePos = leftEyePos + attachment.Ang:Right() * -1.7
        leftEyePos = leftEyePos + attachment.Ang:Forward() * -0.2
        
        local rightEyePos = attachment.Pos
        rightEyePos = rightEyePos + attachment.Ang:Right() * 1.7
        rightEyePos = rightEyePos + attachment.Ang:Forward() * -0.2
        
        local lColor, rColor, gColor = Color(0, 255, 255), Color(0, 255, 255), Color(0, 255, 255)

        if ( self.color and isfunction(self.color) ) then
            lColor, rColor, gColor = self:color(ent)
        end

        ent.leftEyeGlow = ents.Create("env_sprite")
        ent.leftEyeGlow:SetPos(leftEyePos)
        ent.leftEyeGlow:SetParent(ent, ent:LookupAttachment("eyes"))
        ent.leftEyeGlow:SetKeyValue("rendermode", "9")
        ent.leftEyeGlow:SetKeyValue("renderamt", "255")
        ent.leftEyeGlow:SetKeyValue("rendercolor", lColor.r .. " " .. lColor.g .. " " .. lColor.b)
        ent.leftEyeGlow:SetKeyValue("renderfx", "0")
        ent.leftEyeGlow:SetKeyValue("HDRColorScale", "0.5")
        ent.leftEyeGlow:SetKeyValue("model", "sprites/light_glow02_add_noz.vmt")
        ent.leftEyeGlow:SetKeyValue("scale", "0.05")
        ent.leftEyeGlow:Spawn()
        
        ent.rightEyeGlow = ents.Create("env_sprite")
        ent.rightEyeGlow:SetPos(rightEyePos)
        ent.rightEyeGlow:SetParent(ent, ent:LookupAttachment("eyes"))
        ent.rightEyeGlow:SetKeyValue("rendermode", "9")
        ent.rightEyeGlow:SetKeyValue("renderamt", "255")
        ent.rightEyeGlow:SetKeyValue("rendercolor", rColor.r .. " " .. rColor.g .. " " .. rColor.b)
        ent.rightEyeGlow:SetKeyValue("renderfx", "0")
        ent.rightEyeGlow:SetKeyValue("HDRColorScale", "0.5")
        ent.rightEyeGlow:SetKeyValue("model", "sprites/light_glow02_add_noz.vmt")
        ent.rightEyeGlow:SetKeyValue("scale", "0.05")
        ent.rightEyeGlow:Spawn()
        
        ent.worldGlowSprite = ents.Create("env_sprite")
        ent.worldGlowSprite:SetPos(pos)
        ent.worldGlowSprite:SetParent(ent, ent:LookupAttachment("eyes"))
        ent.worldGlowSprite:SetKeyValue("rendermode", "9")
        ent.worldGlowSprite:SetKeyValue("renderamt", "60")
        ent.worldGlowSprite:SetKeyValue("rendercolor", gColor.r .. " " .. gColor.g .. " " .. gColor.b)
        ent.worldGlowSprite:SetKeyValue("renderfx", "0")
        ent.worldGlowSprite:SetKeyValue("HDRColorScale", "1")
        ent.worldGlowSprite:SetKeyValue("model", "sun/overlay.vmt")
        ent.worldGlowSprite:SetKeyValue("scale", "0.2")
        ent.worldGlowSprite:Spawn()

        timer.Simple(0.1, function()
            local glowTable = {}

            if ( IsValid(ent.leftEyeGlow) ) then
                glowTable[#glowTable + 1] = ent.leftEyeGlow
            end

            if ( IsValid(ent.rightEyeGlow) ) then
                glowTable[#glowTable + 1] = ent.rightEyeGlow
            end

            if ( IsValid(ent.worldGlowSprite) ) then
                glowTable[#glowTable + 1] = ent.worldGlowSprite
            end

            net.Start("glowEyes.NetworkLightsToClientside")
                net.WriteEntity(ent)
                net.WriteTable(glowTable)
            net.Broadcast()

            ent.glowEyesTable = glowTable
        end)
    end,
    color = function(self, ent)
        if ( ent:GetSkin() == 1 ) then
            return Color(255, 100, 0), Color(255, 100, 0), Color(255, 100, 0)
        end

        return Color(255, 165, 0), Color(255, 165, 0), Color(255, 165, 0)
    end,
    serverThink = function(self, ent)
        if not ( IsValid(ent) ) then
            return
        end

        if ( ent.glowEyesTable ) then
            for k, v in pairs(ent.glowEyesTable) do
                if not ( IsValid(v) ) then
                    continue
                end

                if ( ent:GetSkin() == 1 ) then
                    v:SetKeyValue("rendercolor", "255 100 0")
                else
                    v:SetKeyValue("rendercolor", "255 165 0")
                end
            end
        end
    end
})

glowEyes:Register("models/nemez/combine_soldiers/combine_soldier_recon_h.mdl", {
    serverInit = function(self, ent)
        if not ( IsValid(ent) ) then
            return
        end
        
        if ( IsValid(ent.worldGlowSprite) ) then
            ent.worldGlowSprite:Remove()
        end
        
        if ( IsValid(ent.leftEyeGlow) ) then
            ent.leftEyeGlow:Remove()
        end
        
        if ( IsValid(ent.rightEyeGlow) ) then
            ent.rightEyeGlow:Remove()
        end
        
        local attachment = ent:GetAttachment(ent:LookupAttachment("eyes"))
        
        if not ( attachment ) then
            return
        end
        
        local pos = attachment.Pos
        
        local leftEyePos = attachment.Pos
        leftEyePos = leftEyePos + attachment.Ang:Right() * -1.7
        leftEyePos = leftEyePos + attachment.Ang:Forward() * -0.2
        
        local rightEyePos = attachment.Pos
        rightEyePos = rightEyePos + attachment.Ang:Right() * 1.7
        rightEyePos = rightEyePos + attachment.Ang:Forward() * -0.2
        
        local lColor, rColor, gColor = Color(0, 255, 255), Color(0, 255, 255), Color(0, 255, 255)

        if ( self.color and isfunction(self.color) ) then
            lColor, rColor, gColor = self:color(ent)
        end

        ent.leftEyeGlow = ents.Create("env_sprite")
        ent.leftEyeGlow:SetPos(leftEyePos)
        ent.leftEyeGlow:SetParent(ent, ent:LookupAttachment("eyes"))
        ent.leftEyeGlow:SetKeyValue("rendermode", "9")
        ent.leftEyeGlow:SetKeyValue("renderamt", "255")
        ent.leftEyeGlow:SetKeyValue("rendercolor", lColor.r .. " " .. lColor.g .. " " .. lColor.b)
        ent.leftEyeGlow:SetKeyValue("renderfx", "0")
        ent.leftEyeGlow:SetKeyValue("HDRColorScale", "0.5")
        ent.leftEyeGlow:SetKeyValue("model", "sprites/light_glow02_add_noz.vmt")
        ent.leftEyeGlow:SetKeyValue("scale", "0.05")
        ent.leftEyeGlow:Spawn()
        
        ent.rightEyeGlow = ents.Create("env_sprite")
        ent.rightEyeGlow:SetPos(rightEyePos)
        ent.rightEyeGlow:SetParent(ent, ent:LookupAttachment("eyes"))
        ent.rightEyeGlow:SetKeyValue("rendermode", "9")
        ent.rightEyeGlow:SetKeyValue("renderamt", "255")
        ent.rightEyeGlow:SetKeyValue("rendercolor", rColor.r .. " " .. rColor.g .. " " .. rColor.b)
        ent.rightEyeGlow:SetKeyValue("renderfx", "0")
        ent.rightEyeGlow:SetKeyValue("HDRColorScale", "0.5")
        ent.rightEyeGlow:SetKeyValue("model", "sprites/light_glow02_add_noz.vmt")
        ent.rightEyeGlow:SetKeyValue("scale", "0.05")
        ent.rightEyeGlow:Spawn()
        
        ent.worldGlowSprite = ents.Create("env_sprite")
        ent.worldGlowSprite:SetPos(pos)
        ent.worldGlowSprite:SetParent(ent, ent:LookupAttachment("eyes"))
        ent.worldGlowSprite:SetKeyValue("rendermode", "9")
        ent.worldGlowSprite:SetKeyValue("renderamt", "60")
        ent.worldGlowSprite:SetKeyValue("rendercolor", gColor.r .. " " .. gColor.g .. " " .. gColor.b)
        ent.worldGlowSprite:SetKeyValue("renderfx", "0")
        ent.worldGlowSprite:SetKeyValue("HDRColorScale", "1")
        ent.worldGlowSprite:SetKeyValue("model", "sun/overlay.vmt")
        ent.worldGlowSprite:SetKeyValue("scale", "0.2")
        ent.worldGlowSprite:Spawn()

        timer.Simple(0.1, function()
            local glowTable = {}

            if ( IsValid(ent.leftEyeGlow) ) then
                glowTable[#glowTable + 1] = ent.leftEyeGlow
            end

            if ( IsValid(ent.rightEyeGlow) ) then
                glowTable[#glowTable + 1] = ent.rightEyeGlow
            end

            if ( IsValid(ent.worldGlowSprite) ) then
                glowTable[#glowTable + 1] = ent.worldGlowSprite
            end

            net.Start("glowEyes.NetworkLightsToClientside")
                net.WriteEntity(ent)
                net.WriteTable(glowTable)
            net.Broadcast()

            ent.glowEyesTable = glowTable
        end)
    end,
    color = function(self, ent)
        return Color(255, 200, 0), Color(255, 200, 0), Color(255, 200, 0)
    end
})

glowEyes:Register("models/nemez/combine_soldiers/combine_soldier_urban_h.mdl", {
    serverInit = function(self, ent)
        if not ( IsValid(ent) ) then
            return
        end
        
        if ( IsValid(ent.worldGlowSprite) ) then
            ent.worldGlowSprite:Remove()
        end
        
        if ( IsValid(ent.leftEyeGlow) ) then
            ent.leftEyeGlow:Remove()
        end
        
        if ( IsValid(ent.rightEyeGlow) ) then
            ent.rightEyeGlow:Remove()
        end
        
        local attachment = ent:GetAttachment(ent:LookupAttachment("eyes"))
        
        if not ( attachment ) then
            return
        end
        
        local pos = attachment.Pos
        
        local leftEyePos = attachment.Pos
        leftEyePos = leftEyePos + attachment.Ang:Right() * -1.7
        leftEyePos = leftEyePos + attachment.Ang:Forward() * -0.2
        
        local rightEyePos = attachment.Pos
        rightEyePos = rightEyePos + attachment.Ang:Right() * 1.7
        rightEyePos = rightEyePos + attachment.Ang:Forward() * -0.2
        
        local lColor, rColor, gColor = Color(0, 255, 255), Color(0, 255, 255), Color(0, 255, 255)

        if ( self.color and isfunction(self.color) ) then
            lColor, rColor, gColor = self:color(ent)
        end

        ent.leftEyeGlow = ents.Create("env_sprite")
        ent.leftEyeGlow:SetPos(leftEyePos)
        ent.leftEyeGlow:SetParent(ent, ent:LookupAttachment("eyes"))
        ent.leftEyeGlow:SetKeyValue("rendermode", "9")
        ent.leftEyeGlow:SetKeyValue("renderamt", "255")
        ent.leftEyeGlow:SetKeyValue("rendercolor", lColor.r .. " " .. lColor.g .. " " .. lColor.b)
        ent.leftEyeGlow:SetKeyValue("renderfx", "0")
        ent.leftEyeGlow:SetKeyValue("HDRColorScale", "0.5")
        ent.leftEyeGlow:SetKeyValue("model", "sprites/light_glow02_add_noz.vmt")
        ent.leftEyeGlow:SetKeyValue("scale", "0.05")
        ent.leftEyeGlow:Spawn()
        
        ent.rightEyeGlow = ents.Create("env_sprite")
        ent.rightEyeGlow:SetPos(rightEyePos)
        ent.rightEyeGlow:SetParent(ent, ent:LookupAttachment("eyes"))
        ent.rightEyeGlow:SetKeyValue("rendermode", "9")
        ent.rightEyeGlow:SetKeyValue("renderamt", "255")
        ent.rightEyeGlow:SetKeyValue("rendercolor", rColor.r .. " " .. rColor.g .. " " .. rColor.b)
        ent.rightEyeGlow:SetKeyValue("renderfx", "0")
        ent.rightEyeGlow:SetKeyValue("HDRColorScale", "0.5")
        ent.rightEyeGlow:SetKeyValue("model", "sprites/light_glow02_add_noz.vmt")
        ent.rightEyeGlow:SetKeyValue("scale", "0.05")
        ent.rightEyeGlow:Spawn()
        
        ent.worldGlowSprite = ents.Create("env_sprite")
        ent.worldGlowSprite:SetPos(pos)
        ent.worldGlowSprite:SetParent(ent, ent:LookupAttachment("eyes"))
        ent.worldGlowSprite:SetKeyValue("rendermode", "9")
        ent.worldGlowSprite:SetKeyValue("renderamt", "60")
        ent.worldGlowSprite:SetKeyValue("rendercolor", gColor.r .. " " .. gColor.g .. " " .. gColor.b)
        ent.worldGlowSprite:SetKeyValue("renderfx", "0")
        ent.worldGlowSprite:SetKeyValue("HDRColorScale", "1")
        ent.worldGlowSprite:SetKeyValue("model", "sun/overlay.vmt")
        ent.worldGlowSprite:SetKeyValue("scale", "0.2")
        ent.worldGlowSprite:Spawn()

        timer.Simple(0.1, function()
            local glowTable = {}

            if ( IsValid(ent.leftEyeGlow) ) then
                glowTable[#glowTable + 1] = ent.leftEyeGlow
            end

            if ( IsValid(ent.rightEyeGlow) ) then
                glowTable[#glowTable + 1] = ent.rightEyeGlow
            end

            if ( IsValid(ent.worldGlowSprite) ) then
                glowTable[#glowTable + 1] = ent.worldGlowSprite
            end

            net.Start("glowEyes.NetworkLightsToClientside")
                net.WriteEntity(ent)
                net.WriteTable(glowTable)
            net.Broadcast()

            ent.glowEyesTable = glowTable
        end)
    end,
    color = function(self, ent)
        return Color(255, 55, 55), Color(255, 55, 55), Color(255, 55, 55)
    end
})

glowEyes:Register("models/nemez/combine_soldiers/combine_soldier_urban_shotgunner_h.mdl", {
    serverInit = function(self, ent)
        if not ( IsValid(ent) ) then
            return
        end
        
        if ( IsValid(ent.worldGlowSprite) ) then
            ent.worldGlowSprite:Remove()
        end
        
        if ( IsValid(ent.leftEyeGlow) ) then
            ent.leftEyeGlow:Remove()
        end
        
        if ( IsValid(ent.rightEyeGlow) ) then
            ent.rightEyeGlow:Remove()
        end
        
        local attachment = ent:GetAttachment(ent:LookupAttachment("eyes"))
        
        if not ( attachment ) then
            return
        end
        
        local pos = attachment.Pos
        
        local leftEyePos = attachment.Pos
        leftEyePos = leftEyePos + attachment.Ang:Right() * -1.7
        leftEyePos = leftEyePos + attachment.Ang:Forward() * -0.2
        
        local rightEyePos = attachment.Pos
        rightEyePos = rightEyePos + attachment.Ang:Right() * 1.7
        rightEyePos = rightEyePos + attachment.Ang:Forward() * -0.2
        
        local lColor, rColor, gColor = Color(0, 255, 255), Color(0, 255, 255), Color(0, 255, 255)

        if ( self.color and isfunction(self.color) ) then
            lColor, rColor, gColor = self:color(ent)
        end

        ent.leftEyeGlow = ents.Create("env_sprite")
        ent.leftEyeGlow:SetPos(leftEyePos)
        ent.leftEyeGlow:SetParent(ent, ent:LookupAttachment("eyes"))
        ent.leftEyeGlow:SetKeyValue("rendermode", "9")
        ent.leftEyeGlow:SetKeyValue("renderamt", "255")
        ent.leftEyeGlow:SetKeyValue("rendercolor", lColor.r .. " " .. lColor.g .. " " .. lColor.b)
        ent.leftEyeGlow:SetKeyValue("renderfx", "0")
        ent.leftEyeGlow:SetKeyValue("HDRColorScale", "0.5")
        ent.leftEyeGlow:SetKeyValue("model", "sprites/light_glow02_add_noz.vmt")
        ent.leftEyeGlow:SetKeyValue("scale", "0.05")
        ent.leftEyeGlow:Spawn()
        
        ent.rightEyeGlow = ents.Create("env_sprite")
        ent.rightEyeGlow:SetPos(rightEyePos)
        ent.rightEyeGlow:SetParent(ent, ent:LookupAttachment("eyes"))
        ent.rightEyeGlow:SetKeyValue("rendermode", "9")
        ent.rightEyeGlow:SetKeyValue("renderamt", "255")
        ent.rightEyeGlow:SetKeyValue("rendercolor", rColor.r .. " " .. rColor.g .. " " .. rColor.b)
        ent.rightEyeGlow:SetKeyValue("renderfx", "0")
        ent.rightEyeGlow:SetKeyValue("HDRColorScale", "0.5")
        ent.rightEyeGlow:SetKeyValue("model", "sprites/light_glow02_add_noz.vmt")
        ent.rightEyeGlow:SetKeyValue("scale", "0.05")
        ent.rightEyeGlow:Spawn()
        
        ent.worldGlowSprite = ents.Create("env_sprite")
        ent.worldGlowSprite:SetPos(pos)
        ent.worldGlowSprite:SetParent(ent, ent:LookupAttachment("eyes"))
        ent.worldGlowSprite:SetKeyValue("rendermode", "9")
        ent.worldGlowSprite:SetKeyValue("renderamt", "60")
        ent.worldGlowSprite:SetKeyValue("rendercolor", gColor.r .. " " .. gColor.g .. " " .. gColor.b)
        ent.worldGlowSprite:SetKeyValue("renderfx", "0")
        ent.worldGlowSprite:SetKeyValue("HDRColorScale", "1")
        ent.worldGlowSprite:SetKeyValue("model", "sun/overlay.vmt")
        ent.worldGlowSprite:SetKeyValue("scale", "0.2")
        ent.worldGlowSprite:Spawn()

        timer.Simple(0.1, function()
            local glowTable = {}

            if ( IsValid(ent.leftEyeGlow) ) then
                glowTable[#glowTable + 1] = ent.leftEyeGlow
            end

            if ( IsValid(ent.rightEyeGlow) ) then
                glowTable[#glowTable + 1] = ent.rightEyeGlow
            end

            if ( IsValid(ent.worldGlowSprite) ) then
                glowTable[#glowTable + 1] = ent.worldGlowSprite
            end

            net.Start("glowEyes.NetworkLightsToClientside")
                net.WriteEntity(ent)
                net.WriteTable(glowTable)
            net.Broadcast()

            ent.glowEyesTable = glowTable
        end)
    end,
    color = function(self, ent)
        return Color(255, 85, 0), Color(255, 85, 0), Color(255, 85, 0)
    end
})

glowEyes.Stored["models/nemez/combine_soldiers/combine_soldier_beta_f.mdl"] = glowEyes.Stored["models/nemez/combine_soldiers/combine_soldier_h.mdl"]
glowEyes.Stored["models/nemez/combine_soldiers/combine_soldier_beta_pm.mdl"] = glowEyes.Stored["models/nemez/combine_soldiers/combine_soldier_h.mdl"]
glowEyes.Stored["models/nemez/combine_soldiers/combine_soldier_beta_ragdoll.mdl"] = glowEyes.Stored["models/nemez/combine_soldiers/combine_soldier_h.mdl"]
glowEyes.Stored["models/nemez/combine_soldiers/combine_soldier_border_patrol_pm.mdl"] = glowEyes.Stored["models/nemez/combine_soldiers/combine_soldier_border_patrol_h.mdl"]
glowEyes.Stored["models/nemez/combine_soldiers/combine_soldier_coordinator_pm.mdl"] = glowEyes.Stored["models/nemez/combine_soldiers/combine_soldier_coordinator_h.mdl"]
glowEyes.Stored["models/nemez/combine_soldiers/combine_soldier_elite_f.mdl"] = glowEyes.Stored["models/nemez/combine_soldiers/combine_soldier_elite_h.mdl"]
glowEyes.Stored["models/nemez/combine_soldiers/combine_soldier_elite_pm.mdl"] = glowEyes.Stored["models/nemez/combine_soldiers/combine_soldier_elite_h.mdl"]
glowEyes.Stored["models/nemez/combine_soldiers/combine_soldier_elite_ragdoll.mdl"] = glowEyes.Stored["models/nemez/combine_soldiers/combine_soldier_elite_h.mdl"]
glowEyes.Stored["models/nemez/combine_soldiers/combine_soldier_f.mdl"] = glowEyes.Stored["models/nemez/combine_soldiers/combine_soldier_h.mdl"]
glowEyes.Stored["models/nemez/combine_soldiers/combine_soldier_nova_f.mdl"] = glowEyes.Stored["models/nemez/combine_soldiers/combine_soldier_nova_h.mdl"]
glowEyes.Stored["models/nemez/combine_soldiers/combine_soldier_recon_f.mdl"] = glowEyes.Stored["models/nemez/combine_soldiers/combine_soldier_recon_h.mdl"]
glowEyes.Stored["models/nemez/combine_soldiers/combine_soldier_recon_pm.mdl"] = glowEyes.Stored["models/nemez/combine_soldiers/combine_soldier_recon_h.mdl"]
glowEyes.Stored["models/nemez/combine_soldiers/combine_soldier_recon_ragdoll.mdl"] = glowEyes.Stored["models/nemez/combine_soldiers/combine_soldier_recon_h.mdl"]
glowEyes.Stored["models/nemez/combine_soldiers/combine_soldier_urban_f.mdl"] = glowEyes.Stored["models/nemez/combine_soldiers/combine_soldier_urban_h.mdl"]
glowEyes.Stored["models/nemez/combine_soldiers/combine_soldier_urban_pm.mdl"] = glowEyes.Stored["models/nemez/combine_soldiers/combine_soldier_urban_h.mdl"]
glowEyes.Stored["models/nemez/combine_soldiers/combine_soldier_urban_ragdoll.mdl"] = glowEyes.Stored["models/nemez/combine_soldiers/combine_soldier_urban_h.mdl"]
glowEyes.Stored["models/nemez/combine_soldiers/combine_soldier_urban_shotgunner_f.mdl"] = glowEyes.Stored["models/nemez/combine_soldiers/combine_soldier_urban_shotgunner_h.mdl"]
glowEyes.Stored["models/nemez/combine_soldiers/combine_soldier_urban_shotgunner_pm.mdl"] = glowEyes.Stored["models/nemez/combine_soldiers/combine_soldier_urban_shotgunner_h.mdl"]