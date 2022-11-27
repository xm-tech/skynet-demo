# skynet developing guidline

## set up

update 3rd dependency

```zsh
git submodule init
git submodule update
```

build skynet

```zsh
cd 3rd/skynet && make macosx(or linux)
cd ../../
\cp 3rd/skynet/skynet .
```

## 模型(用户层)抽象

main : 网络侦听
agent : 玩家登录，业务数据入口，心跳, 这里暂且每个客户端TCP 连接对应1个 agent 服务
hall : 完成组队
room : 游戏逻辑


## 用户层抽象

每个连接 1 agent 服务
大厅服务(hall) : 完成匹配

## 开发思路

快速实现，简单可用(符合设计原则)，持续优化迭代
问题拆解, 分治

## skynet 的分布式方案

cluster 感觉是一个比较复杂的方案， 可不可以用 grpc 呢？ 可不可以用 etcd/zk 之类的?

## skynet 文档挺完善的，不明白的API和设计可以很方便的查阅
