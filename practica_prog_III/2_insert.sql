--hacemos insert en las table

SET search_path TO practica_prog_iii;


-- =====================================================
-- MOCK DATA GENERATION
-- =====================================================

-- Enable necessary extensions
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- =====================================================
-- 1. FACULTAD (7 records)
-- =====================================================
INSERT INTO FACULTAD (NOMBRE, DIRECCION, CUIT, SUCURSAL, TELEFONOS, EMAIL, DEFECTO) VALUES
('Facultad de Ingeniería', 'Av. Libertador 1234, Buenos Aires', '30-12345678-9', 1, '011-4123-4567;011-4123-4568', 'ingenieria@universidad.edu', true),
('Facultad de Medicina', 'Calle Corrientes 567, Buenos Aires', '30-23456789-0', 2, '011-5234-5678;011-5234-5679', 'medicina@universidad.edu', false),
('Facultad de Derecho', 'Av. Callao 890, Buenos Aires', '30-34567890-1', 3, '011-6345-6789', 'derecho@universidad.edu', false),
('Facultad de Economía', 'Calle Florida 123, Buenos Aires', '30-45678901-2', 4, '011-7456-7890;011-7456-7891', 'economia@universidad.edu', false),
('Facultad de Ciencias Exactas', 'Av. Del Libertador 4567, Córdoba', '30-56789012-3', 5, '0351-456-7890', 'exactas@universidad.edu', false),
('Facultad de Psicología', 'Calle San Martín 789, Rosario', '30-67890123-4', 6, '0341-567-8901', 'psicologia@universidad.edu', false),
('Facultad de Arquitectura', 'Av. Independencia 234, Mendoza', '30-78901234-5', 7, '0261-678-9012', 'arquitectura@universidad.edu', false);

