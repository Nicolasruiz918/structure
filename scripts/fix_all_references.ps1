# Script para corregir TODAS las referencias cruzadas de esquemas
$mapping = @{
    # Tabla country está en geografia, no en otros schemas
    'identidad.country' = 'geografia.country'
    'aerolinea.country' = 'geografia.country'
    'operaciones.country' = 'geografia.country'
    'ventas.country' = 'geografia.country'
    'clientes.country' = 'geografia.country'
    
    # Tabla airline está en aerolinea, no en otros
    'operaciones.airline' = 'aerolinea.airline'
    'ventas.airline' = 'aerolinea.airline'
    'clientes.airline' = 'aerolinea.airline'
    'identidad.airline' = 'aerolinea.airline'
    
    # Tabla currency está en aerolinea
    'operaciones.currency' = 'aerolinea.currency'
    'ventas.currency' = 'aerolinea.currency'
    'clientes.currency' = 'aerolinea.currency'
    
    # Tabla airport está en aeropuerto, no en otros
    'operaciones.airport' = 'aeropuerto.airport'
    'ventas.airport' = 'aeropuerto.airport'
    'clientes.airport' = 'aeropuerto.airport'
    'identidad.airport' = 'aeropuerto.airport'
    
    # Tabla cabin_class está en aeronaves, no en operaciones
    'operaciones.cabin_class' = 'aeronaves.cabin_class'
    'ventas.cabin_class' = 'aeronaves.cabin_class'
    
    # Tabla fare_class está en operaciones pero se referencia incorrectamente
    'ventas.fare_class' = 'operaciones.fare_class'
    
    # Tabla person está en identidad
    'ventas.person' = 'identidad.person'
    'clientes.person' = 'identidad.person'
    'operaciones.person' = 'identidad.person'
    
    # Tabla customer está en clientes
    'ventas.customer' = 'clientes.customer'
    'operaciones.customer' = 'clientes.customer'
    'identidad.customer' = 'clientes.customer'
    
    # Tablas de ventas referenciadas desde otros schemas
    'operaciones.reservation' = 'ventas.reservation'
    'operaciones.reservation_status' = 'ventas.reservation_status'
    'operaciones.sale_channel' = 'ventas.sale_channel'
    'operaciones.reservation_passenger' = 'ventas.reservation_passenger'
    'operaciones.fare' = 'ventas.fare'
    'operaciones.ticket_status' = 'ventas.ticket_status'
    'operaciones.ticket' = 'ventas.ticket'
    'operaciones.sale' = 'ventas.sale'
    'clientes.reservation' = 'ventas.reservation'
}

Write-Host "🔧 Corrigiendo referencias cruzadas de esquemas..." -ForegroundColor Cyan
Write-Host ""

$files = Get-ChildItem "01_ddl\03_tables\" -Filter "*.sql" -Recurse | Where-Object { $_.Name -like "*_create_*_tables.sql" }
Write-Host "Procesando $($files.Count) archivos SQL..." -ForegroundColor Yellow

foreach ($file in $files) {
    $content = Get-Content $file.FullName -Raw
    $changes = 0
    
    foreach ($oldRef in $mapping.Keys) {
        $newRef = $mapping[$oldRef]
        if ($content -like "*$oldRef*") {
            # Usar word boundaries para evitar reemplazos parciales
            $pattern = "$([regex]::Escape($oldRef))\("
            $replacement = "$newRef("
            if ($content -match $pattern) {
                $content = $content -replace $pattern, $replacement
                $changes++
            }
        }
    }
    
    if ($changes -gt 0) {
        Set-Content $file.FullName $content
        Write-Host "✓ $($file.Name) - $changes cambio(s)" -ForegroundColor Green
    } else {
        Write-Host "  $($file.Name)" -ForegroundColor Gray
    }
}

Write-Host ""
Write-Host "✅ Correcciones completadas!" -ForegroundColor Green
