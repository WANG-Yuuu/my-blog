#!/bin/bash

# 颜色定义
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${BLUE}🚀 开始自动部署流程...${NC}\n"

# 1. 清理并构建
echo -e "${YELLOW}📦 步骤 1/4: 清理缓存并构建...${NC}"
hugo mod clean
hugo --gc --minify

if [ $? -ne 0 ]; then
    echo -e "${RED}❌ 构建失败！${NC}"
    exit 1
fi
echo -e "${GREEN}✅ 构建成功！${NC}\n"

# 2. 检查是否有更改
echo -e "${YELLOW}🔍 步骤 2/4: 检查文件更改...${NC}"
if [ -z "$(git status --porcelain)" ]; then
    echo -e "${YELLOW}⚠️  没有文件更改，跳过提交${NC}"
    exit 0
fi

git status --short
echo ""

# 3. 添加所有更改
echo -e "${YELLOW}📝 步骤 3/4: 添加文件到 Git...${NC}"
git add .

# 4. 提交（使用参数或默认消息）
COMMIT_MSG="${1:-chore: 自动部署更新 $(date '+%Y-%m-%d %H:%M:%S')}"
echo -e "${YELLOW}💾 提交信息: ${COMMIT_MSG}${NC}"
git commit -m "$COMMIT_MSG"

if [ $? -ne 0 ]; then
    echo -e "${RED}❌ 提交失败！${NC}"
    exit 1
fi
echo -e "${GREEN}✅ 提交成功！${NC}\n"

# 5. 推送到远程
echo -e "${YELLOW}🚀 步骤 4/4: 推送到 GitHub...${NC}"
git push origin main

if [ $? -ne 0 ]; then
    echo -e "${RED}❌ 推送失败！${NC}"
    exit 1
fi

echo -e "\n${GREEN}🎉 部署完成！${NC}"
echo -e "${BLUE}📊 Netlify 将自动开始构建...${NC}"
echo -e "${BLUE}🌐 访问: https://yu-wang.me/${NC}\n"
