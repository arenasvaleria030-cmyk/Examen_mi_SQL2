-- 1. Estructura de la tabla
CREATE TABLE IF NOT EXISTS membresias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_vencimiento DATE NULL
);

-- 2. Trigger para cálculo automático de vencimiento
DROP TRIGGER IF EXISTS calcular_fecha_vencimiento;

CREATE TRIGGER calcular_fecha_vencimiento
BEFORE INSERT ON membresias
FOR EACH ROW
SET NEW.fecha_vencimiento = DATE_ADD(NEW.fecha_inicio, INTERVAL 30 DAY);

-- 1. Insertar el registro de prueba
INSERT INTO membresias (usuario_id, fecha_inicio) 
VALUES (101, '2026-10-08');

-- 2. Consultar la tabla para ver el resultado
SELECT * FROM membresias;