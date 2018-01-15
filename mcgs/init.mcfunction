scoreboard objectives add bsvalid dummy
scoreboard objectives add hit dummy
scoreboard objectives add ftimer dummy
scoreboard objectives add clicked stat.useItem.minecraft.carrot_on_a_stick
scoreboard objectives add fire dummy
scoreboard objectives add fireseq dummy
scoreboard objectives add fire2 stat.useItem.minecraft.bow
scoreboard objectives add weapon dummy
scoreboard objectives add prev dummy
scoreboard objectives add ps dummy
scoreboard objectives add str dummy
scoreboard objectives add temp dummy
scoreboard objectives add distX dummy
scoreboard objectives add distY dummy
scoreboard objectives add distZ dummy
scoreboard objectives add CONST dummy
scoreboard objectives add grav dummy
scoreboard players set invert CONST -1
scoreboard players set sixteen CONST 16
scoreboard players set thirtytwo CONST 32
gamerule commandBlockOutput false
execute @p ~ ~ ~ setblock ~ ~ ~ minecraft:repeating_command_block 1 replace {auto:0b,powered:0b,Command:"function mcgs:loop"}