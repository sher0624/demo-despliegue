$archivoOrigen = Join-Path  $PSScriptRoot 'origen\index.php'
$archivoDestino = Join-Path $PSScriptRoot 'pruebas\index.php'

& 'C:\laragon\bin\php\php-8.4.12-Win32-vs17-x64\php.exe' -l $archivoOrigen

if ($LASTEXITCODE -ne 0) {
    Write-Host "Hay un error de sintaxis no se publico el cambio"
    exit 1
}

Copy-Item $archivoOrigen $archivoDestino -Force -ErrorAction stop
Write-Host "Version publicada en el ambiente de pruebas"
php -S localhost:8082 -t pruebas