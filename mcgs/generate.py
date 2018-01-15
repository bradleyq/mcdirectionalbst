import math
import os
import errno

def directionalSummon(filename, entity, velocity, hs, he, vs, ve, r):
    __directionalSummon(filename, entity, velocity, hs, he, vs, ve, r, 0.0)

def __directionalSummon(filename, entity, velocity, hs, he, vs, ve, r, offset):    
    f = open(filename+".mcfunction","w+")
    for i in range(hs,he+1):
        for j in range(vs,ve+1):
            vec= [math.cos(deg2rad(min(j+0.5+offset,90)))*math.sin(deg2rad(-i-0.5-offset)),
                  math.sin(deg2rad(-j-0.5-offset)),
                  math.cos(deg2rad(min(j+0.5+offset,90)))*math.cos(deg2rad(i+0.5+offset))]
            rt = r if j<=0 else min(r/math.cos(deg2rad(min(j+0.5+offset,90))),(1.5*1.5+r*r)**0.5)
            xp = rt*vec[0]
            yp = rt*vec[1] + 1.5
            zp = rt*vec[2]
            xm = velocity*vec[0]
            ym = velocity*vec[1]
            zm = velocity*vec[2]
            f.write('execute @s[rxm={0},rx={0},rym={1},ry={1}] ~ ~ ~ \
summon {8} ~{2:.5f} ~{3:.5f} ~{4:.5f} {{Tags:[n],Rotation:[{9:.1f}f,{10:.1f}f],Motion:[{5:.5f},{6:.5f},{7:.5f}]\
,Passengers:[{{id:area_effect_cloud,Tags:[bn],Duration:99}}]}}\n'
#}}\n'
                    .format(j,i,xp,yp,zp,xm,ym,zm,entity,-i-0.5,-j-0.5))
#            f.write('execute @a[rxm={0},rx={0},rym={1},ry={1},score_fire_min=1] ~ ~ ~ \
#summon {8} ~{2:.6f} ~{3:.6f} ~{4:.6f} {{PortalCooldown:200,Tags:["bull"],Motion:[{5:.9f},{6:.9f},{7:.9f}],\
#Passengers:[{{id:"armor_stand",Tags:["bs"],Marker:1b,Invisible:1b,PortalCooldown:2}}]}}\n'
#                    .format(j,i,xp,yp,zp,xm,ym,zm,entity))
    f.close()
    return

def deg2rad(num):
    return num*math.pi/180

def directionalBST(filename, entity, velocity, path, additional):
    f = open(filename+".mcfunction","w+")
    for i in range(-180,180,90):
        f.write('function mcgs:{3}{0}h{1}h{2}v-90v-1 if @s[rym={1},ry={2},rxm=-90,rx=-1]\n'.format(filename, i, i+89, path))
        f.write('function mcgs:{3}{0}h{1}h{2}v0v90 if @s[rym={1},ry={2},rxm=0,rx=90]\n'.format(filename, i, i+89, path))

    f.write(additional)
    f.close()
    
    if path != '' and not os.path.exists(os.path.dirname(path)):
        try:
            os.makedirs(os.path.dirname(path))
        except OSError as exc: # Guard against race condition
            if exc.errno != errno.EEXIST:
                raise
        
    for i in range(-180,180,90):
        __BSTworker(filename,i,i+89,-90,-1,entity,velocity, path)
        __BSTworker(filename,i,i+89,0,90,entity,velocity, path)
    return 
        
def __BSTworker(filename,hs,he,vs,ve,entity,velocity, path):
    name = '{0}h{1}h{2}v{3}v{4}'.format(filename,hs,he,vs,ve)
    if he-hs > 15:
        f = open(path+name+'.mcfunction','w+')
        midh = (he+hs)//2
        midv = (ve+vs)//2
        f.write('function mcgs:{5}{0}h{1}h{2}v{3}v{4} if @s[rym={1},ry={2},rxm={3},rx={4}]\n'.format(filename,hs,midh,vs,midv,path))
        f.write('function mcgs:{5}{0}h{1}h{2}v{3}v{4} if @s[rym={1},ry={2},rxm={3},rx={4}]\n'.format(filename,midh+1,he,vs,midv,path))
        f.write('function mcgs:{5}{0}h{1}h{2}v{3}v{4} if @s[rym={1},ry={2},rxm={3},rx={4}]\n'.format(filename,midh+1,he,midv+1,ve,path))
        f.write('function mcgs:{5}{0}h{1}h{2}v{3}v{4} if @s[rym={1},ry={2},rxm={3},rx={4}]\n'.format(filename,hs,midh,midv+1,ve,path))
        if midh-hs <= 15:
            vec= [1.25*math.cos(deg2rad(midv))*math.sin(deg2rad(-midh)),
                  1.25*math.sin(deg2rad(-midv))+1.5,
                  1.25*math.cos(deg2rad(midv))*math.cos(deg2rad(midh))]
            f.write('execute @s ~{0:.5f} ~{1:.5f} ~{2:.5f} scoreboard players operation @e[tag=n,rxm={3},rx={4},rym={5},ry={6},r=1,c=1] weapon = @s weapon'.format(vec[0],vec[1],vec[2],-ve-1,-vs-1,-he-1,-hs-1))
        f.close()
        __BSTworker(filename,hs,midh,vs,midv,entity,velocity,path)
        __BSTworker(filename,hs,midh,midv+1,ve,entity,velocity,path)
        __BSTworker(filename,midh+1,he,vs,midv,entity,velocity,path)
        __BSTworker(filename,midh+1,he,midv+1,ve,entity,velocity,path)
    else:
        __directionalSummon(path+name, entity, velocity, hs, he, vs, ve, 1.25, 0)


