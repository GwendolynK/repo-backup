# Back up your all repo to a usb drive


<br>
<br>

## Instalation:

```
cd ~/
git clone https://github.com/WestleyK/repo-backup
cd repo-backup
sudo cp backup-repo /usr/local/bin/
```

<br>
<br>

## Configuring:

```
micro ~/.config/repo-backup-url/repo-backup-urls.txt
```
You can replace `micro` with other text editors like: `vim` and `nano`.
In that file, you can write the username and repo name like so:
```
WestleyK/rpi-backlight
WestleyK/easy-clone
```
Don't put the `.git` at the end of the repo name, and
no need to put the `https://github.com/` at the beginning.

<br>
<br>

## Usage:

```
cd <TO_YOUR_USB_DRIVE>
backup-repo
# now it will download and update all the repo that were in text file.
```

<br>
<br>


## End README

<br>
<br>









