# Chaoxing Work Export 一键安装脚本（第三方指南）——按官方文档封装
# 官方文档：https://github.com/chenhuilin2/chaoxing-work-export#readme
# 更新日期：2026-11-04
# 类型：script
$ErrorActionPreference = 'Stop'
Set-Location -Path $PSScriptRoot

if (-not (Get-Command git -ErrorAction SilentlyContinue)) { throw '需要先安装 Git' }
if (-not (Get-Command node -ErrorAction SilentlyContinue)) { throw '需要先安装 Node.js' }

New-Item -ItemType Directory -Force -Path .download | Out-Null
Set-Location -Path .download

git clone https://github.com/chenhuilin2/chaoxing-work-export.git
Set-Location chaoxing-work-export
npm install
npm run build
Get-ChildItem dist

Write-Host ''

Write-Host '部署完成'
Write-Host '若结果异常或需要改配置，请参考官方文档：https://github.com/chenhuilin2/chaoxing-work-export#readme'
