FROM gitlab/gitlab-runner:latest

RUN apt update && apt install python3-pip
# RUN curl -sSL https://get.docker.com/ | sh
RUN usermod -aG docker gitlab-runner
RUN curl -L https://github.com/docker/compose/releases/download/1.16.1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose