# shared

Esta carpeta agrupa piezas reutilizables de interfaz que no pertenecen a una sola feature.
La idea es evitar duplicar UI, mantener consistente el estilo de la app y separar la estructura visual de la logica de dominio.

## Estructura

```text
shared/
  components/
  errors/
  layouts/
  presentation/
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

### `errors/`
Definicion de errores y excepciones comunes.
Aqui pueden vivir clases de error que se usan en varias features o que representan fallos comunes en la app, como errores de validacion, de red o de acceso a datos.
El objetivo es centralizar la definicion de errores para evitar duplicacion y mantener un manejo consistente de fallos en toda la app.

Ejemplos:
- errores de validacion de formularios
- excepciones de red o de acceso a datos
- errores de base de datos o de infraestructura


### `layouts/`
Contenedores de pagina y estructuras reutilizables.
Se usan para definir la composicion general de una pantalla: `Scaffold`, `AppBar`, paddings, scroll, area segura y disposicion general del contenido.

Ejemplos:
- layouts secundarios o de detalle
- estructuras comunes de paginas con navegacion y acciones compartidas

### `presentation/`
Presentadores y adaptadores de UI: aquí pueden ir mappers, presenters o pequeñas capas de presentación
que adaptan modelos de dominio a vistas (por ejemplo, formatos de texto, view models sencillos o
helpers que traducen estados a widgets). No es para lógica de negocio compleja, sino para transformación
ligera orientada a la UI.


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