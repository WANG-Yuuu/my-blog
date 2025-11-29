# 部署问题修复说明

## 问题描述

Netlify 部署时出现错误：
```
can't evaluate field sortBy in type bool
```

## 问题原因

1. **博客配置错误**：`hugo.toml` 中 `[params.blog]` 的 `list` 参数设置为布尔值 `true`，但 Hextra 主题期望的是一个对象配置。

2. **主题安装方式**：原本使用传统的 `theme = "hextra"` 方式，但没有实际安装主题文件。

3. **缺少博客索引文件**：`content/blog/_index.md` 文件缺失。

## 修复方案

### 1. 修复博客配置

将 `hugo.toml` 中的：
```toml
[params.blog]
  list = true
  sortBy = "date"
```

改为：
```toml
[params.blog]
  list = { sortBy = "date", cardView = true }
```

### 2. 使用 Hugo Modules 安装主题

将：
```toml
theme = "hextra"
```

改为：
```toml
[module]
  [[module.imports]]
    path = "github.com/imfing/hextra"
```

### 3. 初始化 Hugo Modules

```bash
hugo mod init github.com/superbox/my-blog
hugo mod get -u
```

### 4. 创建博客索引文件

创建 `content/blog/_index.md`：
```markdown
---
title: "日记"
layout: blog
---

这里记录我的思考与感悟。
```

### 5. 更新 Netlify 配置

更新 `netlify.toml`，添加 Go 环境：
```toml
[build.environment]
  HUGO_VERSION = "0.139.0"
  GO_VERSION = "1.23.4"
  TZ = "Asia/Shanghai"
```

## 验证

本地测试构建：
```bash
hugo --gc --minify
```

应该看到类似输出：
```
Total in 928 ms
```

## 部署到 Netlify

1. 提交所有更改到 Git
2. 推送到 GitHub
3. Netlify 会自动重新部署

## 文件清单

修复涉及的文件：
- ✅ `hugo.toml` - 修复博客配置，改用 Hugo Modules
- ✅ `go.mod` - Hugo Modules 配置（自动生成）
- ✅ `go.sum` - 依赖锁定文件（自动生成）
- ✅ `content/blog/_index.md` - 博客索引页
- ✅ `netlify.toml` - 添加 Go 环境配置

## 注意事项

- Hugo Modules 需要 Go 环境支持
- Netlify 会自动安装 Go 和下载依赖
- 确保 `go.mod` 和 `go.sum` 文件已提交到 Git

## 相关资源

- [Hextra 安装文档](https://imfing.github.io/hextra/docs/getting-started/)
- [Hugo Modules 文档](https://gohugo.io/hugo-modules/)
- [Netlify Hugo 部署指南](https://docs.netlify.com/integrations/frameworks/hugo/)
