### **РОССИЙСКИЙ УНИВЕРСИТЕТ ДРУЖБЫ НАРОДОВ**

### **Факультет физико-математических и естественных наук**

### **Кафедра прикладной информатики и теории вероятностей**











### **Отчет по лабораторной работе № 4**

### *Дисциплина: Практикум по компьютерному моделированию*

















Студент:	Логинов Сергей Андреевич

Группа:	  НФИбд-01-18 

​		



​			





​																		

​	**МОСКВА 2021г**

### Цель работы

Изучение возможностей специализированных пакетов Julia для выполнения и оценки эффективности операций над объектами линейной алгебры.



### Ход работы

**Поэлементные операции над многомерными массивами** 

<img src="/Users/sergejloginov/Library/Application Support/typora-user-images/Снимок экрана 2021-10-28 в 22.52.13.png" alt="Снимок экрана 2021-10-28 в 22.52.13" style="zoom:67%;" />

Для работы со средними значениями можно воспользоваться возможностями пакеты Statistics:

<img src="/Users/sergejloginov/Library/Application Support/typora-user-images/Снимок экрана 2021-10-28 в 22.54.12.png" alt="Снимок экрана 2021-10-28 в 22.54.12" style="zoom:67%;" />

**Транспонирование, след, ранг, определитель и инверсия матрицы**

<img src="/Users/sergejloginov/Library/Application Support/typora-user-images/Снимок экрана 2021-10-28 в 22.56.21.png" alt="Снимок экрана 2021-10-28 в 22.56.21" style="zoom:67%;" />



**Вычисление нормы векторов матриц, повороты, вращения**

<img src="/Users/sergejloginov/Library/Application Support/typora-user-images/Снимок экрана 2021-10-28 в 22.57.52.png" alt="Снимок экрана 2021-10-28 в 22.57.52" style="zoom:67%;" />

<img src="/Users/sergejloginov/Library/Application Support/typora-user-images/Снимок экрана 2021-10-28 в 22.58.21.png" alt="Снимок экрана 2021-10-28 в 22.58.21" style="zoom:67%;" />



**Матричное умножение, единичная матрица, скалярное произведение**

<img src="/Users/sergejloginov/Library/Application Support/typora-user-images/Снимок экрана 2021-10-28 в 22.59.37.png" alt="Снимок экрана 2021-10-28 в 22.59.37" style="zoom:67%;" />



**Факторизация. Специальные матричные структуры**



<img src="/Users/sergejloginov/Library/Application Support/typora-user-images/Снимок экрана 2021-10-29 в 00.18.41.png" alt="Снимок экрана 2021-10-29 в 00.18.41" style="zoom:67%;" /> <img src="/Users/sergejloginov/Library/Application Support/typora-user-images/Снимок экрана 2021-10-29 в 00.19.22.png" alt="Снимок экрана 2021-10-29 в 00.19.22" style="zoom:67%;" /><img src="/Users/sergejloginov/Library/Application Support/typora-user-images/Снимок экрана 2021-10-29 в 00.19.43.png" alt="Снимок экрана 2021-10-29 в 00.19.43" style="zoom:67%;" />

<img src="/Users/sergejloginov/Library/Application Support/typora-user-images/Снимок экрана 2021-10-29 в 00.31.05.png" alt="Снимок экрана 2021-10-29 в 00.31.05" style="zoom:67%;"/>

<img src="/Users/sergejloginov/Library/Application Support/typora-user-images/Снимок экрана 2021-10-29 в 00.33.45.png" alt="Снимок экрана 2021-10-29 в 00.33.45" style="zoom:67%;" />



<img src="/Users/sergejloginov/Library/Application Support/typora-user-images/Снимок экрана 2021-10-29 в 00.35.46.png" alt="Снимок экрана 2021-10-29 в 00.35.46" style="zoom:67%;" />



### Задания для самостоятельного выполнения



