# Topicos Especiales de Telematica - Reto 4 - Julián David Bueno Londoño
## Paso 1 - Creación del RDS
Se accede al servicio RDS de AWS.  
Se crea la base de datos RDS con MySQL
![](./images/1.png)
Se revisa que la opcion de "publicly accessible" este checada
![](./images/1-5.png)
Se guarda el Endpoint y el puerto de la base de datos
![](./images/2.png)

## Paso 2 - Creación del EFS
Se accede al servicio EFS de AWS.  
Se crea el Elastic File System
![](./images/3.png)
Se guarda el DNS Name
![](./images/4.png)

## Paso 3 - Creación del Moodle
- Se accede al servicio EC2 de AWS.  
- Se crea una nueva instancia de Ubuntu con puertos 22 y 80 abiertos.
![](./images/5.png)
- Se accede a la instancia Ubuntu creada por medio de ssh.  
- Se clona el repositorio `git clone https://github.com/jdbuenol/TET-Reto4.git`  
- Se accede al repositorio `cd TET-Reto4`  
- Se instala las EFS tools de Amazon `sudo sh installEFSTools.sh`  
- Se edita el archivo `mount.sh` cambiando la variable nfs por el DNS name del EFS  
- Se monta el EFS en la instancia de ubuntu `sudo sh mount.sh`  
- Se instala php y los paquetes necesarios para moodle `sudo sh installPhp.sh`
- Se instala Apache2 y se pone a correr el Moodle `sudo sh startMoodle.sh`
- Poner el DNS apuntando a la IP publica de la instancia de Ubuntu
![](./images/6.png)

## Paso 4 - Configuración del Moodle
- Se accede a la ip publica con url moodle `http://34.201.70.101/moodle`
![](./images/7.png)
- Se asigna el directorio del EFS como Data Directory en mi caso `/moodle_data`
![](./images/8.png)
- Se elige MySQL como el database driver
![](./images/9.png)
- Se crea una conexion entre la base de datos de RDS con la instancia de Ubuntu
![](./images/10.png)
- Se llena la configuración de la base de datos con los datos del RDS
![](./images/11.png)
- Se acepta el copyright y se espera a que la instalación de Moodle haga efecto
![](./images/12.png)
- Se llenan los datos generales
![](./images/13.png)
- Se llenan los datos del sitio
![](./images/14.png)
- Se registra el sitio
![](./images/15.png)
- Se visualiza el sitio web ya funcional
![](./images/16.png)
- Se edita el archivo '/var/www/html/moodle/php.config' modificando la variable wwwroot cambiando la ip por el dominio
![](./images/17.png)

## Paso 5 - Creación de la AMI 
- Se selecciona la instancia de Ubuntu y se crea la imagen
![](./images/18.png)
![](./images/19.png)

## Paso 6 - Creación del LoadBalancer

- Se crea una LaunchTemplate usando la AMI creada en el paso anterior
![](./images/20.png)
- Se crea un TargetGroup
![](./images/21.png)
- Se crea un Application LoadBalancer
![](./images/22.png)
- Se guarda el DNS Name del LoadBalancer
![](./images/23.png)
- Se crea un autoscaling group
![](./images/24.png)
- Se utiliza el comando dig con el DNS Name del LoadBalancer para encontrar las ips del LoadBalancer
![](./images/25.png)
- Se actualiza el DNS con una ip del LoadBalancer
![](./images/26.png)
- Finalmente se accede al dominio con la url /moodle para apreciar el sitio web
![](./images/27.png)