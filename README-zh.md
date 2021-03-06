# SSH Man ![CI](https://github.com/Gcaufy/sshman/workflows/CI/badge.svg?branch=master) ![Version](https://img.shields.io/static/v1?label=VER&message=v1.0.6&color=blue)

[English](README.md)

一个轻量易用的 SSH 登陆配置管理脚本. 

![sshman](https://user-images.githubusercontent.com/2182004/75115010-f7755880-5695-11ea-9850-d135117bb885.gif)

## 功能说明

 * 交互式的进行 SSH 配置的增删改查.
 * 完美的支持使用 `fzf` 进行快速模糊查找.
 * 记录你的登录频率并以之排序.
 * 纯 Bash 脚本实现无其它运行环境依赖.
 * 支持 scp 上传下载文件或文件夹.

## 演示

### 如何登录服务器

<img src="https://raw.githubusercontent.com/Gcaufy/sshman/master/asserts/login.gif" width="400" />

### 如何管理服务器配置

<img src="https://raw.githubusercontent.com/Gcaufy/sshman/master/asserts/edit.gif" width="400" />

### 如何上传文件或者文件夹至服务器

<img src="https://raw.githubusercontent.com/Gcaufy/sshman/master/asserts/upload.gif" width="400" />

### 如何从服务器下载文件或文件夹

<img src="https://raw.githubusercontent.com/Gcaufy/sshman/master/asserts/download.gif" width="400" />

## 依赖项
 * [expect](https://en.wikipedia.org/wiki/Expect)
 * [fzf](https://github.com/junegunn/fzf) *可选依赖*
 * [fd](https://github.com/sharkdp/fd) *可选依赖*

## 使用

```
$ s help
```

## 安装

### 安装依赖项
1. 安装 `expect`
> 参考 [这里](http://www.linuxfromscratch.org/blfs/view/svn/general/expect.html).

2. 安装 `fzf` (可选)
> 可选依赖，但强烈建议安装，提升使用体验。如果`fzf`没有安装，则无法使用上传和下载功能，同时也只能通过输入配置序号进行服务器登陆。
参考 [安装指引](https://github.com/junegunn/fzf#installation).

3. 安装 `fd` (可选依赖)
> 可选依赖，但建议安装。使用 upload 功能时，会要求选择本地文件，如果检测未安装 `fd`，则使用 `find .` 命令代替.
参数 [安装指引](https://github.com/sharkdp/fd#installation)

### 安装 sshman

```shell
curl -o- https://raw.githubusercontent.com/Gcaufy/sshman/master/install | bash
```

### 开发说明

#### Lint

在安装 [shellcheck](https://github.com/koalaman/shellcheck) 后，使用以下命令运行 lint 功能。

```
$ make lint
```

#### Test
在安装 [bats](https://github.com/sstephenson/bats) 后，使用以下命令运行单元测试用例。

```
$ make test
```

## Todo List

[ ] 支持 scp 传输文件

## License

The MIT License (MIT)
Copyright (c) 2020-2021 Gcaufy
