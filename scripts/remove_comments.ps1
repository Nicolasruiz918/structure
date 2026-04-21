# Script para eliminar COMMENT ON statements
$files = Get-ChildItem "01_ddl\03_tables\" -Filter "*.sql" -Recurse | Where-Object { $_.Name -like "*_create_*_tables.sql" }

Write-Host "🔧 Eliminando COMMENT ON statements..." -ForegroundColor Cyan

foreach ($file in $files) {
    $content = Get-Content $file.FullName -Raw
    
    # Eliminar todas las líneas que empiezan con COMMENT ON
    $cleanedContent = $content -replace "COMMENT ON TABLE.*?;`n?", ""
    $cleanedContent = $cleanedContent -replace "COMMENT ON COLUMN.*?;`n?", ""
    
    if ($cleanedContent -ne $content) {
        Set-Content $file.FullName $cleanedContent
        Write-Host "✓ $($file.Name)" -ForegroundColor Green
    }
}

Write-Host ""
Write-Host "✅ COMMENT ON statements eliminados!" -ForegroundColor Green
