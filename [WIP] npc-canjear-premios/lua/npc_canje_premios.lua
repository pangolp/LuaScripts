local npcEntry = 200005

function Player:GossipSetText(text, textID)
    local data = CreatePacket(SMSG_NPC_TEXT_UPDATE, 100);
    data:WriteULong(textID or 0x7FFFFFFF)
    for i = 1, MAX_GOSSIP_TEXT_OPTIONS do
        data:WriteFloat(0) -- Probability
        data:WriteString(text) -- Text
        data:WriteString(text) -- Text
        data:WriteULong(0) -- language
        data:WriteULong(0) -- emote
        data:WriteULong(0) -- emote
        data:WriteULong(0) -- emote
        data:WriteULong(0) -- emote
        data:WriteULong(0) -- emote
        data:WriteULong(0) -- emote
    end
    self:SendPacket(data)
end

function OnGossipHello(event, player, object)
	-- Si el jugador tiene un premio asignado y no fue entregado aun.
	query = CharDBQuery("SELECT * FROM `premios` WHERE `player_name`='"..player:GetName().."' AND `entregado`=0;")
	if (query) then
		repeat
			NOMBRE = query:GetString(5)
		until not query:NextRow()
	end
	player:GossipClearMenu()
	player:GossipSetText("Hola $c, soy Luis Ventura, conocido periodista de espectáculos. Estuve en intrusos muchos años, hasta que tuve un intercambio de palabras con quien creí que era mi amigo y compañero de trabajo. Ahora entre muchas actividades, me dedico a darle premios a aquellos que participan de eventos.$B$BSi no tenes ningún premio asignado, por favor continua jugando. Azeroth te necesita.")
	if (NOMBRE) then
		player:GossipMenuAddItem(0, "Me gustaría canjear mi código secreto.", 0, 1, true, "Por favor inserte su código a continuación.")
	end
	player:GossipSendMenu(0x7FFFFFFF, object)
end

function OnGossipSelect(event, player, object, sender, intid, code, menuid)
	if (intid == 1) then
		query = CharDBQuery("SELECT * FROM `premios` WHERE `codigo`="..code.." AND `entregado`=0;")
		if (query) then
			repeat
				ENTRY = query:GetUInt32(1) -- entry del item a entregar
				CANTIDAD = query:GetUInt32(2) -- cantidad del item a entregar
			until not query:NextRow()
		end
		if (ENTRY) then
			CharDBExecute("UPDATE `premios` SET `entregado`=1, `player_guid`="..player:GetGUIDLow()..", `pedido`='"..os.date("%x, %X", os.time()).."' WHERE `codigo`="..code.." AND `player_name`='"..player:GetName().."';");
			player:AddItem(ENTRY, CANTIDAD)
			player:SendAreaTriggerMessage("Felicitaciones. "..player:GetName())
		end
	end
	player:GossipComplete()
end

RegisterCreatureGossipEvent(npcEntry, 1, OnGossipHello)
RegisterCreatureGossipEvent(npcEntry, 2, OnGossipSelect)
