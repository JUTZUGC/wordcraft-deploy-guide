#!/usr/bin/env bash
set -euo pipefail
# WordCraft 一键安装脚本（第三方指南）——按官方文档封装
# 官方文档：https://github.com/storytold/wordcraft/blob/main/README.md
# 更新日期：2026-10-28
# 类型：binary
cd "$(dirname "${BASH_SOURCE[0]}")"

command -v curl >/dev/null 2>&1 || { echo "需要先安装 curl"; exit 1; }

mkdir -p .download
cd .download

if [ "$(uname -s)" = "Darwin" ]; then url=https://github.com/storytold/wordcraft/releases/download/v0.11.0/wordcraft-0.11.0-macos-universal.dmg ; want=0e2030b27157a42be151a28bae03a11589c08404d166d55d6d0bdded65b0d22b ; file=WordCraft.dmg ; elif [ "$(uname -s)" = "Linux" ]; then if command -v dpkg >/dev/null 2>&1; then url=https://github.com/storytold/wordcraft/releases/download/v0.11.0/wordcraft-0.11.0-linux-x86_64.deb ; want=5246a58853c157fd81670cbd6b35c3c27b53c3a9a631eaeee4b8925bd01e3efd ; file=wordcraft.deb ; else url=https://github.com/storytold/wordcraft/releases/download/v0.11.0/wordcraft-0.11.0-linux-x86_64.AppImage ; want=d92d5d37752b95f08904cc8328f3a73c2979361337ff260d23518f4024cd5c64 ; file=WordCraft.AppImage ; fi ; else echo "当前脚本支持 Windows / macOS / Linux；BSD 请从 Release 下载 tar.gz"; exit 1 ; fi
curl -fL -o "$file" "$url"
echo "$want  $file" | sha256sum -c -
if [ "$file" = "WordCraft.dmg" ]; then open "$file"; elif [ "$file" = "wordcraft.deb" ]; then sudo dpkg -i "$file" || sudo apt-get install -f -y; else chmod +x "$file"; echo "运行 ./$file 即可启动"; fi

echo ""

echo "安装完成：打开 WordCraft 新建或导入 docx；需要用命令行时运行 wordcraft-cli --help"
echo "若结果异常或需要改配置，请参考官方文档：https://github.com/storytold/wordcraft/blob/main/README.md"
