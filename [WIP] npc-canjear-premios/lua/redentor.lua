local Redeemer = {
    Entry = 200005, -- Creature Entry
    ReloadTimer = 120 -- Cache reload timer in seconds
}

function Redeemer.OnGossipHello(event, player, unit)
    player:GossipMenuAddItem(0, "Me gustaría canjear mi código secreto.", 0, 1, true, "Por favor inserte su código a continuación.")
    if(player:IsGM()) then
        player:GossipMenuAddItem(0, "Actualizar caché de código.", 0, 2)
    end
    player:GossipSendMenu(1, unit)
end

function Redeemer.OnGossipSelect(event, player, object, sender, intid, code)
    if(intid == 1) then
        local sCode = tostring(code)
        local t = Redeemer["Cache"][sCode]
        
        if(t) then
            if(t["Creditos etereo"] == 1) then
                player:AddItem(t["38186"], t["10"])
            elseif(t["rtype"] == 2) then
                player:SetKnownTitle(t["entry"])
            elseif(t["rtype"] == 3) then
                player:ModifyMoney(t["count"])
            else
                player:SendAreaTriggerMessage("ERROR: Redención fallida, tipo de redención incorrecto. Informe a los desarrolladores.")
                return;
            end
            
            player:SendAreaTriggerMessage("¡Felicitaciones! ¡Tu código se ha canjeado correctamente!.")
            CharDBExecute("UPDATE redemption SET redeemed=1, player_guid="..player:GetGUIDLow()..", date='"..os.date("%x, %X", os.time()).."' WHERE BINARY passphrase='"..sCode.."';");
            Redeemer["Cache"][sCode] = nil;
        else
            player:SendAreaTriggerMessage("Has ingresado un código no válido o tu código ya ha sido canjeado.")
        end
    elseif(intid == 2) then
        Redeemer.LoadCache()
        player:SendAreaTriggerMessage("Las frases de contraseña disponibles se han actualizad.")
    end
    player:GossipComplete()
end

function Redeemer.LoadCache(event)
    Redeemer["Cache"] = {}
    
    if not(CharDBQuery("SHOW TABLES LIKE 'redemption';")) then
        print("[Eluna Redeemer]: redemption table missing from Character database.")
        print("[Eluna Redeemer]: Inserting table structure, initializing cache.")
        CharDBQuery("CREATE TABLE `redemption` (`passphrase` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL, `type` int(32) NOT NULL DEFAULT '0', `entry` int(32) NOT NULL DEFAULT '0', `count` int(32) NOT NULL DEFAULT '0', `redeemed` int(32) NOT NULL DEFAULT '0', `player_guid` int(32) DEFAULT NULL, `date` varchar(32) DEFAULT NULL, PRIMARY KEY (`passphrase`)) ENGINE=InnoDB DEFAULT CHARSET=utf8;")
        return Redeemer.LoadCache();
    end
    
    local Query = CharDBQuery("SELECT * FROM redemption WHERE redeemed=0;");
    if(Query)then
        repeat
            Redeemer["Cache"][Query:GetString(0)] = {
                -- passphrase
                rtype = Query:GetUInt32(1),
                entry = Query:GetUInt32(2),
                count = Query:GetUInt32(3)
                -- redeemed
                -- player_guid
                -- date
            };
        until not Query:NextRow()
        print("[Eluna Redeemer]: Cache initialized. Loaded "..Query:GetRowCount().." results.")
    else
        print("[Eluna Redeemer]: Cache initialized. No results found.")
    end
end

if(Redeemer.ReloadTimer > 0) then
    Redeemer.LoadCache()
    CreateLuaEvent(Redeemer.LoadCache, Redeemer.ReloadTimer*1000, 0)
else
    Redeemer.LoadCache()
end
RegisterCreatureGossipEvent(Redeemer.Entry, 1, Redeemer.OnGossipHello)
RegisterCreatureGossipEvent(Redeemer.Entry, 2, Redeemer.OnGossipSelect)
