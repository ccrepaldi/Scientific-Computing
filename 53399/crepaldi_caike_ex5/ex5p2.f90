program power_command_line
  implicit none
  integer :: narg, i, j
  character(len=80) :: arg
  real :: a(1000)

  narg=command_argument_count()

  do i=1,narg
     call get_command_argument(i,arg)
     read(arg,*) a(i)
  end do
  
  do i=1,narg
     write(6,'(6(" ",f0.2," "))') [(a(i)**j,j=1,6)]
  end do

end program power_command_line
