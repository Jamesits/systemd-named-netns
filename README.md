# systemd-named-netns

This project enables you to:
 * Create and delete named netns on the fly like systemd services
 * Start named netns on boot
 * Quickly set up bridging or NAT from netns to host
 * Use named netns in systemd services
   * Enables them to connect to the internet too
   * And you can manually switch to its netns (since they are named)
   
## Installation

Dependencies:
 * Recent version of systemd
 * iproute2
 * iptables

For installation, run `make install` with root privilege. 

You ran run `make uninstall` to remove the systemd units, but the configs located in `/etc/default` will not be removed.

## Quickstart

```shell
systemctl start netns-nat@helloworld
chnetns helloworld ip address
```

## Resources

 * [Create and Delete Netns](https://github.com/Jamesits/systemd-named-netns/wiki/Create-and-Delete-Netns)
 * [Switch to some netns and run program](https://github.com/Jamesits/systemd-named-netns/wiki/Chnetns)
 * [Put a systemd unit(service) into a netns](https://github.com/Jamesits/systemd-named-netns/wiki/Systemd-Units-and-Netns)
 * [Configuration](https://github.com/Jamesits/systemd-named-netns/wiki/Config)
 * Use Cases
   * [2 programs listening on the same port](https://github.com/Jamesits/systemd-named-netns/wiki/Use-Case:-Listen-Port-Collision)
   * [Bypass full tunneling VPN](https://github.com/Jamesits/systemd-named-netns/wiki/Use-Case:-OpenConnect-Full-Tunneling-VPN-and-LAN-Access)

## References

 * [f3flight/openconnect-ns](https://github.com/f3flight/openconnect-ns)
 * [@dechamps's netns@.service](https://github.com/systemd/systemd/issues/2741#issuecomment-336736214)
 * [systemd.service](https://www.freedesktop.org/software/systemd/man/systemd.service.html)
 * [systemd.unit](https://www.freedesktop.org/software/systemd/man/systemd.unit.html)
