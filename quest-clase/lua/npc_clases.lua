-- Acá iría el entry del npc que pongas en la DB
local npcEntry = 200001

-- Razas
local HUMANO = 1
local ORCO = 2
local ENANO = 3
local ELFO_NOCTURNO = 4
local NO_MUERTO = 5
local TAUREN = 6
local GNOMO = 7
local TROLL = 8
local ELFO_DE_SANGRE = 10
local DRAENEI = 11

-- Clases
local GUERRERO = 1
local PALADIN = 2
local CAZADOR = 3
local PICARO = 4
local SACERDOTE = 5
local CABALLERO_DE_LA_MUERTE = 6
local CHAMAN = 7
local MAGO = 8
local BRUJO = 9
local DRUIDA = 11

function OnGossipHello(event, player, object)
    if (player:IsInCombat() == false) then
        player:GossipClearMenu()
            teamId = player:GetTeam()
            if (teamId == 0) then
                if (player:GetClass() == PALADIN) then
                    if (player:GetRace() == HUMANO) then
                        if (player:GetQuestRewardStatus(1788) == false) then
                            player:GossipMenuAddItem(0, 'Redención paladín humano', 1, 10)
                        end -- si no tiene que quest completa
                    end -- si no es humano
                    if (player:GetRace() == ENANO) then
                        if (player:GetQuestRewardStatus(1785) == false) then
                            player:GossipMenuAddItem(0, 'Redención paladín enano', 1, 11)
                        end -- si no tiene que quest completa
                    end -- si no es enano
                    if (player:GetRace() == DRAENEI) then
                        if (player:GetQuestRewardStatus(9600) == false) then
                            player:GossipMenuAddItem(0, 'Redención paladín draenei', 1, 12)
                        end -- si no tiene que quest completa
                    end -- si no es draenei
                end -- si no es paladin
            end -- si no es alianza
            if (teamId == 1) then
                if (player:GetClass() == PALADIN) then
                    if (player:GetRace() == ELFO_DE_SANGRE) then
                        if (player:GetQuestRewardStatus(9685) == false) then
                            player:GossipMenuAddItem(0, 'Redención elfo de sangre', 1, 13)
                        end -- si no tiene que quest completa
                    end -- si no es elfo de sangre
                end -- si no es paladin
            end -- si no es horda
        player:GossipSendMenu(npcEntry, object)
    end
end

function OnGossipSelect(event, player, object, sender, intid, code, menuid)
    if (intid == 10) then
        quests = {2998, 1641, 1642, 1643, 1644, 1780, 1781, 1786, 1787, 1788}
        for i, quest in ipairs(quests) do
            questRewardStatus = player:GetQuestRewardStatus(quest)
            if (questRewardStatus == false) then
                player:AddQuest(quest)
                player:CompleteQuest(quest)
                player:RewardQuest(quest)
            end
        end
        player:GossipComplete()
    end
    if (intid == 11) then
        quests = {2997, 1645, 1646, 1647, 1648, 1778, 1779, 1783, 1784, 1785}
        for i, quest in ipairs(quests) do
            questRewardStatus = player:GetQuestRewardStatus(quest)
            if (questRewardStatus == false) then
                player:AddQuest(quest)
                player:CompleteQuest(quest)
                player:RewardQuest(quest)
            end
        end
        player:GossipComplete()
    end
    if (intid == 12) then
        quests = {10366, 9598, 9600}
        for i, quest in ipairs(quests) do
            questRewardStatus = player:GetQuestRewardStatus(quest)
            if (questRewardStatus == false) then
                player:AddQuest(quest)
                player:CompleteQuest(quest)
                player:RewardQuest(quest)
            end
        end
        player:GossipComplete()
    end
    if (intid == 13) then
        quests = {9677, 9678, 9681, 9684, 9685}
        for i, quest in ipairs(quests) do
            questRewardStatus = player:GetQuestRewardStatus(quest)
            if (questRewardStatus == false) then
                player:AddQuest(quest)
                player:CompleteQuest(quest)
                player:RewardQuest(quest)
            end
        end
        player:GossipComplete()
    end
end

RegisterCreatureGossipEvent(npcEntry, 1, OnGossipHello)
RegisterCreatureGossipEvent(npcEntry, 2, OnGossipSelect)
