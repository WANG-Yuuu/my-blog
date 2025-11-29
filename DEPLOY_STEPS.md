# 部署到 Netlify 步骤

## ✅ 问题已修复

所有 Netlify 部署问题已经修复，现在可以正常部署了。

## 📋 需要提交的文件

确保以下文件已经提交到 Git：

```bash
# 查看修改的文件
git status

# 应该包含以下文件：
# modified:   hugo.toml
# modified:   netlify.toml
# new file:   go.mod
# new file:   go.sum
# new file:   content/blog/_index.md
# new file:   DEPLOY_FIX.md
```

## 🚀 部署步骤

### 1. 提交所有更改

```bash
# 添加所有文件
git add .

# 提交更改
git commit -m "fix: 修复 Netlify 部署问题

- 修复博客配置（list 参数改为对象）
- 改用 Hugo Modules 安装 Hextra 主题
- 添加 go.mod 和 go.sum
- 创建缺失的 blog/_index.md
- 更新 netlify.toml 添加 Go 环境"

# 推送到 GitHub
git push origin main
```

### 2. Netlify 自动部署

推送后，Netlify 会自动：
1. 检测到新的提交
2. 安装 Go 环境
3. 下载 Hugo Modules（Hextra 主题）
4. 运行 `hugo --gc --minify` 构建网站
5. 部署到生产环境

### 3. 查看部署状态

访问 Netlify 控制台查看部署进度：
- 登录 https://app.netlify.com/
- 选择你的站点
- 查看 "Deploys" 标签

## ✨ 预期结果

部署成功后，你应该看到：
```
✓ Build succeeded
✓ Site is live
```

访问你的网站：https://yu-wang.me/

## 🔍 验证部署

部署成功后，检查以下页面：
- ✅ 首页：https://yu-wang.me/
- ✅ 博客列表：https://yu-wang.me/blog/
- ✅ 第一篇文章：https://yu-wang.me/blog/first-post/
- ✅ 关于页面：https://yu-wang.me/about/
- ✅ 文档页面：https://yu-wang.me/docs/

## 🐛 如果还有问题

### 查看构建日志

在 Netlify 控制台的 "Deploys" 页面，点击最新的部署，查看详细日志。

### 常见问题

1. **Hugo 版本问题**
   - 确保 `netlify.toml` 中的 `HUGO_VERSION` 是 0.139.0 或更高

2. **Go 版本问题**
   - 确保 `netlify.toml` 中有 `GO_VERSION = "1.23.4"`

3. **模块下载失败**
   - 检查 `go.mod` 和 `go.sum` 是否已提交
   - 确保 `hugo.toml` 中有正确的 module 配置

### 本地测试

在推送前，先本地测试：
```bash
# 清理缓存
hugo mod clean

# 重新下载模块
hugo mod get -u

# 构建测试
hugo --gc --minify

# 应该看到：Total in XXX ms（没有错误）
```

## 📝 修复总结

### 修复的问题

1. ❌ **原问题**：`can't evaluate field sortBy in type bool`
   - ✅ **已修复**：将 `list = true` 改为 `list = { sortBy = "date", cardView = true }`

2. ❌ **原问题**：主题文件不存在
   - ✅ **已修复**：使用 Hugo Modules 自动下载主题

3. ❌ **原问题**：缺少博客索引文件
   - ✅ **已修复**：创建 `content/blog/_index.md`

4. ❌ **原问题**：Netlify 缺少 Go 环境
   - ✅ **已修复**：在 `netlify.toml` 中添加 `GO_VERSION`

### 技术改进

- 使用 Hugo Modules 代替传统主题安装方式
- 更现代化的依赖管理
- 更容易更新主题版本

## 🎉 完成

现在你的博客应该可以成功部署到 Netlify 了！

如有任何问题，请查看 `DEPLOY_FIX.md` 了解详细的修复说明。
