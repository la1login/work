module rand_f
    implicit none
    contains
    integer function rand_func(N) ! функция, возвращающая случайное целое число
    integer, intent(in) :: N      ! в промежутке от 0 до N
    real :: u
    call random_number(u)
    rand_func = 1 + FLOOR(N*u) ! пеходим с промежутка 0;1 к промежутку 1;N
end function
end module rand_f

program main
    use rand_f
    implicit none
    include "omp_lib.h"
    integer :: j, i, th
    integer, dimension(1:6) :: test ! массив для записи количества выпадения чисел
    test = 0
    !$omp parallel private(i, th) num_threads(6)
    th = omp_get_thread_num() + 1
    !$omp do
    do i = th, 10**6, 6 ! каждый поток будет выполнять свою последовательность итераций
        j = rand_func(6) ! случайное целое число от 1 до 6
        test(j) = test(j) + 1 ! каждый элемент массива - количество выпадений числа от 1 до 6
    end do
    !$omp end do
    print *, th, " имеет вероянтость", real(test(th))/sum(test) ! каждый поток выводит собственную информацию
    !$omp end parallel

end program main