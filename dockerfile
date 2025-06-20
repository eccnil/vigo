FROM alpine:edge

RUN apk add git lazygit neovim ripgrep fd stylua shfmt fzf unzip wget gzip bash alpine-sdk curl --update
RUN git clone https://github.com/LazyVim/starter ~/.config/nvim

RUN wget https://go.dev/dl/go1.22.1.linux-amd64.tar.gz
RUN rm -rf /usr/local/go && tar -C /usr/local -xzf go1.22.1.linux-amd64.tar.gz
RUN /usr/local/go/bin/go install mvdan.cc/gofumpt@latest
RUN /usr/local/go/bin/go install golang.org/x/tools/cmd/goimports@latest
RUN cd /root
ENV PATH="${PATH}:/usr/local/go/bin"


#ENTRYPOINT 'sh'
