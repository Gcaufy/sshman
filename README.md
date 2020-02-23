# SSH Man

A shell script to manage all of your SSH config. Works nicely with `fzf`.

![sshman](https://user-images.githubusercontent.com/2182004/75115010-f7755880-5695-11ea-9850-d135117bb885.gif)


## Dependencies
 * [expect](https://en.wikipedia.org/wiki/Expect)
 * [fzf](https://github.com/junegunn/fzf) *optional*

## Usage

```
$ s help
```

## Install

### Install Dependencies
1. Install `expect`
> See [here](http://www.linuxfromscratch.org/blfs/view/svn/general/expect.html).

2. Install `fzf` (optional)
> It's optional, but strongly suggested. If `fzf` is not installed, then you have to select a server by typing its sequence number.
See [Installation](https://github.com/junegunn/fzf#installation).

### Install sshman

#### Using git

```shell
git clone --depth 1 https://github.com/Gcaufy/sshman.git ~/.sshman && \
ln -s /usr/local/bin/s ~/.sshman/sshman
```

#### Using curl
```shell
curl https://github.com/Gcaufy/sshman/archive/v1.0.1.tar.gz -o /tmp/sshman.tar.gz && \
makedir ~/.sshman && tar zxvf /tmp/sshman.tar.gz --strip-components=1 -C ~/.sshman/ && \
ln -s /usr/local/bin/s ~/.sshman/sshman
```
