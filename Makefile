install:
	install --owner=root --group=root --mode=644 services/*.service /lib/systemd/system
	install --owner=root --group=root --mode=644 configs/* /etc/default
	systemctl daemon-reload
