# SSH Man

[English](README.md)

一个轻量易用的 SSH 登陆配置管理脚本. 

![sshman](https://user-images.githubusercontent.com/2182004/75115010-f7755880-5695-11ea-9850-d135117bb885.gif)

## 功能说明

 * 交互式的进行 SSH 配置的增删改查.
 * 完美的支持使用 `fzf` 进行快速模糊查找.
 * 记录你的登录频率并以之排序.
 * 纯 Bash 脚本实现无其它运行环境依赖.

## 依赖项
 * [expect](https://en.wikipedia.org/wiki/Expect)
 * [fzf](https://github.com/junegunn/fzf) *optional*

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

#### git 安装方式

```shell
git clone --depth 1 https://github.com/Gcaufy/sshman.git ~/.sshman && \
ln -s /usr/local/bin/s ~/.sshman/sshman
```

#### curl 安装方式
```shell
curl https://github.com/Gcaufy/sshman/archive/v1.0.1.tar.gz -o /tmp/sshman.tar.gz && \
makedir ~/.sshman && tar zxvf /tmp/sshman.tar.gz --strip-components=1 -C ~/.sshman/ && \
ln -s /usr/local/bin/s ~/.sshman/sshman
```
