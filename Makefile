PREFIX ?= /usr/local
pkgdir = $(DESTDIR)$(PREFIX)/lib/tpersist-postgresql0.1.8

.PHONY: install
install:
	install -d "$(pkgdir)"
	install -m 644 pkgIndex.tcl postgresql.tcl LICENSE "$(pkgdir)"
