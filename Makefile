CC = gcc 
CFLAGS = -Wall -ansi -pedantic 
LFLAGS = -lm 
OBJS = main.o employee.o address.o 
EXEC = myPro
MANIFEST= *.c *.h Makefile
DESTDIR = $(HOME)/bin
VER = 0.1

all: $(EXEC)

$(EXEC): $(OBJS) 
		$(CC) $(LFLAGS) $+ -o $@ 
		echo hello: zbudowane!

%.o: %.c 
		$(CC) -c $(CFLAGS) $<

main.o: address.h employee.h 
employee.o: address.h 
address.o: string.h

clean: 
		rm -f *~ rm -f *.bak rm -f $(EXEC) $(OBJS)
install: all
	sh -c "if [ ! -d $(DESTDIR) ] ; then mkdir $(DESTDIR) ; fi" 
	cp $(EXEC) $(DESTDIR)/$(EXEC)
	echo hello: zainstalowane!
dist: clean
	tar cvzf ../$(EXEC)-$(VER).tar.gz $(MANIFEST)
.PHONY: 
		clean
