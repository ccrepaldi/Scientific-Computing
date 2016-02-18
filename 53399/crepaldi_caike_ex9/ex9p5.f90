module dertypcompn
  implicit none
  integer, parameter :: p=-1 ! change p value here
  type :: gcn
     real :: x,y
  end type gcn
  interface operator(.add.)
     module procedure gcn_add
  end interface operator(.add.)
  interface operator(.sub.)
     module procedure gcn_sub
  end interface operator(.sub.)
  interface operator(.mult.)
     module procedure gcn_mult
  end interface operator(.mult.)
  interface operator(.div.)
     module procedure gcn_div
  end interface operator(.div.)
contains
  type(gcn) function gcn_add(z1,z2)
    implicit none
    type(gcn), intent(in) :: z1,z2

    gcn_add%x=z1%x+z2%x
    gcn_add%y=z1%y+z2%y

  end function gcn_add

  type(gcn) function gcn_sub(z1,z2)
    implicit none
    type(gcn), intent(in) :: z1,z2

    gcn_sub%x=z1%x-z2%x
    gcn_sub%y=z1%y-z2%y

  end function gcn_sub

  type(gcn) function gcn_mult(z1,z2)
    implicit none
    type(gcn), intent(in) :: z1,z2

    gcn_mult%x=z1%x*z2%x+p*z1%y*z2%y
    gcn_mult%y=z1%x*z2%y+z2%x*z1%y

  end function gcn_mult

  type(gcn) function gcn_div(z1,z2)
    implicit none
    type(gcn), intent(in) :: z1,z2
    real :: d

    d=1/(z2%x**2 - p*z2%y**2)

    gcn_div%x=d*(z1%x*z2%x-p*z1%y*z2%y)
    gcn_div%y=d*(z2%x*z1%y-z1%x*z2%y)

  end function gcn_div
end module dertypcompn

program test_gcn
  use dertypcompn
  implicit none
  character(len=80) :: char

  print '(2a)', trim("Let's compare the results:"), new_line(char)

  print "('+',48('-'),'+')"

  print "('| ',a,T30,'(',f0.2,' + ',f0.2,'i)',T50,'|')", trim('GCN:'),&
       &gcn(2,3).add.gcn(3,4)
  print "('| ',a,T30,'(',f0.2,' + ',f0.2,'i)',T50,'|')", &
       &trim('FORTRAN COMPLEX NUMBER:'),(2,3)+(3,4)

  print "('|',48('-'),'|')"

  print "('| ',a,T30,'(',f0.2,' + ',f0.2,'i)',T50,'|')", trim('GCN:'),&
       &gcn(10,2).sub.gcn(11,8)
  print "('| ',a,T30,'(',f0.2,' + ',f0.2,'i)',T50,'|')", &
       &trim('FORTRAN COMPLEX NUMBER:'),(10,2)-(11,8)

  print "('|',48('-'),'|')"

  print "('| ',a,T30,'(',f0.2,' + ',f0.2,'i)',T50,'|')", trim('GCN:'),&
       &gcn(1,2).mult.gcn(1,1)
  print "('| ',a,T30,'(',f0.2,' + ',f0.2,'i)',T50,'|')", &
       &trim('FORTRAN COMPLEX NUMBER:'),(1,2)*(1,1)

  print "('|',48('-'),'|')"

  print "('| ',a,T30,'(',f0.2,' + ',f0.2,'i)',T50,'|')", trim('GCN:'),&
       &gcn(12,9).div.gcn(1,4)
  print "('| ',a,T30,'(',f0.2,' + ',f0.2,'i)',T50,'|')", &
       &trim('FORTRAN COMPLEX NUMBER:'),(12,9)/(1,4)

  print "('+',48('-'),'+')"

end program test_gcn

