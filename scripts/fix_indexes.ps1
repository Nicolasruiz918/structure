# Script para corregir índices sin schema
$files = Get-ChildItem "01_ddl\03_tables\" -Filter "*.sql" -Recurse | Where-Object { $_.Name -like "*_create_*_tables.sql" }

Write-Host "🔧 Corrigiendo índices sin schema..." -ForegroundColor Cyan
Write-Host ""

$schemaMap = @{
    # Geografia
    'continent' = 'geografia'
    'country' = 'geografia'
    'state_province' = 'geografia'
    'time_zone' = 'geografia'
    'city' = 'geografia'
    'district' = 'geografia'
    
    # Aerolinea
    'currency' = 'aerolinea'
    'airline' = 'aerolinea'
    
    # Identidad
    'person_type' = 'identidad'
    'document_type' = 'identidad'
    'contact_type' = 'identidad'
    'person' = 'identidad'
    'person_document' = 'identidad'
    'person_contact' = 'identidad'
    
    # Seguridad
    'security_role' = 'seguridad'
    'security_permission' = 'seguridad'
    'role_permission' = 'seguridad'
    'user_role' = 'seguridad'
    'audit_log' = 'seguridad'
    
    # Clientes
    'loyalty_tier' = 'clientes'
    'loyalty_program' = 'clientes'
    'loyalty_account' = 'clientes'
    'loyalty_transaction' = 'clientes'
    'customer_category' = 'clientes'
    'customer' = 'clientes'
    'customer_benefit' = 'clientes'
    
    # Aeropuerto
    'address' = 'aeropuerto'
    'airport' = 'aeropuerto'
    'terminal' = 'aeropuerto'
    'gate' = 'aeropuerto'
    'runway' = 'aeropuerto'
    
    # Aeronaves
    'aircraft_type' = 'aeronaves'
    'aircraft_status' = 'aeronaves'
    'aircraft' = 'aeronaves'
    'cabin_class' = 'aeronaves'
    
    # Operaciones
    'flight_status' = 'operaciones'
    'delay_reason_type' = 'operaciones'
    'flight' = 'operaciones'
    'flight_segment' = 'operaciones'
    'flight_segment_delay' = 'operaciones'
    'fare_class' = 'operaciones'
    
    # Ventas
    'reservation_status' = 'ventas'
    'sale_channel' = 'ventas'
    'fare' = 'ventas'
    'ticket_status' = 'ventas'
    'ticket' = 'ventas'
    'reservation' = 'ventas'
    'reservation_passenger' = 'ventas'
    'sale' = 'ventas'
    
    # Abordaje
    'boarding_group' = 'abordaje'
    'boarding_status' = 'abordaje'
    'boarding_record' = 'abordaje'
    
    # Pagos
    'payment_method' = 'pagos'
    'payment_status' = 'pagos'
    'payment' = 'pagos'
    
    # Facturación
    'invoice_status' = 'facturacion'
    'invoice' = 'facturacion'
    'invoice_detail' = 'facturacion'
    
    # Notificaciones
    'notification_type' = 'notificaciones'
    'notification_preference' = 'notificaciones'
    'notification' = 'notificaciones'
}

foreach ($file in $files) {
    $content = Get-Content $file.FullName -Raw
    $originalContent = $content
    
    # Buscar patrones de CREATE INDEX sin schema
    # CREATE INDEX idx_xxx ON tabla_sin_schema
    foreach ($table in $schemaMap.Keys) {
        $schema = $schemaMap[$table]
        # Patrón: ON tabla_sin_esquema(
        $pattern = "ON\s+$([regex]::Escape($table))\("
        $replacement = "ON $schema.$table("
        $content = $content -replace $pattern, $replacement
    }
    
    if ($content -ne $originalContent) {
        Set-Content $file.FullName $content
        Write-Host "✓ $($file.Name)" -ForegroundColor Green
    }
}

Write-Host ""
Write-Host "✅ Índices corregidos!" -ForegroundColor Green
