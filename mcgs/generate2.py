import math
import os
import errno

def directionalTag(filename, entity, tag, hs, he, vs, ve, r, tr, sec):    
    f = open(filename+".mcfunction","w+")
    spreadh = 15
    spreadv = 5
    sizej = (ve+1-vs)//sec
    tailj = (ve+1-vs)%sizej
    sech = abs(int(round(sec*(ve+vs)/180.0)))
    sizei = (he+1-hs)//sech
    taili = (he+1-hs)%sizei
    written = False
    for i in range(hs,he+1-taili,sizei):
        for j in range(vs,ve+1-tailj,sizej):
            truesizei = sizei
            truesizej = sizej
            if i+2*sizei>he+1:
                truesizei += taili
            if j+2*sizej>ve+1:
                truesizej += tailj
            vec= [math.cos(deg2rad(min(j+0.5*truesizej,90)))*math.sin(deg2rad(-i-0.5*truesizei)),
                  math.sin(deg2rad(-j-0.5*truesizej)),
                  math.cos(deg2rad(min(j+0.5*truesizej,90)))*math.cos(deg2rad(i+0.5*truesizei))]
            xp = r*vec[0]
            yp = r*vec[1] + 1.5
            zp = r*vec[2]
            if abs(j+0.5*truesizej)>=85:
                f.write('execute @s[tag=!fd,rxm={0},rx={1}] ~{4:.5f} ~{5:.5f} ~{6:.5f} \
scoreboard players operation @e[type={7},rxm={8},rx={9},c=1,r={12}] weapon = @s weapon\n'
                    .format(j,j+truesizej-1,i,i+truesizei-1,xp,yp,zp,entity,min(max(-j-truesizej-spreadv,-90),90),min(max(-j+spreadv-1,-90),90),-i-truesizei-spreadh,-i+spreadh-1,tr,tag))
            else:
                f.write('execute @s[tag=!fd,rxm={0},rx={1},rym={2},ry={3}] ~{4:.5f} ~{5:.5f} ~{6:.5f} \
scoreboard players operation @e[type={7},rxm={8},rx={9},rym={10},ry={11},c=1,r={12}] weapon = @s weapon\n'
                    .format(j,j+truesizej-1,i,i+truesizei-1,xp,yp,zp,entity,min(max(-j-truesizej-spreadv,-90),90),min(max(-j+spreadv-1,-90),90),-i-truesizei-spreadh,-i+spreadh-1,tr,tag))
            f.write('scoreboard players tag @s[score_ps_min=1] add fd\n')
    f.close()
    return

def deg2rad(num):
    return num*math.pi/180

def directionalBST(filename, entity, tag, r, tr, sec, path, additional):
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
        __BSTworker(filename,i,i+89,-90,-1,entity,tag,r,tr,sec,path)
        __BSTworker(filename,i,i+89,0,90,entity,tag,r,tr,sec,path)
    return 
        
def __BSTworker(filename,hs,he,vs,ve,entity,tag,r,tr,sec,path):
    name = '{0}h{1}h{2}v{3}v{4}'.format(filename,hs,he,vs,ve)
    if he-hs > 23:
        f = open(path+name+'.mcfunction','w+')
        midh = (he+hs)//2
        midv = (ve+vs)//2
        f.write('function mcgs:{5}{0}h{1}h{2}v{3}v{4} if @s[rym={1},ry={2},rxm={3},rx={4}]\n'.format(filename,hs,midh,vs,midv,path))
        f.write('function mcgs:{5}{0}h{1}h{2}v{3}v{4} if @s[rym={1},ry={2},rxm={3},rx={4}]\n'.format(filename,midh+1,he,vs,midv,path))
        f.write('function mcgs:{5}{0}h{1}h{2}v{3}v{4} if @s[rym={1},ry={2},rxm={3},rx={4}]\n'.format(filename,midh+1,he,midv+1,ve,path))
        f.write('function mcgs:{5}{0}h{1}h{2}v{3}v{4} if @s[rym={1},ry={2},rxm={3},rx={4}]\n'.format(filename,hs,midh,midv+1,ve,path))
        f.close()
        __BSTworker(filename,hs,midh,vs,midv,entity,tag,r,tr,sec,path)
        __BSTworker(filename,hs,midh,midv+1,ve,entity,tag,r,tr,sec,path)
        __BSTworker(filename,midh+1,he,vs,midv,entity,tag,r,tr,sec,path)
        __BSTworker(filename,midh+1,he,midv+1,ve,entity,tag,r,tr,sec,path)
    else:
        directionalTag(path+name, entity, tag, hs, he, vs, ve, r, tr, sec)


def main():
    directionalBST('arrtag','Arrow','sb', 1.25, 2, 7,'arrtagBST/',
                   'execute @s[tag=!fd] ~ ~ ~ scoreboard players operation @e[type=arrow,tag=!sb,c=1,r=3] weapon = @s weapon\n\
scoreboard players tag @e[type=arrow,score_weapon_min=0] add sb\n\
entitydata @e[tag=sb] {pickup:0b}\n\
scoreboard players tag @s[tag=fd] remove fd')
