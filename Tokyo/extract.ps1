[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$content = [System.IO.File]::ReadAllText('C:\Users\Vivian\Desktop\Claude\Tokyo\tokyo_itinerary.html', [System.Text.Encoding]::UTF8)
$lines = $content -split "`n"
$out = $lines | Where-Object {
  $_ -match 'item-title|item-sub|day-theme|<h2|transit-fh-label|transit-detail|section-divider|maps\.google|maps\.app' -and
  $_ -notmatch '^\s*\.' -and
  $_ -notmatch 'font-size|font-weight|margin|padding|border|color:|background|display:|flex|opacity'
}
$out | ForEach-Object { $_.Trim() } | Out-File -FilePath 'C:\Users\Vivian\Desktop\Claude\Tokyo\extracted.txt' -Encoding UTF8
Write-Host "Done"
