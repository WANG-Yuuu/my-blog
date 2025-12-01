# Cloudflare Pages 迁移指南

本文档说明如何将博客从 Netlify 迁移到 Cloudflare Pages。

## 📋 迁移前准备

### 1. 确认当前配置
- **构建目录**: `docs/public`
- **构建命令**: `cd docs && hugo --gc --minify --themesDir ../.. -b $CF_PAGES_URL`
- **Hugo 版本**: 0.147.7
- **Go 版本**: 1.24.3
- **Node 版本**: 22.16.0

### 2. 域名准备
- 当前域名: `yu-wang.me`
- 需要将域名 DNS 迁移到 Cloudflare（如果还未迁移）

## 🚀 迁移步骤

### 步骤 1: 在 Cloudflare 创建 Pages 项目

1. 登录 [Cloudflare Dashboard](https://dash.cloudflare.com/)
2. 进入 **Workers & Pages** 部分
3. 点击 **Create application** > **Pages** > **Connect to Git**
4. 选择你的 GitHub 仓库（需要授权 Cloudflare 访问）

### 步骤 2: 配置构建设置

在 Cloudflare Pages 项目设置中配置：

**Framework preset**: Hugo

**Build configuration**:
- **Build command**: `cd docs && hugo --gc --minify --themesDir ../..`
- **Build output directory**: `docs/public`
- **Root directory**: `/` (保持默认)

**Environment variables**:
```
HUGO_VERSION=0.147.7
GO_VERSION=1.24.3
NODE_VERSION=22.16.0
CF_PAGES_URL=$CF_PAGES_URL
```

### 步骤 3: 配置自定义域名

1. 在 Cloudflare Pages 项目中，进入 **Custom domains**
2. 点击 **Set up a custom domain**
3. 输入 `yu-wang.me`
4. Cloudflare 会自动配置 DNS 记录（如果域名在 Cloudflare）

### 步骤 4: 更新 Hugo 配置

更新 `docs/hugo.yaml` 中的 `baseURL`:
```yaml
baseURL: "https://yu-wang.me/"
```

### 步骤 5: 触发首次部署

1. 推送代码到 GitHub
2. Cloudflare Pages 会自动检测并开始构建
3. 等待构建完成（通常 1-3 分钟）

### 步骤 6: 验证部署

1. 访问 Cloudflare Pages 提供的预览 URL（如 `your-project.pages.dev`）
2. 确认网站正常运行
3. 访问自定义域名 `yu-wang.me` 确认 DNS 生效

### 步骤 7: 清理 Netlify（可选）

确认 Cloudflare Pages 运行正常后：
1. 在 Netlify 中停止自动部署
2. 可以保留 Netlify 项目作为备份，或完全删除

## 📝 配置文件说明

### `wrangler.toml` (可选)
如果需要更高级的配置，可以创建 `wrangler.toml` 文件。本项目已包含基础配置。

### `_headers` (可选)
Cloudflare Pages 支持自定义 HTTP 头，可以在 `docs/public/_headers` 中配置。

### `_redirects` (可选)
支持重定向规则，可以在 `docs/public/_redirects` 中配置。

## 🔧 Cloudflare Pages vs Netlify 差异

| 特性 | Netlify | Cloudflare Pages |
|------|---------|------------------|
| 构建时间 | 较快 | 非常快 |
| 全球 CDN | ✅ | ✅ (更多节点) |
| 自动 HTTPS | ✅ | ✅ |
| 预览部署 | ✅ | ✅ |
| 环境变量 | ✅ | ✅ |
| 函数支持 | Netlify Functions | Cloudflare Workers |
| 免费额度 | 100GB/月 | 无限带宽 |

## 🎯 优势

1. **更快的全球访问速度**: Cloudflare 拥有全球最大的 CDN 网络
2. **无限带宽**: 免费计划提供无限带宽
3. **更好的 DDoS 防护**: Cloudflare 的核心优势
4. **集成 DNS 管理**: 如果域名在 Cloudflare，管理更方便
5. **免费 SSL**: 自动配置和续期

## 📚 参考资源

- [Cloudflare Pages 文档](https://developers.cloudflare.com/pages/)
- [Hugo on Cloudflare Pages](https://developers.cloudflare.com/pages/framework-guides/deploy-a-hugo-site/)
- [Cloudflare Pages 构建配置](https://developers.cloudflare.com/pages/configuration/build-configuration/)

## ⚠️ 注意事项

1. **构建时间限制**: Cloudflare Pages 免费计划有构建时间限制（500 次/月）
2. **文件大小限制**: 单个文件最大 25MB
3. **总项目大小**: 最大 20,000 个文件
4. **环境变量**: 确保所有必要的环境变量都已配置

## 🆘 故障排查

### 构建失败
- 检查 Hugo 版本是否正确
- 确认构建命令路径正确
- 查看构建日志中的错误信息

### 域名无法访问
- 确认 DNS 记录已正确配置
- 等待 DNS 传播（最多 24-48 小时）
- 检查 SSL 证书状态

### 样式或资源加载失败
- 确认 `baseURL` 配置正确
- 检查资源路径是否使用相对路径
- 查看浏览器控制台错误信息

## 📞 获取帮助

如遇到问题，可以：
1. 查看 [Cloudflare Community](https://community.cloudflare.com/)
2. 提交 [Support Ticket](https://dash.cloudflare.com/?to=/:account/support)
3. 参考 [Hugo 官方文档](https://gohugo.io/documentation/)
