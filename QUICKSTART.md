# 快速启动指南

## 🚀 立即开始

### 1. 启动开发服务器

```bash
hugo server -D
```

或使用 npm：

```bash
npm run dev
```

然后访问 http://localhost:1313

### 2. 创建新内容

#### 创建博客文章

```bash
hugo new blog/my-post.md
```

#### 创建文档

```bash
hugo new docs/my-doc.md
```

### 3. 编辑内容

所有内容文件都在 `content/` 目录下：

```
content/
├── _index.md          # 首页
├── blog/              # 博客文章
│   ├── _index.md
│   └── first-post.md
├── docs/              # 文档
│   ├── _index.md
│   └── hextra-guide.md
└── about/             # 关于页面
    └── index.md
```

### 4. Front Matter 说明

每个 Markdown 文件开头的 YAML 配置：

```yaml
---
title: "文章标题"
date: 2025-11-29
draft: false           # false 表示发布，true 表示草稿
tags: ["标签1", "标签2"]
weight: 1              # 排序权重，数字越小越靠前
---
```

### 5. 使用 Hextra 组件

#### Callout（提示框）

```markdown
{{< callout type="info" >}}
这是提示信息
{{< /callout >}}
```

类型：`info`, `warning`, `error`

#### Cards（卡片）

```markdown
{{< cards >}}
  {{< card link="/blog/" title="博客" icon="document-text" >}}
  {{< card link="/docs/" title="文档" icon="book-open" >}}
{{< /cards >}}
```

#### Steps（步骤）

```markdown
{{< steps >}}

### 步骤 1
内容...

### 步骤 2
内容...

{{< /steps >}}
```

#### Tabs（标签页）

```markdown
{{< tabs items="Tab1,Tab2,Tab3" >}}

{{< tab >}}内容 1{{< /tab >}}
{{< tab >}}内容 2{{< /tab >}}
{{< tab >}}内容 3{{< /tab >}}

{{< /tabs >}}
```

### 6. 配置网站

编辑 `hugo.toml` 文件：

```toml
baseURL = "https://your-domain.com/"
title = "你的网站标题"

[params]
  description = "网站描述"
  
[menu]
  [[menu.main]]
    name = "博客"
    url = "/blog/"
    weight = 1
```

### 7. 构建生产版本

```bash
hugo --minify
```

生成的文件在 `public/` 目录。

### 8. 部署

#### Netlify

1. 推送代码到 GitHub
2. 在 Netlify 导入仓库
3. 自动部署完成

#### GitHub Pages

使用 GitHub Actions 自动部署（需要配置 workflow）。

#### Vercel

1. 导入 GitHub 仓库
2. 选择 Hugo 框架
3. 一键部署

## 📚 更多资源

- [Hextra 文档](https://imfing.github.io/hextra/)
- [Hugo 文档](https://gohugo.io/documentation/)
- [Markdown 语法](https://www.markdownguide.org/)

## 💡 提示

- 使用 `-D` 参数可以预览草稿文章
- 修改配置文件后需要重启服务器
- 图片放在 `static/images/` 目录
- 使用 `hugo new` 命令会自动添加 front matter

## 🎨 自定义样式

在 `assets/css/custom.css` 中添加自定义样式：

```css
/* 自定义样式 */
.my-custom-class {
  color: #your-color;
}
```

祝你使用愉快！🎉
