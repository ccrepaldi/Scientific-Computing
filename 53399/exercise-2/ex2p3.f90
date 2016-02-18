program testrealkind 
  implicit none 
  integer :: p,kind,r=5
  do p=1,50 
     kind=selected_real_kind(p,r) 
     print *,p,kind
  end do
end program testrealkind
