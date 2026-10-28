# WordCraft 一键安装脚本（第三方指南）——按官方文档封装
# 官方文档：https://github.com/storytold/wordcraft/blob/main/README.md
# 更新日期：2026-10-28
# 类型：binary
$ErrorActionPreference = 'Stop'
Set-Location -Path $PSScriptRoot

if (-not (Get-Command curl.exe -ErrorAction SilentlyContinue)) { throw '需要先安装 curl（Windows 10+ 自带 curl.exe）' }

New-Item -ItemType Directory -Force -Path .download | Out-Null
Set-Location -Path .download

curl.exe -L --fail -o WordCraft.msi "https://github.com/storytold/wordcraft/releases/download/v0.11.0/wordcraft-0.11.0-windows-x64.msi"
if ((Get-FileHash WordCraft.msi -Algorithm SHA256).Hash.ToLower() -ne 'fac76d185c3cd5990ceec2fd147748dcf4f2e289aa0085fecbcc7408cef65f87') { throw 'SHA256 校验失败，请重新下载' }
Start-Process msiexec.exe -ArgumentList '/i', '.\WordCraft.msi'

Write-Host ''

Write-Host '安装完成：打开 WordCraft 新建或导入 docx；需要用命令行时运行 wordcraft-cli --help'
Write-Host '若结果异常或需要改配置，请参考官方文档：https://github.com/storytold/wordcraft/blob/main/README.md'
