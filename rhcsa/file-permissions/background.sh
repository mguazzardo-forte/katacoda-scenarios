#!/bin/bash

# create guest user account
useradd guest
useradd -m rhel

# create team group
groupadd team

# modify permissions on proprietary dir
chmod 640 /srv/proprietary
