FROM mikrofusion/docker-devbox-base
MAINTAINER Mike Groseclose <mike.groseclose@gmail.com>

ARG user

# install as root
USER root

RUN apt-get update

RUN apt-get install -y \
      postgresql

# erlang / elixir
RUN wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb -O /tmp/erlang-solutions_1.0_all.deb
RUN sudo dpkg -i /tmp/erlang-solutions_1.0_all.deb
RUN rm /tmp/erlang-solutions_1.0_all.deb
RUN apt-get update
RUN apt-get install -y esl-erlang
RUN apt-get install -y elixir

# phoenix deps
RUN apt-get install -y nodejs-legacy
RUN apt-get install -y npm
RUN apt-get install -y inotify-tools

USER $user

RUN mix local.hex --force
RUN mix archive.install https://github.com/phoenixframework/archives/raw/master/phoenix_new.ez --force

CMD sudo /usr/sbin/sshd -D
