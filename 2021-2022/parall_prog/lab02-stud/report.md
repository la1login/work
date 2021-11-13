### **РОССИЙСКИЙ УНИВЕРСИТЕТ ДРУЖБЫ НАРОДОВ**

### **Факультет физико-математических и естественных наук**

### **Кафедра прикладной информатики и теории вероятностей**











### **Отчет по лабораторной работе № 2**

### *Дисциплина: Параллельное программирование*









Студент:	Логинов Сергей Андреевич

Группа:	  НФИбд-01-18 



​																							

​	**МОСКВА 2021г**

### Задание

1. Используя средства OpenMP для редукции действий с массивами, реализуйте параллельные функции по нахождению суммы, минимума и максимума некоторого массива.

   Протестируйте быстродействие параллельных функций, постройте графики.

2. Используйте формулу трапеции для реализации функции trapezoidal, которая аппроксимирует значение интеграла от скалярной функции *f(x)*.
   $$
   \int_a^b f(x)dx = \frac{h}{2}(f(a) + f(b)) + \sum_{i = 1}^{n-1}f(x_i)
   $$





### Задание 1

В файле reduction.f90 допишем код для описания трех функций: сумма, максимум и минимум массива:

```fortran
function omp_sum(A, ths_num) result(S)
    implicit none
    include "omp_lib.h"
    real(real64), dimension(1:), intent(in) :: A
    integer(int32), intent(in) :: ths_num
    real(real64) :: S
    integer :: i, th ! счетчик и переменная для хранения номера потока
    real(real64), allocatable :: arr_for_sum(:) ! массив для суммы каждого потока
    
    if( .not. allocated(arr_for_sum) ) allocate(arr_for_sum(1:ths_num)) ! выделяем память с проверкой

    !$omp parallel private(th, i) num_threads(ths_num) ! для каждого потока будут свои экземпляры th и i
    th = omp_get_thread_num() + 1 ! к номеру потока доабив единицу для упрощения работы в цикле

    do i = 1, size(A), ths_num ! шаг - количество потоков
      arr_for_sum(th) = arr_for_sum(th) + A(i) ! к элементам массива каждый поток с каждой итерацией прибавляет свой элемент
    end do

    !$omp end parallel

    S = sum(arr_for_sum) ! находим сумму массива, в котором элементы - результаты суммирования каждого потока
    
    
  end function omp_sum
```

```fortran
function omp_max(A, ths_num) result(M)
    implicit none
    include "omp_lib.h"
    real(real64), dimension(1:), intent(in) :: A
    integer(int32), intent(in) :: ths_num
    real(real64) :: M
    integer(int64) :: length, i
    real(real64), allocatable :: arr_for_max(:) ! массив для хранения максимумов из каждого потока

    if( .not. allocated(arr_for_max) ) allocate(arr_for_max(ths_num)) ! выделение памяти


    !$omp parallel private(i, length) num_threads(ths_num)
    
    length = omp_get_thread_num()+1 ! упрощаем работу в цикле
    do i = 1, ths_num, ths_num
      arr_for_max(length) = A(length) ! заполняем массив для максимумов первыми элементами массива А для дальнейшего сравнения
    end do
    do i = 1, size(A) - ths_num, ths_num ! цикл сравнения элементов вида а(n) и a(n+1) но с учетом выполнения в потоках
      if (arr_for_max(length) < A(length + ths_num)) then
        arr_for_max(length) = A(length + ths_num)
      end if
    end do
    !$omp end parallel
    M = maxval(arr_for_max) ! находим максимальное значение из тех, которые нашел каждый поток
  end function omp_max
```

```fortran
! минимум находим по тому же принципу, что и максимум
  function omp_min(A, ths_num) result(M)
    implicit none
    include "omp_lib.h"
    real(real64), dimension(1:), intent(in) :: A
    integer(int32), intent(in) :: ths_num
    real(real64) :: M
    integer(int64) :: length, i
    real(real64), allocatable :: arr_for_min(:)

    if( .not. allocated(arr_for_min) ) allocate(arr_for_min(ths_num))

    !$omp parallel private(i, length) num_threads(ths_num)
    
    length = omp_get_thread_num()+1
    do i = 1, ths_num, ths_num
      arr_for_min(length) = A(length)
    end do
    do i = 1, size(A) - ths_num, ths_num
      if (arr_for_min(length) > A(length + ths_num)) then
        arr_for_min(length) = A(length + ths_num)
      end if
    end do
    !$omp end parallel
    M = minval(arr_for_min)
  end function omp_min
```

