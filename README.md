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

# Tablas e Índices en Bases de Datos Relacionales

Las **tablas** y los **índices** son los pilares de la gestión y la optimización del rendimiento en las **bases de datos relacionales**. Comprender su funcionamiento es esencial para el diseño de sistemas eficientes.

---

## 1. Tablas (Tables) 📊

Una **tabla** es la estructura principal de almacenamiento, organizando la información de manera lógica en filas y columnas. Modelan una entidad del mundo real (ej. Estudiantes, Cursos, Pedidos).

### 1.1 Estructura Básica

| Componente | Nomenclatura Alternativa | Descripción |
| :--- | :--- | :--- |
| **Filas** | Registros, Tuplas | Representan una instancia única de la entidad (ej. un estudiante). |
| **Columnas** | Atributos, Campos | Definen las características o propiedades de la entidad (ej. nombre, ID, fecha de nacimiento). |
| **Esquema** | Definición de tabla | La estructura formal: nombre de las columnas y sus tipos de datos. |

### 1.2 Restricciones de Integridad (Integrity Constraints)

Son reglas fundamentales para asegurar la calidad y coherencia de los datos.

| Restricción | Propósito | Ejemplo |
| :--- | :--- | :--- |
| **Clave Primaria (PK)** | Identifica de forma **única** cada fila. Es la base de la integridad de la entidad. | `id_estudiante` |
| **Clave Foránea (FK)** | Establece una **relación** con la clave primaria de otra tabla, garantizando la integridad referencial. | `id_curso` en la tabla `Inscripciones` que referencia a `Cursos`. |
| `NOT NULL` | Obliga a que una columna siempre contenga un valor. | El `nombre` del estudiante no puede estar vacío. |
| `UNIQUE` | Asegura que todos los valores en la columna son diferentes. | El `email` del estudiante debe ser único. |

---

## 2. Índices (Indexes) 🚀

Un **índice** es una estructura de datos especial que acelera la recuperación de datos (`SELECT`) al permitir al Sistema de Gestión de Bases de Datos (DBMS) localizar registros sin tener que escanear toda la tabla. 

### 2.1 Principio de Funcionamiento

Sin un índice, el DBMS realiza un **Escaneo de Tabla Completo (Table Scan)**, leyendo fila por fila. Un índice es similar al índice de un libro: permite ir directamente a la página (registro) que contiene la información buscada.

### 2.2 Tipos de Índices

| Tipo | Característica | Uso Típico | Impacto en el Almacenamiento |
| :--- | :--- | :--- | :--- |
| **Clustered (Agrupado)** | Define el **orden físico** de almacenamiento de la tabla. Solo puede haber **uno** por tabla. | Generalmente sobre la **Clave Primaria**. | Bajo (La tabla *es* el índice). |
| **Non-Clustered (No Agrupado)** | Es una estructura **separada** que contiene la clave y un puntero a la fila de datos real. Puede haber **múltiples** por tabla. | Columnas usadas frecuentemente en `WHERE` o `JOIN`. | Alto (Estructura de datos adicional). |

### 2.3 La Compensación Rendimiento (Trade-off)

La principal desventaja de los índices es la **sobrecarga de mantenimiento**.

| Operación | Rendimiento con Índices | Razón |
| :--- | :--- | :--- |
| **`SELECT` (Lectura)** | **Mejorado** (Búsqueda rápida y directa). | Evita el escaneo completo de la tabla. |
| **`INSERT` / `UPDATE` / `DELETE` (Escritura)** | **Disminuido** (Más lento). | El DBMS debe actualizar la tabla **y** todos los índices relacionados. |

### 2.4 Guía de Optimización de Índices

Se recomienda indexar columnas que:

1.  Se utilicen con frecuencia en las cláusulas `WHERE`, `JOIN` y `ORDER BY`.
2.  Tengan alta **selectividad** (pocos valores repetidos, ej. un DNI o un código de producto).
3.  Sean **Claves Foráneas (FKs)** para optimizar las operaciones de unión (`JOIN`).

Se debe **evitar** indexar columnas que:

* Se actualicen constantemente.
* Tengan baja selectividad (ej. una columna booleana).
* Se usen raramente en consultas.

---

