install:
	install --owner=root --group=root --mode=644 services/netns@.service /usr/lib/systemd/system
	install --owner=root --group=root --mode=644 services/netns-bridge@.service /usr/lib/systemd/system
	install --owner=root --group=root --mode=644 services/netns-nat@.service /usr/lib/systemd/system
	install --owner=root --group=root --mode=644 configs/netns-bridge /etc/default
	install --owner=root --group=root --mode=644 configs/netns-nat /etc/default
	install --owner=root --group=root --mode=755 scripts/chnetns /usr/bin
	systemctl daemon-reload

uninstall:
	systemctl stop netns@*.service
	systemctl disable netns@*.service
	rm /usr/lib/systemd/system/netns@{,-bridge,-nat}.service
	rm /usr/bin/chnetns
