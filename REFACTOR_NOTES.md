# 配置文件重构说明

## 重构时间
2025-12-01

## 重构内容

### 1. 配置文件格式迁移
- **从**: `hugo.toml` (TOML 格式)
- **到**: `hugo.yaml` (YAML 格式)
- **原因**: 采用 Hextra 官方推荐的配置架构

### 2. 架构改进

#### 采用官方完整架构
参考 Hextra 官方示例 (`docs/hugo.yaml`)，重构了配置文件结构：

```yaml
# 基础配置
baseURL: "https://yu-wang.me/"
title: "WangYu's HOME"
enableRobotsTXT: true
enableGitInfo: true
hasCJKLanguage: true

# 输出格式定义
outputFormats:
  llms:
    name: llms
    baseName: llms
    mediaType: text/plain
    isPlainText: true

outputs:
  home: [html, llms]
  page: [html]
  section: [html, rss]

# 语言配置
defaultContentLanguage: zh-cn
languages:
  zh-cn:
    languageName: 简体中文
    languageCode: zh-CN
    weight: 1
    title: WangYu's HOME

# 模块配置
module:
  hugoVersion:
    extended: true
    min: "0.146.0"
  imports:
    - path: github.com/imfing/hextra

# Markdown 渲染配置
markup:
  highlight:
    noClasses: false
  goldmark:
    renderer:
      unsafe: true
    extensions:
      passthrough:
        delimiters:
          block: [['\[', '\]'], ['$$', '$$']]
          inline: [['\(', '\)']]
        enable: true

enableInlineShortcodes: true
```

#### 菜单系统
```yaml
menu:
  main:
    - identifier: pm-guide
      name: PM修炼手册
      pageRef: /pm-guide
      weight: 1
    - identifier: blog
      name: 日记
      pageRef: /blog
      weight: 2
    - identifier: about
      name: 关于
      pageRef: /about
      weight: 3
    - name: Search
      weight: 4
      params:
        type: search
    - name: GitHub
      weight: 5
      url: "https://github.com/yourusername/my-blog"
      params:
        icon: github

  sidebar:
    - identifier: more
      name: 更多
      params:
        type: separator
      weight: 1
    - identifier: about
      name: "关于"
      pageRef: "/about"
      weight: 2
```

#### 主题参数
```yaml
params:
  description: For Madmen Only.
  
  navbar:
    displayTitle: true
    displayLogo: false
    width: wide

  theme:
    default: system
    displayToggle: true

  footer:
    enable: true
    displayCopyright: true
    displayPoweredBy: true
    width: normal

  search:
    enable: true
    type: flexsearch
    flexsearch:
      index: content
      tokenize: forward

  blog:
    list:
      displayTags: true
      sortBy: date
      sortOrder: desc
      pagerSize: 20
    article:
      displayPagination: true

  highlight:
    copy:
      enable: true
      display: hover
```

### 3. 保留的个人信息
- 网站标题: "WangYu's HOME"
- 网站描述: "For Madmen Only."
- 菜单项: PM修炼手册、日记、关于
- 语言设置: 简体中文

### 4. 新增功能
- ✅ 支持 LLMS 输出格式
- ✅ 完整的多语言支持框架
- ✅ 数学公式渲染支持 (LaTeX)
- ✅ 代码高亮复制功能
- ✅ 主题切换器 (浅色/深色/系统)
- ✅ 搜索功能 (FlexSearch)
- ✅ 博客分页和标签显示
- ✅ Git 信息集成

### 5. 文件备份
原始配置文件已备份到 `/backup` 目录：
- `backup/hugo.toml` - 原始配置文件
- `backup/content/` - 原始内容文件

### 6. 构建验证
```bash
hugo --gc --minify
# ✅ 成功构建 9 页面
# ✅ 构建时间: 2759 ms
```

### 7. 部署状态
- ✅ 已提交到 Git
- ✅ 已推送到 GitHub
- 🚀 Netlify 自动构建中

## 后续优化建议

1. **更新 GitHub 链接**
   ```yaml
   - name: GitHub
     url: "https://github.com/WANG-Yuuu/my-blog"
   ```

2. **添加 Google Analytics**（可选）
   ```yaml
   services:
     googleAnalytics:
       ID: G-MEASUREMENT_ID
   ```

3. **启用评论系统**（可选）
   ```yaml
   params:
     comments:
       enable: true
       type: giscus
   ```

4. **自定义日期格式**
   当前: `2006年1月2日`
   可根据需要调整

## 参考资源
- [Hextra 官方文档](https://imfing.github.io/hextra/)
- [Hugo 配置文档](https://gohugo.io/getting-started/configuration/)
- [官方示例配置](https://github.com/imfing/hextra/blob/main/docs/hugo.yaml)
