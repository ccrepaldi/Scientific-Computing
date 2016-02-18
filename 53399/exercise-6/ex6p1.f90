module integer_module
  integer :: i1,i2,i3,i4,i5,i6,i7,i8,i9,i10
end module integer_module

program problem1
  use integer_module
  implicit none
  character(len=80) :: item
  integer :: iarg, status

  iarg=command_argument_count()

  ! the program shall be run with only one command line argument
  if (iarg/=1) then
     print *, 'Number of arguments is invalid.' 
     print *, 'Please choose between the item a or b.'
     stop
  end if
  
  call get_command_argument(1,item)

  ! verifies the choosen item (a or b)

  item_selection: select case (item)
  case ('a') ! resolve the problem 1a. and prints the output

     call execute_item_a
     print *, i1,i2,i3,i4,i5,i6,i7,i8,i9,i10

  case ('b') ! resolve the problem 1b. and prints the output
  
     call execute_item_b
     print *, i1,i2,i3,i4,i5,i6,i7,i8,i9,i10

  case default ! in case of the item is neither a or b

     print *, 'Error: Argument not recognized. Select the problem item: a or b.'

  end select item_selection

contains

  subroutine execute_item_a
    use integer_module
    implicit none

    read *,i1,i2,i3,i4,i5,i6
    read *,i7,i8,i9,i10

  end subroutine execute_item_a

  subroutine execute_item_b
    use integer_module
    implicit none

    read '(4i10)',i1,i2,i3,i4,i5,i6
    read '(4i10)',i7,i8,i9,i10

  end subroutine execute_item_b

end program problem1
