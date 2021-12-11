include "random.f90"
program main
    use iso_fortran_env
    use random
    implicit none
    include "omp_lib.h"
    integer :: p, i, j, round, x = 10, y = 10, z = 10
    real :: test
    round = 0
    test = x * y * z / (x + y + z - 2)
    do j = 1, 10**6 ! метод Монте-Карло
        x = 10  ! начальное количество жетонов у каждого игрока
        y = 10
        z = 10    
        do i = 1, 100 ! воспроизводим отдельно взятую игру
            p = randomint(3) ! если выпадает 1, побеждает первый(х), забирает два жетона, у второго и третьего -1 жетон и тд
            select case(p)
                case(1)
                    x = x + 2
                    y = y - 1
                    z = z - 1
                case(2)
                    x = x - 1
                    y = y + 2
                    z = z - 1
                case(3)
                    x = x - 1
                    y = y - 1
                    z = z + 2
            end select
            if (x == 0 .or. y == 0 .or. z == 0) then 
                round = round + i ! фиксируем количество раундов в данной игре
                exit ! выходим из цикла
            end if
        end do
    end do
    print *,"Среднее количество раундов программно = ", real(round) / 10**6 ! находим среднее количество раундов в играх
    print *,"Среднее количество раундов по формуле = ", test
    print *,"Погрешность = ", test - real(round) / 10**6
end program main