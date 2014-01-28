#!/bin/bash

cd /var/app/bacino
bundle install --gemfile=/var/app/bacino/Gemfile
bundle exec ruby /var/app/bacino/main.rb -o 0.0.0.0