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
                        end -- Si no fue premiado por la misión.
                    end -- si no es humano
                    if (player:GetRace() == ENANO) then
                        if (player:GetQuestRewardStatus(1785) == false) then
                            player:GossipMenuAddItem(0, 'Redención paladín enano', 1, 11)
                        end -- Si no fue premiado por la misión.
                    end -- si no es enano
                    if (player:GetRace() == DRAENEI) then
                        if (player:GetQuestRewardStatus(9600) == false) then
                            player:GossipMenuAddItem(0, 'Redención paladín draenei', 1, 12)
                        end -- Si no fue premiado por la misión.
                    end -- si no es draenei
                end -- si no es paladin
                if (player:GetClass() == GUERRERO) then
                    if (player:GetQuestRewardStatus(1719) == false) then
                        player:GossipMenuAddItem(0, 'Actitud rabiosa / Interceptar', 1, 14)
                    end -- Si no fue premiado por la misión.
                    if (player:GetRace() == HUMANO) then
                        if (player:GetQuestRewardStatus(1665) == false) then
                            player:GossipMenuAddItem(0, 'Actitud defensiva humano', 1, 15)
                        end -- Si no fue premiado por la misión.
                    end -- si no es humano
                    if ((player:GetRace() == ENANO) or (player:GetRace() == GNOMO)) then
                        if (player:GetQuestRewardStatus(1678) == false) then
                            player:GossipMenuAddItem(0, 'Actitud defensiva enano / gnomo', 1, 16)
                        end -- Si no fue premiado por la misión.
                    end -- Si no es enano o gnomo.
                    if (player:GetRace() == DRAENEI) then
                        if (player:GetQuestRewardStatus(9582) == false) then
                            player:GossipMenuAddItem(0, 'Actitud defensiva draenei', 1, 17)
                        end -- Si no fue premiado por la misión.
                    end -- si no es draenei
                    if (player:GetRace() == ELFO_NOCTURNO) then
                        if (player:GetQuestRewardStatus(1683) == false) then
                            player:GossipMenuAddItem(0, 'Actitud defensiva elfo nocturno', 1, 18)
                        end -- Si no fue premiado por la misión.
                    end -- si no es elfo nocturno
                end -- si no es guerrero
                if (player:GetClass() == DRUIDA) then
                    if (player:GetRace() == ELFO_NOCTURNO) then
                        if (player:GetQuestRewardStatus(6001) == false) then
                            player:GossipMenuAddItem(0, 'Forma de oso / Bramido / Magullar', 1, 21)
                        end -- Si no fue premiado por la misión.
                    end -- si no es elfo nocturno
                end -- si no es druida
                if (player:GetClass() == BRUJO) then
                    if (player:GetRace() == HUMANO) then
                        if (player:GetQuestRewardStatus(1689) == false) then
                            player:GossipMenuAddItem(0, 'Invocar abisario', 1, 23)
                        end -- Si no fue premiado por la misión.
                        if (player:GetQuestRewardStatus(1739) == false) then
                            player:GossipMenuAddItem(0, 'Invocar súcubo', 1, 24)
                        end -- Si no fue premiado por la misión.
                        if (player:GetQuestRewardStatus(1795) == false) then
                            player:GossipMenuAddItem(0, 'Invocar manáfago', 1, 25)
                        end -- Si no fue premiado por la misión.
                    end -- si no es humano
                    if (player:GetRace() == GNOMO) then
                        if (player:GetQuestRewardStatus(1689) == false) then
                            player:GossipMenuAddItem(0, 'Invocar abisario', 1, 26)
                        end -- Si no fue premiado por la misión.
                        if (player:GetQuestRewardStatus(1739) == false) then
                            player:GossipMenuAddItem(0, 'Invocar súcubo', 1, 24)
                        end -- Si no fue premiado por la misión.
                         if (player:GetQuestRewardStatus(1795) == false) then
                            player:GossipMenuAddItem(0, 'Invocar manáfago', 1, 25)
                        end -- Si no fue premiado por la misión.
                    end
                end -- si no es brujo
            end -- si no es alianza
            if (teamId == 1) then
                if (player:GetClass() == PALADIN) then
                    if (player:GetRace() == ELFO_DE_SANGRE) then
                        if (player:GetQuestRewardStatus(9685) == false) then
                            player:GossipMenuAddItem(0, 'Redención elfo de sangre', 1, 13)
                        end -- Si no fue premiado por la misión.
                    end -- si no es elfo de sangre
                end -- si no es paladin
                if (player:GetClass() == GUERRERO) then
                    if (player:GetQuestRewardStatus(1719) == false) then
                        player:GossipMenuAddItem(0, 'Actitud rabiosa / Interceptar', 1, 14)
                    end -- Si no fue premiado por la misión.
                    if (player:GetRace() == NO_MUERTO) then
                        if (player:GetQuestRewardStatus(1819) == false) then
                            player:GossipMenuAddItem(0, 'Actitud defensiva no-muerto', 1, 19)
                        end -- Si no fue premiado por la misión.
                    end -- si no es no-muerto
                    if ((player:GetRace() == ORCO) or (player:GetRace() == TROLL) or (player:GetRace() == TAUREN)) then
                        if (player:GetQuestRewardStatus(1498) == false) then
                            player:GossipMenuAddItem(0, 'Actitud defensiva', 1, 20)
                        end -- Si no fue premiado por la misión.
                    end -- si es orco, troll o tauren
                end -- si no es guerrero
                if (player:GetClass() == DRUIDA) then
                    if (player:GetRace() == TAUREN) then
                        if (player:GetQuestRewardStatus(6002) == false) then
                            player:GossipMenuAddItem(0, 'Forma de oso / Bramido / Magullar', 1, 22)
                        end -- Si no fue premiado por la misión.
                    end
                end
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
    end -- Redención paladín humano
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
    end -- Redención paladín enano
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
    end -- Redención paladín draenei
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
    end -- Redención elfo de sangre
    if (intid == 14) then
        quests = {1718, 1719}
        for i, quest in ipairs(quests) do
            questRewardStatus = player:GetQuestRewardStatus(quest)
            if (questRewardStatus == false) then
                player:AddQuest(quest)
                player:CompleteQuest(quest)
                player:RewardQuest(quest)
            end
        end
        player:GossipComplete()
    end -- Actitud rabiosa / Interceptar
    if (intid == 15) then
        quests = {1638, 1639, 1640, 1665}
        for i, quest in ipairs(quests) do
            questRewardStatus = player:GetQuestRewardStatus(quest)
            if (questRewardStatus == false) then
                player:AddQuest(quest)
                player:CompleteQuest(quest)
                player:RewardQuest(quest)
            end
        end
        player:GossipComplete()
    end -- Actitud defensiva / Hender armadura / Provocar humano
    if (intid == 16) then
        quests = {1679, 1678}
        for i, quest in ipairs(quests) do
            questRewardStatus = player:GetQuestRewardStatus(quest)
            if (questRewardStatus == false) then
                player:AddQuest(quest)
                player:CompleteQuest(quest)
                player:RewardQuest(quest)
            end
        end
        player:GossipComplete()
    end -- Actitud defensiva / Hender armadura / Provocar enano - gnomo
    if (intid == 17) then
        questRewardStatus = player:GetQuestRewardStatus(9582)
        if (questRewardStatus == false) then
            player:AddQuest(quest)
            player:CompleteQuest(quest)
            player:RewardQuest(quest)
        end
        player:GossipComplete()
    end -- Actitud defensiva / Hender armadura / Provocar draenei
    if (intid == 18) then
        quests = {1684, 1683}
        for i, quest in ipairs(quests) do
            questRewardStatus = player:GetQuestRewardStatus(quest)
            if (questRewardStatus == false) then
                player:AddQuest(quest)
                player:CompleteQuest(quest)
                player:RewardQuest(quest)
            end
        end
        player:GossipComplete()
    end -- Actitud defensiva / Hender armadura / Provocar elfo nocturno
    if (intid == 19) then
        quests = {1818, 1819}
        for i, quest in ipairs(quests) do
            questRewardStatus = player:GetQuestRewardStatus(quest)
            if (questRewardStatus == false) then
                player:AddQuest(quest)
                player:CompleteQuest(quest)
                player:RewardQuest(quest)
            end
        end
        player:GossipComplete()
    end -- Actitud defensiva / Hender armadura / Provocar no-muerto
    if (intid == 20) then
        quests = {1505, 1498}
        for i, quest in ipairs(quests) do
            questRewardStatus = player:GetQuestRewardStatus(quest)
            if (questRewardStatus == false) then
                player:AddQuest(quest)
                player:CompleteQuest(quest)
                player:RewardQuest(quest)
            end
        end
        player:GossipComplete()
    end -- Actitud defensiva / Hender armadura / Provocar orco, troll y tauren
    if (intid == 21) then
        quests = {5923, 5924, 5925, 5291, 5929, 5931, 6001}
        for i, quest in ipairs(quests) do
            questRewardStatus = player:GetQuestRewardStatus(quest)
            if (questRewardStatus == false) then
                player:AddQuest(quest)
                player:CompleteQuest(quest)
                player:RewardQuest(quest)
            end
        end
        player:GossipComplete()
    end -- Forma de oso / Bramido / Magullar elfo nocturno
    if (intid == 22) then
        quests = {5926, 5927, 5928, 5922, 5930, 5932, 6002}
        for i, quest in ipairs(quests) do
            questRewardStatus = player:GetQuestRewardStatus(quest)
            if (questRewardStatus == false) then
                player:AddQuest(quest)
                player:CompleteQuest(quest)
                player:RewardQuest(quest)
            end
        end
        player:GossipComplete()
    end -- Forma de oso / Bramido / Magullar tauren
    if (intid == 23) then
        quests = {1685, 1688, 1689}
        for i, quest in ipairs(quests) do
            questRewardStatus = player:GetQuestRewardStatus(quest)
            if (questRewardStatus == false) then
                player:AddQuest(quest)
                player:CompleteQuest(quest)
                player:RewardQuest(quest)
            end
        end
        player:GossipComplete()
    end -- Invocar abisario (Humano)
    if (intid == 24) then
        quests = {1717, 1716, 1738, 1739}
        for i, quest in ipairs(quests) do
            questRewardStatus = player:GetQuestRewardStatus(quest)
            if (questRewardStatus == false) then
                player:AddQuest(quest)
                player:CompleteQuest(quest)
                player:RewardQuest(quest)
            end
        end
        player:GossipComplete()
    end -- Invocar súcubo (Humano / Gnomo)
    if (intid == 25) then
        quests = {1798, 1758, 1802, 1804, 1795}
        for i, quest in ipairs(quests) do
            questRewardStatus = player:GetQuestRewardStatus(quest)
            if (questRewardStatus == false) then
                player:AddQuest(quest)
                player:CompleteQuest(quest)
                player:RewardQuest(quest)
            end
        end
        player:GossipComplete()
    end -- Invocar manáfago (Humano / Gnomo)
    if (intid == 26) then
        quests = {1715, 1688, 1689}
        for i, quest in ipairs(quests) do
            questRewardStatus = player:GetQuestRewardStatus(quest)
            if (questRewardStatus == false) then
                player:AddQuest(quest)
                player:CompleteQuest(quest)
                player:RewardQuest(quest)
            end
        end
        player:GossipComplete()
    end -- Invocar abisario (Gnomo)
end

RegisterCreatureGossipEvent(npcEntry, 1, OnGossipHello)
RegisterCreatureGossipEvent(npcEntry, 2, OnGossipSelect)
