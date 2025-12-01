# Cloudflare Pages 快速设置指南

## 🎯 现在需要做什么？

代码已经推送到 GitHub，现在需要在 Cloudflare 上配置部署。

## 📝 步骤清单

### ✅ 已完成
- [x] 创建 Cloudflare Pages 配置文件
- [x] 更新 Hugo 配置（baseURL、标题等）
- [x] 修复配置错误
- [x] 本地构建测试成功（108 页面）
- [x] 推送代码到 GitHub

### 🔲 待完成（需要你手动操作）

#### 1. 在 Cloudflare 创建 Pages 项目 (5 分钟)

1. 访问 [Cloudflare Dashboard](https://dash.cloudflare.com/)
2. 点击左侧菜单 **Workers & Pages**
3. 点击 **Create application** 按钮
4. 选择 **Pages** 标签
5. 点击 **Connect to Git**
6. 授权 Cloudflare 访问你的 GitHub 账户
7. 选择仓库：`WANG-Yuuu/my-blog`
8. 点击 **Begin setup**

#### 2. 配置构建设置

在项目设置页面填写：

**Project name**: `my-blog` (或任意名称)

**Production branch**: `main`

**Framework preset**: 选择 `Hugo`

**Build configuration**:
```
Build command: cd docs && hugo --gc --minify --themesDir ../..
Build output directory: docs/public
Root directory: /
```

**Environment variables** (点击 Add variable 添加):
```
HUGO_VERSION = 0.147.7
GO_VERSION = 1.24.3
NODE_VERSION = 22.16.0
```

#### 3. 开始首次部署

1. 点击 **Save and Deploy** 按钮
2. 等待构建完成（约 1-3 分钟）
3. 构建成功后会显示预览 URL（如 `my-blog-xxx.pages.dev`）

#### 4. 配置自定义域名

1. 在项目页面，点击 **Custom domains** 标签
2. 点击 **Set up a custom domain** 按钮
3. 输入域名：`yu-wang.me`
4. 如果域名已在 Cloudflare，会自动配置 DNS
5. 如果域名不在 Cloudflare，需要：
   - 将域名 DNS 迁移到 Cloudflare，或
   - 在当前 DNS 提供商添加 CNAME 记录指向 `my-blog-xxx.pages.dev`

#### 5. 验证部署

1. 访问预览 URL 确认网站正常
2. 等待 DNS 生效（通常几分钟，最多 24-48 小时）
3. 访问 `https://yu-wang.me` 确认自定义域名可用

#### 6. 停用 Netlify（可选）

确认 Cloudflare Pages 运行正常后：
1. 登录 [Netlify](https://app.netlify.com/)
2. 进入你的站点设置
3. 停止自动部署或删除站点

## 🎨 构建信息

本地测试构建结果：
- ✅ 构建成功
- 📄 页面数：108 页
- 📦 文件数：130 个
- 💾 总大小：19MB
- ⚡ 构建时间：2.3 秒

## 🔗 重要链接

- **Cloudflare Dashboard**: https://dash.cloudflare.com/
- **GitHub 仓库**: https://github.com/WANG-Yuuu/my-blog
- **目标域名**: https://yu-wang.me
- **详细迁移指南**: [CLOUDFLARE_MIGRATION.md](./CLOUDFLARE_MIGRATION.md)

## 💡 提示

1. **首次部署**：Cloudflare Pages 会自动检测 Hugo 项目并建议配置
2. **自动部署**：每次推送到 `main` 分支都会自动触发部署
3. **预览部署**：Pull Request 会自动创建预览部署
4. **回滚**：可以在 Cloudflare Dashboard 中一键回滚到任何历史版本
5. **环境变量**：如需修改，在 Settings > Environment variables 中配置

## 🆘 遇到问题？

### 构建失败
- 检查环境变量是否正确配置
- 查看构建日志中的错误信息
- 确认构建命令和输出目录正确

### 域名无法访问
- 检查 DNS 记录是否正确
- 等待 DNS 传播完成
- 确认 SSL 证书已激活

### 样式丢失
- 确认 `baseURL` 设置为 `https://yu-wang.me/`
- 检查浏览器控制台是否有 404 错误
- 清除浏览器缓存重试

## 📞 获取帮助

- [Cloudflare Community](https://community.cloudflare.com/)
- [Hugo 官方文档](https://gohugo.io/documentation/)
- [Hextra 主题文档](https://imfing.github.io/hextra/)

---

**下一步**：按照上面的步骤在 Cloudflare Dashboard 中创建 Pages 项目！🚀
