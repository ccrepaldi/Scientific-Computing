program problem4
  implicit none
  integer :: i,j


  write(6,"(T6,'|',10(i4) )") [(i,i=1,10)]
  write(6,"(5('-'),'|',50('-') )")
  do j=1,10
     write(6, "(i4,T6,'|', 10(i4))") j,[(j*i,i=1,10)]
  end do

end program problem4
