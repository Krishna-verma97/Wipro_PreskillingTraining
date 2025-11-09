# Files\KVWelcome.ps1
# Per-user action run by Active Setup (runs once per user on first login)
Add-Type -AssemblyName PresentationFramework
[System.Windows.MessageBox]::Show("Welcome to the KV world!", "KV World", "OK", "Information")

# (Optional non-UI verification)
$desktop = [Environment]::GetFolderPath("Desktop")
"Welcome to the KV world! - $(Get-Date)" | Out-File -FilePath (Join-Path $desktop "KVWelcome.txt") -Encoding UTF8 -Force
