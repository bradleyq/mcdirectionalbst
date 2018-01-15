tp @s @e[r=1,tag=pt,c=1]
scoreboard players set @s temp 0
scoreboard players add @s[rym=256] temp 256
tp @s[rym=256] ~ ~ ~ ~-256 ~
scoreboard players add @s[rym=128] temp 128
tp @s[rym=128] ~ ~ ~ ~-128 ~
scoreboard players add @s[rym=64] temp 64
tp @s[rym=64] ~ ~ ~ ~-64 ~
scoreboard players add @s[rym=32] temp 32
tp @s[rym=32] ~ ~ ~ ~-32 ~
scoreboard players add @s[rym=16] temp 16
tp @s[rym=16] ~ ~ ~ ~-16 ~
scoreboard players add @s[rym=8] temp 8
tp @s[rym=8] ~ ~ ~ ~-8 ~
scoreboard players add @s[rym=4] temp 4
tp @s[rym=4] ~ ~ ~ ~-4 ~
scoreboard players add @s[rym=2] temp 2
tp @s[rym=2] ~ ~ ~ ~-2 ~
scoreboard players add @s[rym=1] temp 1
tp @s[rym=1] ~ ~ ~ ~-1 ~
scoreboard players operation @s distX = @s temp
scoreboard players remove @s[score_temp=270,score_temp_min=91] distX 180
scoreboard players remove @s[score_temp_min=271] distX 360
scoreboard players operation @s distZ = @s distX
scoreboard players add @s distZ 90
scoreboard players remove @s[score_distZ_min=91] distZ 180
scoreboard players operation @s[score_temp=270,score_temp_min=91] distX *= invert CONST
scoreboard players operation @s[score_temp=180,score_temp_min=1] distZ *= invert CONST
scoreboard players set @s distY -90
scoreboard players add @s[rx=90,rxm=38] distY 128
tp @s[rx=90,rxm=38] ~ ~ ~ ~ ~-128
scoreboard players add @s[rx=38,rxm=-26] distY 64
tp @s[rx=38,rxm=-26] ~ ~ ~ ~ ~-64
scoreboard players add @s[rx=-27,rxm=-58] distY 32
tp @s[rx=-27,rxm=-58] ~ ~ ~ ~ ~-32
scoreboard players add @s[rx=-59,rxm=-74] distY 16
tp @s[rx=-59,rxm=-74] ~ ~ ~ ~ ~-16
scoreboard players add @s[rx=-75,rxm=-82] distY 8
tp @s[rx=-75,rxm=-82] ~ ~ ~ ~ ~-8
scoreboard players add @s[rx=-83,rxm=-86]  distY 4
tp @s[rx=-83,rxm=-86] ~ ~ ~ ~ ~-4
scoreboard players add @s[rx=-87,rxm=-88] distY 2
tp @s[rx=-87,rxm=-88] ~ ~ ~ ~ ~-2
scoreboard players add @s[rx=-89,rxm=-89] distY 1
tp @s[rx=-89,rxm=-89] ~ ~ ~ ~ ~-1
scoreboard players operation @s temp = @s distY
scoreboard players operation @s[score_temp_min=1] temp *= invert CONST
scoreboard players add @s temp 90
scoreboard players operation @s distX *= sixteen CONST
scoreboard players operation @s distZ *= sixteen CONST
scoreboard players operation @s distX *= @s temp
scoreboard players operation @s distZ *= @s temp
scoreboard players operation @s distY *= thirtytwo CONST
scoreboard players set @s bsvalid 0
stats entity @s set SuccessCount @s bsvalid