!
!           В ДАННОМ ЗАДАНИИ В КАЧЕСТВЕ ВЫЧИСЛЕНИЙ ВОЗЬМЕМ ФУНКЦИЮ ТИПА sqrt(exp(sin(X)))
!
program main
    use iso_fortran_env    
    implicit none
    include "omp_lib.h"
    real, allocatable :: args(:), fullarr(:) ! объявим два динамических массива
    real(Real64) :: t1, t2, time, time1 ! переменные для замера времени
    integer :: i, n

    n = 100

    if( .not. allocated(args) ) allocate(args(1:n)) ! выделяем память(с проверкой выделения) под массив 
    if( .not. allocated(fullarr) ) allocate(fullarr(1:n)) ! выделяем память(с проверкой выделения) под массив 

    do i = 1, n                     ! заполняем начальные массивы значениями типа real
        args(i) = i + 1.0
        fullarr(i) = i + 1.0
    end do

    t1 = omp_get_wtime() ! первый замер времени
    do i = 1, n
        args(i) = sqrt(exp(sin(args(i))))  ! поэлементно вычислили значения в первом массиве
    end do
    t2 = omp_get_wtime()
    time = t2 - t1 !    временные затраты на поэлементное вычисление
    write(*, *) "Поэлементно :", time

    t1 = omp_get_wtime() ! второй замер времени
    fullarr = sqrt(exp(sin(fullarr))) ! в данном случае наша функция будет применена ко всем элементам массива без использования цикла
    t2 = omp_get_wtime()
    time1 = t2 - t1 ! временные затраты на вычисление функции с массивом в виде аргумента
    write(*, *) "Массив в виде аргумента :", time1
    if(time > time1) then       ! проверка 
        write(*, *) "Второй способ дал выигрыш в проивзодительности"
    end if
    deallocate(args, fullarr) ! осовободим память
end program main