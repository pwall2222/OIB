# OIB

Open In Browser

## Description

This set of scripts lets you choose where to open your links, in a main web-browser, a secondary web-browser or a chromium app (or PWA).

## Setup Script

```sh
curl https://raw.githubusercontent.com/pwall2222/oib/master/init.sh | bash
```

## Files

* app-list: A script containg all the ids and urls to take as arguments to launch a chromium based web-browser.
* open-app: A script that opens the app in the chromium browser or returns 1.
* url-handler: A script that decides where the url should be launched.

## Setting up

1. You need to get all 3 scripts on your path I suggest moving them to "/usr/local/bin/".
2. You will need to set up the scripts accordingly.
   * In url-handler you will need to set export MAIN_BROWSER, OTHER_BROWSER, CHROMIUM_BROWSER to the path of your browser executables.
   * You will need to create both a .domainrc and a .app-list in your home directory
   * In the domainrc you will need to put all the domains that you wanna either open in app or with the secondary browser, leaving a end break.
   * in the .app-list you will need to put the id and domain of the app you wanna acces. The number after `app` should be one greater than the one before (1,2,3,4,5) Example:

   ```sh
     declare -A app1=(
       [link]='open.spotify.com'
       [id]='pjibgclleladliembfgfagdaldikeohf'
     )
   ```

3. You have to get the url-handler.desktop into the `/usr/share/applications/` of your system.
4. You will need to make url-handler the default handler for the mime types of http and https. In gnome you can do this by executing this command:

```sh
gio mime x-scheme-handler/https  url-handler.desktop
gio mime x-scheme-handler/http  url-handler.desktop
```
