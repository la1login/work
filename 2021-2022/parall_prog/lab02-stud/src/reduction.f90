module reduction
  use iso_fortran_env, only: int32, int64, real32, real64
  implicit none
  private
! Доступные вовне функции и подпрограммы
  public :: omp_sum, omp_max, omp_min
  public :: omp_reduction
  
  abstract interface
    function omp_reduction(A, ths_num)
      double precision, dimension(1:), intent(in) :: A
      integer, intent(in) :: ths_num
      double precision :: omp_reduction
    end function omp_reduction
  end interface
  
  contains
  function omp_sum(A, ths_num) result(S)
    use omp_lib
    implicit none
    real(real64), dimension(1:), intent(in) :: A
    integer(int32), intent(in) :: ths_num
    integer :: i, th
    real(real64) :: S
    real(real64), allocatable :: tmp(:)
    
    allocate(tmp(ths_num))
    S = 0
    tmp = 0
    !$omp parallel private(th, i) num_threads(ths_num)
    th = omp_get_thread_num()
    do i = th + 1, size(A), ths_num
        tmp(th+1) = A(i) + tmp(th+1)
    end do
    !$omp end parallel
    do i = 1, size(tmp)
      S = S + tmp(i)
    end do

    deallocate(tmp)

  end function omp_sum

  function omp_max(A, ths_num) result(M)
    use omp_lib
    implicit none
    real(real64), dimension(1:), intent(in) :: A
    integer(int32), intent(in) :: ths_num
    real(real64) :: M
    integer(int64) :: length, i, th
    real(real64), allocatable :: tmp(:)
    
    length = size(A)
    allocate(tmp(ths_num))
    !$omp parallel private(th, i) num_threads(ths_num)
    th = omp_get_thread_num()
    tmp(th + 1) = A(th + 1)
    do i = th + 1, size(A), ths_num
        if (A(i) > tmp(th + 1)) then
          tmp(th+1) = A(i)
        end if
    end do
    !$omp end parallel
    M = maxval(tmp)
    deallocate(tmp)
  end function omp_max
  
  function omp_min(A, ths_num) result(M)
    use omp_lib
    implicit none
    real(real64), dimension(1:), intent(in) :: A
    integer(int32), intent(in) :: ths_num
    real(real64) :: M
    integer(int64) :: length, i, th
    real(real64), allocatable :: tmp(:)
    
    length = size(A)
    allocate(tmp(ths_num))
    !$omp parallel private(th, i) num_threads(ths_num)
    th = omp_get_thread_num()
    tmp(th + 1) = A(th + 1)
    do i = th + 1, size(A), ths_num
        if (A(i) < tmp(th + 1)) then
          tmp(th+1) = A(i)
        end if
    end do
    !$omp end parallel
    M = minval(tmp)
    deallocate(tmp)
  end function omp_min
end module reduction

