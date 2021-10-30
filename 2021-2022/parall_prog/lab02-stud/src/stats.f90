! Вычисление статистических величин
module stats
  use iso_fortran_env, only: int32, int64, real32, real64
  implicit none
  private

! Доступные вовне функции и подпрограммы
  public :: online_average, online_variance, mean
  
  interface online_average
    module procedure :: online_average_i4, online_average_i8
  end interface online_average

  contains

  ! просто среднее
  pure function mean(array)
    implicit none
    real(real64), intent(in) :: array(1:)
    real(real64) :: mean
    mean = sum(array) / size(array)
  end function mean

  ! Вычисление среднего по мере поступления новых данных
  ! [x_1,x_2,x_3,...,x_i,...]
  ! avg_i = avg_(i-1) + (x_i - avg_(i-1)) / i
  pure subroutine online_average_i8(i, x, avg)
    implicit none
    real(real64),intent(in) :: x
    real(real64),intent(inout) :: avg
    integer(int64), intent(in) :: i
    if (i > 1) then
      avg = avg + (x - avg) / dble(i)
    else
      avg = x
    end if
    ! i = i + 1
  end subroutine
  
  pure subroutine online_average_i4(i, x, avg)
    implicit none
    real(real64),intent(in) :: x
    real(real64),intent(inout) :: avg
    integer(int32), intent(in) :: i
    if (i > 1) then
      avg = avg + (x - avg) / dble(i)
    else
      avg = x
    end if
    ! понадобится для параллельных вычислений
    ! i = i + 1
  end subroutine


  subroutine online_variance(i, x, avg, m2, var)
    implicit none
    real(real64),intent(in) :: x
    integer(int64), intent(in) :: i
    real(real64),intent(inout) :: avg, var, m2
    real(real64) :: D1, D2
    
    D1 = x - avg
    avg = avg + D1 / dble(i)
    D2 = x - avg
    M2 = M2 + D1 * D2
    var = M2 / i
    ! понадобится для параллельных вычислений
    !i = i + 1
  end subroutine

end module stats
