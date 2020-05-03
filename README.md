# SSH Man

[中文](README-zh.md)

A shell script to manage all of your SSH config. Works nicely with `fzf`.

![sshman](https://user-images.githubusercontent.com/2182004/75115010-f7755880-5695-11ea-9850-d135117bb885.gif)

## Features

 * Manage SSH config interactively.
 * Support fuzzy filter by using `fzf`.
 * Sort by your SSH login frequency.
 * Pure bash scripts.
 * Support quick scp upload/download.

## Dependencies

 * [expect](https://en.wikipedia.org/wiki/Expect)
 * [fzf](https://github.com/junegunn/fzf) *optional*
 * [fd](https://github.com/sharkdp/fd) *optional*

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

```shell
curl -o- https://raw.githubusercontent.com/Gcaufy/sshman/master/install | bash
```

### Development

#### Lint

After installed [shellcheck](https://github.com/koalaman/shellcheck), then run the following commands for code lint.

```
$ make lint
```

#### Test

After installed [bats](https://github.com/sstephenson/bats), then run the following commands to run uint test.

```
$ make test
```

## License

The MIT License (MIT)
Copyright (c) 2020-2021 Gcaufy