def main():
 #   directionalBST('snowball','Snowball',3.0,'snowballBST/','entitydata @e[tag=bs] {Invulnerable:1b,Small:1b,NoGravity:1b,NoBasePlate:1b}')
    directionalBST('bull','snowball',3.2,'bullBST/','execute @e[tag=n,c=1] ~ ~ ~ scoreboard players operation @e[r=1,tag=bn,c=1] weapon = @s weapon\n\
entitydata @e[tag=n,score_weapon_min=0,c=1] {Tags:[b]}\n\
entitydata @e[tag=bn,score_weapon_min=0,c=1] {Tags:[bs]}\n\
execute @s[score_weapon_min=1,score_weapon=6] ~ ~1.0 ~ playsound entity.firework.large_blast player @p ~ ~ ~ 2.0 1.5\n\
execute @s[score_weapon_min=1,score_weapon=6] ~ ~1.0 ~ playsound entity.firework.blast player @a ~ ~ ~ 0.5 0.9\n\
execute @s[score_weapon_min=1,score_weapon=6] ~ ~1.0 ~ playsound minecraft:block.piston.extend player @a ~ ~ ~ 0.3 1.3\n\
execute @s[score_weapon_min=13,score_weapon=18] ~ ~1.0 ~ playsound entity.firework.blast player @p ~ ~ ~ 2.0 1.4\n\
execute @s[score_weapon_min=13,score_weapon=18] ~ ~1.0 ~ playsound entity.firework.large_blast player @p ~ ~ ~ 1.5 1.5\n\
execute @s[score_weapon_min=13,score_weapon=18] ~ ~1.0 ~ playsound block.anvil.place player @p ~ ~ ~ 0.04 1.6\n\
tp @s[score_fireseq=0,score_fireseq_min=0,score_weapon_min=1,score_weapon=1] ~ ~ ~ ~0.5 ~-1.7\n\
tp @s[score_fireseq=1,score_fireseq_min=1,score_weapon_min=1,score_weapon=1] ~ ~ ~ ~0.2 ~-1.4\n\
tp @s[score_fireseq=2,score_fireseq_min=2,score_weapon_min=1,score_weapon=1] ~ ~ ~ ~-0.8 ~-1.8\n\
tp @s[score_fireseq=0,score_fireseq_min=0,score_weapon_min=2,score_weapon=2] ~ ~ ~ ~0.4 ~-2.3\n\
tp @s[score_fireseq=1,score_fireseq_min=1,score_weapon_min=2,score_weapon=2] ~ ~ ~ ~0.1 ~-2.5\n\
tp @s[score_fireseq=2,score_fireseq_min=2,score_weapon_min=2,score_weapon=2] ~ ~ ~ ~-0.3 ~-2.4\n\
tp @s[score_fireseq=0,score_fireseq_min=0,score_weapon_min=13,score_weapon=13] ~ ~ ~ ~0.8 ~-3.1\n\
tp @s[score_fireseq=1,score_fireseq_min=1,score_weapon_min=13,score_weapon=13] ~ ~ ~ ~-0.5 ~-3.5\n\
tp @s[score_fireseq=2,score_fireseq_min=2,score_weapon_min=13,score_weapon=13] ~ ~ ~ ~-0.7 ~-3.4\n\
scoreboard players set @s[score_fire_min=4] fire 3\n\
scoreboard players set @s[score_weapon_min=1,score_weapon=1] ftimer 3\n\
scoreboard players set @s[score_weapon_min=2,score_weapon=2] ftimer 4\n\
scoreboard players set @s[score_weapon_min=13,score_weapon=13] ftimer 6\n\
scoreboard players add @s fireseq 1\n\
scoreboard players remove @s fire 1')
