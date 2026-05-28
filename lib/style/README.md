# style

Esta carpeta define el sistema visual de la aplicacion.
Aqui se concentran los tokens de color, espaciado, tipografia y temas de Material para mantener una apariencia coherente en toda la app.

## Estructura

```text
style/
  theme/
```

## Que va en cada carpeta

### `theme/`
Configuracion central del tema de la app y sus piezas relacionadas.
Aqui deben vivir los valores visuales reutilizables que se aplican de forma global.

Ejemplos:
- paleta de colores
- tema general de Material
- estilos de botones
- estilos de inputs
- espaciado tipografico y bordes

## Regla practica

- Si es un valor visual base, va en `theme/`.
- Si define el aspecto global de la app, tambien va aqui.
- Si un widget necesita un ajuste puntual, no deberia convertirlo en una nueva constante de estilo global sin necesidad.

## Lo que no deberia ir aqui

No deberian vivir aqui pantallas, componentes funcionales ni logica de negocio.
`style` solo debe encargarse de la capa visual compartida.
