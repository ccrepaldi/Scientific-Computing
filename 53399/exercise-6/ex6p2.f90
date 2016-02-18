program problem2
  implicit none
  character(len=100), allocatable :: inputFile(:)
  integer :: file_size,i,narg
  logical :: there

  narg=COMMAND_ARGUMENT_COUNT()

  allocate ( inputFile(narg) )

  do i=1,narg

  call GET_COMMAND_ARGUMENT(i,inputFile(i))
     
  INQUIRE (FILE=inputFile(i), SIZE=file_size, EXIST=there)

  if(.NOT.there.OR.file_size.LT.0) then

     write(6,'(a,1x,a,1x,a)') trim("File"), trim(inputFile(i)), trim("doesn't exist.")
     
  else
 
     write(6,"(a,T35,i0,' bytes')") trim(inputFile(i)), file_size

  end if
  
     
  end do

end program problem2
