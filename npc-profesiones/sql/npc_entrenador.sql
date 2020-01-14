/*
	Revisen antes de correr, que no tengan un npc con ese entry.
	Al agregar el npc y el script en lua, solamente es cuestión de ir y hablarle.
*/

DELETE FROM `creature_template` WHERE `entry`=200004;

INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES
(200004,0,0,0,0,0,18718,0,0,0,"Oscar Isidro Parrilli","Profesiones 450",NULL,0,83,83,2,2082,1,1,0.99206,1,3,509,683,0,805,35,2000,2000,1,768,2048,0,0,0,0,0,0,371,535,135,6,36,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,"",0,3,1,2000,1,1,0,0,1,8388624,2,"",12340);

DELETE FROM `creature` WHERE `id`=200004 AND `guid`=4000002;

INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `ScriptName`, `VerifiedBuild`) VALUES
(4000002, 200004, 571, 0, 0, 1, 1, 0, 0, 5787.18, 450.444, 658.782, 6.21808, 300, 0, 0, 27890000, 0, 0, 0, 0, 0, "", 0);
