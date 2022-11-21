fig = plt.figure(figsize=(7, 3))
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.mlab as mlab
import random
for j in range(283,330):
    b = []
    bx = []
    c = []
    cx = []
    t = []
    #t = np.random.randn(280,331)
    for i in range(1,26):
        r = []
        u = mda.Universe('/Scr/arango/Sobolev-Hyun/2-MembTempredict/testing/T.'+str(j)+'/166.'+str(i)+'.pdb')
        CA = u.select_atoms("all")
        #DO NP.WHERE
        r = np.append(r, CA.positions) 
        r = r.reshape((int(r.shape[0]/3), 3))
        b = np.append(b, (np.min(r[0: , 0:1]), np.max(r[0: , 0:1]) ))
        c = np.append(c, (np.min(r[0: , 1:2]), np.max(r[0: , 1:2]) ))
        ran = random.randint(280, 330)
        bx = np.append(bx, (np.min(r[0: , 0:1]), np.max(r[0: , 0:1]), ran ))
        cx = np.append(cx, (np.min(r[0: , 1:2]), np.max(r[0: , 1:2]), ran ))
        
    #d = np.where(b, )
    bx = bx.reshape((int(bx.shape[0]/3), 3))
    #bx = bx[0: , 2:3]
    cx = cx.reshape((int(cx.shape[0]/3), 3))
    #
    #print(cx)
    #print(bx)
    #Working sort cx[cx[:, 0].argsort()]
    xsorted = bx[bx[:, 0].argsort()]
    ysorted = cx[cx[:, 0].argsort()]
    #print(xsorted, ysorted)
    #Making the bins
    bop = np.min(xsorted[0: , 0:1]), np.max(xsorted[0: , 1:2])
    cop = np.min(ysorted[0: , 0:1]), np.max(ysorted[0: , 1:2])
    x = np.linspace(bop[0], bop[1], num=100)
    y = np.linspace(cop[0], cop[1], num=100)
    #print(x)
    w= len(cx[0: , 2:3])
    v= len(x)
    #print(v)
    

        #list a
    #FOR X
    ll = []
    for a in range(v):
        l = []
        for f in range(w):
            k = xsorted[0: , 0:1][f]
            h = xsorted[0: , 1:2][f]
            temp = xsorted[0: , 2:3][f]
            if k[0] <= y[a] <= h[0]:
                l = np.append(l, temp)
                #print(temp)
            #else:
             #   print("Nope")
       
        #print(np.mean(l))
        ll = np.append(ll, np.mean(l))
    #print(len(ll))
    
    #FOR Y
    ly = []
    for a in range(v):
        l = []
        for f in range(w):
            k = ysorted[0: , 0:1][f]
            h = ysorted[0: , 1:2][f]
            temp = ysorted[0: , 2:3][f]
            if k[0] <= y[a] <= h[0]:
                l = np.append(l, temp)
                #print(temp)
            #else:
             #   print("Nope")
       
        #print(np.mean(l))
        ly = np.append(ly, np.mean(l))
    #print(len(ly))
    plt.xlim([-41, 41])
    plt.ylim([-41, 41])
    plt.subplot(111)
    av = np.divide(np.add(ll, ly), 2)
    plt.contourf(x,y,np.divide(np.outer(ll, ly), av))
    #plt.contourf(x,y,np.divide(np.outer(ll, ly), av), levels=[280,305,330])
    plt.colorbar()
    plt.show()
