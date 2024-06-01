check-deps:
	/usr/bin/env python -c 'import dasbus' &> /dev/null || { echo >&2 "Requires dasbus pip package" exit 1; }

install: check-deps
	install ./media-sleep-inhibitor ~/.local/bin
	cp ./media-sleep-inhibitor.service ~/.config/systemd/user/
	systemctl --user daemon-reload
	systemctl --user enable media-sleep-inhibitor.service
	systemctl --user restart media-sleep-inhibitor.service
