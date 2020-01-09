-- Acá iría el entry del npc que pongas en la DB
local npcEntry = 200003

local ALIANZA = 0
local HORDA = 1

function OnGossipHello(event, player, object)
	-- Corrobora que el jugador no se encuentre en combate
	if (player:IsInCombat() == false) then
		-- Inicializa el menú del jugador.
		player:GossipClearMenu()
		-- Chequea que el jugador sea de nivel 80.
		if (player:GetLevel() == 80) then
			-- Si el jugador es alianza…
			if (player:GetTeam() == ALIANZA) then
				if (player:GetQuestRewardStatus(12898) == false) then
					player:GossipMenuAddItem(0, '¡Los caballeros de la Espada de Ébano!', 1, 10)
				end
			else
				-- Si el jugador es horda…
				if (player:GetQuestRewardStatus(12899) == false) then
					player:GossipMenuAddItem(0, '¡Los caballeros de la Espada de Ébano!', 1, 10)
				end
			end
		end
		player:GossipSendMenu(npcEntry, object)
	end
end

function OnGossipSelect(event, player, object, sender, intid, code, menuid)
	if (intid == 10) then
		if (player:GetTeam() == ALIANZA) then
			quests = {12887, 12891, 12893, 12896, 12898}
		else
			quests = {12892, 12891, 12893, 12897, 12899}
		end
		for i, quest in ipairs(quests) do
			questRewardStatus = player:GetQuestRewardStatus(quest)
			if (questRewardStatus == false) then
				player:AddQuest(quest)
				player:CompleteQuest(quest)
				player:RewardQuest(quest)
			end
		end
	end -- Misiones de la espalda de ebano.
end

RegisterCreatureGossipEvent(npcEntry, 1, OnGossipHello)
RegisterCreatureGossipEvent(npcEntry, 2, OnGossipSelect)
