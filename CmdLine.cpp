#include <iostream>
#include <iomanip>
#include <stdlib.h>
#include <string>

#include <boost/program_options.hpp>

#include "CmdLine.hpp"

namespace po = boost::program_options;

CmdLine::CmdLine(int argCount, char **argVar){

  try{
    po::options_description desc("Allowed options");
    desc.add_options()
    ("help,h", "Prints help message.")
    ("val,v", po::value<double>(&val)->required(), "Test value to be printed.");

    po::variables_map vm;

    try{

      po::store(po::parse_command_line(argCount, argVar, desc), vm);


      if(vm.count("help")){
        std::cout << "\n\n" << desc << "\n\n" << std::endl;
        exit(0);
      }

      po::notify(vm);

    }

    // catch any errors in boost argument parsing.
    catch(po::error& e){
      std::cout << "\nerror: " << e.what() << std::endl;
      std::cout << "\n\n" << "Usage: ./test -v <value>" << std::endl;
      std::cout << "\nFor additional options type: ./test -h\n" << std::endl;
      exit(EXIT_FAILURE);
    }

  }

  // catch any other exceptions/errors in standard argument parsing.
  catch(std::exception& e){
    std::cout << std::endl << e.what() << std::endl;
    exit(EXIT_FAILURE);
  }

}