-- =====================================================
-- 2. TERCEROS (38 records)
-- =====================================================
INSERT INTO TERCEROS (NOMBRE, CUITL, SITIVA, DIRECCION, LOCALIDAD, PROVINCIA, TELEFONOS, SALDO_APERTURA, TIPO_SALDO) VALUES
('Juan Pérez', '20-12345678-9', 'Responsable Inscripto', 'Av. Rivadavia 1234', 'Capital Federal', 'Buenos Aires', '011-4123-1234', 15000.00, 'ACREEDOR'),
('María González', '27-23456789-0', 'Monotributo', 'Calle Corrientes 5678', 'Capital Federal', 'Buenos Aires', '011-5234-5678', 0.00, 'DEVEDOR'),
('Carlos Rodríguez', '20-34567890-1', 'Responsable Inscripto', 'Av. Santa Fe 9012', 'Rosario', 'Santa Fe', '0341-456-7890', 25000.50, 'ACREEDOR'),
('Ana Martínez', '27-45678901-2', 'Consumidor Final', 'Calle San Martín 3456', 'Córdoba', 'Córdoba', '0351-567-8901', 5000.00, 'DEVEDOR'),
('Roberto Sánchez', '30-56789012-3', 'Responsable Inscripto', 'Av. Alem 7890', 'Mendoza', 'Mendoza', '0261-678-9012', 32000.75, 'ACREEDOR'),
('Laura Fernández', '27-67890123-4', 'Monotributo', 'Calle Belgrano 1234', 'La Plata', 'Buenos Aires', '0221-789-0123', 1200.00, 'DEVEDOR'),
('Diego López', '20-78901234-5', 'Responsable Inscripto', 'Av. Pueyrredón 5678', 'Mar del Plata', 'Buenos Aires', '0223-890-1234', 18750.00, 'ACREEDOR'),
('Silvia Díaz', '27-89012345-6', 'Consumidor Final', 'Calle Moreno 9012', 'Salta', 'Salta', '0387-901-2345', 750.00, 'DEVEDOR'),
('Javier Torres', '30-90123456-7', 'Responsable Inscripto', 'Av. 9 de Julio 3456', 'Tucumán', 'Tucumán', '0381-012-3456', 42900.00, 'ACREEDOR'),
('Patricia Ramírez', '27-01234567-8', 'Monotributo', 'Calle Lavalle 7890', 'Neuquén', 'Neuquén', '0299-123-4567', 3500.00, 'DEVEDOR'),
('Gabriel Morales', '20-11223344-5', 'Responsable Inscripto', 'Av. Libertador 1234', 'San Juan', 'San Juan', '0264-234-5678', 22500.00, 'ACREEDOR'),
('Veronica Castro', '27-22334455-6', 'Consumidor Final', 'Calle Mitre 5678', 'Santa Fe', 'Santa Fe', '0342-345-6789', 800.00, 'DEVEDOR'),
('Ricardo Aguirre', '30-33445566-7', 'Responsable Inscripto', 'Av. Illia 9012', 'Paraná', 'Entre Ríos', '0343-456-7890', 31000.00, 'ACREEDOR'),
('Claudia Méndez', '27-44556677-8', 'Monotributo', 'Calle Sarmiento 3456', 'Corrientes', 'Corrientes', '0379-567-8901', 2100.00, 'DEVEDOR'),
('Fernando Herrera', '20-55667788-9', 'Responsable Inscripto', 'Av. Costanera 7890', 'Posadas', 'Misiones', '0376-678-9012', 19800.00, 'ACREEDOR'),
('Liliana Ríos', '27-66778899-0', 'Consumidor Final', 'Calle Alvear 1234', 'Formosa', 'Formosa', '0370-789-0123', 450.00, 'DEVEDOR'),
('Martín Silva', '30-77889900-1', 'Responsable Inscripto', 'Av. San Martín 5678', 'Resistencia', 'Chaco', '0362-890-1234', 26750.00, 'ACREEDOR'),
('Andrea Paz', '27-88990011-2', 'Monotributo', 'Calle Uruguay 9012', 'Santiago del Estero', 'Santiago del Estero', '0385-901-2345', 1850.00, 'DEVEDOR'),
('Hugo Medina', '20-99001122-3', 'Responsable Inscripto', 'Av. Roca 3456', 'La Rioja', 'La Rioja', '0380-012-3456', 15200.00, 'ACREEDOR'),
('Natalia Blanco', '27-00112233-4', 'Consumidor Final', 'Calle Pellegrini 7890', 'San Luis', 'San Luis', '0266-123-4567', 620.00, 'DEVEDOR'),
('Oscar Navarro', '30-11122233-4', 'Responsable Inscripto', 'Av. Perón 1234', 'Catamarca', 'Catamarca', '0383-234-5678', 34100.00, 'ACREEDOR'),
('Roxana Vega', '27-22233344-5', 'Monotributo', 'Calle Güemes 5678', 'Jujuy', 'Jujuy', '0388-345-6789', 2950.00, 'DEVEDOR'),
('Luis Páez', '20-33344455-6', 'Responsable Inscripto', 'Av. Belgrano 9012', 'San Miguel', 'Tucumán', '0381-456-7890', 27300.00, 'ACREEDOR'),
('Graciela Ortiz', '27-44455566-7', 'Consumidor Final', 'Calle Independencia 3456', 'Godoy Cruz', 'Mendoza', '0261-567-8901', 980.00, 'DEVEDOR'),
('Sergio Godoy', '30-55566677-8', 'Responsable Inscripto', 'Av. España 7890', 'Bariloche', 'Río Negro', '0294-678-9012', 45600.00, 'ACREEDOR'),
('Miriam Luna', '27-66677788-9', 'Monotributo', 'Calle Rivadavia 1234', 'Comodoro Rivadavia', 'Chubut', '0297-789-0123', 4100.00, 'DEVEDOR'),
('Emilio Fuentes', '20-77788899-0', 'Responsable Inscripto', 'Av. del Trabajo 5678', 'Río Gallegos', 'Santa Cruz', '0296-890-1234', 18900.00, 'ACREEDOR'),
('Cecilia Domínguez', '27-88899900-1', 'Consumidor Final', 'Calle San Lorenzo 9012', 'Ushuaia', 'Tierra del Fuego', '02901-234-567', 350.00, 'DEVEDOR'),
('Adrián Ponce', '30-99900011-2', 'Responsable Inscripto', 'Av. Maipú 3456', 'Vicente López', 'Buenos Aires', '011-345-6789', 52300.00, 'ACREEDOR'),
('Marina Juárez', '27-00011122-3', 'Monotributo', 'Calle Olivos 7890', 'Olivos', 'Buenos Aires', '011-456-7890', 2750.00, 'DEVEDOR'),
('Esteban Vera', '20-11122233-4', 'Responsable Inscripto', 'Av. del Libertador 1234', 'Belgrano', 'Buenos Aires', '011-567-8901', 34800.00, 'ACREEDOR'),
('Florencia Acosta', '27-22233344-5', 'Consumidor Final', 'Calle Cabildo 5678', 'Nuñez', 'Buenos Aires', '011-678-9012', 1250.00, 'DEVEDOR'),
('Guillermo Benítez', '30-33344455-6', 'Responsable Inscripto', 'Av. Santa Fe 9012', 'Recoleta', 'Buenos Aires', '011-789-0123', 29500.00, 'ACREEDOR'),
('Mónica Giménez', '27-44455566-7', 'Monotributo', 'Calle Las Heras 3456', 'Palermo', 'Buenos Aires', '011-890-1234', 3300.00, 'DEVEDOR'),
('Raúl Villalba', '20-55566677-8', 'Responsable Inscripto', 'Av. Corrientes 7890', 'Balvanera', 'Buenos Aires', '011-901-2345', 41200.00, 'ACREEDOR'),
('Bárbara Toledo', '27-66677788-9', 'Consumidor Final', 'Calle Jujuy 1234', 'Almagro', 'Buenos Aires', '011-012-3456', 890.00, 'DEVEDOR'),
('Leonardo Farías', '30-77788899-0', 'Responsable Inscripto', 'Av. La Plata 5678', 'Boedo', 'Buenos Aires', '011-123-4567', 36700.00, 'ACREEDOR'),
('Carolina Pereyra', '27-88899900-1', 'Monotributo', 'Calle Boedo 9012', 'San Cristóbal', 'Buenos Aires', '011-234-5678', 1980.00, 'DEVEDOR');

