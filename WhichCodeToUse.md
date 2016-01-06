# Monte Carlo vs. Explicit Methods for solving 3D radiative transfer problems #

While we hope you find this code useful it is not always the right tool for the job. That's because the code uses Monte Carlo techniques to solve the equation describing three-dimensional radiative transfer in the atmosphere. The alternative is to use explicit methods. Depending on the quantities you need to compute (domain-averaged fluxes, say, vs. spatially-resolved intensity) one method or the other can be hundreds of times faster at achieving a given accuracy.

The most widely-used explicit method in the atmospheric sciences is the Spherical Harmonics Discrete Ordinates Method, or [SHDOM](http://nit.colorado.edu/shdom.html).

The [technical paper](http://www.cdc.noaa.gov/people/robert.pincus/Papers/3DRT-Models/) that describes the I3RC community Monte Carlo model also looks at the relative efficiency of explicit methods and Monte Carlo methods for solving different kinds of problems.

# Alternatives to this code #

If you want to use Monte Carlo methods there are a couple of choices in addition to this code. We know of
  * [MCARATS](http://www.geocities.jp/null2unity/mcarats/) by Hiro Iwabuchi
  * [MC-UNIK and Grimaldi](http://www.ifm-geomar.de/index.php?id=981) by Andreas Macke and colleagues