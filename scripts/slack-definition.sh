#!/usr/bin/env bash
source ./scripts/HASH.sh
export DIST_HASH="$NOW_HASH"
# 设置目标 url 链接
export TARGET_URL="https://tds-preview.xdrnd.com/$DIST_HASH/"
# 获取 commit 日志
git fetch
SOURCE_HASH=$(git rev-parse HEAD)
git stash
git checkout $CI_MERGE_REQUEST_TARGET_BRANCH_NAME
TARGET_HASH=$(git rev-parse $CI_MERGE_REQUEST_TARGET_BRANCH_NAME)
export LAST_COMMIT=$(git log \
"$SOURCE_HASH...$TARGET_HASH" \
-3 \
--pretty=format:'%s' --abbrev-commit  | awk -F ':'   '{print   NR " "  $0 }')
# 输出 commit 信息
echo "last commit: $LAST_COMMIT"
echo "check: $SOURCE_HASH...$TARGET_HASH"
# 还原 branch 状态
git checkout $SOURCE_HASH
# 输出已经被定义的变量
echo "$LAST_COMMIT"
echo "$DIST_HASH"
echo "$TARGET_URL"