-- =====================================================
-- 3. FACTURAS (100 records)
-- =====================================================
DO $$
DECLARE
    i INTEGER;
    tercero_id INTEGER;
    fecha_factura DATE;
    numero_factura INTEGER;
BEGIN
    FOR i IN 1..100 LOOP
        -- Random tercero ID (1-38)
        tercero_id := 1 + floor(random() * 38);
        
        -- Random date in 2024-2025
        fecha_factura := DATE '2024-01-01' + (floor(random() * 730) || ' days')::INTERVAL;
        
        -- Sequential invoice number
        numero_factura := 1000 + i;
        
        INSERT INTO FACTURAS (FECHA_FACTURA, ID_TERCERO, NUMERO)
        VALUES (fecha_factura, tercero_id, numero_factura);
    END LOOP;
END $$;

-- =====================================================
-- 4. FACTURAS_ITEMS (Each invoice has 1-5 items)
-- =====================================================
DO $$
DECLARE
    i INTEGER;
    j INTEGER;
    factura_id INTEGER;
    monto NUMERIC;
    cantidad NUMERIC;
    items_count INTEGER;
    detalles TEXT[];
BEGIN
    detalles := ARRAY[
        'Consulta médica', 'Análisis clínicos', 'Radiografía', 'Ecografía', 
        'Medicamentos', 'Tratamiento dental', 'Cirugía menor', 'Terapia',
        'Material de oficina', 'Equipo informático', 'Software', 'Mantenimiento',
        'Servicio de limpieza', 'Seguridad', 'Consultoría', 'Capacitación',
        'Material didáctico', 'Libros', 'Inscripción', 'Cuota social',
        'Honorarios', 'Alquiler', 'Servicios públicos', 'Telecomunicaciones'
    ];
    
    FOR factura_id IN 1..100 LOOP
        -- Random number of items per invoice (1 to 5)
        items_count := 1 + floor(random() * 5);
        
        FOR j IN 1..items_count LOOP
            -- Random amounts and quantities
            monto := (10 + random() * 5000)::NUMERIC(8,2);
            cantidad := (0.5 + random() * 100)::NUMERIC(9,3);
            
            INSERT INTO FACTURAS_ITEMS (MONTO, CANTIDAD, ID_FACTURA, DETALLE)
            VALUES (
                monto, 
                cantidad, 
                factura_id,
                detalles[1 + floor(random() * array_length(detalles, 1))]
            );
        END LOOP;
    END LOOP;
END $$;

-- =====================================================
-- 5. PAGOS (85 records)
-- =====================================================
DO $$
DECLARE
    i INTEGER;
    tercero_id INTEGER;
    fecha_pago DATE;
    monto_pago NUMERIC;
    modos TEXT[];
    modo_seleccionado TEXT;
