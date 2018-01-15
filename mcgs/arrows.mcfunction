scoreboard players tag @e[type=arrow,tag=!old,score_weapon_min=25] add timeout
scoreboard players tag @e[tag=sb] remove timeout {Potion:"minecraft:strong_harming",crit:1b}
scoreboard players tag @e[type=arrow,score_weapon_min=25,tag=timeout] add bad {inGround:0b}
execute @e[type=arrow,tag=bad,score_weapon=25,score_weapon_min=25] ~ ~ ~ scoreboard players set @p[r=3,score_weapon=25,score_weapon_min=25,score_fire2_min=1] fire2 0
execute @e[type=arrow,tag=bad,score_weapon=26,score_weapon_min=26] ~ ~ ~ scoreboard players set @p[r=3,score_weapon=26,score_weapon_min=26,score_fire2_min=1] fire2 0
execute @e[type=arrow,tag=bad,score_weapon=27,score_weapon_min=27] ~ ~ ~ scoreboard players set @p[r=3,score_weapon=27,score_weapon_min=27,score_fire2_min=1] fire2 0

#rpg code
scoreboard players tag @e[type=arrow,score_weapon_min=25,score_weapon=25,tag=!timeout] add rpg
execute @e[tag=rpg] ~ ~ ~ particle explode ~ ~ ~ 0.5 0.5 0.5 0.3 30 normal
execute @e[tag=rpg] ~ ~ ~ playsound entity.firework.launch player @a ~ ~ ~ 2.0 0.0
execute @e[tag=rpg] ~ ~ ~ playsound entity.generic.explode player @a ~ ~ ~ 0.8 1.0
execute @e[tag=rpg] ~ ~ ~ summon Fireball ~ ~ ~ {Tags:["rocket"],PortalCooldown:140,ExplosionPower:5,direction:[0.0,0.0,0.0]}
tp @a[score_weapon=25,score_fire2_min=1,score_fireseq=0,score_fireseq_min=0] ~ ~ ~ ~0.7 ~-2.0
tp @a[score_weapon=25,score_fire2_min=1,score_fireseq=1,score_fireseq_min=1] ~ ~ ~ ~-0.1 ~-2.5
tp @a[score_weapon=25,score_fire2_min=1,score_fireseq=2,score_fireseq_min=2] ~ ~ ~ ~-1.0 ~-1.7
scoreboard players add @a[score_weapon_min=25,score_weapon=25,score_fire2_min=1] fireseq 1
scoreboard players set @a[score_weapon_min=25,score_weapon=25,score_fire2_min=1] fire2 0

#snipers
entitydata @e[type=arrow,score_weapon_min=25,tag=!timeout] {PortalCooldown:120,Potion:"",Tags:["sb","old"]}
entitydata @e[type=arrow,score_weapon_min=26,score_weapon=26,tag=!timeout] {damage:8.0d}
entitydata @e[type=arrow,score_weapon_min=27,score_weapon=27,tag=!timeout] {damage:16.0d}
execute @a[score_weapon_min=26,score_fire2_min=1] ~ ~ ~ playsound entity.firework.blast player @a ~ ~ ~ 3.0 1.2
execute @a[score_weapon_min=26,score_fire2_min=1] ~ ~ ~ playsound entity.firework.large_blast player @a ~ ~ ~ 3.0 2.0
execute @a[score_weapon_min=26,score_fire2_min=1] ~ ~ ~ playsound entity.generic.explode player @a ~ ~ ~ 0.4 1.5
scoreboard players set @a[score_weapon_min=26,score_weapon=26,score_fire2_min=1] str 15
scoreboard players set @a[score_weapon_min=27,score_weapon=27,score_fire2_min=1] str 3
tp @a[score_weapon_min=26,score_fire2_min=1,score_fireseq=0,score_fireseq_min=0] ~ ~ ~ ~2.7 ~-8
tp @a[score_weapon_min=26,score_fire2_min=1,score_fireseq=1,score_fireseq_min=1] ~ ~ ~ ~-2.3 ~-10
tp @a[score_weapon_min=26,score_fire2_min=1,score_fireseq=2,score_fireseq_min=2] ~ ~ ~ ~-0.5 ~-12
scoreboard players add @a[score_fire2_min=1] fireseq 1
scoreboard players set @a fire2 0