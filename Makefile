LDFLAGS = -pthread -lpthread
CFLAGS = -g -Wall -Werror
backprop: backprop.o layer.o neuron.o
	$(CC) $(LDFLAGS) -o bin/backprop build/main.o build/layer.o build/neuron.o -lm

backprop.o: src/main.c
	$(CC) $(CFLAGS) -c src/main.c -o build/main.o

layer.o: src/layer.c
	$(CC) $(CFLAGS) -c src/layer.c -o build/layer.o

neuron.o: src/neuron.c
	$(CC) $(CFLAGS) -c src/neuron.c -o build/neuron.object

run:
	./bin/backprop

# remove object files and executable when user executes "make clean"
clean:
	rm *.o backprop
