NAME = $(shell cat ./control/control | grep Package | cut -d" " -f2)
ARCH = $(shell cat ./control/control | grep Architecture | cut -d" " -f2)
VERSION = $(shell cat ./control/control | grep Version | cut -d" " -f2)
IPK_NAME = "${NAME}_${VERSION}_${ARCH}.ipk"

all:
	mkdir -p ipk
	echo "2.0" > ipk/debian-binary
	cp -r control ipk/
	cd ipk/control && tar czvf ../control.tar.gz .
	cd ipk/ && tar czvf "./${IPK_NAME}" ./control.tar.gz ./debian-binary

clean:
	rm -rf ipk
