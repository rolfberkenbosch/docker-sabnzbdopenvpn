#!/bin/sh

#. /etc/profile

# See https://openvpn.net/index.php/open-source/documentation/manuals/65-openvpn-20x-manpage.html (--up cmd)

if [ ! -e "/dev/random" ]; then
  # Avoid "Fatal: no entropy gathering module detected" error
  echo "INFO: /dev/random not found - symlink to /dev/urandom"
  ln -s /dev/urandom /dev/random
fi

echo "STARTING SABNZBD with USER ${USER_NAME}"

# ENV Variables missing - fix needed

ENV LANG="en_US.UTF-8" LANGUAGE="en_US.UTF-8" PYTHONIOENCODING="utf-8"
exec sudo LANG="en_US.UTF-8" LANGUAGE="en_US.UTF-8" PYTHONIOENCODING="utf-8" -u abc /usr/bin/sabnzbdplus --config-file /config --server 0.0.0.0:8080 &

echo "Startup script SABnzbd completed."
