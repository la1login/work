## **РОССИЙСКИЙ УНИВЕРСИТЕТ ДРУЖБЫ НАРОДОВ**

### **Факультет физико-математических и естественных наук**

### **Кафедра прикладной информатики и теории вероятностей**



















## **ОТЧЕТ ПО ЛАБОРАТОРНОЙ РАБОТЕ № 6**

###  *дисциплина: Математическое моделирование*

**Вариант 41**

















Студент:	Логинов Сергей Андреевич

Группа:	  НФИбд-01-18 



​													



​														

​																		 	**МОСКВА**

​															    				2021 г.







## Задача об эпидемии



## Теоретическая часть:

Рассмотрим простейшую модель эпидемии. 

Предположим, что некая популяция, состоящая из N особей, (считаем, что популяция изолирована) подразделяется на три группы. 

Первая группа - это восприимчивые к болезни, но пока здоровые особи, обозначим их через S(t). 

Вторая группа – это число инфицированных особей, которые также при этом являются распространителями инфекции, обозначим их I(t). 

А третья группа, обозначающаяся через R(t) – это здоровые особи с иммунитетом к болезни. 

До того, как число заболевших не превышает критического значения I*  , считаем, что все больные изолированы и не заражают здоровых. Когда I(t) >  I* , тогда инфицирование способны заражать восприимчивых к болезни особей. 

Таким образом, скорость изменения числа S(t) меняется по следующему закону:


$$
\frac {dS}{dt}
\begin{cases} -\alpha S, \space если I(t) > I\dot \\ 
\\
0, \space  если I(t) ≤  I\dot\\  \end{cases}
$$


Поскольку каждая восприимчивая к болезни особь, которая, в конце концов, заболевает, сама становится инфекционной, то скорость изменения числа инфекционных особей представляет разность за единицу времени между заразившимися и теми, кто уже болеет и лечится, т.е.:
$$
\frac {dI}{dt}
\begin{cases} \alpha S - \beta I, \space если I(t) > I\dot \\ 
\\
- \beta I, \space  если I(t) ≤  I\dot\\  \end{cases}
$$


А скорость изменения выздоравливающих особей (при этом приобретающие иммунитет к болезни):
$$
\frac{dR}{dt} = \beta I
$$
Постоянные пропорциональности  *α* *β* - это коэффициенты заболеваемости и выздоровления соответственно. Для того, чтобы решения соответствующих уравнений определялось однозначно, необходимо задать начальные условия. Считаем, что на начало эпидемии в момент времени *t = 0* нет особей с иммунитетом к болезни *R(0)=0*, а число инфицированных и восприимчивых к болезни особей *I(0)* и *S(0)* соответственно. Для анализа картины протекания эпидемии необходимо рассмотреть два случая:
$$
I(t) > I\dot \\ \space и  \space I(t) ≤  I\dot\\
$$

## Решение:



### Вариант 41

На одном острове вспыхнула эпидемия. Известно, что из всех проживающих на острове (*N=5 000*) в момент начала эпидемии (*t=0*) число заболевших людей (являющихся распространителями инфекции) *I(0)=30*, А число здоровых людей с иммунитетом к болезни *R(0)=1*. Таким образом, число людей восприимчивых к болезни, но пока здоровых, в начальный момент времени *S(0)=N-I(0) - R(0)*. Постройте графики изменения числа особей в каждой из трех групп. Рассмотрите, как будет протекать эпидемия в случае:



1. $$
   I(t) ≤  I\dot\\
   $$

2. $$
   I(t) > I\dot \\
   $$



Программный код:

```python
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
```



График для случая 1:

![](C:\Users\itsok\work\2020-2021\MatModel\laboratory\lab6\graph\1.png)

​	Рис.1 (Критическое значение не достигнуто)



График для случая 2:

![2](C:\Users\itsok\work\2020-2021\MatModel\laboratory\lab6\graph\2.png)

Рис.2 (Критическое значение достигнуто)



## Вывод:

Решили задачу об эпидемии и рассмотрели два варианта развития событий.