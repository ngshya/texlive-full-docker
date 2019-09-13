FROM ubuntu:18.04
MAINTAINER ngshya
RUN apt update
RUN apt dist-upgrade -y
RUN apt -y install texlive-full
WORKDIR /usr/src/tex
