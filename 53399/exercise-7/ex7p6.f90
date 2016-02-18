module ackermannfunc
  implicit none
  integer :: m,n
  
contains

recursive function ack(m,n) result(a)
  integer, intent(in) :: m,n ! variable can enter but cannot be changed
  integer :: a
  if (m==0) then
     a=n+1
  else if (n==0) then
     a=ack(m-1,1)
  else
     a=ack(m-1,ack(m,n-1))
  end if
end function ack

end module ackermannfunc
