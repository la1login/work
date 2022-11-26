from math import gcd
a_global = 1
b_global = 1
def f1(x, n):
    return (x * x + 5) % n

def f2(a, b, n, d):
    a = f1(a, n)
    b = f1(f1(b, n), n) % n
    d = gcd(a - b, n)
    if 1 < d < n:
        p = d
        print(p)
        exit()
    if d == n:
        print('Not found')
    if d == 1:
        global a_global
        a_global = b
        f2(a, b, n, d)

n = 1359331
c = 1
a = c
b = c
a = f1(a, n) % n
b = f1(a, n) % n
d = gcd(a - b, n)
if 1 < d < n:
    p = d
    print(p)
    exit()
if d == n:
    pass
if d == 1:
    f2(a, b, n, d)