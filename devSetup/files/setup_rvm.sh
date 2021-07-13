#!/bin/bash -l

set -e

curl -sSL https://rvm.io/mpapis.asc | gpg2 --import -
curl -sSL https://rvm.io/pkuczynski.asc | gpg2 --import -

curl -sSL https://get.rvm.io | bash -s stable --ruby