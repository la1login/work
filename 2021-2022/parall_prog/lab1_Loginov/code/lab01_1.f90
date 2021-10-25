program main
    use iso_fortran_env
    implicit none
    include "omp_lib.h"
    real(Real64) :: t1, t2, summ, med, disp
    real(8), allocatable :: arr(:), arr_disp(:) ! два динамических массива
    integer :: i, N
    i = 1
    
    ! замеряем время работы подпрограммы wait
    do i=1,10,1
        t1 = omp_get_wtime()
        call wait(1)
        t2 = omp_get_wtime()
        print *,i, "замер : ", t2-t1
    end do
    
    ! проведем большее число замеров (10^6), результаты будем записывать
    ! в массив для дальнейшей работы с его элементами
    N = 10**6
    if( .not. allocated(arr) ) allocate(arr(1:N)) ! выделяем память(с проверкой выделения) под массив 
    do i=1, N
        t1 = omp_get_wtime()
        summ = exp(t1) + log(t1) ! произвольные вычисления
        t2 = omp_get_wtime()
        arr(i) = t2-t1  ! запись в массив
    end do
    
    med = sum(arr) / size(arr) ! находим среднее значение массива

    if( .not. allocated(arr_disp) ) allocate(arr_disp(1:N)) ! второй массив для поиска дисперсии, в нем будут элементы вида
    !(Xi - X`)^2(часть формулы дисперсии), где Xi - замер времени выполнения вычислений из прошлого цикла а X` - найденное среднее значение
    do i=1, N
        arr_disp(i) = (arr(i) - med)**2
    end do
    
    disp = sqrt(sum(arr_disp)/N) ! дополним формулу и найдем дисперсию
    
    print *, "   "
    write (*, *) "Median =", med
    print *, "   "
    write (*, *) "Disp =", disp
    deallocate(arr, arr_disp) ! освободим память
end program main

subroutine wait(i) ! подпрограмма, реализующая "сон" на 1 секунду
    implicit none
    integer, intent(in) :: i
    call sleep(i)
end subroutine wait

    