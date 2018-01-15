#define undead enemies
scoreboard players tag @e[type=wither,tag=!undead] add undead
scoreboard players tag @e[type=wither_skeleton,tag=!undead] add undead
scoreboard players tag @e[type=zombie_pigman,tag=!undead] add undead
scoreboard players tag @e[type=zombie,tag=!undead] add undead
scoreboard players tag @e[type=skeleton,tag=!undead] add undead

#update history
execute @a ~ ~ ~ scoreboard players operation @s last = @s weapon

#identify weapon
scoreboard players set @a weapon 0
scoreboard players set @a weapon 1 {Inventory:[{Slot:-106b,id:"minecraft:bow",Damage:1s,tag:{Unbreakable:1b}}]}
scoreboard players set @a weapon 2 {Inventory:[{Slot:-106b,id:"minecraft:bow",Damage:2s,tag:{Unbreakable:1b}}]}
scoreboard players set @a weapon 3 {Inventory:[{Slot:-106b,id:"minecraft:bow",Damage:3s,tag:{Unbreakable:1b}}]}
replaceitem entity @a[score_weapon=1,score_weapon_min=1] slot.weapon.offhand minecraft:carrot_on_a_stick 1 19 {Unbreakable:1b}
replaceitem entity @a[score_weapon=2,score_weapon_min=2] slot.weapon.offhand minecraft:carrot_on_a_stick 1 20 {Unbreakable:1b}
replaceitem entity @a[score_weapon=3,score_weapon_min=3] slot.weapon.offhand minecraft:carrot_on_a_stick 1 21 {Unbreakable:1b}
scoreboard players set @a weapon 0
scoreboard players set @a weapon 1 {SelectedItem:{id:"minecraft:carrot_on_a_stick",Damage:1s,tag:{Unbreakable:1b}}}
scoreboard players set @a weapon 2 {SelectedItem:{id:"minecraft:carrot_on_a_stick",Damage:2s,tag:{Unbreakable:1b}}}
scoreboard players set @a weapon 7 {SelectedItem:{id:"minecraft:carrot_on_a_stick",Damage:7s,tag:{Unbreakable:1b}}}
scoreboard players set @a weapon 13 {SelectedItem:{id:"minecraft:carrot_on_a_stick",Damage:13s,tag:{Unbreakable:1b}}}
scoreboard players set @a weapon 19 {SelectedItem:{id:"minecraft:carrot_on_a_stick",Damage:19s,tag:{Unbreakable:1b}}}
scoreboard players set @a weapon 20 {SelectedItem:{id:"minecraft:carrot_on_a_stick",Damage:20s,tag:{Unbreakable:1b}}}
scoreboard players set @a weapon 21 {SelectedItem:{id:"minecraft:carrot_on_a_stick",Damage:21s,tag:{Unbreakable:1b}}}
replaceitem entity @a[score_weapon=19,score_weapon_min=19] slot.weapon.mainhand minecraft:bow 1 1 {Unbreakable:1b}
replaceitem entity @a[score_weapon=20,score_weapon_min=20] slot.weapon.mainhand minecraft:bow 1 2 {Unbreakable:1b}
replaceitem entity @a[score_weapon=21,score_weapon_min=21] slot.weapon.mainhand minecraft:bow 1 3 {Unbreakable:1b}
scoreboard players set @a weapon 25 {SelectedItem:{id:"minecraft:bow",Damage:1s,tag:{Unbreakable:1b}}}
scoreboard players set @a weapon 26 {SelectedItem:{id:"minecraft:bow",Damage:2s,tag:{Unbreakable:1b}}}
scoreboard players set @a weapon 27 {SelectedItem:{id:"minecraft:bow",Damage:3s,tag:{Unbreakable:1b}}}

