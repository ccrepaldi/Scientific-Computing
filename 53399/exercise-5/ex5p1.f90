program conversion_table
  implicit none
  real :: mm,inches=0.5,r=25.4

  table: do
     mm=inches*r
     write(6,'(f5.1," inch"," = ",f5.1," mm")') inches, mm
     inches=inches+0.5
     if (inches.GT.12) exit
  end do table

end program conversion_table
