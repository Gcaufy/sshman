# SSH Man ![CI](https://github.com/Gcaufy/sshman/workflows/CI/badge.svg?branch=master) ![Version](https://img.shields.io/static/v1?label=VER&message=v1.0.5&color=blue)

[中文](README-zh.md)

A shell script to manage all of your SSH config. Works nicely with `fzf`.

![sshman](https://user-images.githubusercontent.com/2182004/75115010-f7755880-5695-11ea-9850-d135117bb885.gif)

## Features

 * Manage SSH config interactively.
 * Support fuzzy filter by using `fzf`.
 * Sort by your SSH login frequency.
 * Pure bash scripts.
 * Support quick scp upload/download.

## Demo

### How to login

<img src="https://raw.githubusercontent.com/Gcaufy/sshman/master/asserts/login.gif" width="400" />

### How to manage server config

<img src="https://raw.githubusercontent.com/Gcaufy/sshman/master/asserts/edit.gif" width="400" />

### How to upload a file or directory to the server

<img src="https://raw.githubusercontent.com/Gcaufy/sshman/master/asserts/upload.gif" width="400" />

### How to download file from a server 

<img src="https://raw.githubusercontent.com/Gcaufy/sshman/master/asserts/download.gif" width="400" />

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
> It's optional, but strongly suggested. If `fzf` is not installed, you can not use upload and donwload command. And also you have to select a server by typing its sequence number(which I think it's inefficient). 
See [Installation](https://github.com/junegunn/fzf#installation).

3. Install `fd` (optional)
> It's optional, If `fd` is not installed, in upload command, when you select local files, it's using `find .`.
See [Installation](https://github.com/sharkdp/fd#installation)

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
