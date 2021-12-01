FROM    ruby:2.5.7
LABEL   MAINTAINER Webmaster Team "web@cercomp.ufg.br"

RUN     apt-get update && apt-get install -y git imagemagick libpq-dev libncurses5-dev libffi-dev curl build-essential libssl-dev libreadline6-dev zlib1g-dev zlib1g libsqlite3-dev libmagickwand-dev libqtwebkit-dev libqt4-dev libreadline-dev libxslt-dev

COPY    . /weby
WORKDIR /weby
RUN     gem install bundler && bundle install && bundle exec rake assets:precompile --trace || true
ENTRYPOINT ["bash", "docker-entrypoint.sh"]
CMD     ["bin/rails","s","-b","0.0.0.0","-p","3000"]