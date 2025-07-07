FROM docker:dind

RUN apk add git lazygit neovim ripgrep fd stylua shfmt fzf unzip wget gzip bash alpine-sdk curl supervisor --update
RUN git clone https://github.com/LazyVim/starter ~/.config/nvim

RUN wget https://go.dev/dl/go1.22.1.linux-amd64.tar.gz
RUN rm -rf /usr/local/go && tar -C /usr/local -xzf go1.22.1.linux-amd64.tar.gz
RUN /usr/local/go/bin/go install mvdan.cc/gofumpt@latest
RUN /usr/local/go/bin/go install golang.org/x/tools/cmd/goimports@latest

#dapr
RUN wget -q https://raw.githubusercontent.com/dapr/cli/master/install/install.sh -O - | /bin/bash
EXPOSE 3500 50001 50002

#configure supervisor
RUN mkdir -p /etc/supervisor.d
COPY supervisor.ini /etc/supervisor.d/supervisor.ini

#configure docker
RUN mkdir -p /etc/docker && \
  echo '{"storage-driver": "vfs"}' > /etc/docker/daemon.json 
EXPOSE 2375

#configure nvim
EXPOSE 7777

RUN cd /root
ENV PATH="${PATH}:/usr/local/go/bin"

CMD ["supervisord", "-c", "/etc/supervisor.d/supervisor.ini"]

