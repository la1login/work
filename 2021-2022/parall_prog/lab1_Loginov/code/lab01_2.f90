module subs ! отдельный модуль для функции суммы через потоки
    implicit none
    contains
    integer function summ_by_tr(intarray, n) 
        include "omp_lib.h"
    
        integer, intent(in) :: n ! размер массива
        integer, intent(in), dimension(1:n) :: intarray ! входной массив
        integer :: thread, i
        integer :: base(4) ! вспомогательный массив, в которой свое значение суммы будет записывать каждый поток
    
        base = [0, 0, 0, 0] ! изначально элементы равны нулю
        !$omp parallel num_threads(4) ! начало параллельной области
        thread = omp_get_thread_num() + 1 ! тк нумерация потоков начинается с нуля, нам необходимо увеличить номер на единицу для корректной
                                            ! работы с массивом

        do i = thread, n, 4 ! шаг 4 тк 4 потока
            base(thread) = intarray(i) + base(thread) ! суммируем элементы 
        end do
        !$omp end parallel ! выход из параллельной области
        summ_by_tr = sum(base) ! сумма через потоки
    end function
end module subs    
program main
    use iso_fortran_env
    use subs
    implicit none
    include "omp_lib.h"
    integer :: n
    !$omp parallel ! начало параллельной области
        n = omp_get_num_threads() ! смотрим, сколько потоков создается по умолчанию
    !$omp end parallel
    write(*, *) "Количество созданных потоков: ", n
    call test() ! вызов подпрограммы-тестера
end program main



subroutine test() ! подпрограмма для тестирования
    use iso_fortran_env
    use subs    ! подключили модуль с нашей функцией
    implicit none
    integer :: i, n
    integer, allocatable :: arr(:) ! динамический массив со значениями
    n = 100
    if( .not. allocated(arr) ) allocate(arr(1:n)) ! выделяем память(с проверкой выделения) под массив 

    do i = 1, n
        arr(i) = i
    end do

    if (summ_by_tr(arr, n) == sum(arr)) then ! проверяем, равна ли сумма через потоки сумме, найденной через библиотечну функцию sum
        write(*, *) "True"
    else
        write(*, *) "False"
    end if

    write(*, *) "Сумма через потоки = ", summ_by_tr(arr, n)
    write(*, *) "Сумма через библиотечную функцию = ", sum(arr)

    deallocate(arr) ! освободим память
end subroutine


    