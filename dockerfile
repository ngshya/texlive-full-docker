FROM ubuntu:latest
MAINTAINER ngshya
ENV TZ=Europe/Rome
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt update
RUN apt -y install texlive-full htop curl git
WORKDIR /root/
RUN curl -fsSL https://code-server.dev/install.sh | sh
RUN code-server --install-extension ms-python.python \ 
                --install-extension njpwerner.autodocstring \ 
                --install-extension grapecity.gc-excelviewer \ 
                --install-extension eamodio.gitlens \ 
                --install-extension ms-toolsai.jupyter \ 
                --install-extension ms-toolsai.jupyter-renderers \ 
                --install-extension marp-team.marp-vscode \ 
                --install-extension ms-python.mypy-type-checker \ 
                --install-extension zhuangtongfa.material-theme \ 
                --install-extension anwar.papyrus-pdf \ 
                --install-extension jebbs.plantuml \ 
                --install-extension anwar.resourcemonitor \ 
                --install-extension gruntfuggly.todo-tree
EXPOSE 9123
CMD code-server --host 0.0.0.0 --port 9123 --auth none
