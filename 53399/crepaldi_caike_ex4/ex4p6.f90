program read_power
  implicit none
  integer, parameter :: n=100
  real(kind=16) :: x(n)
  integer :: i,j,ios
  character(len=80) :: fname

  call get_command_argument(1,fname)

  open(unit=1,file=fname,iostat=ios,status='old',action='read')
  if (ios/=0) then
     print '(a,a)','*** Error in opening file ', trim(fname)
     stop
  end if
  i=1
  do
     read(1,*,iostat=ios) x(i)
     if (ios<0) exit
     i=i+1
  end do
  i=i-1
  close(1)

  do j=1,i
     print *, 2**x(j)
  end do

end program read_power
