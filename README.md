# T41A-P08

## 1. Crea las siguientes tablas e índices

```sql
-- Tabla: customers
CREATE TABLE customers (
    id                    -- Identificador único autoincremental
    name                  -- Nombre del cliente (obligatorio)
    email                 -- Email único y obligatorio
    city                  -- Ciudad del cliente (obligatorio)
    signup_date           -- Fecha de registro (obligatoria)
);
-- Índices para optimizar búsquedas
CREATE INDEX              -- Índice para búsquedas por ciudad
CREATE INDEX              -- Índice para rangos de fechas

-- Tabla: products
CREATE TABLE products (
    id                    -- Identificador único autoincremental
    name                  -- Nombre del producto (obligatorio)
    price                 -- Precio del producto (obligatorio, admite decimales)
);
CREATE INDEX              -- Índice para búsquedas por nombre

-- Tabla: orders
CREATE TABLE orders (
    id                    -- Identificador único autoincremental
    customer_id           -- Relación con cliente (clave foránea)
    order_date            -- Fecha de la orden (obligatoria)
);
CREATE INDEX              -- Índice para rangos de fechas
CREATE INDEX              -- Índice para búsquedas por cliente

-- Tabla: order_items
CREATE TABLE order_items (
    id SERIAL             -- Identificador único autoincremental
    order_id              -- Relación con orden (clave foránea)
    product_id            -- Relación con producto (clave foránea)
    quantity              -- Cantidad del producto (obligatoria)
);
CREATE INDEX              -- Índice para búsquedas por orden
CREATE INDEX              -- Índice para búsquedas por producto
```

## 2. Insertar la siguiente cantidad de registros por tabla

- 4 registros en `customers`
- 4 registros en `products`
- 4 registros en `orders`
- 6 registros en `order_items`

## 3. Realizar las siguientes consultas

```sql
-- Clientes y sus órdenes

-- Órdenes y sus productos

-- Total gastado por cliente

```
