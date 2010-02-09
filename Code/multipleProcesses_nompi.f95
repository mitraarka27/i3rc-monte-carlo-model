! Copyight 2003-2009, Regents of the University of Colorado. All right reserved
! Use and duplication is permitted under the terms of the 
!   GNU public license, V2 : http://www.gnu.org/licenses/old-licenses/gpl-2.0.html
! NASA has special rights noted in License.txt

! $Revision$, $Date$
! $URL$
module multipleProcesses
  !
  ! Module encapsulating all MPI calls needed in the I3RC model. 
  !   These can be replaced with stubs and the code compiled without MPI. 
  !
  implicit none
  
  logical, parameter :: MasterProc = .true. 
  
  interface sumAcrossProcesses
    module procedure sumAcrossProcesses_Real_Scalar,                         &
                     sumAcrossProcesses_Real_1D, sumAcrossProcesses_Real_2D, &
                     sumAcrossProcesses_Real_3D, sumAcrossProcesses_Real_4D
  end interface sumAcrossProcesses
  
  interface broadcastToAllProcesses
    module procedure broadcast_Logical_1D, &
                     broadcast_Int_S,      &
                     broadcast_Int_1D,   broadcast_Int_2D,  broadcast_Int_3D,  broadcast_Int_4D, & 
                     broadcast_Real_1D,  broadcast_Real_2D, broadcast_Real_3D, broadcast_Real_4D
  end interface broadcastToAllProcesses
contains
  ! -----------------------------------------------------------
  subroutine initializeProcesses(numProcs, thisProcNum)
    integer, intent(out) :: numProcs, thisProcNum
    !
    !Initial MPI calls; how many processors are being used 
    !   and which number is this one? 
    !
    numProcs = 1
    thisProcNum = 0
    
  end subroutine initializeProcesses
  ! -----------------------------------------------------------
  subroutine synchronizeProcesses
    !
    ! Wait for all processors to get to this point
    ! 
    
  end subroutine synchronizeProcesses
  ! -----------------------------------------------------------
  subroutine finalizeProcesses
    
  end subroutine finalizeProcesses
  ! -----------------------------------------------------------
  function sumAcrossProcesses_Real_Scalar(x) 
    !
    ! Add values across all processors
    !
    real, intent(in) :: x
    real             :: sumAcrossProcesses_Real_Scalar

    sumAcrossProcesses_Real_Scalar = x
    
  end function sumAcrossProcesses_Real_Scalar
  ! -----------------------------------------------------------
  function sumAcrossProcesses_Real_1D(x) 
    !
    ! Add values across all processors
    !
    real, dimension(:), intent(in) :: x
    real, dimension(size(x))       :: sumAcrossProcesses_Real_1D
    
    sumAcrossProcesses_Real_1D(:) = x(:)
    
  end function sumAcrossProcesses_Real_1D
  ! -----------------------------------------------------------
  function sumAcrossProcesses_Real_2D(x) 
    !
    ! Add values across all processors
    !
    real, dimension(:, :),       intent(in) :: x
    real, dimension(size(x, 1), size(x, 2)) :: sumAcrossProcesses_Real_2D
    
    sumAcrossProcesses_Real_2D(:, :) = x(:, :)
    
  end function sumAcrossProcesses_Real_2D
  ! -----------------------------------------------------------
  function sumAcrossProcesses_Real_3D(x) 
    !
    ! Add values across all processors
    !
    real, dimension(:, :, :), intent(in) :: x
    real, dimension(size(x, 1), size(x, 2), &
                    size(x, 3))          :: sumAcrossProcesses_Real_3D
    
    sumAcrossProcesses_Real_3D(:, :, :) = x(:, :, :)
    
  end function sumAcrossProcesses_Real_3D
  ! -----------------------------------------------------------
  function sumAcrossProcesses_Real_4D(x) 
    real, dimension(:, :, :, :), intent(in) :: x
    real, dimension(size(x, 1), size(x, 2), &
                    size(x, 3), size(x, 4)) :: sumAcrossProcesses_Real_4D
    
    sumAcrossProcesses_Real_4D(:, :, :, :) = x(:, :, :, :)
    
  end function sumAcrossProcesses_Real_4D
  ! -----------------------------------------------------------
  !
  ! Broadcasting
  !
  ! -----------------------------------------------------------
  subroutine broadcast_Logical_1D(x) 
    logical, dimension(:), intent(in) :: x 
    
  end subroutine broadcast_Logical_1D  
  ! -----------------------------------------------------------
  ! Integers
  ! -----------------------------------------------------------
  subroutine broadcast_Int_S(x) 
    integer, intent(in) :: x 
    
  end subroutine broadcast_Int_S  
  ! -----------------------------------------------------------
  subroutine broadcast_Int_1D(x) 
    integer, dimension(:), intent(in) :: x 
    
  end subroutine broadcast_Int_1D  
  ! -----------------------------------------------------------
  subroutine broadcast_Int_2D(x) 
    integer, dimension(:, :), intent(in) :: x 
    
  end subroutine broadcast_Int_2D  
  ! -----------------------------------------------------------
  subroutine broadcast_Int_3D(x) 
    integer, dimension(:, :, :), intent(in) :: x 
    
  end subroutine broadcast_Int_3D  
  ! -----------------------------------------------------------
  subroutine broadcast_Int_4D(x) 
    integer, dimension(:, :, :, :), intent(in) :: x 
    
  end subroutine broadcast_Int_4D  
  ! -----------------------------------------------------------
  ! Reals
  ! -----------------------------------------------------------
  subroutine broadcast_Real_1D(x) 
    real, dimension(:), intent(in) :: x 
    
  end subroutine broadcast_Real_1D  
  ! -----------------------------------------------------------
  subroutine broadcast_Real_2D(x) 
    real, dimension(:, :), intent(in) :: x 
    
  end subroutine broadcast_Real_2D  
  ! -----------------------------------------------------------
  subroutine broadcast_Real_3D(x) 
    real, dimension(:, :, :), intent(in) :: x 
    
  end subroutine broadcast_Real_3D  
  ! -----------------------------------------------------------
  subroutine broadcast_Real_4D(x) 
    real, dimension(:, :, :, :), intent(in) :: x 
    
  end subroutine broadcast_Real_4D  
  ! -----------------------------------------------------------
end module multipleProcesses