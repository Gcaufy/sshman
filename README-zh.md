# SSH Man ![CI](https://github.com/Gcaufy/sshman/workflows/CI/badge.svg?branch=master)

[English](README.md)

一个轻量易用的 SSH 登陆配置管理脚本. 

![sshman](https://user-images.githubusercontent.com/2182004/75115010-f7755880-5695-11ea-9850-d135117bb885.gif)

## 功能说明

 * 交互式的进行 SSH 配置的增删改查.
 * 完美的支持使用 `fzf` 进行快速模糊查找.
 * 记录你的登录频率并以之排序.
 * 纯 Bash 脚本实现无其它运行环境依赖.
 * 支持 scp 上传下载文件或文件夹.

## 依赖项
 * [expect](https://en.wikipedia.org/wiki/Expect)
 * [fzf](https://github.com/junegunn/fzf) *optional*
 * [fd](https://github.com/sharkdp/fd) *optional*

## 使用

```
$ s help
```

## 安装

### 安装依赖项
1. 安装 `expect`
> 参考 [这里](http://www.linuxfromscratch.org/blfs/view/svn/general/expect.html).

2. 安装 `fzf` (可选)
> 这个是可选项，但强烈建议安装，提升使用体验。如果`fzf`没有安装，则无法使用快速模糊查找功能，只能通过输入配置序号进行服务器登陆。
参考 [安装指引](https://github.com/junegunn/fzf#installation).

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
