function f = mid(g,m,n)

f1 = ordfilt2(g,1,ones(m,n),'symmetric');
        f2 = ordfilt2(g,m*n,ones(m,n),'symmetric');
        f = imlincomb(0.5,f1,0.5,f2);
