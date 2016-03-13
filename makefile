CC = g++

CFLAGS = -Iheader/ -lwebsockets
LDFLAGS = 

HEADER_DIR = header/
SRC_DIR = src/
OBJ_DIR = obj/

HEADER_FILES = $(HEADER_DIR)*.h
SOURCE_FILES = $(SRC_DIR)*.cpp
OBJ_FILES = $(OBJ_DIR)*.o

EXECUTABLE = baymax-connection

ALL: $(EXECUTABLE)

$(OBJ_DIR)main.o: $(SRC_DIR)main.cpp $(HEADER_DIR)main.h $(OBJ_DIR)init.o $(OBJ_DIR)cmdparser.o #$(OBJ_DIR)fan.o
	$(CC) -c -o $@ $< $(CFLAGS)

$(EXECUTABLE): $(OBJ_DIR)main.o
	$(CC) $(LDFLAGS) $(OBJ_FILES) -o executable/$(EXECUTABLE)
    
clean:
	rm $(OBJ_FILES)

run:
	./executable/$(EXECUTABLE)

debug: $(EXECUTABLE) run