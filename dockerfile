FROM ubuntu:18.04
MAINTAINER ngshya
ENV TZ=Europe/Rome
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update && apt-get install -y --no-install-recommends apt-utils
RUN apt update
RUN apt dist-upgrade -y
RUN apt -y install texlive-full
RUN mkdir /usr/src/tex
WORKDIR /usr/src/tex
