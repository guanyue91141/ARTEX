$ErrorActionPreference = 'SilentlyContinue'
$root = 'E:\ARTEX'
$out = @()
$out += '=== docs listing ==='
Get-ChildItem -Path (Join-Path $root 'docs') -Force | ForEach-Object { $out += ($_.Name + '  [' + $_.Length + ' bytes]') }
$out += ''
$out += '=== docs content ==='
Get-ChildItem -Path (Join-Path $root 'docs') -File -Force | ForEach-Object {
  $out += '----- FILE: ' + $_.FullName + ' -----'
  $out += (Get-Content -Path $_.FullName -Raw -Encoding utf8)
}
Set-Content -Path (Join-Path $root '_docs_out.txt') -Value ($out -join "`r`n") -Encoding utf8
