include "random.f90"
program main
    use random
    implicit none
    include "omp_lib.h"
    integer :: j, i, k, q
    integer :: test
    real, dimension(1:100) :: p
    test = 56 ! зададим начальное значение, к которому хотим искать соотвествие среди случайных чисел
    p = 0.0
    !$omp parallel private(i, q, k) num_threads(8)
    !$omp do
    do i = 2, 100 ! группы от 2 до 100 человек
        do q = 1, 10**6    ! 10**6 экспериментов методом Монте-Карло
            do k = 2, i ! находим вероятность того, что наше выбранное число совпадает со случайно сгенерированным функцией randomint
                j = randomint(365)
                if (j == test) then
                    p(i) = p(i) + 1.0 ! считаем совпадения
                end if
            end do
        end do
    end do
    !$omp end do
    !$omp end parallel
    do i = 2, 100 ! с двойки тк вероятность совпадения при одном человеке ноль
        p(i) = (p(i)) / 10**6
        print '(f5.3)', p(i)
    end do
    open(1, file = "birthday.txt", status = "old") ! запишем вероятности в файл
    do i = 1, 100
        write(1, *) p(i)
    end do
    close(1)
end program main