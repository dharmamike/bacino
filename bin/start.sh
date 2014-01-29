#!/bin/bash

cd /var/app/bacino
bundle install --gemfile=/var/app/bacino/Gemfile
bundle exec rails s