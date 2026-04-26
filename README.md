# CodeFog

> iOS / Flutter 专业代码混淆工具
> Professional iOS & Flutter Code Obfuscation Tool

[![Website](https://img.shields.io/badge/Website-codefog.cc-blue)](https://codefog.cc)
[![Release](https://img.shields.io/github/v/release/codefog-apple/codefog?label=Latest)](https://github.com/codefog-apple/codefog/releases)
[![License](https://img.shields.io/badge/License-MIT-green)](LICENSE)
[![Platform](https://img.shields.io/badge/Platform-macOS-lightgrey)](https://codefog.cc)

---

## 产品介绍

CodeFog 是一款专为 **iOS (Objective-C / Swift)** 和 **Flutter (Dart)** 项目设计的专业代码混淆工具。通过可视化界面一键操作，帮助开发者有效保护源代码，防止反编译和代码窃取。

## 下载安装

前往 [Releases](https://github.com/codefog-apple/codefog/releases) 页面下载最新版本。

| 平台 | 架构 | 格式 |
|------|------|------|
| macOS | Apple Silicon (M1/M2/M3/M4) | `.dmg` |
| macOS | Intel | `.dmg` |

> 首次运行可能需要在「系统设置 → 隐私与安全性」中允许。

## 核心功能

### iOS 混淆能力（15 项）

| 功能 | 说明 |
|------|------|
| 类名混淆 | 自动重命名类名，支持自定义前缀/后缀规则 |
| 方法名混淆 | 混淆方法签名，保持 API 兼容性 |
| 属性混淆 | 保护属性名称不被逆向分析 |
| 字符串加密 | 对硬编码字符串进行编译期加密 |
| 资源名混淆 | 自动重命名图片/音频/视频等资源文件 |
| 资源 MD5 更新 | 修改资源文件哈希，绕过重复检测 |
| 垃圾代码注入 | 添加仿真死代码，干扰反编译器 |
| 注释清除 | 发布前自动剥离所有注释 |
| 目录结构混淆 | 随机化项目目录结构 |
| 敏感词过滤 | 检测并替换敏感关键词 |
| XIB/Storyboard 混淆 | 正确处理 Interface Builder 文件 |
| 国际化 Key 混淆 | 保护本地化键名 |
| UUID 翻新 | 为项目文件生成新的 UUID |
| 枚举关键词混淆 | 混淆 enum case 名称 |
| 控件颜色魔改 | 随机化 UI 控件颜色 |

### Flutter 混淆能力（7 项）

| 功能 | 说明 |
|------|------|
| 类名混淆 | Dart 文件类名自动重命名 |
| 变量常量混淆 | 混淆变量名和常量名 |
| 方法名混淆 | 混淆 Dart 方法签名 |
| 资源名混淆 | 资源文件自动重命名 |
| 资源 MD5 更新 | 修改资源哈希值 |
| 注释清除 | 自动移除代码注释 |
| 白名单管理 | 灵活配置不参与混淆的文件/类 |

## 产品亮点

- **可视化操作** — 图形化界面，无需命令行，小白也能上手
- **一键混淆** — 选择项目目录，勾选功能，点击开始
- **智能白名单** — 自动识别系统框架类，避免误混淆
- **增量混淆** — 支持多次混淆，每次只处理新增代码
- **映射记录** — 完整的混淆前后名称映射，方便排查问题
- **多项目支持** — 同时管理多个项目的混淆配置
- **macOS 原生** — 专为 macOS 设计，流畅运行

## 适用场景

- App Store 上架前的代码保护
- 防止竞争对手通过反编译窃取核心逻辑
- 规避 App Store 机审代码重复检测
- 保护商业算法和业务逻辑
- 多马甲项目的差异化处理

## 快速开始

1. 前往 [Releases](https://github.com/codefog-apple/codefog/releases) 下载最新版
2. 安装并打开 CodeFog
3. 选择你的 iOS / Flutter 项目目录
4. 勾选需要的混淆功能
5. 点击「开始混淆」

## 联系我们

- 官网：[codefog.cc](https://codefog.cc)
- 邮箱：codefog2026@outlook.com
- GitHub：[@codefog-apple](https://github.com/codefog-apple)

## License

MIT License - see [LICENSE](LICENSE) for details.
