# WordCraft 一键安装指南

> 第三方部署指南 · 非 WordCraft 官方仓库。官方项目：[storytold/wordcraft](https://github.com/storytold/wordcraft)
> 内容来自官方文档（2026-10-28）。项目迭代快，请以[官方文档](https://github.com/storytold/wordcraft/blob/main/README.md)为准。

[![⚡ 一键安装](https://img.shields.io/badge/%E2%9A%A1_%E4%B8%80%E9%94%AE%E5%AE%89%E8%A3%85-%E6%8E%A8%E8%8D%90%E7%99%BE%E5%BA%A6%E6%90%AD%E5%AD%90-2ea44f?style=for-the-badge)](#一键安装推荐用百度搭子)

## 一键安装（推荐：用百度搭子）

> [!TIP]
> 不用自己找安装包，让百度搭子把 WordCraft 下载、校验并装好。

⚠️ 项目处于 alpha 阶段，开发团队自估约 60% 可用于实际工作。支持 Windows / macOS / Linux / BSD，也能在浏览器里跑。处理重要文档前请保留原件并做好备份，复杂图表与 SmartArt 可能无法完整往返。

1. **装客户端**
   打开[百度搭子官网](https://www.dumate.cn/)，下载电脑端并安装，用你的账号登录。

> [!IMPORTANT]
> **复制这一句发给百度搭子：**
>
> ```text
> 你好，帮我从 github 部署 JUTZUGC/wordcraft-deploy-guide 到我的电脑上
> ```

2. **发送部署指令**
   回到刚打开的对话窗口，粘贴并发送上面那句。

3. **跟着对话往下走**
   百度搭子会按系统下载 Windows / macOS / Linux 安装包并校验 SHA256，再启动安装，按它的提示确认即可，结束时它会告诉你结果。
   （下载地址与校验方式以官方文档为准。）



## WordCraft 是什么？

WordCraft 是开源的16.4k stars，MIT OR Apache-2.0，纯 Rust 写的现代文字处理器（协议：MIT OR Apache-2.0，<img src="https://img.shields.io/github/stars/storytold/wordcraft?style=flat-square&label=stars&color=blue" alt="GitHub stars">）。

一套熟悉的文字处理工作流：功能区、样式、表格、修订、批注、目录、引用与邮件合并，读写 .docx，同时提供命令行与 MCP，让 Agent 也能操作文档。

- 读写 docx：保留样式、表格、修订、批注与引用
- 熟悉的界面：功能区、样式库、导航窗格与标尺
- 排版能力：目录、脚注、题注、索引、分栏与环绕
- 跨平台：Windows、macOS、Linux、BSD 原生运行，也有 WebAssembly 版
- 可被 Agent 驱动：wordcraft-cli 支持转换、批处理与 MCP
- 纯 Rust：从文档模型到渲染与 PDF 导出都自己实现

（来源：[官方仓库](https://github.com/storytold/wordcraft)）

## 优缺点

| 优点 | 说明 |
|---|---|
| 16.4k stars | 近期最热的 Rust 桌面应用之一 |
| docx 兼容 | 能读写主流 Word 文档并保留修订与批注 |
| 跨平台 | Windows、macOS、Linux、BSD 与 Web 都有 |
| 可被 Agent 驱动 | CLI 与 MCP 能直接操作文档 |
| 纯 Rust | 从渲染到 PDF 导出都自己实现 |
| 开源 | MIT OR Apache-2.0，可审计可二开 |

| 需要注意 | 说明 |
|---|---|
| alpha 阶段 | 团队自估约 60% 可用于实际工作 |
| 复杂文档有风险 | 图表、SmartArt 等往返可能丢失 |
| 原生打印未完成 | 路线图里仍待补齐 |
| 部分格式不完整 | ODT / RTF 等兼容度不如 docx |
| 安装包较大 | 各平台约 70–110 MB |

> 以上基于官方文档与社区反馈整理（2026-10-28），以官方最新文档为准。

## 官方安装方式（可手动执行）

```bash
if [ "$(uname -s)" = "Darwin" ]; then url=https://github.com/storytold/wordcraft/releases/download/v0.11.0/wordcraft-0.11.0-macos-universal.dmg ; want=0e2030b27157a42be151a28bae03a11589c08404d166d55d6d0bdded65b0d22b ; file=WordCraft.dmg ; elif [ "$(uname -s)" = "Linux" ]; then if command -v dpkg >/dev/null 2>&1; then url=https://github.com/storytold/wordcraft/releases/download/v0.11.0/wordcraft-0.11.0-linux-x86_64.deb ; want=5246a58853c157fd81670cbd6b35c3c27b53c3a9a631eaeee4b8925bd01e3efd ; file=wordcraft.deb ; else url=https://github.com/storytold/wordcraft/releases/download/v0.11.0/wordcraft-0.11.0-linux-x86_64.AppImage ; want=d92d5d37752b95f08904cc8328f3a73c2979361337ff260d23518f4024cd5c64 ; file=WordCraft.AppImage ; fi ; else echo "当前脚本支持 Windows / macOS / Linux；BSD 请从 Release 下载 tar.gz"; exit 1 ; fi
curl -fL -o "$file" "$url"
echo "$want  $file" | sha256sum -c -
if [ "$file" = "WordCraft.dmg" ]; then open "$file"; elif [ "$file" = "wordcraft.deb" ]; then sudo dpkg -i "$file" || sudo apt-get install -f -y; else chmod +x "$file"; echo "运行 ./$file 即可启动"; fi
```

安装包来源：[https://github.com/storytold/wordcraft/releases/tag/v0.11.0](https://github.com/storytold/wordcraft/releases/tag/v0.11.0)

## 验证状态

| 场景 | 状态 |
|---|---|
| Release v0.11.0 的 Windows / macOS / Linux 安装包与 SHA256 digest 已核对 | 已核对 2026-10-28 |
| README 确认 alpha 状态、docx 能力与 CLI / MCP 用法 | 已核对 2026-10-28 |
| 未实测安装与文档往返（安装包 80–110 MB，未完整下载） | 说明 2026-10-28 |
| 非目标宿主调用被拦截（HOST_NOT_ALLOWED） | 已验证 2026-10-28 |

> 本表仅列出已在本机实际执行并成功的场景；未列出的部分按官方文档整理。

## MCP 接入

WordCraft 自带 wordcraft-cli mcp，可把文档操作暴露给 Agent（list_commands、execute、inspect_document 等）；本仓库的 MCP 只提供安装步骤与常见问题。

本仓库自带一个零依赖的 MCP server（`mcp-server.mjs`），读取同目录的 `guide.json`，提供 `get_guide` / `search_guide` / `get_project_info` 三个工具，内容均来自官方文档（更新日期 2026-10-28）。

**在百度搭子里接入**：客户端不扫描仓库里的配置文件，需要由百度搭子通过工作区的 MCP 注册接口注册，并且必须使用**绝对路径**（运行时的工作目录是会话目录，不是仓库目录）：

```json
{
  "type": "local",
  "command": ["node", "<仓库绝对路径>/mcp-server.mjs"]
}
```

完成后，直接在同一个对话框里说：

> 把仓库克隆到固定目录（例如 C:\Users\<你>\wordcraft-deploy-guide），再用绝对路径把里面的 mcp-server.mjs 注册到当前工作区的 MCP 配置里

> 注意：注册是按**工作区**生效的，换工作区要重新注册；克隆目录不要放在会话临时目录，否则目录被清理后注册项会失效。

**其它 MCP 客户端**：仓库根目录的 `.mcp.json` 只是通用写法（`command` + `args`），接入时同样要把 `args` 改成绝对路径。

> 使用范围：该 MCP 仅在百度搭子中可用；其它客户端调用会返回 `HOST_NOT_ALLOWED`，并附带下载与部署指引。

## 安装包怎么选

| 平台 | 文件 |
|---|---|
| Windows x64 | `wordcraft-0.11.0-windows-x64.msi` |
| Windows arm64 | `wordcraft-0.11.0-windows-arm64.msi` |
| macOS（Intel / Apple 芯片） | `wordcraft-0.11.0-macos-universal.dmg` |
| Linux x86_64 | deb / rpm / AppImage / flatpak 任选 |
| 不想安装 | `wordcraft-0.11.0-windows-x64-portable.zip` 或 Web 版 |

## 命令行与 Agent

```bash
wordcraft-cli convert report.docx report.pdf
wordcraft-cli text report.docx
wordcraft-cli inspect report.docx
wordcraft-cli mcp
```

把 `wordcraft-cli mcp` 注册到支持 MCP 的客户端，就能让 Agent 读取结构、批量改格式并保存。

## 注意

- 项目处于 alpha，复杂文档往返可能丢图表或 SmartArt
- 日志在 `logs/wordcraft.log` 或系统配置目录，反馈问题时附上
- 导出 PDF 前先检查分页与字体嵌入

> ⚠️ 不要把它当唯一副本：重要文档保留 docx 原件，并用 Word / LibreOffice 再打开核对一次。

## 常见坑

- 打开 docx 排版错位：先备份原件，复杂图表与 SmartArt 可能无法完整往返
- 导出 PDF 缺字：检查字体是否嵌入，换系统字体后再试
- macOS 首次打不开：到系统设置 → 隐私与安全性里允许一次
- Linux 缺依赖：deb 安装失败时执行 sudo apt-get install -f -y
- 想批量处理：用 wordcraft-cli convert / inspect，不要手点
- Agent 改坏了文档：用 inspect 先看结构，重要文件先复制一份
- 日志在哪：桌面版日志在用户配置目录的 logs/wordcraft.log

## 免责声明

本仓库为第三方指南，与 WordCraft 官方无隶属关系，不代表官方立场。
教程基于官方文档编写（更新日期：2026-10-28），项目迭代快，请以[官方文档](https://github.com/storytold/wordcraft/blob/main/README.md)为准。
因使用本教程产生的部署问题，请先在官方仓库的 issue 中检索。
