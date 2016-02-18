program infinity
  implicit none
  real :: p=1.0,q=0.0,p_infy,n_infy

  p_infy = p/q !calculates a positive infinity
  n_infy = log(q) !calculates a negative infinity

  !print *, p_infy, n_infy

  print *, "(+Infinity)*(-Infinity) =", p_infy*n_infy
  print *, "(-Infinity)*(-Infinity) =", n_infy*n_infy

end program infinity
