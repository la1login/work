module random
  use iso_fortran_env
  implicit none

private
public :: monty, random_walk_1d, random_walk_avg_rounds,&
        & galton_board, randomint

contains

  ! Случайное целое число от 1 до n
  integer function randomint(n)
    implicit none
    integer, intent(in) :: n
    real :: x
    call random_number(x)
    randomint = ceiling(n * x)
  end function randomint

  ! Выбирает случайный элемент массива `array`
  integer function random_choice(array)
    implicit none
    integer, intent(in), dimension(1:) :: array
    random_choice = array(randomint(size(array)))
  end function

  
  ! Алгоритм игры Монти Холла
  ! alternate - меняет ли игрок выбор, если да
  ! то `.true.`, иначе `.false.`
  function monty(alternate)
    implicit none
    logical, intent(in) :: alternate
    integer :: monty

    integer, parameter :: doors_quantity = 3
    ! НЕ ПРИСВАИВАТЬ ЗНАЧЕНИЕ ПРИ ОБЪЯВЛЕНИИ !!!!
    ! За какой дверью приз
    logical(kind=1) :: doors(1:doors_quantity)
    ! Выбор игрока
    logical(kind=1) :: pick(1:doors_quantity)

    pick(1:doors_quantity) = .false.
    doors(1:doors_quantity) = .false.

    ! Дверь с призом
    doors(randomint(doors_quantity)) = .true.
    
    ! Выбор игрока
    pick(randomint(doors_quantity)) = .true.

    if (all(doors .eqv. pick)) then
      ! если совпало, то смена ведет к проигрышу
      if (alternate) then
        monty = 0
      else
        monty = 1
      end if
    else
      ! Игрок сразу не угадал, тогда у ведущего нет выбора
      ! и он открывает только одну дверь и смена ведет к победе
      if (alternate) then
        monty = 1
      else
        monty = 0
      end if
    end if
  end function monty

  subroutine random_walk_1d(start, stop, start_position, p, rounds, win)
    implicit none
    integer, intent(in) :: start, stop, start_position
    ! Вероятность успеха (неудачи 1 - p)
    real, intent(in) :: p
    integer(int64), intent(out) :: rounds
    logical(1), intent(out) :: win
    integer :: position
    real :: rnd

    position = start_position
    rounds = 0

    do while((position < stop) .and. (position > start))
      rounds = rounds + 1
      call random_number(rnd)
      if (rnd <= p) then
        position = position + 1
      else
        position = position - 1
      end if
    end do
    
    if (position == stop) then
      win = .true.
    else if (position == start) then
      win = .false.
    else
      error stop "Невозможная ситуация"
    end if
  end subroutine

  ! n - место старта
  ! a - вся сумма (конечна точка)
  ! p - вероятность успеха
  pure function random_walk_avg_rounds(p, n, a) result(avg_rounds)
    implicit none
    real, intent(in) :: p
    integer, intent(in) :: n, a
    real(real64) :: avg_rounds
    real :: q
    q = 1 - p
    avg_rounds = (1 - (q/p)**n) / (1 - (q/p)**a)
    avg_rounds = avg_rounds * a / (q - p)
    avg_rounds = n / (q - p) - avg_rounds
  end function random_walk_avg_rounds

  ! Доска Гальтона
  function galton_board(hight, n)
    implicit none
    integer(int64), intent(in) :: hight, n
    integer(int64) :: galton_board(0:hight)
    real :: rnd(1:hight)
    integer(int64) :: i, k

    galton_board = 0

    do i = 1,n,1
      call random_number(rnd)
      k = count(rnd > 0.5)
      galton_board(k) = galton_board(k) + 1
    end do

  end function galton_board

end module random