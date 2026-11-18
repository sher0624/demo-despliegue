param(
    [string]$RutaPHP = 'php'
)

$archivoOrigen = Join-Path $PSScriptRoot 'origen\index.php'
$carpetaPruebas = Join-Path $PSScriptRoot 'pruebas'
$archivoDestino = Join-Path $carpetaPruebas 'index.php'

& $RutaPHP -l $archivoOrigen

if ($LASTEXITCODE -ne 0) {
    Write-Error 'Falló la validación de PHP. No se copió el archivo.'
    exit 1
}

New-Item -ItemType Directory -Path $carpetaPruebas -Force -ErrorAction Stop | Out-Null
Copy-Item -LiteralPath $archivoOrigen -Destination $archivoDestino -Force -ErrorAction Stop

Write-Host 'Versión preparada en pruebas/index.php.'