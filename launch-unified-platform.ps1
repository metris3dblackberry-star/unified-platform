$crmDir = "D:\KNB Backend\automotive-repair-management-system"
$erpDir = "D:\PLANETA ERP"
$gatewayDir = Split-Path -Parent $MyInvocation.MyCommand.Path

$crmPort = 5101
$erpPort = 5102
$gatewayPort = 5100

$crmPython = Join-Path $crmDir "venv\Scripts\python.exe"
if (-not (Test-Path $crmPython)) {
    $crmPython = "python"
}

$crmCommand = "`$env:HOST='127.0.0.1'; `$env:PORT='$crmPort'; `$env:EMBED_ALLOWED_ORIGIN='http://127.0.0.1:$gatewayPort'; & '$crmPython' run.py"
$erpCommand = "`$env:EMBED_ALLOWED_ORIGIN='http://127.0.0.1:$gatewayPort'; @'`nfrom app import create_app`napp = create_app()`napp.run(host='127.0.0.1', port=$erpPort, debug=False)`n'@ | py -3 -"
$gatewayCommand = "`$env:CRM_BASE_URL='http://127.0.0.1:$crmPort'; `$env:ERP_BASE_URL='http://127.0.0.1:$erpPort'; & py -3 app.py"

Start-Process -FilePath "powershell" -ArgumentList "-NoProfile", "-ExecutionPolicy", "Bypass", "-Command", $crmCommand -WorkingDirectory $crmDir -WindowStyle Hidden
Start-Process -FilePath "powershell" -ArgumentList "-NoProfile", "-ExecutionPolicy", "Bypass", "-Command", $erpCommand -WorkingDirectory $erpDir -WindowStyle Hidden
Start-Process -FilePath "py" -ArgumentList "-3", "-m", "pip", "install", "-r", "requirements.txt" -WorkingDirectory $gatewayDir -WindowStyle Hidden -Wait
Start-Process -FilePath "powershell" -ArgumentList "-NoProfile", "-ExecutionPolicy", "Bypass", "-Command", $gatewayCommand -WorkingDirectory $gatewayDir -WindowStyle Hidden

Write-Host "Unified platform inditva: http://127.0.0.1:$gatewayPort"
