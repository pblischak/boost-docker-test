BOOST_LIB = /usr/local/lib
BOOST_INC = /usr/local/include

EXE = test
OBJ = CmdLine.o main.o

.PHONY : install uninstall clean

$(EXE) : $(OBJ)
	$(CXX) $(CXXFLAGS) -L${BOOST_LIB} -o $(EXE) $^ $(LDFLAGS)

$(OBJ) : %.o: %.cpp
	$(CXX) $(CXXFLAGS) -o $@ -c $<

install :
	@cp $(EXE) /usr/local/bin

uninstall :
	@rm -i /usr/local/bin/$(EXE)

clean :
	@rm -i *.o test
