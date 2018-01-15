tp @s ~-0.5 ~-0.5 ~-0.5
scoreboard players operation @s temp = @s distX
tp @s[score_temp_min=0] ~0.5 ~ ~
scoreboard players remove @s[score_temp_min=0] temp 129600
tp @s[score_temp_min=-64800] ~0.25 ~ ~
scoreboard players remove @s[score_temp_min=-64800] temp 64800
tp @s[score_temp_min=-97200] ~0.125 ~ ~
scoreboard players remove @s[score_temp_min=-97200] temp 32400
tp @s[score_temp_min=-113400] ~0.0625 ~ ~
scoreboard players remove @s[score_temp_min=-113400] temp 16200
tp @s[score_temp_min=-121500] ~0.03125 ~ ~
scoreboard players remove @s[score_temp_min=-121500] temp 8100
tp @s[score_temp_min=-125550] ~0.015625 ~ ~
scoreboard players remove @s[score_temp_min=-125550] temp 4050
tp @s[score_temp_min=-127575] ~0.0078125 ~ ~
scoreboard players remove @s[score_temp_min=-127575] temp 2025
scoreboard players operation @s temp = @s distZ
tp @s[score_temp_min=0] ~ ~ ~0.5
scoreboard players remove @s[score_temp_min=0] temp 129600
tp @s[score_temp_min=-64800] ~ ~ ~0.25
scoreboard players remove @s[score_temp_min=-64800] temp 64800
tp @s[score_temp_min=-97200] ~ ~ ~0.125
scoreboard players remove @s[score_temp_min=-97200] temp 32400
tp @s[score_temp_min=-113400] ~ ~ ~0.0625
scoreboard players remove @s[score_temp_min=-113400] temp 16200
tp @s[score_temp_min=-121500] ~ ~ ~0.03125
scoreboard players remove @s[score_temp_min=-121500] temp 8100
tp @s[score_temp_min=-125550] ~ ~ ~0.015625
scoreboard players remove @s[score_temp_min=-125550] temp 4050
tp @s[score_temp_min=-127575] ~ ~ ~0.0078125
scoreboard players remove @s[score_temp_min=-127575] temp 2025
scoreboard players operation @s temp = @s distY
tp @s[score_temp_min=0] ~ ~0.5 ~
scoreboard players remove @s[score_temp_min=0] temp 2880
tp @s[score_temp_min=-1440] ~ ~0.25 ~
scoreboard players remove @s[score_temp_min=-1440] temp 1440
tp @s[score_temp_min=-2160] ~ ~0.125 ~
scoreboard players remove @s[score_temp_min=-2160] temp 720
tp @s[score_temp_min=-2520] ~ ~0.0625 ~
scoreboard players remove @s[score_temp_min=-2520] temp 360
tp @s[score_temp_min=-2700] ~ ~0.03125 ~
scoreboard players remove @s[score_temp_min=-2700] temp 180
tp @s[score_temp_min=-2790] ~ ~0.015625 ~
scoreboard players remove @s[score_temp_min=-2790] temp 90
tp @s[score_temp_min=-2835] ~ ~0.0078125 ~
scoreboard players remove @s[score_temp_min=-2835] temp 45
scoreboard players set @s temp 0
testforblock ~0.4 ~0.05 ~0.4 minecraft:air
scoreboard players set @s[score_bsvalid_min=1] temp 1
execute @s[score_temp=0] ~ ~ ~ testforblock ~-0.4 ~0.05 ~0.4 minecraft:air
scoreboard players set @s[score_bsvalid_min=1] temp 1
execute @s[score_temp=0] ~ ~ ~ testforblock ~-0.4 ~0.05 ~-0.4 minecraft:air
scoreboard players set @s[score_bsvalid_min=1] temp 1
execute @s[score_temp=0] ~ ~ ~ testforblock ~0.4 ~0.05 ~-0.4 minecraft:air
scoreboard players set @s[score_bsvalid_min=1] temp 1
execute @s[score_temp=0] ~ ~ ~ testforblock ~0.4 ~0.05 ~0.4 minecraft:stone_slab
scoreboard players set @s[score_bsvalid_min=1] temp 1
execute @s[score_temp=0] ~ ~ ~ testforblock ~-0.4 ~0.05 ~0.4 minecraft:stone_slab
scoreboard players set @s[score_bsvalid_min=1] temp 1
execute @s[score_temp=0] ~ ~ ~ testforblock ~-0.4 ~0.05 ~-0.4 minecraft:stone_slab
scoreboard players set @s[score_bsvalid_min=1] temp 1
execute @s[score_temp=0] ~ ~ ~ testforblock ~0.4 ~0.05 ~-0.4 minecraft:stone_slab
scoreboard players set @s[score_bsvalid_min=1] temp 1
execute @s[score_temp=0] ~ ~ ~ testforblock ~0.4 ~0.05 ~0.4 minecraft:wooden_slab
scoreboard players set @s[score_bsvalid_min=1] temp 1
execute @s[score_temp=0] ~ ~ ~ testforblock ~-0.4 ~0.05 ~0.4 minecraft:wooden_slab
scoreboard players set @s[score_bsvalid_min=1] temp 1
execute @s[score_temp=0] ~ ~ ~ testforblock ~-0.4 ~0.05 ~-0.4 minecraft:wooden_slab
scoreboard players set @s[score_bsvalid_min=1] temp 1
execute @s[score_temp=0] ~ ~ ~ testforblock ~0.4 ~0.05 ~-0.4 minecraft:wooden_slab
scoreboard players set @s[score_bsvalid_min=1] temp 1
execute @s[score_temp=0] ~ ~ ~ testforblock ~0.4 ~0.05 ~0.4 minecraft:tallgrass
scoreboard players set @s[score_bsvalid_min=1] temp 1
execute @s[score_temp=0] ~ ~ ~ testforblock ~-0.4 ~0.05 ~0.4 minecraft:tallgrass
scoreboard players set @s[score_bsvalid_min=1] temp 1
execute @s[score_temp=0] ~ ~ ~ testforblock ~-0.4 ~0.05 ~-0.4 minecraft:tallgrass
scoreboard players set @s[score_bsvalid_min=1] temp 1
execute @s[score_temp=0] ~ ~ ~ testforblock ~0.4 ~0.05 ~-0.4 minecraft:tallgrass
scoreboard players set @s[score_bsvalid_min=1] temp 1
execute @s[score_temp=0] ~ ~ ~ testforblock ~0.4 ~0.05 ~0.4 minecraft:double_plant
scoreboard players set @s[score_bsvalid_min=1] temp 1
execute @s[score_temp=0] ~ ~ ~ testforblock ~-0.4 ~0.05 ~0.4 minecraft:double_plant
scoreboard players set @s[score_bsvalid_min=1] temp 1
execute @s[score_temp=0] ~ ~ ~ testforblock ~-0.4 ~0.05 ~-0.4 minecraft:double_plant
scoreboard players set @s[score_bsvalid_min=1] temp 1
execute @s[score_temp=0] ~ ~ ~ testforblock ~0.4 ~0.05 ~-0.4 minecraft:double_plant
scoreboard players set @s[score_bsvalid_min=1] temp 1
scoreboard players set @s[score_temp=0] hit 9
execute @s[score_weapon_min=7] ~ ~-0.75 ~ effect @p[r=1] 7 1 0 true
execute @s[score_weapon_min=7] ~ ~-1.25 ~ effect @p[r=1] 7 1 0 true
execute @s[score_weapon_min=7] ~ ~-0.75 ~ effect @e[tag=!undead,type=!Player,r=1,score_hit_min=1] 7 1 0 true
execute @s[score_weapon_min=7] ~ ~-1.25 ~ effect @e[tag=!undead,type=!Player,r=1,score_hit_min=1] 7 1 0 true
execute @s[score_weapon_min=7] ~ ~-0.75 ~ effect @e[tag=undead,type=!Player,r=1,score_hit_min=1] 6 1 0 true
execute @s[score_weapon_min=7] ~ ~-1.25 ~ effect @e[tag=undead,type=!Player,r=1,score_hit_min=1] 6 1 0 true
execute @s[score_weapon=6] ~ ~-0.75 ~ effect @p[r=1] 7 2 0 true
execute @s[score_weapon=6] ~ ~-1.25 ~ effect @p[r=1] 7 2 0 true
execute @s[score_weapon=6] ~ ~-0.75 ~ effect @e[tag=!undead,type=!Player,r=1,score_hit_min=1] 7 1 1 true
execute @s[score_weapon=6] ~ ~-1.25 ~ effect @e[tag=!undead,type=!Player,r=1,score_hit_min=1] 7 1 1 true
execute @s[score_weapon=6] ~ ~-0.75 ~ effect @e[tag=undead,type=!Player,r=1,score_hit_min=1] 6 1 1 true
execute @s[score_weapon=6] ~ ~-1.25 ~ effect @e[tag=undead,type=!Player,r=1,score_hit_min=1] 6 1 1 true