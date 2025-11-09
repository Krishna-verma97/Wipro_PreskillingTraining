Write-Host "Hello,World!!!"
<#
Multiline comment
#>
write-host 'Krishna'
clear

#Conditionals

$service = Get-Service -Name "Spooler"
if($service.Status -eq "running"){
write-host "Running."
}
else{
write-host "spooler is stoped"
}


$Stopservice = "spooler","dnscache"
foreach($serviceName in $Stopservice){
write-host "Attempting to stop $serviceName..."
stop-service -name $serviceName
}

$Stopservice = "notepad++","excel"
foreach($serviceName in $Stopservice){
write-host "Attempting to stop $serviceName..."
stop-service -name $serviceName
}

$Stopservice = "spooler","dnscache"
foreach($serviceName in $Stopservice){
write-host "Attempting to stop $serviceName..."
#stop-service -name $serviceName
}



function service{
Get-Command -Name Get-Process
}
service


function Get-SystemUptime {
    (Get-Date) - (Get-CimInstance Win32_OperatingSystem).LastBootUpTime
}

# Now you can call the function like a regular cmdlet
Get-SystemUptime


write-host $pwd
write-host $psversiontable

Get-Process | Get-Member

$processes = Get-Process
$processes[1].Id

$sample = "apple","mango"
write-host $sample[-1]#last item


$servers = "Server01", "Server02", "Server03"

foreach ($server in $servers) {
    Write-Host "Testing connection to $server..."
    Test-Connection -ComputerName $server -Count 1
}


$names = "Krishna","Vishnu","Gauri"
foreach($names in $names){
write-host "$names is from the danger blood zone family dhasuuu"
}



Write-Host "This is Black text" -ForegroundColor Black
Write-Host "This is DarkBlue text" -ForegroundColor DarkBlue
Write-Host "This is DarkGreen text" -ForegroundColor DarkGreen
Write-Host "This is DarkCyan text" -ForegroundColor DarkCyan
Write-Host "This is DarkRed text" -ForegroundColor DarkRed
Write-Host "This is DarkMagenta text" -ForegroundColor DarkMagenta
Write-Host "This is DarkYellow text" -ForegroundColor DarkYellow
Write-Host "This is Gray text" -ForegroundColor Gray
Write-Host "This is DarkGray text" -ForegroundColor DarkGray
Write-Host "This is Blue text" -ForegroundColor Blue
Write-Host "This is Green text" -ForegroundColor Green
Write-Host "This is Cyan text" -ForegroundColor Cyan
Write-Host "This is Red text" -ForegroundColor Red
Write-Host "This is Magenta text" -ForegroundColor Magenta
Write-Host "This is Yellow text" -ForegroundColor Yellow
Write-Host "This is White text" -ForegroundColor White



 $services = "Spooler", "Dnscache", "TermService"

# The pipeline automatically processes each item in the array
$services | Get-Service