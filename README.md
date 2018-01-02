# Simplest possible Unifi Controller for Raspberry Pi

Based on https://github.com/ryansch/docker-unifi-rpi, but simpler

# Build
 `git clone https://github.com/lucaszanella/docker-unifi-rpi && cd docker-unifi-rpi`
`sudo docker build -t unifi .`

# Run

`R=/home/$USER/unifi && sudo docker run --rm -i -t --net="host" -v $R/config:/var/lib/unifi -v $R/log:/usr/lib/unifi/logs -v $R/log2:/var/log/unifi -v $R/run:/usr/lib/unifi/run -v $R/run2:/run/unifi -v $R/work:/usr/lib/unifi/work unifi`

# Run forever in background

`R=/home/$USER/unifi && sudo docker run -i -t --net="host" -v $R/config:/var/lib/unifi -v $R/log:/usr/lib/unifi/logs -v $R/log2:/var/log/unifi -v $R/run:/usr/lib/unifi/run -v $R/run2:/run/unifi -v $R/work:/usr/lib/unifi/work --restart unless-stopped unifi`

This way you can exit the terminal and it'll still run in the background even you restart the raspberry, unless you run `docker stop container_id` to stop it :)

# How to access

Just go to your raspberry IP address using the browser and put `:8443`, like this:

`https://your_raspberry_ip_address:8443`

Dont forget to put `https` in front of it and confirm the security exception as the certificate is self-emitted. TODO: print the certificate fingerprint upon running so you can safely confirm the security exception.
