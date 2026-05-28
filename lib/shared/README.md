# shared

Esta carpeta agrupa piezas reutilizables de interfaz que no pertenecen a una sola feature.
La idea es evitar duplicar UI, mantener consistente el estilo de la app y separar la estructura visual de la logica de dominio.

## Estructura

```text
shared/
  components/
  layouts/
  widgets/
```

## Que va en cada carpeta

### `components/`
Componentes visuales reutilizables con comportamiento propio.
Aqui pueden vivir piezas que no son una pantalla completa, pero si resuelven una necesidad concreta de UI y pueden concentrar logica de presentacion o interaccion relacionada con ese componente.

Ejemplos:
- un display de rating
- una tarjeta reutilizable con reglas de presentacion
- un bloque de UI que combina varios widgets pequenos

No deberian contener logica de dominio de una feature concreta. Si la logica describe reglas del negocio de una pantalla o caso de uso, debe vivir en la feature o en la capa de dominio correspondiente.

### `layouts/`
Contenedores de pagina y estructuras reutilizables.
Se usan para definir la composicion general de una pantalla: `Scaffold`, `AppBar`, paddings, scroll, area segura y disposicion general del contenido.

Ejemplos:
- layouts secundarios o de detalle
- estructuras comunes de paginas con navegacion y acciones compartidas

### `widgets/`
Widgets reutilizables de menor nivel, normalmente mas cercanos a un bloque tecnico que a una pantalla.
Su foco es encapsular una interaccion especifica o una integracion concreta con APIs de Flutter.

Ejemplos:
- menus anclados
- mappers entre tipos de dominio y widgets de Flutter
- wrappers pequenos sobre widgets nativos

## Regla practica

- Si define la estructura general de una pantalla, va en `layouts/`.
- Si resuelve una pieza reutilizable con comportamiento propio, va en `components/`.
- Si encapsula un widget tecnico o una integracion puntual de Flutter, va en `widgets/`.

## Objetivo

Mantener esta carpeta como un punto de reuso claro. Si una pieza empieza a depender demasiado de una feature o de reglas de negocio especificas, conviene moverla a esa feature y dejar en `shared/` solo lo que realmente sea transversal.