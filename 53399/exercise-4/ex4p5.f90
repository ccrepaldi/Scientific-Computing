program command_line
  implicit none
  integer :: i1,i2,ios,power
  character(len=80) :: arg,fname

  call get_command_argument(1,fname)
  call get_command_argument(2,arg)
  read(arg,*) i1
  call get_command_argument(3,arg)
  read(arg,*) i2

  open(unit=1,file=fname,iostat=ios,status='new')
  if (ios/=0) then
     print '(a,a)','*** Error in opening file ', trim(fname)
     stop
  end if

  do power=i1,i2
     write(1,*) 2**power
  end do

  close(unit=1,status='keep')
end program command_line


  
