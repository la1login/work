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
    use omp_lib
    implicit none
    procedure(f) :: func
    real(real64), intent(in) :: a, b
    integer(int64), intent(in) :: n
    integer(int64), intent(in) :: threads_num
    real(real64) :: res, step
    real(real64), allocatable :: tmp(:) 
    integer(int64) :: th, i
    real(real64) :: xi
    
    allocate(tmp(threads_num))
    step = (b - a) / real((n - 1), real64)
    res = (step / 2.0) * (func(a) + func(b))
    tmp = 0

    !$omp parallel private(th, i, xi) num_threads(threads_num)
    th = omp_get_thread_num()
    do i = th + 1, (n - 1), threads_num
        xi = a + i * step
        tmp(th + 1) = tmp(th + 1) + func(xi) * step
    end do
    !$omp end parallel

    res = res + sum(tmp)
    deallocate(tmp)
  end function trapezoidal

end module trapezoidal_rule
