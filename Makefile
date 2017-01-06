CC=gcc
CFLAGS=-Wall -std=c99 -fPIC -O2 -nostartfiles -shared
LIBS=-ltag_c 

all:
	$(CC) $(CFLAGS) $(INC) ./taglib.c -o ./taglib.so $(LDFLAGS) $(LIBS)

clean:
	rm -f ./taglib.so

install:
	test -d "$(DESTDIR)/etc/efind/extensions" || mkdir -p "$(DESTDIR)/etc/efind/extensions"
	cp ./taglib.so "$(DESTDIR)/etc/efind/extensions"
	chmod 755 "$(DESTDIR)/etc/efind/extensions/taglib.so"

uninstall:
	rm -f "$(DESTDIR)/etc/efind/extensions/taglib.so"
