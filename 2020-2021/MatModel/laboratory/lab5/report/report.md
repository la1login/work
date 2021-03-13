## **РОССИЙСКИЙ УНИВЕРСИТЕТ ДРУЖБЫ НАРОДОВ**

### **Факультет физико-математических и естественных наук**

### **Кафедра прикладной информатики и теории вероятностей**



















## **ОТЧЕТ ПО ЛАБОРАТОРНОЙ РАБОТЕ № 5**

###  *дисциплина: Математическое моделирование*

**Вариант 41**

















Студент:	Логинов Сергей Андреевич

Группа:	  НФИбд-01-18 



​													



​														

​																		 	**МОСКВА**

​															    				2021 г.







## Теоретическая часть:

Модель хищник-жертва 

Простейшая модель взаимодействия двух видов типа «хищник — жертва» - модель Лотки-Вольтерры. 

Рассмотрим базисные компоненты системы. Пусть система имеет *X* хищников и *Y* жертв. И пусть для этой системы выполняются следующие предположения: (Модель Лотки-Вольтерра)

1. Численность популяции жертв и хищников зависят только от времени (модель не учитывает пространственное распределение популяции на занимаемой территории)
2. В отсутствии взаимодействия численность видов изменяется по модели Мальтуса, при этом число жертв увеличивается, а число хищников падает
3. Естественная смертность жертвы и естественная рождаемость хищника считаются несущественными
4. Эффект насыщения численности обеих популяций не учитывается
5. Скорость роста численности жертв уменьшается пропорционально численности хищников:

$$
\begin{cases} 	
\frac{dx}{dt} = ax(t) - by(t)x(t) \\
\frac{dy}{dt} = -cy(t) + dy(t)x(t) 
\end{cases}
$$



Параметр *a* определяет коэффициент смертности хищников, *b* – коэффициент естественного прироста хищников, *c* – коэффициент прироста жертв и *d* – коэффициент смертности жертв

В зависимости от этих параметрах система и будет изменяться. Однако следует выделить одно важное состояние системы, при котором не происходит никаких изменений как со стороны хищников, так и со стороны жертв. Это, так называемое, стационарное состояние системы. При нем, как уже было отмечено, изменение численности популяции равно нулю. Следовательно, при отсутствии изменений в системе 
$$
\frac{dx}{dt} = 0, \frac{dy}{dt} = 0
$$




Пусть по условию есть хотя бы один хищник и хотя бы одна жертва: *x>0, y>0* Тогда стационарное состояние системы определяется следующим образом: 
$$
 x_0=\frac{a}{b}, y_0=\frac{c}{d}
$$
Выполнение:

 Для модели «хищник-жертва»:

Вариант 41 
$$
\begin{cases} \frac{dx}{dt} = -0.58x(t) + 0.048y(t)x(t) \\
\frac{dy}{dt} = 0.38y(t) - 0.028y(t)x(t) \end{cases}
$$


Постройте график зависимости численности хищников от численности жертв, а также графики изменения численности хищников и численности жертв при следующих начальных условиях: 
$$
x_0 = 7, y_0 = 15
$$


 Найдите стационарное состояние системы.



Программный код( python ):

```python
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
fig2 = pl.figure(facecolor='white')
pl.plot(t, second)
pl.xlabel("t")
pl.ylabel("zhertva")
pl.grid(True)
pl.show()

fig3 = pl.figure(facecolor='white')
pl.plot(t, first)
pl.xlabel("t")
pl.ylabel("predator")
pl.grid(True)
pl.show()
```



![](C:\Users\itsok\work\2020-2021\MatModel\laboratory\lab5\screen\first.png)

Зависимость количества жертв от количества хищников



![](C:\Users\itsok\work\2020-2021\MatModel\laboratory\lab5\screen\second.png)

Изменения популяции жертв



![third](C:\Users\itsok\work\2020-2021\MatModel\laboratory\lab5\screen\third.png)

Изменения популяции хищников



Стационарное состояние:


$$
X_{ст}= 12,083
\\
Y_{ст} = 13,571
$$