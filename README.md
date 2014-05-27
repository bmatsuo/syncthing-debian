Debian script for installing syncthing.

Get syncthing

    make

Install syncthing and make sure it it always running.

    sudo make install
    sudo /etc/init.d/syncthing start

On a default Raspbian setup the syncthing logs will go to /var/log/user.log.
