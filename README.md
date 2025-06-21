# vigo

vi (nvim) dev environment for go

## usage

use ith with make

`make edit`

### alternative usage

After `make .make_image` you can set this alias

```bash
alias vigo='docker run -ti --platform linux/amd64 -e DISPLAY=$DISPLAY -e TERM=xterm -e GIT_USERNAME="Your Name" -e GIT_EMAIL="YourEmail@Stealer.com"  --rm -v $HOME/tmp/:/tmp/ -v $(pwd):/code go-dev-environment-editor nvim'
```
