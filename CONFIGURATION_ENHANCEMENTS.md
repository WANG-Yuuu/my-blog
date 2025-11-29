---
title: "配置增强说明"
date: 2025-11-29
---

# 🎨 博客配置增强说明

## 新增功能清单

### 1. 🎭 主题切换器
- **功能**: 支持浅色/深色/跟随系统三种模式
- **配置**: `params.theme.default = "system"`
- **使用**: 页面右上角会显示主题切换按钮

### 2. 🎨 代码高亮主题
- **当前主题**: Monokai
- **可选主题**: 
  - `monokai` - 深色，对比度高
  - `dracula` - 深色，护眼
  - `github` - 浅色，GitHub 风格
  - `solarized-dark` - 深色，柔和
  - `solarized-light` - 浅色，柔和

### 3. 📝 编辑链接
- **功能**: 每个页面底部显示"在 GitHub 上编辑"链接
- **配置**: 需要更新 `params.editURL.base` 为你的 GitHub 仓库地址
- **示例**: `https://github.com/yourusername/my-blog/edit/main`

### 4. 📑 目录（TOC）
- **功能**: 文章右侧显示目录导航
- **配置**: 
  - `minLevel = 2` - 从 H2 开始
  - `maxLevel = 4` - 到 H4 结束

### 5. 🍞 面包屑导航
- **功能**: 页面顶部显示当前位置路径
- **效果**: 首页 > 博客 > 文章标题

### 6. 📊 阅读统计
- **字数统计**: 显示文章字数
- **阅读时间**: 自动计算预计阅读时间

### 7. 🔗 社交链接
- **位置**: 页脚或侧边栏
- **支持**: GitHub、Twitter、Email 等
- **自定义**: 在 `params.social` 中添加

### 8. 📄 分页功能
- **每页文章数**: 10 篇（可调整）
- **自动分页**: 文章列表超过限制自动分页

### 9. 🏠 美化首页
- **Hero 组件**: 大标题展示
- **Cards 布局**: 卡片式导航
- **响应式**: 自适应各种屏幕

### 10. 🔍 增强搜索
- **占位符**: 自定义搜索提示文本
- **FlexSearch**: 快速全文搜索

## 需要自定义的配置

### 1. GitHub 编辑链接
```toml
[params.editURL]
  enable = true
  base = "https://github.com/你的用户名/my-blog/edit/main"
```

### 2. 社交链接
```toml
[[params.social]]
  name = "GitHub"
  url = "https://github.com/你的用户名"
  icon = "github"
```

### 3. Google Analytics（可选）
```toml
[services.googleAnalytics]
  ID = "G-XXXXXXXXXX"  # 你的 GA ID
```

## 使用建议

### 代码高亮主题切换
如果想更换代码高亮主题，修改 `hugo.toml`:
```toml
[markup.highlight]
  style = "dracula"  # 或其他主题名
```

### 自定义 CSS
创建 `assets/css/custom.css` 添加自定义样式：
```css
/* 自定义主色调 */
:root {
  --primary-hue: 210;
  --primary-saturation: 100%;
}
```

### 添加更多 Shortcodes
Hextra 支持的组件：
- `{{< callout >}}` - 提示框
- `{{< cards >}}` - 卡片布局
- `{{< steps >}}` - 步骤指南
- `{{< tabs >}}` - 标签页
- `{{< details >}}` - 折叠面板

## 测试清单

- [ ] 本地运行 `hugo server -D` 查看效果
- [ ] 测试主题切换功能
- [ ] 检查代码高亮是否正常
- [ ] 验证搜索功能
- [ ] 查看移动端响应式效果
- [ ] 更新 GitHub 仓库地址
- [ ] 添加个人社交链接

## 部署

配置完成后，使用自动部署脚本：
```bash
./deploy.sh "feat: 增强博客配置和样式"
```

## 参考资源

- [Hextra 官方文档](https://imfing.github.io/hextra/)
- [Hugo Chroma 主题预览](https://xyproto.github.io/splash/docs/)
- [Tailwind CSS 文档](https://tailwindcss.com/docs)
