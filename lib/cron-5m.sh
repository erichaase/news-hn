#!/usr/bin/env bash

RAILS_HOME=/home/eric/news-production

cd $RAILS_HOME

source /home/eric/.rvm/environments/ruby-1.9.2-p320@news

bundle exec rake sync:process RAILS_ENV=production 2>&1 >> $RAILS_HOME/log/production.log
