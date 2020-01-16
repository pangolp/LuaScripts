SET @ENTRY:=200001;
SET @GUID:=400000;

DELETE FROM `creature_template` WHERE `entry`=@ENTRY;
INSERT INTO `creature_template` (`entry`,`difficulty_entry_1`,`difficulty_entry_2`,`difficulty_entry_3`,`KillCredit1`,`KillCredit2`,`modelid1`,`modelid2`,`modelid3`,`modelid4`,`name`,`subname`,`IconName`,`gossip_menu_id`,`minlevel`,`maxlevel`,`exp`,`faction`,`npcflag`,`speed_walk`,`speed_run`,`scale`,`rank`,`mindmg`,`maxdmg`,`dmgschool`,`attackpower`,`DamageModifier`,`BaseAttackTime`,`RangeAttackTime`,`unit_class`,`unit_flags`,`unit_flags2`,`dynamicflags`,`family`,`trainer_type`,`trainer_spell`,`trainer_class`,`trainer_race`,`minrangedmg`,`maxrangedmg`,`rangedattackpower`,`type`,`type_flags`,`lootid`,`pickpocketloot`,`skinloot`,`resistance1`,`resistance2`,`resistance3`,`resistance4`,`resistance5`,`resistance6`,`spell1`,`spell2`,`spell3`,`spell4`,`spell5`,`spell6`,`spell7`,`spell8`,`PetSpellDataId`,`VehicleId`,`mingold`,`maxgold`,`AIName`,`MovementType`,`InhabitType`,`HoverHeight`,`HealthModifier`,`ManaModifier`,`ArmorModifier`,`RacialLeader`,`movementId`,`RegenHealth`,`mechanic_immune_mask`,`flags_extra`,`ScriptName`,`VerifiedBuild`) VALUES
(@ENTRY,0,0,0,0,0,29615,0,0,0,"ChuckNorris","Losindestructibles","Speak",5000,80,80,0,35,1,1,1.14286,0.5,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,"",0,1,0,0,0,0,0,0,0,0,0,"",1);

DELETE FROM `creature` WHERE `id`=@ENTRY AND `guid` BETWEEN @GUID+0 AND @GUID+7;

INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
(@GUID+0,@ENTRY,530,1,1,0,0,10354.6,-6370.14,36.0298,1.85756,300,0,0,5342,0,0,0,0,0),
(@GUID+1,@ENTRY,0,1,1,0,0,-6246.37,336.594,382.839,6.01252,300,0,0,5342,0,0,0,0,0),
(@GUID+2,@ENTRY,0,1,1,0,0,-8924.34,-135.922,81.113,1.87509,300,0,0,5342,0,0,0,0,0),
(@GUID+3,@ENTRY,1,1,1,0,0,10325.8,821.945,1326.42,2.19356,300,0,0,5342,0,0,0,0,0),
(@GUID+4,@ENTRY,1,1,1,0,0,-605.951,-4249.06,38.957,2.78409,300,0,0,5342,0,0,0,0,0),
(@GUID+5,@ENTRY,1,1,1,0,0,-2913.36,-266.869,53.681,2.1801,300,0,0,5342,0,0,0,0,0),
(@GUID+6,@ENTRY,0,1,1,0,0,1827.75,1583.5,94.9683,1.40837,300,0,0,5342,0,0,0,0,0),
(@GUID+7,@ENTRY,530,1,1,0,0,-3963.4,-13907.9,100.115,3.49502,300,0,0,5342,0,0,0,0,0);
