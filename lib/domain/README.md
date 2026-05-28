# domain

Esta capa contiene el modelo y las reglas puras del negocio.
Aqui viven los objetos que describen el dominio de la app y las reglas que no deben depender de Flutter, de la base de datos ni de la interfaz.

## Estructura

```text
domain/
  filters/
  models/
```

## Que va en cada carpeta

### `models/`
Modelos de dominio puros.
Representan entidades o conceptos centrales de la aplicacion y deben permanecer independientes de la infraestructura.

Ejemplos:
- reviews
- items
- folders
- categories

Estos modelos no deberian depender de JSON, Drift o widgets. Su trabajo es expresar el negocio de forma estable.

### `filters/`
Objetos de criterio para consultar o acotar informacion de dominio.
Sirven para agrupar parametros de busqueda o filtrado sin llenar la app de listas de argumentos sueltos.

Ejemplos:
- filtros por rating
- filtros por fecha
- filtros por relacion con otro objeto del dominio

## Regla practica

- Si representa un concepto del negocio, va en `models/`.
- Si agrupa criterios de filtrado o consulta del dominio, va en `filters/`.
- Si necesita acceder a datos, UI o framework, ya no pertenece aqui.

## Lo que no deberia ir aqui

No deberian vivir en `domain` los repositories, DAOs, widgets ni helpers de presentacion.
Esta capa debe seguir siendo la parte mas estable y menos dependiente del proyecto.
