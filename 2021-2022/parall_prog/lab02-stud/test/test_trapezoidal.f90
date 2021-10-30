include "../src/trapezoidal_rule.f90"
include "../src/integrands.f90"
include "../src/stats.f90"

program test_trapezoidal
  use iso_fortran_env, only : int32, int64, real32, real64
  use stats
  use trapezoidal_rule
  use integrands
  implicit none
  include "omp_lib.h"
  ! Параметры
  ! a -  левый конец интервала,
  ! b -  правый конец интервала,
  ! n - число точек разбиения интервала.
  ! threads_num -- максимальное количество нитей
  ! test_num -- число повторений
  real (real64), parameter :: a = +0.0
  real (real64), parameter :: b = +2.0
  integer (int64), parameter :: n = 10**6
  integer (int64), parameter :: threads_num = 16
  integer (int64), parameter :: test_num = 10
  ! Для вычисления среднего
  real (real64) :: avg_T
  real (real64) :: t1, t2
  ! Приближенное значение интеграла
  real (real64) :: integral_approx
  ! Точное значение интеграла
  real (real64) :: integral_exact
  ! счетчики цикла
  integer (int64) :: i, tn

  avg_T = 0.0d0
  print '("#",a4,",",a18,",",a18,",",a18)', "th","Avg. time","abs. error"," error"
  do tn = 1,threads_num,1
    ! Повторяем вычисления несколько раз и находим среднее
    do i = 1,test_num,1
      t1 = omp_get_wtime(t1)
      integral_approx = trapezoidal(integrand_01, a, b, n, tn)
      t2 = omp_get_wtime(t2)
      call online_average(i, t2 - t1, avg_T)
    end do
    integral_exact = integral_01(b) - integral_01(a)
    print '(i4,",",G0,",",G0,",",G0)', tn, avg_T, &
          & abs(integral_approx - integral_exact), &
          & abs(integral_approx - integral_exact) / integral_exact
    ! call sleep(1)
  end do
end program test_trapezoidal
