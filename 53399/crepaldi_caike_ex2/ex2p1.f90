program palpatine
  implicit none
  real :: x=1.5, y=2.0, z=2.5

  write(6,*) "Poooooweeeeer!"
  write(6,*) x**y**z
  write(6,*) (x**y)**z
  write(6,*) x**(y**z)

end program palpatine
