# docker-rpi-dokuwiki

<img src="https://badgen.net/badge/platform/raspberry%20pi?list=1"/> <a href="https://hub.docker.com/r/dtroncy/rpi-dokuwiki"><img src="https://badgen.net/badge//docker?icon=docker"/></a> <a href="https://travis-ci.org/dtroncy/docker-rpi-dokuwiki"><img src="https://badgen.net/travis/babel/babel?icon=travis&label=build"/></a>

This is a raspberry pi compatible dokuwiki DockerFile.

To build it :

    docker build --build-arg dokuwiki_version=$dokuwiki_version -t dtroncy/rpi-dokuwiki .

$dokuwiki_version is version of dokuwiki you want to build.

To run it (with image on docker hub) :

    docker run -d --name dokuwiki dtroncy/rpi-dokuwiki

Description of parameters :
  - **-d** : Run as Daemon
  - **--name dokuwiki** : Container's name
  - **dtroncy/rpi-dokuwiki** : Image's name

If you want to persist your dokuwiki's data, you can add -v option for this folders :
  - **data/pages** - contains your current pages
  - **data/meta** - contains meta information about your pages (like who created it originally, who subscribed to it, …)
  - **data/media** - contains your current media (images, PDFs, …)
  - **data/media_meta** - meta data for the media
  - **data/attic** - all the old versions of your pages
  - **data/media_attic** - all the old versions of your media
  - **conf** - the configuration settings