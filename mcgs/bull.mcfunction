function mcgs:bullBST/bullh-180h-91v-90v-1 if @s[rym=-180,ry=-91,rxm=-90,rx=-1]
function mcgs:bullBST/bullh-180h-91v0v90 if @s[rym=-180,ry=-91,rxm=0,rx=90]
function mcgs:bullBST/bullh-90h-1v-90v-1 if @s[rym=-90,ry=-1,rxm=-90,rx=-1]
function mcgs:bullBST/bullh-90h-1v0v90 if @s[rym=-90,ry=-1,rxm=0,rx=90]
function mcgs:bullBST/bullh0h89v-90v-1 if @s[rym=0,ry=89,rxm=-90,rx=-1]
function mcgs:bullBST/bullh0h89v0v90 if @s[rym=0,ry=89,rxm=0,rx=90]
function mcgs:bullBST/bullh90h179v-90v-1 if @s[rym=90,ry=179,rxm=-90,rx=-1]
function mcgs:bullBST/bullh90h179v0v90 if @s[rym=90,ry=179,rxm=0,rx=90]
execute @e[tag=n,c=1] ~ ~ ~ scoreboard players operation @e[r=1,tag=bn,c=1] weapon = @s weapon
entitydata @e[tag=n,score_weapon_min=0,c=1] {Tags:[b]}
entitydata @e[tag=bn,score_weapon_min=0,c=1] {Tags:[bs]}
execute @s[score_weapon_min=1,score_weapon=6] ~ ~1.0 ~ playsound entity.firework.large_blast player @p ~ ~ ~ 2.0 1.5
execute @s[score_weapon_min=1,score_weapon=6] ~ ~1.0 ~ playsound entity.firework.blast player @a ~ ~ ~ 0.5 0.9
execute @s[score_weapon_min=1,score_weapon=6] ~ ~1.0 ~ playsound minecraft:block.piston.extend player @a ~ ~ ~ 0.3 1.3
execute @s[score_weapon_min=13,score_weapon=18] ~ ~1.0 ~ playsound entity.firework.blast player @p ~ ~ ~ 2.0 1.4
execute @s[score_weapon_min=13,score_weapon=18] ~ ~1.0 ~ playsound entity.firework.large_blast player @p ~ ~ ~ 1.5 1.5
execute @s[score_weapon_min=13,score_weapon=18] ~ ~1.0 ~ playsound block.anvil.place player @p ~ ~ ~ 0.04 1.6
tp @s[score_fireseq=0,score_fireseq_min=0,score_weapon_min=1,score_weapon=1] ~ ~ ~ ~0.5 ~-1.7
tp @s[score_fireseq=1,score_fireseq_min=1,score_weapon_min=1,score_weapon=1] ~ ~ ~ ~0.2 ~-1.4
tp @s[score_fireseq=2,score_fireseq_min=2,score_weapon_min=1,score_weapon=1] ~ ~ ~ ~-0.8 ~-1.8
tp @s[score_fireseq=0,score_fireseq_min=0,score_weapon_min=2,score_weapon=2] ~ ~ ~ ~0.4 ~-2.3
tp @s[score_fireseq=1,score_fireseq_min=1,score_weapon_min=2,score_weapon=2] ~ ~ ~ ~0.1 ~-2.5
tp @s[score_fireseq=2,score_fireseq_min=2,score_weapon_min=2,score_weapon=2] ~ ~ ~ ~-0.3 ~-2.4
tp @s[score_fireseq=0,score_fireseq_min=0,score_weapon_min=13,score_weapon=13] ~ ~ ~ ~0.8 ~-3.1
tp @s[score_fireseq=1,score_fireseq_min=1,score_weapon_min=13,score_weapon=13] ~ ~ ~ ~-0.5 ~-3.5
tp @s[score_fireseq=2,score_fireseq_min=2,score_weapon_min=13,score_weapon=13] ~ ~ ~ ~-0.7 ~-3.4
scoreboard players set @s[score_fire_min=4] fire 3
scoreboard players set @s[score_weapon_min=1,score_weapon=1] ftimer 3
scoreboard players set @s[score_weapon_min=2,score_weapon=2] ftimer 4
scoreboard players set @s[score_weapon_min=13,score_weapon=13] ftimer 6
scoreboard players add @s fireseq 1
scoreboard players remove @s fire 1