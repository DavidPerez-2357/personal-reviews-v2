# lib

Esta carpeta contiene la aplicacion Flutter y su organizacion principal por capas.
La idea es separar responsabilidades para que cada parte del codigo tenga un proposito claro y sea facil de mantener.

## Capas principales

- [core](core/README.md): piezas transversales, tipos, extensiones y utilidades compartidas.
- [shared](shared/README.md): widgets, componentes y layouts reutilizables entre features.
- [domain](domain/README.md): modelos y reglas puras del negocio.
- [data](data/README.md): traduccion y acceso a fuentes de datos.
- [database](database/README.md): persistencia local con Drift y SQLite.
- [features](features/README.md): capacidades y pantallas organizadas por funcionalidad.
- [style](style/README.md): sistema visual, tema y tokens de la app.

## Entrada de la app

- `main.dart`: punto de arranque de Flutter.

## Regla general

Cada carpeta debe contener solo la responsabilidad que le corresponde.
Si una pieza empieza a depender de otra capa sin necesidad, normalmente conviene moverla al lugar correcto y dejar aqui solo lo transversal o lo especifico de su capa.