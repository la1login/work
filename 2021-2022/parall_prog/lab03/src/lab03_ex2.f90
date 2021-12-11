program main
    use iso_fortran_env
    implicit none
    include "omp_lib.h"
    real :: u, y
    real(Real64) :: t1, t2, t3, t4, z1, z2
    integer i, j, k, q
    real, dimension(1:3) :: test, test1
    test = [0.0, 0.0, 0.0]
    t1 = omp_get_wtime()
    !$omp parallel private(i, j, u) shared(test) num_threads(8)
    !$omp do
    do i = omp_get_thread_num() + 1, 10**6, 8
        call random_number(u) !получаем случайное число от 0 до 1
        j = 1 + FLOOR(3*u) !    и переводим его в пределы от 1 до 3
        test(j) = test(j) + 1.0 ! записываем количество выпавших единиц, двоек и троек
    end do
    !$omp end do
    !$omp end parallel
    t2 = omp_get_wtime()
    z1 = t2 - t1
    print *, "Вероятность выиграть без изменения выбора: ", test(1)/sum(test)
    print *, "Вероятность выиграть с изменением выбора: ", (test(2) + test(3))/sum(test) 
    print *, "Время выполнения через потоки: ", z1
    test1 = [0.0, 0.0, 0.0]
    t3 = omp_get_wtime()
    do q = 1, 10**6
        call random_number(y)
        k = 1 + FLOOR(3*y)
        test1(k) = test1(k) + 1.0
    end do
    t4 = omp_get_wtime()
    z2 = t4 - t3
    print *, "Время выполнения без использования потоков: ", z2
    print *, " Проверка ", z2 / z1
end program main