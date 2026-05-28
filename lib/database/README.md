# database

Esta carpeta contiene la implementacion de persistencia local de la app.
Aqui vive la configuracion de Drift, el esquema de SQLite, los DAOs y las tablas.

## Estructura

```text
database/
  app_database.dart
  daos/
  schemas/
  tables/
```

## Que va en cada carpeta

### `app_database.dart`
Punto de entrada de la base de datos.
Centraliza la definicion de Drift, la apertura de la conexion, la version del schema y las migraciones.

Tambien es el lugar adecuado para configurar detalles de la base como el modo de apertura, pragmas de SQLite o datos iniciales.

### `daos/`
Objetos de acceso a datos para consultar y mutar tablas.
Los DAOs deben contener la logica SQL o Drift necesaria para leer, filtrar, insertar, actualizar y borrar registros.

Ejemplos:
- obtener reviews por item
- leer tablas relacionadas
- ejecutar operaciones de escritura transaccionales

### `tables/`
Definicion de las tablas de SQLite usando Drift.
Aqui se describen columnas, indices, restricciones y relaciones entre tablas.

Ejemplos:
- columnas y tipos
- foreign keys
- indices compuestos
- defaults y checks

### `schemas/`
Estructuras relacionadas con la evolucion del esquema o con definiciones auxiliares del modelo de base de datos.
Si una pieza pertenece al contrato estructural de la base, pero no es una tabla ni un DAO, este es el sitio natural para agruparla.

## Regla practica

- Si define la conexion o migracion global, va en `app_database.dart`.
- Si ejecuta consultas o escrituras, va en `daos/`.
- Si define la estructura de una tabla, va en `tables/`.
- Si describe partes auxiliares del schema, va en `schemas/`.

## Lo que no deberia ir aqui

No deberian vivir aqui los modelos de dominio, los repositories ni la logica de negocio de la app.
La base de datos debe limitarse a persistencia y schema; la traduccion hacia dominio debe pasar por `data/`.