# Compiler and flags
CC = g++
CFLAGS = -Wall -std=c++11

# Source and object files
SRCS = Graph.cpp Algorithms.cpp Queue.cpp PriorityQueue.cpp main.cpp
OBJS = $(SRCS:.cpp=.o)

# Output file name
TARGET = ex1

# Default target
all: $(TARGET)

# Executable build
$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) -o $@ $^

# Pattern rule for object files
%.o: %.cpp
	$(CC) $(CFLAGS) -c $< -o $@

# Dependencies
main.o: main.cpp Graph.hpp Algorithms.hpp
Graph.o: Graph.cpp Graph.hpp
PriorityQueue.o: PriorityQueue.cpp PriorityQueue.hpp
Queue.o: Queue.cpp Queue.hpp
Algorithms.o: Algorithms.cpp Graph.hpp Queue.hpp PriorityQueue.hpp

# Clean object files and executable
clean:
	rm -f *.o $(TARGET)

# Run the main program
run: $(TARGET)
	./$(TARGET)

# Check memory leaks with valgrind
valgrind: $(TARGET)
	valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes ./$(TARGET)

.PHONY: all clean run valgrind
