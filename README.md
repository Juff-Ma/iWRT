# iWRT

This is a custom fork of X-WRT with changed packages and some additions.

Specifically it's created for the BananaPI BPI-r4 since X-WRT includes many patches that make it work better than vanilla OpenWRT.
It also includes an x86 build for server use.

Some of the changes made by iWRT to upstream are:

* Remove China-specific tools/settings most international users won't need
* Add some helpful high-end shell utils like fastfetch or btop
* Add many protocols by default (especially VPN)
* Include some cool luci apps like speedtest, argon theme and cpu state
* Change default subnet to be a 172.../16
* Include some more advanced services like AdGuard, unbound or atftp

iWRT is pretty much for personal use only but you can use my config as and packages as a base for your own build. (look at \*.config files)

There's also an OpenWRT Imagebuilder included in each release (look in the 7zip file) which you can customize.
But since my builds include very little packages besides the ones I actually use you probably could only remove stuff and not add anything.

Still if you want to use it and need help (that's just related to iWRT and not upstream) you can open an issue and I'll take a look at it
I just won't make changes that benefit you only.

