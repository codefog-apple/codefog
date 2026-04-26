#!/bin/bash
set -euo pipefail

VERSION="${1:-}"
NOTES="${2:-}"
REPO="codefog-apple/codefog"

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

usage() {
    echo "用法: ./scripts/release.sh <版本号> [更新说明]"
    echo ""
    echo "示例:"
    echo "  ./scripts/release.sh 1.0.0"
    echo "  ./scripts/release.sh 1.0.0 '修复了若干问题'"
    echo ""
    echo "前置条件:"
    echo "  1. 安装 gh CLI: brew install gh"
    echo "  2. 登录: gh auth login"
    echo "  3. 将 DMG 文件放在 dist/ 目录下"
    exit 1
}

if [ -z "$VERSION" ]; then
    echo -e "${RED}错误: 请提供版本号${NC}"
    usage
fi

if [[ ! "$VERSION" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
    echo -e "${RED}错误: 版本号格式不正确，应为 x.y.z${NC}"
    exit 1
fi

if ! command -v gh &> /dev/null; then
    echo -e "${RED}错误: 未安装 gh CLI${NC}"
    echo "安装: brew install gh"
    exit 1
fi

echo -e "${YELLOW}=== CodeFog Release v${VERSION} ===${NC}"
echo ""

if gh release view "v${VERSION}" --repo "$REPO" &> /dev/null; then
    echo -e "${RED}错误: v${VERSION} 已存在${NC}"
    exit 1
fi

ASSETS=()
if [ -d "dist" ]; then
    for f in dist/*.dmg dist/*.zip dist/*.pkg; do
        [ -f "$f" ] && ASSETS+=("$f")
    done
fi

if [ ${#ASSETS[@]} -eq 0 ]; then
    echo -e "${YELLOW}提示: dist/ 下没有找到安装包文件（.dmg/.zip/.pkg）${NC}"
    echo -e "${YELLOW}将创建不含附件的 Release，后续可手动上传${NC}"
    echo ""
fi

DEFAULT_NOTES="## CodeFog v${VERSION}

### 下载

| 平台 | 架构 | 下载 |
|------|------|------|
| macOS | Apple Silicon (M1/M2/M3/M4) | CodeFog-${VERSION}-arm64.dmg |
| macOS | Intel | CodeFog-${VERSION}-x64.dmg |

### 安装说明

1. 下载对应架构的 .dmg 文件
2. 打开 DMG，将 CodeFog 拖入 Applications
3. 首次运行可能需要在「系统设置 → 隐私与安全性」中允许

---
**官网**: [codefog.cc](https://codefog.cc)"

RELEASE_NOTES="${NOTES:-$DEFAULT_NOTES}"

echo -e "${GREEN}创建 Release v${VERSION}...${NC}"

RELEASE_CMD=(gh release create "v${VERSION}"
    --repo "$REPO"
    --title "CodeFog v${VERSION}"
    --notes "$RELEASE_NOTES")

if [ ${#ASSETS[@]} -gt 0 ]; then
    for asset in "${ASSETS[@]}"; do
        RELEASE_CMD+=("$asset")
        echo -e "  附件: ${asset}"
    done
fi

"${RELEASE_CMD[@]}"

echo ""
echo -e "${GREEN}Release v${VERSION} 创建成功!${NC}"
echo -e "查看: https://github.com/${REPO}/releases/tag/v${VERSION}"