#firing mechanism
scoreboard players remove @a[score_ftimer_min=1] ftimer 1
scoreboard players set @a[score_fireseq_min=3] fireseq 0
scoreboard players tag @a[score_ps_min=0,tag=!ready] add ready
scoreboard players set @a[tag=!ready] ps 0
execute @a[tag=!ready] ~ ~ ~ stats entity @s set SuccessCount @s ps

scoreboard players remove @a[score_str_min=0] str 1
execute @a[score_str_min=0,score_str=0] ~ ~ ~ playsound block.chest.locked player @p ~ ~ ~ 0.6 1.5
execute @a[score_str_min=0,score_str=0] ~ ~ ~ playsound block.piston.contract player @p ~ ~ ~ 0.1 0.8
execute @a[score_str_min=0,score_str=0] ~ ~ ~ playsound block.anvil.place player @p ~ ~ ~ 0.07 2.0

execute @a ~ ~ ~ scoreboard players operation @s temp = @s weapon
execute @a ~ ~ ~ scoreboard players operation @s temp -= @s last
scoreboard players set @a[score_temp=0,score_temp_min=0] fire 0
scoreboard players set @a[score_weapon=0] fire 0
scoreboard players set @a[score_weapon=0] clicked 0
scoreboard players set @a[score_weapon=0] fire2 0

scoreboard players add @a[score_clicked_min=1,score_weapon_min=1,score_weapon=1] fire 3
scoreboard players set @a[score_clicked_min=1,score_fire=0,score_ftimer=0] fire 1
#scoreboard players add @a[score_clicked_min=1,score_weapon_min=2,score_weapon=2] fire 1

execute @p[score_fire_min=1,score_ftimer=0] ~ ~ ~ function mcgs:bull
execute @a[score_fire2_min=1,score_weapon_min=25] ~ ~ ~ function mcgs:arrtag
function mcgs:arrows if @p[score_fire2_min=1]
scoreboard players tag @e[tag=sb,score_weapon_min=0] add timeout {crit:0b}
scoreboard players set @a clicked 0

#snowball hit detection
execute @e[tag=b] ~ ~ ~ kill @e[tag=pt,r=0]
execute @e[tag=b] ~ ~ ~ summon area_effect_cloud ~ ~ ~ {Duration:2,Tags:["pt"]}
execute @e[tag=b] ~ ~ ~ tp @e[tag=pt,r=2,c=1] @s
scoreboard players add @e[tag=bs] hit 1
scoreboard players set @e[tag=!b,type=!area_effect_cloud] hit 1
scoreboard players set @e[tag=!bs] hit 0 {HurtTime:0s}
execute @e[tag=b] ~ ~ ~ scoreboard players set @e[r=1,tag=bs,c=1] hit 0
execute @e[tag=bs,score_hit=1,score_hit_min=1] ~ ~ ~ function mcgs:tppos
kill @e[tag=bs,score_hit_min=10]
execute @e[tag=bs,score_hit_min=1] ~ ~ ~ function mcgs:bscalc
scoreboard players add @e[score_hit_min=1,tag=bs] hit 1
kill @e[tag=bs,score_hit_min=10]
execute @e[tag=bs,score_hit_min=1] ~ ~ ~ function mcgs:bscalc


#low bet gravity
scoreboard players add @e[tag=b] grav 0
scoreboard players add @e[tag=sb] grav 0
scoreboard players remove @e[score_grav_min=1] grav 1
entitydata @e[score_grav_min=1] {NoGravity:1b}
entitydata @e[score_grav=0] {NoGravity:0b}
scoreboard players set @e[tag=b,score_grav=0] grav 2
scoreboard players set @e[tag=sb,score_grav=0] grav 4

#cleanup
scoreboard players tag @e[tag=b] add timeout {Passengers:[{Age:98}]}
scoreboard players tag @e[tag=rocket] add timeout {PortalCooldown:0}
scoreboard players tag @e[tag=sb] add timeout {PortalCooldown:0}
execute @e[tag=timeout,type=snowball] ~ ~ ~ kill @e[tag=bs,r=1]
kill @e[tag=timeout]
