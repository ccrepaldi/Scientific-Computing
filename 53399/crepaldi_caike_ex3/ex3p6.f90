program table1
  implicit none
  integer,parameter :: n=4
  integer :: i,j,b(n),c(n,n),d(n,n)
 
  ! ---------- Do not change these loops 
  do i=1,n
     b(i)=i
     do j=1,n
        c(j,i)=10*i+j
     end do
  end do
  ! ----------

  d(:,:)=c(:,:)+1

  c(2:n,2:n)=d(1:(n-1),1:(n-1))
  
  c(1:n:2,1:n:2)=10*c(1:n:2,1:n:2)
  
  
  ! print statement is a shorter way to write to stdout
  ! print *,var1,var2,...  == write(6,*) var1,var2,...
  ! Intrinsic function sum() gives the sum of all array elements.
  print *, 'answer=',sum(c)

end program table1
