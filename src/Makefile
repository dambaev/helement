INC=-I/usr/include/ecore-1 -I/usr/include/evas-1 -I/usr/include/eet-1 -I/usr/include/eina-1 -I/usr/include/eina-1/eina -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I/usr/include/p11-kit-1 -I/usr/include/lua5.1 -I/usr/include/embryo-1 -I/usr/include/fribidi -I/usr/include/freetype2 -I/usr/include/elementary-1 -I/usr/include/edje-1 -I../include

LINKDLLS=y:/_win32/efl/lib/libevil.dll.a y:/_win32/efl/lib/libelementary.dll.a

PACKAGES=-package utf8-string

DEST=../bin
NAME=helement

CCMD=ghc -c -O $(INC)
HSCMD=ghc -c -O
HSC=hsc2hs --cc=gcc --ld=g++ $(INC)

HSCLD=--lflag="-Ly:/_win32/efl/lib" \
	--lflag="-lelementary" --lflag="-levil"
	

CC=ghc
CFLAGS=-c -O $(INC)
LIBDIRS=
LIBS=-lelementary -lm -leet -levas -lrt -lecore -leina -lpthread -lecore_evas -lecore_file -ledje -lecore_imf -lecore_con
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

