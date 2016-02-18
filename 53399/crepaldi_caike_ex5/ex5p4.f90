program sum_sqrt
  implicit none
  real :: n,sum=0.0

  do
     read (5,*) n
     if (n.GT.0) then
        sum=sum+sqrt(n)
     else
        if (n==0) exit
     end if
  end do

  write(6,'("Sum of square roots: ",f0.4)') sum
end program sum_sqrt
