import numpy
from scipy. integrate import odeint
import matplotlib.pyplot as pl

a = 0.58
b = 0.38
c = 0.048
d = 0.028

tmax = 100
step = 0.1

x0 = [7, 15]

t = numpy.arange(0, tmax, step)

def dx(x, t):
    x1, x2 = x
    return[-a*x1 + c*x1*x2,  b*x2 - d*x1*x2]

mas = odeint(dx, x0, t)

first = mas[:, 0]
second = mas[:, 1]

fig1 = pl.figure(facecolor='white')
pl.plot(first, second)
pl.xlabel("y")
pl.ylabel("x")
pl.grid(True)
pl.show()
fig1.savefig('first.png', dpi=600)
fig2 = pl.figure(facecolor='white')
pl.plot(t, second)
pl.xlabel("t")
pl.ylabel("zhertva")
pl.grid(True)
pl.show()
fig2.savefig('second.png', dpi=600)
fig3 = pl.figure(facecolor='white')
pl.plot(t, first)
pl.xlabel("t")
pl.ylabel("predator")
pl.grid(True)
pl.show()
fig3.savefig('third.png', dpi=600)
