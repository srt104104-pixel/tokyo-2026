[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$content = [System.IO.File]::ReadAllText('C:\Users\Vivian\Desktop\Claude\Tokyo\tokyo_itinerary.html', [System.Text.Encoding]::UTF8)
$pattern = 'href="(https://maps\.app\.goo\.gl/[^"]+)"'
$ms = [regex]::Matches($content, $pattern)
foreach ($m in $ms) {
    Write-Output $m.Groups[1].Value
}
