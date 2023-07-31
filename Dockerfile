ARG IMG_TAG=latest

FROM ubuntu:${IMG_TAG}

LABEL maintainer="Sven Skender (@sskender)"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y
RUN apt-get install build-essential cmake vim-nox python3-dev git vim wget curl -y
RUN apt-get install mono-complete golang nodejs default-jdk npm -y
RUN apt-get install fzf ripgrep -y
RUN apt-get install universal-ctags -y
RUN apt autoremove -y \
    && apt clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ARG GROUP_ID=1000
ARG USER_ID=1000
ARG USER_NAME=sskender

RUN groupadd -g ${GROUP_ID} ${USER_NAME} && \
    useradd -u ${USER_ID} -g ${USER_NAME} -m ${USER_NAME}

USER ${USER_NAME}
WORKDIR /home/${USER_NAME}

RUN git clone https://github.com/sskender/vimrc.git
RUN ln -s /home/${USER_NAME}/vimrc/.vimrc /home/${USER_NAME}/.vimrc

WORKDIR /home/${USER_NAME}/.vim/plugged/
RUN git clone https://github.com/ycm-core/YouCompleteMe.git
RUN cd YouCompleteMe && \
    git submodule update --init --recursive && \
    python3 install.py --all

WORKDIR /home/${USER_NAME}

ENTRYPOINT ["vim"]
