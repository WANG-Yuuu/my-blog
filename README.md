# Hermann's Echo - 个人博客

基于 [Hextra](https://github.com/imfing/hextra) 主题构建的 Hugo 博客网站。

## 快速开始

### 本地开发

```bash
# 启动开发服务器
hugo server -D

# 或者使用 npm（如果配置了）
npm run dev
```

访问 http://localhost:1313 查看网站。

### 构建网站

```bash
# 构建生产版本
hugo

# 输出在 public/ 目录
```

## 项目结构

```
my-blog/
├── content/           # 内容目录
│   ├── _index.md     # 首页
│   ├── blog/         # 博客文章
│   ├── about/        # 关于页面
│   └── docs/         # 文档
├── static/           # 静态资源
├── themes/hextra/    # Hextra 主题
└── hugo.toml         # 配置文件
```

## 创建新文章

```bash
# 创建博客文章
hugo new blog/my-new-post.md

# 创建文档
hugo new docs/my-doc.md
```

## 配置说明

主要配置在 `hugo.toml` 文件中：

- **baseURL**: 网站的基础 URL
- **title**: 网站标题
- **menu**: 导航菜单配置
- **params**: 主题参数配置

## Hextra 主题特性

- 🎨 现代化设计
- 📱 响应式布局
- 🔍 全文搜索功能
- 🌙 深色模式支持
- 📝 Markdown 增强
- 🚀 快速加载

## 部署

### Netlify

项目已包含 `netlify.toml` 配置文件，可直接部署到 Netlify。

### GitHub Pages

可以使用 GitHub Actions 自动部署到 GitHub Pages。

### Vercel

也支持一键部署到 Vercel。

## 自定义

### 修改样式

在 `assets/css/` 目录下创建自定义 CSS 文件。

### 添加组件

Hextra 提供了丰富的 shortcodes，参考：
https://imfing.github.io/hextra/docs/guide/shortcodes/

## 更多资源

- [Hextra 文档](https://imfing.github.io/hextra/)
- [Hugo 文档](https://gohugo.io/documentation/)

## License

MIT
