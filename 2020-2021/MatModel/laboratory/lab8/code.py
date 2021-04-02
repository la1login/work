import numpy
from scipy. integrate import odeint
import matplotlib.pyplot as pl


p_cr = 35
tau1 = 14
p1 = 6.5
tau2 = 7
p2 = 15
V = 41
q = 1

x0 = [5.5, 5]
a1 = p_cr/(tau1*tau1*p1*p1*V*q)
a2 = p_cr/(tau2*tau2*p2*p2*V*q)

b = p_cr/(tau1*tau1*tau2*tau2*p1*p1*p2*p2*V*q)

c1 = (p_cr-p1)/(tau1*p1)
c2 = (p_cr-p2)/(tau2*p2)

t = numpy.arange(0, 30, 0.01)

def syst(dx, t):
    dx1, dx2 = dx
    return[dx1 - (a1/c1)*dx1*dx1 - (b/c1)*dx1*dx2, (c2/c1)*dx2 - (a2/c1)*dx2*dx2 - (b/c1)*dx1*dx2]

y = odeint(syst, x0, t)

y_1 = y[:, 0]
y_2 = y[:, 1]

fig1 = pl.figure(facecolor='white')
pl.plot(t, y_1, label='Фирма 1')
pl.plot(t, y_2, label='Фирма 2')
pl.xlabel("Время")
pl.ylabel("Оборотные средства")
pl.legend()
pl.show()

def syst(dx, t):
    dx1, dx2 = dx
    return[dx1 - (a1/c1)*dx1*dx1 - (b/c1)*dx1*dx2, (c2/c1)*dx2 - (a2/c1)*dx2*dx2 - (b/c1+0.00021)*dx1*dx2]

y1 = odeint(syst, x0, t)

y1_1 = y1[:, 0]
y1_2 = y1[:, 1]

fig2 = pl.figure(facecolor='white')
pl.plot(t, y1)
pl.plot(t, y1_1, label='Фирма 1')
pl.plot(t, y1_2, label='Фирма 2')
pl.xlabel("Время")
pl.ylabel("Оборотные средства")
pl.legend()
pl.show()

