! Модуль содержит функции для интегрирования
module integrands
  use iso_fortran_env, only : real32, real64
  implicit none

  contains
  ! Функция номер 1
  pure function integrand_01(x) result(res)
    implicit none
    real(real64), intent(in) :: x
    real(real64) :: res
    res = x
  end function integrand_01

  ! Ее аналитический интеграл для проверки
  pure function integral_01(x) result(res)
    implicit none
    real(real64), intent(in) :: x
    real(real64) :: res
    res = x**2 / 2.0
  end function integral_01

end module integrands
