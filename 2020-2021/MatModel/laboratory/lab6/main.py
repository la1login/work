import numpy
from scipy. integrate import odeint
import matplotlib.pyplot as pl

a = 0.5
b = 0.02

N = 5000

I0 = 30
R0 = 1
S0 = N - I0 - R0

tmax = 100

step = 0.01

t = numpy.arange(0, tmax, step)

def dx(x, t):
    x1, x2, x3 = x
    return[0, -b*x2, b*x2]

x0 = [S0, I0, R0]

mas = odeint(dx, x0, t)

def dy(x, t):
    x1, x2, x3 = x
    return[-a*x1, a*x1-b*x2, b*x2]

mas1 = odeint(dy, x0, t)


fig1 = pl.figure(facecolor='white')
pl.plot(t, mas)
pl.ylabel("Population")
pl.xlabel("Time")
pl.grid(True)
pl.show()

fig2 = pl.figure(facecolor='white')
pl.plot(t, mas1)
pl.ylabel("Population")
pl.xlabel("Time")
pl.grid(True)
pl.show()
