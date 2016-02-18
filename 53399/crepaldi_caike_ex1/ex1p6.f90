program speed
  implicit none
  real :: velocity, meters, time

  write(6,*) "Give a distance (in meters)"
  read(5,*) meters
  write(6,*) "Give the elapsed time (in seconds)"
  read(5,*) time

  velocity=meters/time

  write(6,*) "The average speed was",velocity*3.6,"km/h."
  
end program speed
