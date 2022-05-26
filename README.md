# wtfos-opkg-config
This package will set up `opkg.conf` depending on the hardware it is running on.

On package installation following checks and actions happen:

1. The current `/opt/etc/opkg.conf` is backupped to `/opt/etc/opkg.conf.bak`
2. If `/opt/etc/opkg.conf` is untouched (no `WTFOS-CONFIG` comments are found) the current configuration is moved to `/opt/etc/opkg.conf.orig`
3. A new configuration block with delimiting comments is appended to `/opt/etc/opkg.conf`. If a `WTFOS-OPKG-CONFIG` block is present already, the old block is deleted before the new one is appended.

## Extending the configuration
If you want to extend the OPKG configuration - by for example adding a dev repository of your own - your package should depend on this package.

### postinst
Your `postinst` script should then implement Steps 1 and 3 as described above (your delimiter should be unique to your package).

### prerm
Your `prerm` script should simply delete the whole block that was added during the `postinst` step.
