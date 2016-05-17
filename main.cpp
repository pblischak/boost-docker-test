#include <iostream>
#include <iomanip>
#include <string>

#ifdef _OPENMP
  #include <omp.h>
#endif

#include "CmdLine.hpp"

int main(int argc, char **argv){

  CmdLine cmd(argc, argv);

  std::cout << "\n\n**** Start ****\n\n";

  std::cout << std::setw(10) << std::setprecision(10) <<  "\nCommand line value: " << cmd.val << "\n";

  std::cout << "\nParallelization with OpenMP test...\n\n";

  std::cout << "Loop 1 through 10 in parallel and print to STDOUT (won't be in order)...\n\n";

  #pragma omp parallel for
  for(int i = 0; i < 10; i++){

    #pragma omp critical
    std::cout << i + 1 << "\n";

  }

  std::cout << "\n\n**** Done ****\n\n";

  return 0;

}
