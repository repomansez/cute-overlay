## Cute overlay
just my personal overlay with stuff I use daily (or yearly). Not very cute tbh.

might contain straight out "stolen" ebuilds that either have specific configurations for my particular setup or that I added just to avoid enabling a million repositories, this is, after all, an overlay for personal use, so keep that in mind. That is also the reason this overlay is not listed at gpo.zugaina.org or anywhere else. Most ebuilds should be fine, though. 

## I wanna use this shit anyways
Create a configuration file for it on repos.conf

```touch /etc/portage/repos.conf/cute-overlay.conf```

and paste this inside of it
```
[cute-overlay]
location = /var/db/repos/cute-overlay
sync-type = git
sync-uri = https://github.com/repomansez/cute-overlay
```
