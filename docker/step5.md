## Objetivo: actualización del motor de BB.DD. sin perder información

## Indicaciones
- Crearemos un contenedor `postgres` con un volumen `psql-data`, usando la imagen oficial `postgres 9.6.1`
- Miraremos en _Docker Hub_ qué ruta necesitamos para los volúmenes.
- Comprobamos los logs y paramos el contenedor.
- Crearemos un nuevo contenedor `postgres`, con el mismo volumen asociado, usando esta vez la imagen oficial de la versión `postgres 9.6.2`.
- Comprobamos los logs para ver que todo ha ido bien.

> *Fuente:* Adaptado del curso _Udemy_ [_Docker Mastery_](https://www.udemy.com/docker-mastery/learn/v4/content), de [Brent Fisher](https://www.bretfisher.com/)
