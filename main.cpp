#include <iostream>
#include <iomanip>
#include <stdlib.h>
#include <string>

#include "CmdLine.hpp"

int main(int argc, char **argv){

  CmdLine cmd(argc, argv);

  std::cout << std::setw(10) << std::setprecision(10) << cmd.val << "\n";

  return 0;

}
