# core

Esta carpeta agrupa piezas transversales del proyecto.
Aqui viven contratos, helpers y definiciones reutilizables que no dependen de una feature concreta ni de una capa de infraestructura.

## Estructura

```text
core/
  constants/
  enums/
  extensions/
  types/
  utils/
```

## Que va en cada carpeta

### `constants/`
Valores fijos compartidos por toda la app.
Se usan para evitar repetir literales y centralizar configuraciones estaticas.

Ejemplos:
- claves de navegacion
- valores por defecto
- nombres o rutas reutilizadas

### `enums/`
Enumeraciones del dominio tecnico de la app o de la UI.
Sirven para representar estados cerrados o variantes conocidas sin usar cadenas sueltas.

Ejemplos:
- tipos de color
- modos de operacion
- estados pequeños y finitos

### `extensions/`
Extensiones de Dart o Flutter que agregan helpers de uso general.
La idea es hacer mas expresivo el codigo sin duplicar logica en muchos widgets o clases.

Ejemplos:
- acceso a `Theme.of(context)` desde `BuildContext`
- helpers sobre tipos comunes de Flutter

### `types/`
Clases de apoyo que modelan datos simples y reutilizables de la app.
Suelen ser objetos pequenos para pasar informacion entre widgets, layout o casos de uso de UI.

Ejemplos:
- configuraciones de pagina
- acciones de menu
- objetos de soporte para la interfaz

### `utils/`
Funciones puras y helpers genericos.
Aqui deberian ir operaciones pequeñas y reutilizables que no necesitan estado ni una clase completa.

Ejemplos:
- conversiones de color
- formateos simples
- funciones auxiliares sin dependencia fuerte de una feature

## Regla practica

- Si es una constante compartida, va en `constants/`.
- Si representa un conjunto finito de opciones, va en `enums/`.
- Si mejora la legibilidad de una API existente, va en `extensions/`.
- Si modela un dato sencillo de soporte, va en `types/`.
- Si es una funcion pura de ayuda, va en `utils/`.

## Lo que no deberia ir aqui

No deberian vivir en `core` los modelos de negocio completos, repositorios, acceso a datos ni logica especifica de una feature.
Si algo empieza a depender demasiado de una pantalla o de un caso de uso concreto, conviene moverlo a la capa correspondiente y dejar en `core` solo lo verdaderamente transversal.