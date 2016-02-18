program write_file
  implicit none
  integer, parameter :: n=1000
  integer :: i,a(n)

  a(:)=42
  
  open(2,file='unf.data',form='unformatted',access='stream',status='replace')

  write(2) n
  do i=1,n
     write(2) a(i)
  end do

  close(2,status='keep')

end program write_file
