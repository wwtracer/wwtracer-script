# wwtracer-script

Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex "&{$((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/wwtracer/wwtracer-script/main/getlink.ps1'))} global"

https://raw.githubusercontent.com/wwtracer/wwtracer-script/main/getlink.ps1