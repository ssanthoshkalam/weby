#!/bin/bash
cd /weby
chmod +x bin/rails
if [ "$1" == "init" ]
then
rake db:create
rake db:schema:load
rake db:seed
bin/rails db:migrate RAILS_ENV=$RAILS_ENV
exit 0
fi
exec "$@"
