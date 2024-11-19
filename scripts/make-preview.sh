#!/usr/bin/env bash
source ./scripts/HASH.sh
# 设置环境变量
export APP_PUBLIC_PATH="https://tds-preview.xdrnd.com"
export APP_ROUTER_BASE_URL="/$NOW_HASH/"
# 构建 preview
# 按照结果 exit 或 继续执行
if [ "$?" -eq 0 ];
then
  echo 'Build success'
  echo "APP_PUBLIC_PATH: $APP_PUBLIC_PATH"
  echo "APP_ROUTER_BASE_URL: $APP_ROUTER_BASE_URL"
else
  echo 'Build fail'
  exit 2;
fi
