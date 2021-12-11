# Лабораторная работа № 6

## **Решение моделей в непрерывном и дискретном времени**

Логинов Сергей

НФИбд-01-18

# Цель работы

Освоение специализированных пакетов для решения задач в непрерывном и дискретном времени

# Ход работы

Для начала были выполнены следующие задачи из пособия:

- Решение обыкновенных дифференциальных уравнений

$u' = au, \space u(0) = u_0$

$\begin{cases} x' = \sigma (y-x) \\ y' = \rho x - y - xz \\ z' = xy - \beta z \end{cases}$

- Модель Лотки-Вольтерры

$\begin{cases} x' = (\alpha - \beta y)x \\ y' = (- \gamma + \delta x)y \end{cases}$

# Ход работы

Далее были выполнены задания для самостоятельного выполнения

1. Модель Мальтуса

   $x' = ax, \space a = b - c$

   \includegraphics[width=4in]{graphics/1.png}

# Ход работы

2. Логистическая модель роста популяции

   $x' = rx(1 - \frac{x}{k}, \space r>0, \space k>0)$

\includegraphics[width=4in]{graphics/2.png}

# Ход работы

3. Модель эпидемии SIR

   $\begin{cases} s'=-\beta is \\ i' = \beta is - \nu i \\ r' = \nu i \end{cases}$

\includegraphics[width=4in]{graphics/3.png}

# Ход работы

4. Модель эпидемии SEIR

   $\begin{cases} s' = -\frac{\beta}{N}si \\ e' = \frac{\beta}{N}si - \delta e \\ i'=\delta e - \gamma i \\ r'= \gamma i \end{cases}$

\includegraphics[width=3.5in]{graphics/4.png}

# Ход работы

6. Модель отбора на основе конкурентных отношений

   $\begin{cases}x'=\alpha x - \beta xy \\ y' = \alpha y - \beta xy \end{cases}$

\includegraphics[width=3.5in]{graphics/5.png}

# Ход работы

7. Модель консервативного гармонического осциллятора

   $x'' + \omega_0^2 x = 0, \space x(t_0) = x_0, \space x'(t_0) = y_0$

\includegraphics[width=4in]{graphics/6.png}

# Ход работы

8. Модель свободных колебаний гармонического осциллятора

   $x'' + 2\gamma x' + \omega_0^2 = 0, \space x(t_0) = x_0, \space x'(t_0) = y_0$

\includegraphics[width=4in]{graphics/7.png}

# Вывод

В ходе лабораторной работы освоили специализированные пакеты для решения задач в непрерывном и дискретном времени и применили их на практике