Запустим тест три раза. Простестируем сумму, максимум и минимум:

![Снимок экрана 2021-11-01 в 22.59.27](/Users/sergejloginov/Library/Application Support/typora-user-images/Снимок экрана 2021-11-01 в 22.59.27.png)

Для построения графиков мне пришлось воспользоваться другим устройством(windows-машина), в котором при компиляции появилось сообщение о несоотвествии числа потоков в программе и оптимальным для устройства. Изменил число потоков в тесте на 8 и получил следующие графики:

![make](/Users/sergejloginov/work/2021-2022/parall_prog/lab02-stud/image/make.png)

Функция omp_sum:

![effectiveness_sum](/Users/sergejloginov/work/2021-2022/parall_prog/lab02-stud/image/effectiveness_sum.png)

![](/Users/sergejloginov/work/2021-2022/parall_prog/lab02-stud/image/time_sum.png)

![speedup_sum](/Users/sergejloginov/work/2021-2022/parall_prog/lab02-stud/image/speedup_sum.png)



Функция omp_max:

![effectiveness_max](/Users/sergejloginov/work/2021-2022/parall_prog/lab02-stud/image/effectiveness_max.png)

![time_max](/Users/sergejloginov/work/2021-2022/parall_prog/lab02-stud/image/time_max.png)

![speedup_max](/Users/sergejloginov/work/2021-2022/parall_prog/lab02-stud/image/speedup_max.png)



Функция omp_min:

![effectiveness_min](/Users/sergejloginov/work/2021-2022/parall_prog/lab02-stud/image/effectiveness_min.png)

![time_min](/Users/sergejloginov/work/2021-2022/parall_prog/lab02-stud/image/time_min.png)

![speedup_min](/Users/sergejloginov/work/2021-2022/parall_prog/lab02-stud/image/speedup_min.png)



2. В файле trapezoidal_rule.f90 допишем код в соответствии с формулой
   $$
   \int_a^b f(x)dx = \frac{h}{2}(f(a) + f(b)) + \sum_{i = 1}^{n-1}f(x_i)
   $$
   

```fortran
function trapezoidal(func, a, b, n, threads_num) result (res)
    implicit none
    include "omp_lib.h"
    procedure(f) :: func
    real(real64), intent(in) :: a, b
    integer(int64), intent(in) :: n
    integer(int64), intent(in) :: threads_num
    real(real64) :: h, res
    integer :: i, th
    real(real64), allocatable :: arr_tr(:)

    if( .not. allocated(arr_tr) ) allocate(arr_tr(threads_num))
    h = (b - a)/n ! вычисляем шаг как разница между верхним и нижним пределом 
    !интегрирования деленная на число точек разбиения
    !$omp parallel private(i) num_threads(threads_num)
    th = omp_get_thread_num() + 1
    do i = 1, n-1, threads_num
      arr_tr(th) = arr_tr(th) + func(a + i * h) * h ! суммируем, res общая для всех потоков 
    end do
    !$omp end parallel
    res = sum(arr_tr) + h / 2 * (func(a) + func(b)) ! дописываем формулу, получив значение суммы


  end function trapezoidal
```

Запустим тест:

![Снимок экрана 2021-11-01 в 23.46.28](/Users/sergejloginov/Library/Application Support/typora-user-images/Снимок экрана 2021-11-01 в 23.46.28.png)

С построением графиков вышли такие же проблемы:

![make1](/Users/sergejloginov/work/2021-2022/parall_prog/lab02-stud/image/make1.png)

![effectiveness](/Users/sergejloginov/work/2021-2022/parall_prog/lab02-stud/image/effectiveness.png)

![time](/Users/sergejloginov/work/2021-2022/parall_prog/lab02-stud/image/time.png)

![speedup](/Users/sergejloginov/work/2021-2022/parall_prog/lab02-stud/image/speedup.png)

