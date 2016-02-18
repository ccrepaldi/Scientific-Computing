program problem5
  implicit none
  real :: num1,num2 ! the two real numbers for the calculation
  character(len=80) :: oper, arg ! operator and command line argument
  integer :: narg, i, status ! number of arguments, counter and internal i/o status
  logical :: valid_arguments=.TRUE.

  narg=command_argument_count()

  ! verifies the number of command line arguments

  if (narg /= 3) then
     print *, 'Syntax error, please use: <number> <operator> <number>.'
     stop
  end if

  ! verifies the command line arguments and their formats

  call get_command_argument(1,arg)
  read(arg,*,iostat=status) num1
  if (status/=0) then
     print *, 'Number(1) type invalid.'
     valid_arguments=.FALSE.
  end if
    call get_command_argument(2,arg)
  read(arg,'(a)',iostat=status) oper
  if (status/=0) then
     print *, 'Operator argument type invalid.'
     valid_arguments=.FALSE.
  end if
  call get_command_argument(3,arg)
  read(arg,*,iostat=status) num2
  if (status/=0) then
     print *, 'Number(2) type invalid.'
     valid_arguments=.FALSE.
  end if

  if (.NOT.valid_arguments) stop ! if the argument type is wrong (not valid)
                                 ! the program stops after printing the warnings
  
  ! verifies the operator type and print the output of the calculation
  
  operator_select: select case (oper)
  case('+')
     print *, num1+num2
  case ('-')
     print *, num1-num2
  case ('*')
     print *, num1*num2
  case ('/')
     print *, num1/num2
  case default
     print *, "Non-valid operator."
     print *, "Please choose between the four basics operators: + , - , * , / ."
     print *, "The * operator shall be used as \* , e.g. 2 \* 3 ."
     stop
  end select operator_select

end program problem5
