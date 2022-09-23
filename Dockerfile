FROM node:12-slim

# 使用 HTTPS 协议访问容器云调用证书安装
RUN apk add ca-certificates

WORKDIR /usr/src/app

COPY package*.json .

# NPM更换腾讯加速源
RUN npm config set registry https://mirrors.tencent.com/npm/
RUN npm config set sharp_binary_host "https://npmmirror.com/mirrors/sharp"
RUN npm config set sharp_libvips_binary_host "https://npmmirror.com/mirrors/sharp-libvips"

RUN npm install --only=production

COPY . .

CMD [ "node", "index.js" ]
