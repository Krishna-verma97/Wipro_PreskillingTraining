# In the Global Scope (after the script finishes)
$global:MyGlobalVar = "This is a global variable"
Write-Host "Global variable created in the script."

# In the Script Scope
$script:MyScriptVar = "This is a script variable"
$MyNormalScriptVar = "This is a normal script variable"
Write-Host "Script variables created."

# A function that creates a new scope (Function Scope)
function Test-FunctionScope {
    # This variable is only visible inside this function
    $MyFunctionVar = "This is a function variable"
    Write-Host "Inside the function:"
    Write-Host "  - MyGlobalVar is accessible: $MyGlobalVar"
    Write-Host "  - MyScriptVar is accessible: $MyScriptVar"
    Write-Host "  - MyNormalScriptVar is accessible: $MyNormalScriptVar"
    Write-Host "  - MyFunctionVar is accessible: $MyFunctionVar"
}

# Run the function
Test-FunctionScope

# Back in the Script Scope
Write-Host "---------------------------"
Write-Host "Back in the script scope:"
Write-Host "  - MyGlobalVar is accessible: $MyGlobalVar"
Write-Host "  - MyScriptVar is accessible: $MyScriptVar"
Write-Host "  - MyNormalScriptVar is accessible: $MyNormalScriptVar"
# The next line will fail because the variable is out of scope!
Write-Host "  - MyFunctionVar is accessible: $MyFunctionVar"

Get-Service | Where-Object { $_.Status -eq 'Stopped' -or $_.Status -eq 'StopPending' }

Get-Service | Where-Object { -not ($_.Status -eq 'Running')

 # This command will generate an error because the service doesn't exist
Get-Service -Name "NonExistentService" 2> C:\temp\errors.txt


# Create a hashtable of parameters and their values
$params = @{
    Path = "C:\Windows\System32"
    Force = $true
    Recurse = $true
}

# Use the splatting operator (@) to pass the hashtable
Get-ChildItem @params


$services = Get-Service -name "spooler"
if($services.status -eq "running"){
write-host "Service exists."}
else{
write-host "Setvice doesn't exists."}
