program bolt
  implicit none
  real :: velocity, meters=100, time=9.58

  velocity=meters/time

  write(6,*) "Mr. Bolt's average speed was",velocity*3.6,"km/h!"
  
end program bolt
