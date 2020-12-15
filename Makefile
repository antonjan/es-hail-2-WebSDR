CFLAGS?=-O3 -Wall -I./websocket -std=gnu99 -DESHAIL2
LDLIBS+= -lpthread -lm -lfftw3 -lfftw3_threads -lsndfile -lasound -lrtlsdr
CC?=gcc
PROGNAME=qo100websdr
OBJ=qo100websdr.o sdrplay.o fir_table_calc.o wf_univ.o websocket/websocketserver.o websocket/ws_callbacks.o websocket/base64.o websocket/sha1.o websocket/ws.o websocket/handshake.o audio.o setqrg.o rtlsdr.o timing.o fifo.o ssbfft.o cat.o civ.o ssbdemod.o setup.o beaconlock.o identifySerUSB.o

all: qo100websdr

websocket/%.o: websocket/%c
%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

qo100websdr: $(OBJ)
	$(CC) -g -o $@ $^ $(LDFLAGS) $(LDLIBS)

clean:
	rm -f *.o websocket/*.o qo100websdr
