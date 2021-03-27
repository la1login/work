import numpy
from scipy. integrate import odeint
import matplotlib.pyplot as pl
import math

t0 = 0

x0 = 20

N = 2300

k = 0.205

p = 0.000023

t = numpy.arange(t0, 30, 2)

def syst(dx, t):
    x = dx
    return (k + p*x)*(N-x)

solution = odeint(syst, x0, t)

fig1 = pl.figure(facecolor='white')
pl.plot(t, solution)
pl.xlabel("Time")
pl.ylabel("Clients")
pl.show()

k1 = 0.0000305

p1 = 0.24

def syst1(dx, t):
    x = dx
    return (k1 + p1*x)*(N-x)

solution1 = odeint(syst1, x0, t)

fig2 = pl.figure(facecolor='white')
pl.plot(t, solution1)
pl.xlabel("Time")
pl.ylabel("Clients")
pl.show()


def k(q):
    k = 0.05*math.sin(q)
    return k

def p(q):
    p = 0.03*math.cos(4*q)
    return p

q = numpy.arange(t0, 0.1, 0.001)

def syst2(dx, q):
    x = dx
    return (k(q) + p(q)*x)*(N-x)

solution2 = odeint(syst2, x0, q)

fig3 = pl.figure(facecolor='white')
pl.plot(q, solution2)
pl.xlabel("Time")
pl.ylabel("Clients")
pl.show()

dyy = (k1 + p1*solution1)*(N-solution1)

fig4 = pl.figure(facecolor='white')
pl.plot(t, dyy)
pl.xlabel("Time")
pl.ylabel("Clients")
pl.show()