1. **Произведение векторов**

   1. Задайте вектор v. Умножьте данный вектор скалярно на себя и сохраните результат
   2. Умножьте вектор матрично на себя

   <img src="/Users/sergejloginov/Library/Application Support/typora-user-images/Снимок экрана 2021-10-29 в 00.44.52.png" alt="Снимок экрана 2021-10-29 в 00.44.52" style="zoom:67%;" />

   

   2. **Системы линейных уравнений**

      1. Решить СЛАУ с двумя неизвестными

         

   <img src="/Users/sergejloginov/Library/Application Support/typora-user-images/Снимок экрана 2021-10-29 в 00.47.05.png" alt="Снимок экрана 2021-10-29 в 00.47.05" style="zoom:67%;" />

   ​	Создадим функцию для решения СЛАУ путем деления:

   <img src="/Users/sergejloginov/Library/Application Support/typora-user-images/Снимок экрана 2021-10-29 в 00.50.12.png" alt="Снимок экрана 2021-10-29 в 00.50.12" style="zoom:67%;" />

   Решим уравнения:

   <img src="/Users/sergejloginov/Library/Mobile Documents/com~apple~CloudDocs/Снимок экрана 2021-10-29 в 00.53.07.png" alt="Снимок экрана 2021-10-29 в 00.53.07" style="zoom:67%;" />

   Уравнение b имеет решение (1; 1), но функция его не находит. Уравнения  c и e не имеют решений.

      2. Решить СЛАУ с тремя неизвестными

         <img src="/Users/sergejloginov/Library/Application Support/typora-user-images/Снимок экрана 2021-10-29 в 00.57.55.png" alt="Снимок экрана 2021-10-29 в 00.57.55" style="zoom:67%;" />  <img src="/Users/sergejloginov/Library/Application Support/typora-user-images/Снимок экрана 2021-10-29 в 00.59.10.png" alt="Снимок экрана 2021-10-29 в 00.59.10" style="zoom:67%;" />

   




3. **Операции с матрицами**

Приведите матрицы к диагональному виду

a) 
$$
\begin{pmatrix}
1 \ -2 \\
-2 \ \ \ 1
\end{pmatrix}
$$


b) 
$$
\begin{pmatrix}
1 \ -2 \\
-2 \ \ \ 3
\end{pmatrix}
$$


c)
$$
\begin{pmatrix}
1 \ -2 \ \ 0\\
-2 \ \  1 \ \ \ 2 \\
0 \ \ \ \ 2 \ \ \ 0
\end{pmatrix}
$$


Напишем функцию get_diagonal_matrix, которая будет возвращать диагональную матрицу из собственных значений матрицы, переднанной в функцию в качестве аргумента. Используем спектральное разложение:

<img src="/Users/sergejloginov/Library/Application Support/typora-user-images/Снимок экрана 2021-10-29 в 01.23.33.png" alt="Снимок экрана 2021-10-29 в 01.23.33" style="zoom:67%;" />



<img src="/Users/sergejloginov/Library/Application Support/typora-user-images/Снимок экрана 2021-10-29 в 01.25.04.png" alt="Снимок экрана 2021-10-29 в 01.25.04" style="zoom:67%;" />

Задание c) решим подробно и с проверкой. Спектральное разложение - представление матрицы А в виде A = VSV<sup>-1</sup>, где V - собственные вектора матрицы А, S - диагональная матрица из собственных значений. В ходе проверки должны получить исходную матрицу.

 <img src="/Users/sergejloginov/Library/Application Support/typora-user-images/Снимок экрана 2021-10-29 в 01.29.03.png" alt="Снимок экрана 2021-10-29 в 01.29.03" style="zoom:67%;" />

В итоге получили исходную матрицу (на месте нулей числа, очень близкие к нулю)

Вычислите

a)
$$
\begin{pmatrix}
1 \ -2 \\
-2 \ \ \ 1
\end{pmatrix}^{10}
$$
b)
$$
\sqrt{\begin{pmatrix}
5 \ -2 \\
-2 \ \ \ 5
\end{pmatrix}}
$$
c)
$$
\sqrt[3]{\begin{pmatrix}
5 \ -2 \\
-2 \ \ \ 5
\end{pmatrix}}
$$
d) 
$$
\sqrt{\begin{pmatrix}
1 \ \ \ 2 \\
2 \ \ \ 3
\end{pmatrix}}
$$
![Снимок экрана 2021-10-29 в 01.30.55](/Users/sergejloginov/Library/Application Support/typora-user-images/Снимок экрана 2021-10-29 в 01.30.55.png)



Найдите собственные значения матрицы А. Создайте диагональную матрицу из собственных значений матрицы А. Создайте нижнедиагональную матрицу из матрицы А. Оцените эффективность выполняемых операций.

<img src="/Users/sergejloginov/Library/Application Support/typora-user-images/Снимок экрана 2021-10-29 в 01.32.00.png" alt="Снимок экрана 2021-10-29 в 01.32.00" style="zoom:50%;" />

Воспользуемся функцией нахождения диагональной матрицы и проведем замер затраченных ресурсов:

<img src="/Users/sergejloginov/Library/Application Support/typora-user-images/Снимок экрана 2021-10-29 в 01.33.08.png" alt="Снимок экрана 2021-10-29 в 01.33.08" style="zoom:67%;" />

Создадим нижнедиагональную матрицу. Пользуемся LU-разложением, результатом будет матрица L:

<img src="/Users/sergejloginov/Library/Application Support/typora-user-images/Снимок экрана 2021-10-29 в 01.34.16.png" alt="Снимок экрана 2021-10-29 в 01.34.16" style="zoom:67%;" />

