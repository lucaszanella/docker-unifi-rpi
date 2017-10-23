# Simplest possible Unifi Controller for Raspberry Pi

Based on https://github.com/ryansch/docker-unifi-rpi, but simpler

# Run

`R=/home/$USER/unifi && sudo docker run --rm -i -t --net="host" -v $R/config:/var/lib/unifi -v $R/log:/usr/lib/unifi/logs -v $R/log2:/var/log/unifi -v $R/run:/usr/lib/unifi/run -v $R/run2:/run/unifi -v $R/work:/usr/lib/unifi/work unifi`

# Build

`sudo docker build -t unifi .`


# Inspection

Add  `--entrypoint /bin/bash` before `unifi`

