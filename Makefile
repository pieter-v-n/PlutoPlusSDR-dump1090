SYSROOT = $HOME/staging/
PKG_CONFIG_PATH=${SYSROOT}/usr/lib/pkgconfig
CC=arm-linux-gnueabihf-gcc
CFLAGS?=--sysroot=${SYSROOT} -O2 -g -Wall -W 
LDLIBS+=-liio -lpthread -lm -lad9361
PROGNAME=dump1090

all: dump1090

%.o: %.c
	$(CC) $(CFLAGS) -c $<

dump1090: dump1090.o anet.o
	$(CC) $(CFLAGS) -g -o dump1090 dump1090.o anet.o $(LDFLAGS) $(LDLIBS)

clean:
	rm -f *.o dump1090
