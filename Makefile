.PHONY: all install uninstall

all:
	

install:
	mkdir -p $(DESTDIR)/usr/lib/systemd/system
	install --owner=root --group=root --mode=644 services/netns@.service $(DESTDIR)/usr/lib/systemd/system/
	install --owner=root --group=root --mode=644 services/netns-bridge@.service $(DESTDIR)/usr/lib/systemd/system/
	install --owner=root --group=root --mode=644 services/netns-nat@.service $(DESTDIR)/usr/lib/systemd/system/
	install --owner=root --group=root --mode=644 services/netns-tunnel@.service $(DESTDIR)/usr/lib/systemd/system/
	install --owner=root --group=root --mode=644 configs/netns-bridge $(DESTDIR)/etc/default/
	install --owner=root --group=root --mode=644 configs/netns-nat $(DESTDIR)/etc/default/
	install --owner=root --group=root --mode=644 configs/netns-tunnel $(DESTDIR)/etc/default/
	install --owner=root --group=root --mode=755 scripts/chnetns $(DESTDIR)/usr/bin/
	install --owner=root --group=root --mode=755 scripts/netnsinit $(DESTDIR)/usr/bin/
	systemctl daemon-reload

uninstall:
	systemctl stop netns@*.service
	systemctl disable netns@*.service || true
	systemctl disable netns-bridge@*.service || true
	systemctl disable netns-nat@*.service || true
	rm -f $(DESTDIR)/usr/lib/systemd/system/netns@.service
	rm -f $(DESTDIR)/usr/lib/systemd/system/netns-bridge@.service
	rm -f $(DESTDIR)/usr/lib/systemd/system/netns-nat@.service
	rm -f $(DESTDIR)/usr/lib/systemd/system/netns-tunnel@.service
	rm -f $(DESTDIR)/usr/bin/chnetns
	rm -f $(DESTDIR)/usr/bin/netnsinit
