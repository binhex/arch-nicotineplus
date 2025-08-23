# Application

[Nicotine+](https://nicotine-plus.org/)

## Description

Nicotine+ is a graphical client for the Soulseek peer-to-peer network.
Nicotine+ aims to be a lightweight, pleasant, free and open source (FOSS)
alternative to the official Soulseek client, while also providing a
comprehensive set of features.
Nicotine+ is written in Python and uses GTK for its graphical user interface.

## Build notes

Latest stable Nicotine+ release from Arch Linux.

## Usage

```bash
docker run -d \
    -p 5900:5900 \
    -p 6080:6080 \
    --name=<container name> \
    --privileged=true \
    -v <path for config files>:/config \
    -v /etc/localtime:/etc/localtime:ro \
    -e GLUETUN_INCOMING_PORT=<yes|no> \
    -e HTTPS_CERT_PATH=<path to cert file> \
    -e HTTPS_KEY_PATH=<path to key file> \
    -e WEBPAGE_TITLE=<name shown in browser tab> \
    -e VNC_PASSWORD=<password for web ui> \
    -e ENABLE_STARTUP_SCRIPTS=<yes|no> \
    -e HEALTHCHECK_COMMAND=<command> \
    -e HEALTHCHECK_ACTION=<action> \
    -e HEALTHCHECK_HOSTNAME=<hostname> \
    -e UMASK=<umask for created files> \
    -e PUID=<uid for user> \
    -e PGID=<gid for user> \
    binhex/arch-nicotineplus
```

Please replace all user variables in the above command defined by <> with the
correct values.

## Example

```bash
docker run -d \
    -p 5900:5900 \
    -p 6080:6080 \
    --name=nicotineplus \
    --privileged=true \
    -v /apps/docker/nicotineplus:/config \
    -v /etc/localtime:/etc/localtime:ro \
    -e GLUETUN_INCOMING_PORT=no \
    -e WEBPAGE_TITLE=Nicotine \
    -e VNC_PASSWORD=mypassword \
    -e ENABLE_STARTUP_SCRIPTS=yes \
    -e UMASK=000 \
    -e PUID=0 \
    -e PGID=0 \
    binhex/arch-nicotineplus
```

If you do specify a password for the web ui via the env var 'VNC_PASSWORD'
then it MUST be 6 characters or longer, otherwise it will be ignored.

## Access via web interface (noVNC)

`http://<host ip>:<host port>/vnc.html?resize=remote&host=<host ip>&port=<host
port>&&autoconnect=1`

e.g.:-

`http://192.168.1.10:6080/vnc.html?resize=remote&host=192.168.1.10&port=6080&&autoconnect=1`

## Access via VNC client

`<host ip>::<host port>`

e.g.:-

`192.168.1.10::5900`

## Notes

`ENABLE_STARTUP_SCRIPTS` when set to `yes` will allow a user to install
additional packages from the official Arch Repository or the Arch User
Repository (AUR) via scripts located in the folder `/config/home/scripts/`.
A sample script is located at `/config/home/scripts/example-startup-script.sh`
with comments to guide the user on script creation.

User ID (PUID) and Group ID (PGID) can be found by issuing the following
command for the user you want to run the container as:-

```bash
id <username>
```

___

If you appreciate my work, then please consider buying me a beer  :D

[![PayPal donation](https://www.paypal.com/en_US/i/btn/btn_donate_SM.gif)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=MM5E27UX6AUU4)

[Documentation](https://github.com/binhex/documentation) | [Support forum](https://forums.unraid.nets/topic/71764-support-binhex-makemkv/)
