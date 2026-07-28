[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$content = [System.IO.File]::ReadAllText('C:\Users\Vivian\Desktop\Claude\Tokyo\tokyo_itinerary.html', [System.Text.Encoding]::UTF8)

# Extract from first day-card to end of container
$start = $content.IndexOf('<div class="day-card">')
$chunk = $content.Substring($start, [Math]::Min(200000, $content.Length - $start))

# Find all item blocks
$pattern = '(?s)<div class="item-title">(.*?)</div>\s*<div class="item-sub">(.*?)</div>\s*</div>\s*</div>'
$matches = [regex]::Matches($chunk, $pattern)
foreach ($m in $matches) {
    $title = $m.Groups[1].Value.Trim()
    $sub = $m.Groups[2].Value -replace '<[^>]+>', ' ' -replace '\s+', ' '
    Write-Output "TITLE: $title"
    Write-Output "SUB: $($sub.Trim())"
    Write-Output "---"
}
