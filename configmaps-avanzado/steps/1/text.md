# Importante: SCC

Nosotros necesitamos correr el siguiente comando, para poder ejecutar como root los pods de nginx
`oc adm policy add-scc-to-user anyuid -z default`{{execute}}

