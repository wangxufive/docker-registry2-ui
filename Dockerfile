# base image
FROM golang:latest

LABEL PROJECT="docker-registry2-ui" \
      AUTHOR="wangxufire@gmail.com"

# developer info
MAINTAINER  "wangxufire" <wangxufire@gmail.com>

# current workspace
WORKDIR /opt

# appliction resources
ADD . docker-registry2-ui

# runtime setting
ENV LANG en_US.UTF-8

# building
RUN docker-registry2-ui/docker/build.sh

# open image port
EXPOSE 8000

# exec command
CMD ["./docker-registry2-ui"]
