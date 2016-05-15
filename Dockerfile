# base image
FROM golang:alpine

LABEL PROJECT="docker-registry2-ui" \
      AUTHOR="wangxufire@gmail.com"

# developer info
MAINTAINER  "wangxufire" <wangxufire@gmail.com>

# current workspace
WORKDIR /opt

# appliction resources
COPY . .

# runtimes setting
ENV LANG en_US.UTF-8
RUN ./docker/build.sh

# open image port
EXPOSE 8000

# exec command
CMD ["./docker-registry2-ui"]
