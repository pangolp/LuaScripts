-- Acá iría el entry del npc que pongas en la DB
local npcEntry = 200004

local ALQUIMIA = 171
local DESUELLO = 393
local ENCANTAMIENTO = 333
local HERBORISTERIA = 182
local HERRERIA = 164
local INGENIERIA = 202
local INSCRIPCION = 773
local JOYERIA = 755
local MINERIA = 186
local PELETERIA = 165
local SASTRERIA = 197
local COCINA = 185
local PESCA = 356
local PRIMEROS_AUXILIOS = 129

function OnGossipHello(event, player, object)
	if (player:IsInCombat() == false) then
		player:GossipClearMenu()
		if (player:GetLevel() == 80) then
			if ((player:HasSkill(ALQUIMIA) and (player:GetSkillValue(ALQUIMIA) ~= 450))) then
				player:GossipMenuAddItem(0, '  æ Alquimia 450 æ', 1, 10)
			end
			if ((player:HasSkill(DESUELLO) and (player:GetSkillValue(DESUELLO) ~= 450))) then
				player:GossipMenuAddItem(0, '  æ Desuello 450 æ', 1, 11)
			end
			if ((player:HasSkill(ENCANTAMIENTO) and (player:GetSkillValue(ENCANTAMIENTO) ~= 450))) then
				player:GossipMenuAddItem(0, '  æ Encantamiento 450 æ', 1, 12)
			end
			if ((player:HasSkill(HERRERIA) and (player:GetSkillValue(HERRERIA) ~= 450))) then
				player:GossipMenuAddItem(0, '  æ Herreria 450 æ', 1, 13)
			end
			player:GossipSendMenu(npcEntry, object)
		end
	end
end

function OnGossipSelect(event, player, object, sender, intid, code, menuid)
	if (intid == 10) then
		-- 2259 - ALQUIMIA RANGO 1
		-- 3101 - ALQUIMIA RANGO 2
		-- 3464 - ALQUIMIA RANGO 3
		-- 11611 - ALQUIMIA RANGO 4
		-- 28596 - ALQUIMIA RANGO 5
		-- 51304 - ALQUIMIA RANGO 6
		spells = {3101, 3464, 11611, 28596, 51304}
		for i, spell in ipairs(spells) do
			if (player:HasSpell(spell) == false) then
				player:LearnSpell(spell)
			end
		end
		maxSkill = player:GetMaxSkillValue(ALQUIMIA)
		player:AdvanceSkill(ALQUIMIA, maxSkill)
	end
	if (intid == 11) then
		-- 8617 - DESUELLO RANGO 2
		-- 8618 - DESUELLO RANGO 3
		-- 10768 - DESUELLO RANGO 4
		-- 32678 - DESUELLO RANGO 5
		-- 50305 - DESUELLO RANGO 6
		spells = {8617, 8618, 10768, 32678, 50305}
		for i, spell in ipairs(spells) do
			if (player:HasSpell(spell) == false) then
				player:LearnSpell(spell)
			end
		end
		maxSkill = player:GetMaxSkillValue(DESUELLO)
		player:AdvanceSkill(DESUELLO, maxSkill)
	end
	if (intid == 12) then
		-- 7412 - ENCANTAMIENTO RANGO 2
		-- 7413 - ENCANTAMIENTO RANGO 3
		-- 13920 - ENCANTAMIENTO RANGO 4
		-- 28029 - ENCANTAMIENTO RANGO 5
		-- 51313 - ENCANTAMIENTO RANGO 6
		spells = {7412, 7413, 13920, 28029, 51313}
		for i, spell in ipairs(spells) do
			if (player:HasSpell(spell) == false) then
				player:LearnSpell(spell)
			end
		end
		maxSkill = player:GetMaxSkillValue(ENCANTAMIENTO)
		player:AdvanceSkill(ENCANTAMIENTO, maxSkill)
	end
	if (intid == 13) then
		-- 3100 - HERRERIA RANGO 2
		-- 3538 - HERRERIA RANGO 3
		-- 9785 - HERRERIA RANGO 4
		-- 29844 - HERRERIA RANGO 5
		-- 51300 - HERRERIA RANGO 6
		spells = {3100, 3538, 9785, 29844, 51300}
		for i, spell in ipairs(spells) do
			if (player:HasSpell(spell) == false) then
				player:LearnSpell(spell)
			end
		end
		maxSkill = player:GetMaxSkillValue(HERRERIA)
		player:AdvanceSkill(HERRERIA, maxSkill)
	end
	player:GossipComplete()
end

RegisterCreatureGossipEvent(npcEntry, 1, OnGossipHello)
RegisterCreatureGossipEvent(npcEntry, 2, OnGossipSelect)
