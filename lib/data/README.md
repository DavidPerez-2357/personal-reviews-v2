# data

Esta capa conecta el dominio con las fuentes de datos.
Aqui se concentra la traduccion entre modelos de dominio, filas de base de datos y operaciones de acceso a datos.

## Estructura

```text
data/
  mappers/
  repositories/
```

## Que va en cada carpeta

### `mappers/`
Convertidores entre representaciones distintas de un mismo dato.
Su trabajo es transformar rows, entidades de persistencia o respuestas de infraestructura en modelos de dominio, y viceversa cuando haga falta.

Ejemplos:
- filas Drift a modelos de dominio
- combinacion de datos de varias tablas en un unico modelo
- traducciones simples entre formatos de almacenamiento y dominio

Los mappers no deberian hablar con la base de datos ni contener logica de acceso a datos. Su responsabilidad es solo transformar.

### `repositories/`
Punto de entrada para leer y escribir datos desde la app.
Los repositories coordinan DAOs, mappers y reglas de acceso para exponer una API estable hacia la capa superior.

Ejemplos:
- obtener listas o detalles
- crear, actualizar, borrar o restaurar registros
- combinar varias consultas antes de devolver un modelo de dominio

## Regla practica

- Si solo transforma datos, va en `mappers/`.
- Si coordina consultas, persistencia o lectura/escritura, va en `repositories/`.
- Si la logica empieza a ser de negocio puro, debe moverse al dominio.

## Lo que no deberia ir aqui

No deberian vivir en `data` las reglas de negocio principales, los widgets de UI ni la definicion de tablas o DAOs.
`data` debe servir como puente entre dominio e infraestructura, no como lugar para mezclar capas.
