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
    implicit none
    include "omp_lib.h"
    real(real64), dimension(1:), intent(in) :: A
    integer(int32), intent(in) :: ths_num
    real(real64) :: S
    integer :: i, th ! счетчик и переменная для хранения номера потока
    real(real64), allocatable :: arr_for_sum(:) ! массив для суммы каждого потока
    
    if( .not. allocated(arr_for_sum) ) allocate(arr_for_sum(1:ths_num)) ! выделяем память с проверкой

    !$omp parallel private(th, i) num_threads(ths_num) ! для каждого потока будут свои экземпляры th и i
    th = omp_get_thread_num() + 1 ! к номеру потока доабив единицу для упрощения работы в цикле

    do i = 1, size(A), ths_num ! шаг - количество потоков
      arr_for_sum(th) = arr_for_sum(th) + A(i) ! к элементам массива каждый поток с каждой итерацией прибавляет свой элемент
    end do

    !$omp end parallel

    S = sum(arr_for_sum) ! находим сумму массива, в котором элементы - результаты суммирования каждого потока
    
    
  end function omp_sum

  function omp_max(A, ths_num) result(M)
    implicit none
    include "omp_lib.h"
    real(real64), dimension(1:), intent(in) :: A
    integer(int32), intent(in) :: ths_num
    real(real64) :: M
    integer(int64) :: length, i
    real(real64), allocatable :: arr_for_max(:) ! массив для хранения максимумов из каждого потока

    if( .not. allocated(arr_for_max) ) allocate(arr_for_max(ths_num)) ! выделение памяти


    !$omp parallel private(i, length) num_threads(ths_num)
    
    length = omp_get_thread_num()+1 ! упрощаем работу в цикле
    do i = 1, ths_num, ths_num
      arr_for_max(length) = A(length) ! заполняем массив для максимумов первыми элементами массива А для дальнейшего сравнения
    end do
    do i = 1, size(A) - ths_num, ths_num ! цикл сравнения элементов вида а(n) и a(n+1) но с учетом выполнения в потоках
      if (arr_for_max(length) < A(length + ths_num)) then
        arr_for_max(length) = A(length + ths_num)
      end if
    end do
    !$omp end parallel
    M = maxval(arr_for_max) ! находим максимальное значение из тех, которые нашел каждый поток
  end function omp_max
  
  ! минимум находим по тому же принципу, что и максимум
  function omp_min(A, ths_num) result(M)
    implicit none
    include "omp_lib.h"
    real(real64), dimension(1:), intent(in) :: A
    integer(int32), intent(in) :: ths_num
    real(real64) :: M
    integer(int64) :: length, i
    real(real64), allocatable :: arr_for_min(:)

    if( .not. allocated(arr_for_min) ) allocate(arr_for_min(ths_num))

    !$omp parallel private(i, length) num_threads(ths_num)
    
    length = omp_get_thread_num()+1
    do i = 1, ths_num, ths_num
      arr_for_min(length) = A(length)
    end do
    do i = 1, size(A) - ths_num, ths_num
      if (arr_for_min(length) > A(length + ths_num)) then
        arr_for_min(length) = A(length + ths_num)
      end if
    end do
    !$omp end parallel
    M = minval(arr_for_min)
  end function omp_min
end module reduction

