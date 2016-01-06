(This information is repeated in Readme.txt in the root directory.)

This code relies on the netCDF libraries, which are available at
http://www.unidata.ucar.edu/software/netcdf/. These must be built before
compiling the I3RC code. In my experience, it's easiest to build the Fortran
interface to netCDF using the same compiler with which you'll build the I3RC
code. You can build the I3RC code without netCDF if you remove or replace all
the read_and write_ subroutines from the modules in the Code/ directory. If you
simply remove the subroutines you won't be be able to store information for
later use, so I don't recommend this if you can possibly avoid it.

This code conforms to the ANSI Fortran 95 standard but it really stresses
compilers, and many fail while building the code. Some will simply dump core,
often while compiling the file scatteringPhaseFunctions.f95 in the Code/
subdirectory. If this happens be sure you have the most up-to-date version of
the compiler available. Some compilers (those from Portland Group, and at least
some versions of the Sun Forte compilers) simply don't work on this code. Most
of the development work has been done on Power PC Macs running xlf 8.1 on system
10.3 and 10.4, and on Intel Linux boxes running the Intel Fortran compiler
(versions 8, 9, and 10).

The code builds under the g95 compiler, which is available for a wide range of
systems (Windows, Solaris, HP-UX, Mac) from http://g95.org/. Unfortunately, as
of this writing the g95 compiler produces code that runs very slowly (4-6 times
more slowly than other compilers) because it spends a lot of time managing
temporary memory. This will hopefully improve in future.

Compilation options, including the compiler name and compilation flags, are set in
the Makefile in the top level directory.This is also where the location of the
(required) netcdf files is set, as well as the (optional) location of the
MPI message-passing libraries and include files.  This information is
used by the Makefiles in each subdirectory. We've provided production
and debugging settings for the Intel ifort and g95 compilers. If you're
using a new platform add the compiler and flag definitions following
these examples. I'd appreciate copies of working configurations for other platforms.

In the examples we have provided most of the parameters are specified using
namelists. The name of the namelist file must be supplied at run time. Many Unix
systems support reading arguments from the command line; on platforms that don't
the file name is read from standard in. You can choose which behavior you want
by commenting out the approriate subroutines in Code/userInterface\_Unix.f95
before compiling.

Once make.common has been edited, type "./Build" in the top level directory. This
will build everything in all the subdirectories in the proper order. Note that
the directories must be built in order (Code/, Integrators/, Example-Drivers/;
Tools/ must be built after Code/) because the dependencies are set in the directories
themselves.

The subdirectory Tools/ contains general purpose programs to build "domain"
files that describe the 3D distribution of optical properties within a domain.
Typically one would first build one or more phase function tables describing the
single scattering properties of clouds, aerols, etc. using MakeMieTable. We've
provided example namelists for clouds and aerosol, though you may want to tweak
these. Program [PhysicalPropertiesToDomain](http://code.google.com/p/i3rc-monte-carlo-model/source/browse/trunk/Tools/PhysicalPropertiesToDomain.f95) reads an ASCII description of the 3D
liquid water content field, combines it with a phase function table, and creates
the final domain. Alternatively, you can use the program
[OpticalPropertiesToDomain](http://code.google.com/p/i3rc-monte-carlo-model/source/browse/trunk/Tools/OpticalPropertiesToDomain.f95)  to convert files similar to those used by [SHDOM](http://nit.colorado.edu/shdom.html) to the
internal format. ASCII file formats are described in the example programs. The
domain files can then used as input to the program
Example-Drivers/monteCarloDriver.

The programs in I3RC-Examples/ will build files describing the I3RC Phase 1 test
cases using the files provided by the I3RC (available in I3RC-Examples/Data).

This code makes extensive use of dynamic memory. If program seems to crash
without explanation be sure the shell is not imposing limits on the amount
of memory each process can request (i.e. "unlimit stacksize" when using tcsh).