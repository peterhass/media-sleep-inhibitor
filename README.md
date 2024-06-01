# media-sleep-inhibitor

Most applications inhibit sleep through loginctrl on their own but seems like spotify devs decided against it. This small service waits for the spotify dbus service to appear, inherits sleep when media is playing and releases the sleep lock when it is paused.

## Install

```bash
# Install deps
sudo pacman -S python-dasbus

# Allow user services
loginctl enable-linger

# Go for gold
make install
```

Run spotify and check `systemd-inhibit --list`.

## Troubleshooting

Try the journal: `journalctl --user -u media-sleep-inhibitor.service -f`
