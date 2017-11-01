install:
	install --owner=root --group=root --mode=644 services/netns*.service /usr/lib/systemd/system
	install --owner=root --group=root --mode=644 configs/* /etc/default
	systemctl daemon-reload

uninstall:
	systemctl stop netns@*.service
	systemctl disable netns@*.service
	rm /usr/lib/systemd/system/netns*.service
