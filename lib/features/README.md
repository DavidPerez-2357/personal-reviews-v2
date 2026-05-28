# features

Esta carpeta agrupa las capacidades de la aplicacion por area funcional.
Aqui deberian vivir las pantallas, flujos, componentes y logica especifica de cada feature.

## Estructura

```text
features/
  app_shell/
```

## Que va en cada carpeta

### carpetas de feature
Cada feature debe contener todo lo que necesita para funcionar de forma cohesionada.
Eso incluye UI, estado, coordinacion de acciones y componentes propios de esa funcionalidad.

Ejemplos:
- shell principal de la app
- flujo de listado o detalle
- acciones y widgets exclusivos de una seccion

## Regla practica

- Si algo pertenece a una funcion concreta de la app, debe vivir dentro de su feature.
- Si algo se reutiliza en varias features, probablemente no pertenece aqui y debe moverse a `shared/`, `core/` o `style/` segun corresponda.

## Lo que no deberia ir aqui

No deberian mezclarse aqui modelos de dominio puros, helpers globales ni estilos base.
`features` es para organizacion por producto o capacidad, no para utilities genericas.
