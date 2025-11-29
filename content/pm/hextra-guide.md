---
title: "Hextra 使用指南"
date: 2025-11-29
weight: 1
---

## Hextra 主题特性

Hextra 是一个现代化的 Hugo 主题，提供了丰富的功能。

### 基本功能

- ✅ 响应式设计
- ✅ 深色模式
- ✅ 全文搜索
- ✅ 多语言支持
- ✅ SEO 优化

### Callout 组件

{{< callout type="info" >}}
这是一个信息提示框。
{{< /callout >}}

{{< callout type="warning" >}}
这是一个警告提示框。
{{< /callout >}}

{{< callout type="error" >}}
这是一个错误提示框。
{{< /callout >}}

### Cards 组件

{{< cards >}}
  {{< card link="/blog/" title="博客" icon="document-text" >}}
  {{< card link="/docs/" title="文档" icon="book-open" >}}
  {{< card link="/about/" title="关于" icon="user" >}}
{{< /cards >}}

### Steps 组件

{{< steps >}}

### 步骤 1

安装 Hugo

### 步骤 2

克隆 Hextra 主题

### 步骤 3

开始创作

{{< /steps >}}

### 代码高亮

```go
package main

import "fmt"

func main() {
    fmt.Println("Hello, Hextra!")
}
```

```python
def hello():
    print("Hello, Hextra!")

if __name__ == "__main__":
    hello()
```

### 表格

| 功能 | 支持 | 说明 |
|------|------|------|
| 搜索 | ✅ | FlexSearch |
| 深色模式 | ✅ | 自动切换 |
| 多语言 | ✅ | i18n |

### 更多资源

访问 [Hextra 官方文档](https://imfing.github.io/hextra/) 了解更多功能。
