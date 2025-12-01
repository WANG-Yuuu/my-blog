<div align="center">
  <h1 align="center">WangYu's HOME</h1>
  <p align="center">For Madmen Only.</p>

网站 → [yu-wang.me](https://yu-wang.me/)
</div>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://user-images.githubusercontent.com/5097752/263550533-c18343ca-3848-4230-b5c0-ee989d7916da.png">
  <img alt="Hextra" src="https://user-images.githubusercontent.com/5097752/263550528-663599f9-17a1-4686-b5c4-3da233b5034d.png">
</picture>



## 特性

- **美观的设计** - 受 Nextra 的启发，Hextra 利用 Tailwind CSS 提供现代化的设计，使您的网站看起来美观有加.
- **响应式布局和深色模式支持** - 在任何设备上看起来都足够美观, 无论是手机, 平板电脑或者电脑. 深色模式的支持使 Hextra 可以应对各种照明环境.
- **快速且轻量** - 由 Hugo 强力支持, Hugo 是一个快如闪电的静态站点生成器, 这一切都只需一个可执行文件, Hextra 始终保持最小化, 无需 Javascript 或者 Node.js.
- **全文搜索** - 集成了 Flexsearch 的全文搜索, 无需额外的配置.
- **功能齐全** - Markdown, 代码高亮, LaTex 数学公式, diagrams 图表和 Shortcodes 都可以用于丰富你的内容. 目录, 面包屑导航, 分页, 侧边栏等均由 Hextra 自动生成。
- **多语言和 SEO Ready** - Hugo 的多语言模式使得构建多语言网站更简单. 具有 SEO tags, Open Graph, 和 Twitter Cards 等诸多开箱即用的功能.

## 部署方式

本博客使用 **Cloudflare Pages** 进行部署，享受全球 CDN 加速和无限带宽。

### 本地开发

```bash
# 安装依赖
npm install

# 启动开发服务器
cd docs && hugo server -D

# 本地构建测试
./build-cloudflare.sh
```

### 自动部署

推送代码到 GitHub 后，Cloudflare Pages 会自动检测并部署：

1. 构建命令: `cd docs && hugo --gc --minify --themesDir ../..`
2. 输出目录: `docs/public`
3. 环境变量: Hugo 0.147.7, Go 1.24.3, Node 22.16.0

### 迁移指南

如需从 Netlify 迁移到 Cloudflare Pages，请查看 [CLOUDFLARE_MIGRATION.md](./CLOUDFLARE_MIGRATION.md)

## 技术栈

- **框架**: [Hugo](https://gohugo.io/) - 快速的静态网站生成器
- **主题**: [Hextra](https://github.com/imfing/hextra) - 现代化响应式主题
- **部署**: [Cloudflare Pages](https://pages.cloudflare.com/) - 全球 CDN 加速
- **样式**: [Tailwind CSS](https://tailwindcss.com/) - 实用优先的 CSS 框架

## 许可证

基于 Hextra 主题构建，遵循 [MIT License](./LICENSE)
