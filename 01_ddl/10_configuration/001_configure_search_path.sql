-- ============================================
-- Configuración de search_path
-- Descripción: Configura el search_path para incluir todos los schemas
-- de negocio para que \dt muestre todas las tablas por defecto
-- ============================================

-- Configurar search_path a nivel de database
ALTER DATABASE aerolinea SET search_path TO public,geografia,aerolinea,identidad,seguridad,clientes,aeropuerto,aeronaves,operaciones,ventas,abordaje,pagos,facturacion,notificaciones;

-- Configurar search_path para el usuario admin
ALTER USER admin SET search_path TO public,geografia,aerolinea,identidad,seguridad,clientes,aeropuerto,aeronaves,operaciones,ventas,abordaje,pagos,facturacion,notificaciones;
