CC = gcc

CFLAGS = -Iheader/ -lpthread -lwebsockets
LDFLAGS = -lpthread -lwebsockets

HEADER_DIR = header/
SRC_DIR = src/
OBJ_DIR = obj/

HEADER_FILES = $(HEADER_DIR)*.h
SOURCE_FILES = $(SRC_DIR)*.cpp
OBJ_FILES = $(OBJ_DIR)*.o

EXECUTABLE = baymax-connection

ALL: $(EXECUTABLE)

$(OBJ_DIR)cmdparser.o: $(SRC_DIR)cmdparser.cpp $(HEADER_DIR)cmdparser.h
	$(CC) -c -o $@ $< $(CFLAGS)

$(OBJ_DIR)pipeline.o: $(SRC_DIR)pipeline.cpp $(HEADER_DIR)pipeline.h
	$(CC) -c -o $@ $< $(CFLAGS)

$(OBJ_DIR)webconn.o: $(SRC_DIR)webconn.cpp $(HEADER_DIR)webconn.h $(OBJ_DIR)cmdparser.o $(OBJ_DIR)pipeline.o
	$(CC) -c -o $@ $< $(CFLAGS)

$(OBJ_DIR)main.o: $(SRC_DIR)main.cpp $(HEADER_DIR)main.h $(OBJ_DIR)webconn.o # $(OBJ_DIR)init.o $(OBJ_DIR)cmdparser.o
	$(CC) -c -o $@ $< $(CFLAGS)

$(EXECUTABLE): $(OBJ_DIR)main.o
	$(CC) $(LDFLAGS) $(OBJ_FILES) -o executable/$(EXECUTABLE)
    
clean:
	rm $(OBJ_FILES)

run:
	./executable/$(EXECUTABLE)

debug: $(EXECUTABLE) run