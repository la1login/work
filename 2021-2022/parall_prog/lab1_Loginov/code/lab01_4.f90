!
!   ВАЖНОЕ ЗАМЕЧАНИЕ. Я НЕ СОВСЕМ ПОНЯЛ ЗАДАЧУ ВЫЧИСЛЕНИЯ ПОЛИНОМА, ПОЭТОМУ В КОДЕ ПРОСТО НАХОДИТСЯ КВАДРАТ ДЕЙСТВИТЕЛЬНОГО ЧИСЛА,
!   ОСТАЛЬНОЙ ФУНКЦИОНАЛ РЕАЛИЗОВАН В ПОЛНОЙ МЕРЕ
!   НО ПРИ НЕОБХОДИМОСТИ ДОСТАТОЧНО БУДЕТ ЗАМЕНИТЬ НЕСКОЛЬКО СТРОК, ЧТОБЫ ПОМЕНЯТЬ ВЫЧИСЛЯЕМУЮ ФУНКЦИЮ
!
module main_fun     ! в этом модуле опишем саму функцию map
    implicit none   
    abstract interface  ! задаем абстрактный интерфейс для функции-аргумента
        pure function f(x)
            real, intent(in) :: x
            real :: f
        end function f
    end interface
    contains
    function map(func, x)   ! описываем функцию map
        implicit none
        procedure(f) :: func    ! функция аргумент
        real, intent(in), dimension(1:) :: x    ! входной массив
        real, dimension(1: size(x)) :: map  ! возвращаем массив как результат функции
        integer :: n, i

        n = size(x)
        
        do i = 1, n 
            map(i) = func(x(i))
        end do

    end function
end module main_fun

module side_function    ! описываем вспомогательную функцию в этом модуле
    contains
    pure function funcc(x)  !вспомогательная функция
        implicit none
        real, intent(in) :: x
        real :: funcc
        funcc = x**2
    end function funcc
end module side_function

module elemental_function   ! элементарная функция для второго задания
    implicit none
    contains
    elemental function elem(x)
        real :: elem  
        real, intent(in) :: x
        elem = x**2
    end function
end module
program main
    use side_function
    use main_fun
    use elemental_function
    implicit none
    real, allocatable :: x(:), y(:), z(:) 
    integer :: i, n
    n = 100
    if( .not. allocated(x) ) allocate(x(1:n)) ! выделяем память(с проверкой выделения) под массив 
    if( .not. allocated(y) ) allocate(y(1:n)) ! выделяем память(с проверкой выделения) под массив 
    if( .not. allocated(z) ) allocate(z(1:n)) ! выделяем память(с проверкой выделения) под массив 
    do i = 1, n
        x(i) = i + 1.0
    end do
    y = map(funcc, x)
    write(*, *) y(90:100)
    z = elem(x)
    write(*, *) z(90:100)
end program main