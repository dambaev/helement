INC=-I../include -I/usr/local/include/elementary-1 -I/usr/local/include/ethumb-1 -I/usr/local/include/efreet-1 -I/usr/local/include/e_dbus-1 -I/usr/local/include/ecore-1 -I/usr/local/include/emotion-1 -I/usr/local/include/eio-1 -I/usr/local/include/edje-1 -I/usr/local/include/evas-1 -I/usr/local/include/eet-1 -I/usr/local/include/eina-1 -I/usr/local/include/eina-1/eina -I/usr/local/include/embryo-1 -I/usr/local/include/eeze-1 -I/usr/include/glib-2.0 -I/usr/lib/i386-linux-gnu/glib-2.0/include -I/usr/include/dbus-1.0 -I/usr/lib/i386-linux-gnu/dbus-1.0/include -I/usr/include/libexif -I/usr/include/freetype2 -I/usr/include/p11-kit-1 -I/usr/include/lua5.1 

LINKDLLS=y:/_win32/efl/lib/libevil.dll.a y:/_win32/efl/lib/libelementary.dll.a

PACKAGES=-package utf8-string

DEST=../bin
NAME=helement

CCMD=ghc -c -O $(INC)
HSCMD=ghc -c -O
HSC=hsc2hs --cc=gcc --ld=g++ $(INC)

HSCLD=--lflag="-L/usr/local/lib" \
	--lflag="-lelementary" 
	

CC=ghc
CFLAGS=-c -O $(INC)
LIBDIRS=
LIBS=-L/usr/local/lib -lelementary -lm -leet -lefreet -lefreet_mime -lefreet_trash -lethumb_client -ledbus -ldbus-1 -lethumb -levas -lrt -lecore -leina -lpthread -lecore_evas -lecore_file -ledje -lemotion -lexif -lecore_imf -lecore_con
LDFLAGS=-O  $(LIBDIRS) $(LIBS)

CSOURCES=c_util.c

CPPSOURCES=
#startend_cpp.cpp

HSCSOURCES=HElementary/ElementaryFFI.hsc

HLIBSOURCES=$(HSCSOURCES:.hsc=.hs) HElementary/Elementary.hs

HSOURCES=$(HLIBSOURCES) Main.hs

SOURCES=$(HSOURCES) $(CSOURCES)
OBJECTS=$(HSOURCES:.hs=.o) $(CSOURCES:.c=.o) $(CPPSOURCES:.cpp=.o) 
EXECUTABLE=$(DEST)/$(NAME)


$(EXECUTABLE): $(OBJECTS) 
	$(CC) $(OBJECTS) $(LDFLAGS) $(PACKAGES) -o $@

.cpp.o:
	$(CC) $(CFLAGS) $< -o $@

.c.o:
	$(CC) $(CFLAGS) $< -o $@

.hs.o:
	$(CC) $(CFLAGS) $< -o $@

.hsc.hs:
	$(HSC) $(HSCLD) $< -o $@


.SUFFIXES: .cpp .c .hs .hsc .o


all: $(SOURCES) $(EXECUTABLE)

clean:
	rm $(OBJECTS) *.hi

