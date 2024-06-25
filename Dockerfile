#这里的go版本最好对应本地的go版本
FROM golang:1.22.4-alpine AS builder

MAINTAINER lyyym

ENV GO111MODULE=on \
    GOPROXY=https://goproxy.cn,direct \
    CGO_ENABLED=0 \
    GOOS=linux \
    GOARCH=amd64

WORKDIR /app
#拷贝编译后的二进制文件
COPY . .
#设置数据卷
VOLUME ["/app/config.yaml"]
#暴漏的端口
EXPOSE 8080
#运行程序
ENTRYPOINT ["/app/main"]
