function mcgs:arrtagBST/arrtagh-180h-91v-90v-1 if @s[rym=-180,ry=-91,rxm=-90,rx=-1]
function mcgs:arrtagBST/arrtagh-180h-91v0v90 if @s[rym=-180,ry=-91,rxm=0,rx=90]
function mcgs:arrtagBST/arrtagh-90h-1v-90v-1 if @s[rym=-90,ry=-1,rxm=-90,rx=-1]
function mcgs:arrtagBST/arrtagh-90h-1v0v90 if @s[rym=-90,ry=-1,rxm=0,rx=90]
function mcgs:arrtagBST/arrtagh0h89v-90v-1 if @s[rym=0,ry=89,rxm=-90,rx=-1]
function mcgs:arrtagBST/arrtagh0h89v0v90 if @s[rym=0,ry=89,rxm=0,rx=90]
function mcgs:arrtagBST/arrtagh90h179v-90v-1 if @s[rym=90,ry=179,rxm=-90,rx=-1]
function mcgs:arrtagBST/arrtagh90h179v0v90 if @s[rym=90,ry=179,rxm=0,rx=90]
execute @s[tag=!fd] ~ ~ ~ scoreboard players operation @e[type=arrow,tag=!sb,c=1,r=3] weapon = @s weapon
scoreboard players tag @e[type=arrow,score_weapon_min=0] add sb
entitydata @e[tag=sb] {pickup:0b}
scoreboard players tag @s[tag=fd] remove fd