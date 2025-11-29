# 📚 Hermann's Echo 博客使用指南

> 这是一份完整的博客使用说明文档，帮助你快速上手博客的日常更新和维护。

## 📖 目录

- [快速开始](#快速开始)
- [日常写作](#日常写作)
- [自动部署](#自动部署)
- [项目结构](#项目结构)
- [配置说明](#配置说明)
- [常见问题](#常见问题)

---

## 🚀 快速开始

### 本地预览

```bash
# 进入项目目录
cd /Users/superbox/my-blog

# 启动开发服务器（包含草稿）
hugo server -D

# 或者不显示草稿
hugo server
```

访问 http://localhost:1313 即可实时预览你的博客。

### 构建网站

```bash
# 清理缓存并构建
hugo --gc --minify
```

构建后的静态文件会生成在 `public/` 目录。

---

## ✍️ 日常写作

### 创建新文章

#### 方法一：使用 Hugo 命令（推荐）

```bash
# 创建博客文章
hugo new blog/我的新文章.md

# 创建文档
hugo new docs/技术文档.md
```

#### 方法二：手动创建

在 `content/blog/` 目录下创建新的 `.md` 文件：

```markdown
---
title: "文章标题"
date: 2025-11-29T17:00:00+08:00
draft: false
tags: ["标签1", "标签2"]
categories: ["分类"]
description: "文章简介"
---

这里是文章正文内容...
```

### Front Matter 说明

每篇文章开头的 YAML 配置（Front Matter）：

```yaml
---
title: "文章标题"           # 必填：文章标题
date: 2025-11-29           # 必填：发布日期
draft: false               # 是否为草稿（true=草稿，false=发布）
tags: ["Hugo", "博客"]     # 标签
categories: ["技术"]       # 分类
description: "文章摘要"    # 文章描述（用于 SEO）
weight: 1                  # 排序权重（数字越小越靠前）
---
```

### Markdown 写作技巧

#### 基础语法

```markdown
# 一级标题
## 二级标题
### 三级标题

**粗体** *斜体* ~~删除线~~

- 无序列表
- 项目二

1. 有序列表
2. 项目二

[链接文字](https://example.com)

![图片描述](/images/photo.jpg)
```

#### 代码块