BEGIN
    modos := ARRAY['EFECTIVO', 'TRANSFERENCIA', 'TARJETA', 'CHEQUE', 'MERCADO PAGO'];
    
    FOR i IN 1..85 LOOP
        -- Random tercero ID (1-38)
        tercero_id := 1 + floor(random() * 38);
        
        -- Random date in 2024-2025
        fecha_pago := DATE '2024-01-01' + (floor(random() * 730) || ' days')::INTERVAL;
        
        -- Random payment amount
        monto_pago := (100 + random() * 50000)::NUMERIC(12,2);
        
        -- Random payment method
        modo_seleccionado := modos[1 + floor(random() * array_length(modos, 1))];
        
        INSERT INTO PAGOS (ID_TERCERO, FECHA_PAGO, MONTO_PAGO, MODO_PAGO)
        VALUES (tercero_id, fecha_pago, monto_pago, modo_seleccionado);
    END LOOP;
END $$;

-- =====================================================
-- 6. PAGOS_DETALLE (For payments with instrument)
-- =====================================================
DO $$
DECLARE
    i INTEGER;
    pago_id INTEGER;
    instrument_number TEXT;
    instrument_date DATE;
    bancos TEXT[];
    banco_seleccionado TEXT;
    pago_realizado BOOLEAN;
    total_pagos INTEGER;
BEGIN
    bancos := ARRAY[
        'Banco Nación', 'Banco Provincia', 'Banco Galicia', 'Banco Santander', 
        'Banco Francés', 'Banco Macro', 'Banco Ciudad', 'Banco Patagonia',
        'Banco Supervielle', 'Banco Comafi', 'Banco Itaú', 'HSBC'
    ];
    
    -- Get total number of payments
    SELECT COUNT(*) INTO total_pagos FROM PAGOS;
    
    -- Create detail for approximately 70% of payments (random selection)
    FOR pago_id IN 1..total_pagos LOOP
        -- 70% chance to have payment detail
        IF random() < 0.7 THEN
            -- Instrument number: random format
            instrument_number := 
                LPAD(floor(random() * 10000000)::TEXT, 8, '0') || '-' ||
                LPAD(floor(random() * 9)::TEXT, 1, '0');
            
            -- Instrument date
            instrument_date := DATE '2024-01-01' + (floor(random() * 730) || ' days')::INTERVAL;
            
            -- Random bank
            banco_seleccionado := bancos[1 + floor(random() * array_length(bancos, 1))];
            
            -- Payment realized flag (85% true)
            pago_realizado := random() < 0.85;
            
            INSERT INTO PAGOS_DETALLE (INSTRUMENTNUMBER, INSTRUMENTDATE, BANCO, PAGOREALIZADO, ID_PAGOS)
            VALUES (instrument_number, instrument_date, banco_seleccionado, pago_realizado, pago_id);
        END IF;
    END LOOP;
END $$;

-- =====================================================
-- VERIFICATION QUERIES (Run after data insertion)
-- =====================================================

-- Count records
SELECT 'FACULTAD' AS TABLA, COUNT(*) AS CANTIDAD FROM FACULTAD
UNION ALL
SELECT 'TERCEROS', COUNT(*) FROM TERCEROS
UNION ALL
SELECT 'FACTURAS', COUNT(*) FROM FACTURAS
UNION ALL
SELECT 'FACTURAS_ITEMS', COUNT(*) FROM FACTURAS_ITEMS
UNION ALL
SELECT 'PAGOS', COUNT(*) FROM PAGOS
UNION ALL
SELECT 'PAGOS_DETALLE', COUNT(*) FROM PAGOS_DETALLE;

-- Sample data view
SELECT 
    f.ID_FACTURA,
    f.NUMERO,
    f.FECHA_FACTURA,
    t.NOMBRE AS TERCERO,
    COUNT(fi.ID_ITEMS) AS CANTIDAD_ITEMS,
    SUM(fi.MONTO * fi.CANTIDAD) AS TOTAL_FACTURA
FROM FACTURAS f
JOIN TERCEROS t ON f.ID_TERCERO = t.ID_TERCERO
LEFT JOIN FACTURAS_ITEMS fi ON f.ID_FACTURA = fi.ID_FACTURA
GROUP BY f.ID_FACTURA, f.NUMERO, f.FECHA_FACTURA, t.NOMBRE
LIMIT 10;