include "random.f90"
program main
    use iso_fortran_env
    use random
    implicit none
    include "omp_lib.h"
    integer(int64) :: r, rounds = 0
    real(real64) :: t1, t2, t3, t4
    logical(1) :: win
    real :: p, winrate
    integer :: i, start, end, n, wins = 0
    p = 0.5 ! вероятность выигрыша
    r = 0 ! кол-во раундов
    start = 0 ! минимальное значение(проигрыш)
    end = 10 ! конечное значение(выигрыш)
    n = 9 ! текущее значение
    
    t1 = omp_get_wtime()
    do i = 1, 10**6
        call random_walk_1d(start, end, n, p, r, win)
        if(win) then
            wins = wins + 1 ! считаем количество попед
        end if
        rounds = rounds + r ! и количество раундов
    end do
    t2 = omp_get_wtime()
    t3 = t2 - t1
    winrate = real(wins) / 10**6 !частота побед
    rounds = rounds / 10**6 ! среднее количество раундов в игре
    print *,"Вероятность победы ", winrate, " Среднее количество раундов ", rounds
    print *, " time = ", t3

    wins = 0
    rounds = 0

    t1 = omp_get_wtime()
    !$omp parallel private(i) num_threads(8)
    !$omp do reduction(+ : wins, rounds)
    do i = 1, 10**6
        call random_walk_1d(start, end, n, p, r, win)
        if(win) then
            wins = wins + 1
        end if
        rounds = rounds + r
    end do
    !$omp end do
    !$omp end parallel
    t2 = omp_get_wtime()
    t4 = t2 - t1
    winrate = real(wins) / 10**6
    rounds = rounds / 10**6
    print *, "Вероятность победы ", winrate, " Среднее количество раундов ", rounds 
    print *, " time = ", t4
    print *, "Выигрыш в производительности составил", t3 / t4 ! проверим, что параллельное вычисление дало выигрыш в производительности
end program main