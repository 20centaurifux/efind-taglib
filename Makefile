PREFIX?=/usr
CC=gcc
CFLAGS=-Wall -std=c99 -fPIC -O2 -nostartfiles -shared
LIBS=-ltag_c 

MACHINE:=$(shell uname -m)

ifeq ($(MACHINE), x86_64)
	LIBDIR?=$(PREFIX)/lib64
else
	LIBDIR?=$(PREFIX)/lib
endif

VERSION=0.2.0

all:
	$(CC) $(CFLAGS) $(INC) ./taglib.c -o ./taglib.so $(LDFLAGS) $(LIBS)

clean:
	rm -f ./taglib.so

install:
	test -d "$(DESTDIR)$(LIBDIR)/efind/extensions" || mkdir -p "$(DESTDIR)$(LIBDIR)/efind/extensions"
	cp ./taglib.so "$(DESTDIR)$(LIBDIR)/efind/extensions"
	chmod 755 "$(DESTDIR)$(LIBDIR)/efind/extensions/taglib.so"

uninstall:
	rm -f "$(DESTDIR)$(LIBDIR)/efind/extensions/taglib.so"

tarball:
	cd .. && \
	rm -rf ./efind-taglib-$(VERSION) && \
	cp -r ./efind-taglib ./efind-taglib-$(VERSION) && \
	find ./efind-taglib-$(VERSION) -name ".git*" | xargs rm -r && \
	tar cfJ ./efind-taglib-$(VERSION).tar.xz ./efind-taglib-$(VERSION) --remove-files 
