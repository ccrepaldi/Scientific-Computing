program problem3
  ! convert number to real from stdin or command line
  implicit none
  real, allocatable :: x(:)
  character(len=80), allocatable :: c(:)
  character(len=80) :: msg
  integer :: narg,status,i,iter

  narg=command_argument_count()

  ! if the user uses the command line to send the input to the program
  ! he/she can send more than one number at time
  ! e.g. ./a.out 3e4 22.44 7 34 potato @ ? 445.444
  ! it generates the following output:
  ! 30000.000
  ! 22.440
  ! 7.000
  ! 34.000
  ! Format error: Input cannot be converted into a real number.
  ! Format error: Input cannot be converted into a real number.
  ! Format error: Input cannot be converted into a real number.
  ! 445.444

  if (narg .EQ. 0) then ! if there is no command line argument the program
     allocate ( c(1) )
     allocate ( x(1) )
     iter=1
     read(5,*) c        ! reads from stdin
  else if (narg .GT. 0) then ! if there is one command line argument the program
     allocate ( c(narg) )
     allocate ( x(narg) )
     iter=narg
     do i=1,narg
        call get_command_argument(i,c(i)) ! reads the input from there
     end do
  end if

  do i=1,iter
     read(c(i),*,iostat=status) x(i) ! internal i/o
     if (status/=0) then ! if there is a problem with the input format
        print '(a)', trim('Format error: Input cannot be converted into a real number.')
     else
        print '(f0.3)', x(i) ! prints the converted number
     end if
  end do
  
end program problem3
