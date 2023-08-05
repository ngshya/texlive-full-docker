FROM ubuntu:latest
MAINTAINER ngshya
ENV TZ=Europe/Rome
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt update
RUN apt -y install texlive-full htop curl git
COPY settings.json /root/.local/share/code-server/User/settings.json
WORKDIR /root/
RUN curl -fsSL https://code-server.dev/install.sh | sh
RUN code-server --install-extension eamodio.gitlens \ 
                --install-extension marp-team.marp-vscode \ 
                --install-extension zhuangtongfa.material-theme \ 
                --install-extension anwar.resourcemonitor \ 
                --install-extension gruntfuggly.todo-tree \
                --install-extension james-yu.latex-workshop
EXPOSE 65002
CMD code-server --host 0.0.0.0 --port 65002 --auth none
