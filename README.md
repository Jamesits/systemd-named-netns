# systemd-named-netns

This project enables you to:
 * Create and delete named netns on the fly like systemd services
 * Start named netns on boot
 * Quickly set up bridging or NAT from netns to host
 * Put some systemd services in a specific named netns
   * Enables them to connect to the internet too
   * And you can manually switch to its netns (since they are named)
   
## Installation

For installation, run `make install` with root privilege. 

You ran run `make uninstall` to remove the systemd units, but the configs located in `/etc/default` will not be removed.

## Usage

### Create netns

Assume you want to create a netns named `foo`. 

Bridged to host network:
```shell
systemctl start netns-bridge@foo
```
(For the default config, it will bridge to `br0`. You should create the bridge first. See [wiki/bridging](https://github.com/Jamesits/systemd-named-netns/wiki/bridging))

NATed:
```shell
systemctl start netns-nat@foo
```

Just a plain netns without external networking:
```shell
systemctl start netns@foo
```

Note: 
 * In the first 2 cases, `netns@foo` is automatically started.
 * You may want to `systemctl enable` them to make them available after every boot.

Remove netns (for all cases):

```shell
systemctl stop netns@foo
```

### Use the netns manually

```shell
chnetns foo bash
```

Note: you may need root privilege to use `chnetns`.

### Put a systemd service to that netns

Assume you want to put `bar.service` into netns `foo`, Create a file named `/etc/systemd/system/bar.service.d/netns.conf` and put the following content in:
```
[Unit]
BindsTo=netns@foo.service
After=netns@foo.service
JoinsNamespaceOf=netns@foo.service

[Service]
PrivateNetwork=yes
```
Do a `systemctl daemon-reload` afterwards. If you have enabled it, `systemctl reenable bar.service` too.

If you need automatic bridging or NAT, `systemctl enable netns-bridge@foo.service` or `systemctl enable netns-nat@foo.service`.

## Configuration

Global config file is located at `/etc/default/netns-bridge` and `/etc/default/netns-nat`. You can create individual config file for each netns named in `netns-bridge-foo` or `netns-nat-foo` to override global config.

## References

 * [f3flight/openconnect-ns](https://github.com/f3flight/openconnect-ns)
 * [@dechamps's netns@.service](https://github.com/systemd/systemd/issues/2741#issuecomment-336736214)
 * [systemd.service](https://www.freedesktop.org/software/systemd/man/systemd.service.html)
 * [systemd.unit](https://www.freedesktop.org/software/systemd/man/systemd.unit.html)
