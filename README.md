# Server Jenkis

## Inicializar
Para inicializar usamos el comando `docker-compose up` esto levantara el contenedor el el jeckkins:

```sh
docker-compose up -d 
```
Para acceder a jeckins entramos `localhost:9078` al inicar jeckins nos pedira una contraseña que jecnkins ya genero, para poder ver la contraseña usaremos `docker logs`
```sh
docker logs jenkins
```
cundo ejecutemos el `docker logs` en terminal nos saldra la contrasela que jecnkis nos creo.   

![pass_jenkins](jenkins-pass.png)