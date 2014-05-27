PREFIX=/usr/local

SYNCTHING_VERSION=v0.8.11
SYNCTHING_ARCH=armv6
SYNCTHING_OS=linux

SYNCTHING_DIST=syncthing-${SYNCTHING_OS}-${SYNCTHING_ARCH}-${SYNCTHING_VERSION}

all: make

install: make
	cp ${SYNCTHING_DIST}/syncthing ${PREFIX}/bin/syncthing
	cp bin/st ${PREFIX}/bin/st
	cp etc/init.d/syncthing /etc/init.d/syncthing

make: bin/st etc/init.d/syncthing ${SYNCTHING_DIST}

${SYNCTHING_DIST}: ${SYNCTHING_DIST}.tar.gz
	tar xvzf $<
	touch ${SYNCTHING_DIST}

${SYNCTHING_DIST}.tar.gz:
	wget https://github.com/calmh/syncthing/releases/download/${SYNCTHING_VERSION}/$@

clean:
	rm -r ${SYNCTHING_DIST}
	rm ${SYNCTHING_DIST}.tar.gz
