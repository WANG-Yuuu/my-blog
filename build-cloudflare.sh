#!/bin/bash

# Cloudflare Pages 部署脚本
# 用于本地测试构建是否成功

set -e

echo "🚀 开始构建 Hugo 网站..."

# 清理旧的构建文件
if [ -d "docs/public" ]; then
    echo "🧹 清理旧的构建文件..."
    rm -rf docs/public
fi

# 构建网站
echo "📦 构建网站..."
cd docs && hugo --gc --minify --themesDir ../..

echo "✅ 构建完成！"
echo ""
echo "📊 构建统计："
echo "   输出目录: docs/public"
echo "   文件数量: $(find public -type f | wc -l)"
echo "   总大小: $(du -sh public | cut -f1)"
echo ""
echo "💡 提示："
echo "   1. 推送代码到 GitHub 后，Cloudflare Pages 会自动部署"
echo "   2. 访问 Cloudflare Dashboard 查看部署状态"
echo "   3. 部署完成后访问: https://yu-wang.me"
echo ""
echo "🔗 相关链接："
echo "   - Cloudflare Dashboard: https://dash.cloudflare.com/"
echo "   - 迁移指南: CLOUDFLARE_MIGRATION.md"
