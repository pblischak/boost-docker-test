BOOST_LIB = /usr/local/lib
BOOST_INC = /usr/local/include

EXE = test
OBJ = CmdLine.o main.o

CXX=g++
CXXFLAGS = -I${BOOST_INC} -O3 -g -std=c++11 -fopenmp
LDFLAGS = -lboost_program_options

.PHONY : install uninstall clean

all :
	@echo "Please enter either 'make mac' on a Mac, or 'make linux' on a Linux computer."

linux : $(OBJ)
	$(CXX) $(CXXFLAGS) -L${BOOST_LIB} -Wl,-rpath=/usr/local/lib -o $(EXE) $^ $(LDFLAGS)

mac : $(OBJ)
	$(CXX) $(CXXFLAGS) -L${BOOST_LIB} -o $(EXE) $^ $(LDFLAGS)

$(OBJ) : %.o: %.cpp
	$(CXX) $(CXXFLAGS) -o $@ -c $<

install :
	@cp $(EXE) /usr/local/bin

uninstall :
	@rm -i /usr/local/bin/$(EXE)

clean :
	@rm -i *.o test