4. Линейные модели экономики:

Линейная модель экономики может быть записана как СЛАУ

​													𝑥 − 𝐴𝑥 = 𝑦,

где элементы матрицы 𝐴 и столбца 𝑦 — неотрицательные числа. По своему смыслу в эко- номике элементы матрицы 𝐴 и столбцов 𝑥, 𝑦 не могут быть отрицательными числами.

a) Матрица 𝐴 называется продуктивной, если решение 𝑥 системы при любой неотрицательной правой части 𝑦 имеет только неотрицательные элементы 𝑥𝑖. Используя это определение, проверьте, являются ли матрицы продуктивными.
$$
\begin{pmatrix}
1\  \ -2 \\
3 \ \ \ 4
\end{pmatrix}
$$

$$
\frac{1}{2}\begin{pmatrix}
1\  \ -2 \\
3 \ \ \ 4
\end{pmatrix}
$$

$$
\frac{1}{10}\begin{pmatrix}
1\  \ -2 \\
3 \ \ \ 4
\end{pmatrix}
$$

Представим x - Ax как x(E - A), где Е - единичная матрица. Е - А назовем s. Зададим произвольные положительные значения для y. Домножим наше уравнение xs = y на s<sup>-1</sup>. Получим x = ys<sup>-1</sup> 

Первая матрица:
<img src="/Users/sergejloginov/Library/Application Support/typora-user-images/Снимок экрана 2021-10-29 в 01.48.29.png" alt="Снимок экрана 2021-10-29 в 01.48.29" style="zoom:67%;" />

х отрицательный, матрица непродуктивная



Вторая матрица:

<img src="/Users/sergejloginov/Library/Application Support/typora-user-images/Снимок экрана 2021-10-29 в 01.49.23.png" alt="Снимок экрана 2021-10-29 в 01.49.23" style="zoom:67%;" />

х отрицательный, матрица непродуктивная



Третья матрица:

<img src="/Users/sergejloginov/Library/Application Support/typora-user-images/Снимок экрана 2021-10-29 в 01.49.57.png" alt="Снимок экрана 2021-10-29 в 01.49.57" style="zoom:67%;" />

Здесь х положительный, матрица продуктивна.



b) Критерий продуктивности: матрица 𝐴 является продуктивной тогда и только тогда, когда все элементы матрицы

​					(𝐸 − 𝐴)−1

являются неотрицательными числами. Используя этот критерий, проверьте, являются ли матрицы продуктивными:
$$
\begin{pmatrix}
1\  \ 2 \\
3 \ \  1
\end{pmatrix}
$$

$$
\frac{1}{2}\begin{pmatrix}
1\  \ 2 \\
3 \ \  1
\end{pmatrix}
$$

$$
\frac{1}{10}\begin{pmatrix}
1\  \ 2 \\
3 \ \  1
\end{pmatrix}
$$

<img src="/Users/sergejloginov/Library/Application Support/typora-user-images/Снимок экрана 2021-10-29 в 01.53.08.png" alt="Снимок экрана 2021-10-29 в 01.53.08" style="zoom:67%;" />



Видим, что продуктивна только третья матрица



c) Спектральный критерий продуктивности: матрица 𝐴 является продуктивной тогда и только тогда, когда все её собственные значения по модулю меньше 1. Используя этот критерий, проверьте, являются ли матрицы продуктивными.
$$
\begin{pmatrix}
1\  \ 2 \\
3 \ \  1
\end{pmatrix}
$$

$$
\frac{1}{2}\begin{pmatrix}
1\  \ 2 \\
3 \ \  1
\end{pmatrix}
$$

$$
\frac{1}{10}\begin{pmatrix}
1\  \ 2 \\
3 \ \  1
\end{pmatrix}
$$

$$
\begin{pmatrix}
0.1\  \ 0.2 \ \ 0.3\\
0 \ \ \   \  0.1 \ \ 0.2 \\
0 \ \ \ \  0.1 \ \ 0.3
\end{pmatrix}
$$





<img src="/Users/sergejloginov/Library/Application Support/typora-user-images/Снимок экрана 2021-10-29 в 01.54.43.png" alt="Снимок экрана 2021-10-29 в 01.54.43" style="zoom:67%;" /><img src="/Users/sergejloginov/Library/Application Support/typora-user-images/Снимок экрана 2021-10-29 в 01.55.01.png" alt="Снимок экрана 2021-10-29 в 01.55.01" style="zoom:67%;" />

Видим, что продуктивны две матрицы - третья и четвертая.





### Вывод

В данной лабораторной работе углубились в элементы линейной алгебры и освоили способы оценки производительности в Julia.