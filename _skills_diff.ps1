$ErrorActionPreference = 'SilentlyContinue'
$root = 'E:\ARTEX'
$out = @()
$out += '=== skills/ ==='
Get-ChildItem -Path (Join-Path $root 'skills') -Directory | ForEach-Object { $out += $_.Name }
$out += ''
$out += '=== skills_backup_original/ ==='
Get-ChildItem -Path (Join-Path $root 'skills_backup_original') -Directory | ForEach-Object { $out += $_.Name }
$out += ''
$out += '=== dir comparison (present only in skills, absent in backup) ==='
$a = Get-ChildItem -Path (Join-Path $root 'skills') -Directory | Select-Object -ExpandProperty Name
$b = Get-ChildItem -Path (Join-Path $root 'skills_backup_original') -Directory | Select-Object -ExpandProperty Name
$out += ($a | Where-Object { $b -notcontains $_ }) -join ', '
$out += ''
$out += '=== file hash diff for overlapping dirs ==='
foreach ($d in ($a | Where-Object { $b -contains $_ })) {
  $p1 = Join-Path $root "skills\$d"
  $p2 = Join-Path $root "skills_backup_original\$d"
  $f1 = Get-ChildItem -Path $p1 -Recurse -File
  $f2 = Get-ChildItem -Path $p2 -Recurse -File
  $h1 = @{}; foreach ($f in $f1) { $rel = $f.FullName.Substring($p1.Length); $h1[$rel] = (Get-FileHash -Path $f.FullName -Algorithm MD5).Hash }
  $h2 = @{}; foreach ($f in $f2) { $rel = $f.FullName.Substring($p2.Length); $h2[$rel] = (Get-FileHash -Path $f.FullName -Algorithm MD5).Hash }
  foreach ($k in ($h1.Keys + $h2.Keys | Select-Object -Unique)) {
    $v1 = $h1[$k]; $v2 = $h2[$k]
    if (-not $v1) { $out += "  [$d] ONLY-IN-BACKUP: $k" }
    elseif (-not $v2) { $out += "  [$d] ONLY-IN-SKILLS: $k" }
    elseif ($v1 -ne $v2) { $out += "  [$d] CHANGED: $k" }
  }
}
$out += ''
$out += '=== git diff stat for tracked files ==='
Push-Location $root
$out += (& git diff --stat 2>&1 | Out-String)
$out += (& git status --short 2>&1 | Out-String)
Pop-Location
Set-Content -Path (Join-Path $root '_skills_diff_out.txt') -Value ($out -join "`r`n") -Encoding utf8
