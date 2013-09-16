#!/usr/bin/env bash

export RAILS_HOME=/home/eric/news-production
export RAILS_ENV=production

cd $RAILS_HOME

source /home/eric/.rvm/environments/ruby-1.9.2-p320@news

bundle exec rake sync:hn 2>&1 >> $RAILS_HOME/log/production.log
