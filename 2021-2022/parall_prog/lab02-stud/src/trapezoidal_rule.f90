module trapezoidal_rule
  use iso_fortran_env, only : int32, int64, real32, real64
  implicit none

  abstract interface
    ! Абстрактный интерфейс для подинтегральной функции
    pure function f(x)
      double precision, intent(in) :: x
      double precision :: f
    end function f
  end interface

  private

  public :: trapezoidal

  contains
  !----------------------------------------------------------------
  ! Функция вычисляющая значение интеграла по формуле трапеции
  ! Функция func --- подынтегральная функция от одного аргумента 
  ! Параметры a и b задают пределы интегрирования
  ! Параметр n --- число точек разбиения отрезка [a, b]
  ! Параметра threads_num --- число потоков, которые может использовать
  ! функция
  !----------------------------------------------------------------
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

end module trapezoidal_rule
