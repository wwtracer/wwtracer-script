Add-Type -AssemblyName System.Web

$logLocation = "E:\Wuthering Waves\Wuthering Waves Game\Client\Binaries\Win64\ThirdParty\KrPcSdk_Global\KRSDKRes\KRSDKWebView\debug.log";
if (-Not [System.IO.File]::Exists($path)) {
    Write-Host "Finding installation path .... "
    $gameLocation = Get-ChildItem -Path E:\ -Filter "Wuthering Waves.exe" -Recurse -ErrorAction SilentlyContinue | ForEach-Object { Split-Path -Path $_.FullName }
    $logLocation = $gameLocation + "\Client\Binaries\Win64\ThirdParty\KrPcSdk_Global\KRSDKRes\KRSDKWebView\debug.log";
}

$path = [System.Environment]::ExpandEnvironmentVariables($logLocation);
Write-Host $path

if (-Not [System.IO.File]::Exists($path)) {
    Write-Host "Cannot find the log file! Check convene history in game!" -ForegroundColor Red
    return
}

$logs = Get-Content -Path $path

$result = select-string -path $logLocation -pattern 'aki-gm' | select-string -pattern 'gacha' | select-string -pattern 'player_id' | Where-Object { $_.Line -notmatch '.json' } | Select-Object -ExpandProperty Line  | Select-Object -Last 1

if ($result -match '(https://[^\s",]+)') {
    $url = $matches[1]
} else {
    Write-Host "No URL Found" -ForegroundColor Red
    return
}
Write-Output $url
Set-Clipboard -Value $url

Write-Host "Link copied to clipboard, paste it back to wwtracer" -ForegroundColor Green