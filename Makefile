DESTDIR ?= /

.PHONY: all
all:
	@echo "Nothing to make."

.PHONY: install
install:
	install -d -m 755 $(DESTDIR)/usr/sbin
	install -m 755 src/salix-chroot-install $(DESTDIR)/usr/sbin/

