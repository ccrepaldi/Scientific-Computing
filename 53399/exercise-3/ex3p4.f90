program arra_content
  implicit none
  integer :: a(2,2), inp_value, i

  print *, "Please, insert the integer value for the a(1,1) &
       element of the array:"
  read(5,*) inp_value

  a(1,1) = inp_value**2

  print*, "Please, insert the integer value for the a(1,2) &                   
       element of the array:"
  read(5,*) inp_value

  a(1,2) = inp_value**2

  print*, "Please, insert the integer value for the a(2,1) &                   
       element of the array:"
  read(5,*) inp_value

  a(2,1) = inp_value**2

  print*, "Please, insert the integer value for the a(2,2) &                   
       element of the array:"
  read(5,*) inp_value

  a(2,2) = inp_value**2

  print *, "Array:"
  
  do i=1,2
     write(6,*) a(i,:)
  end do
  
end program arra_content
