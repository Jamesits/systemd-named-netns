.PHONY: all install uninstall

all:
	

install:
	mkdir -p /usr/lib/systemd/system
	install --owner=root --group=root --mode=644 services/netns@.service /usr/lib/systemd/system/
	install --owner=root --group=root --mode=644 services/netns-bridge@.service /usr/lib/systemd/system/
	install --owner=root --group=root --mode=644 services/netns-nat@.service /usr/lib/systemd/system/
	install --owner=root --group=root --mode=644 configs/netns-bridge /etc/default/
	install --owner=root --group=root --mode=644 configs/netns-nat /etc/default/
	install --owner=root --group=root --mode=755 scripts/chnetns /usr/bin/
	install --owner=root --group=root --mode=755 scripts/netnsinit /usr/bin/
	systemctl daemon-reload

uninstall:
	systemctl stop netns@*.service
	systemctl disable netns@*.service || true
	systemctl disable netns-bridge@*.service || true
	systemctl disable netns-nat@*.service || true
	rm -f /usr/lib/systemd/system/netns@.service
	rm -f /usr/lib/systemd/system/netns-bridge@.service
	rm -f /usr/lib/systemd/system/netns-nat@.service
	rm -f /usr/bin/chnetns
	rm -f /usr/bin/netnsinit
