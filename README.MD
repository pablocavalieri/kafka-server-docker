Ejemplo de cómo levantar un servidor Kafka con docker, luego escribir y leer desde la máquina host del docker

Correr docker-compose up desde el directorio en donde se encuentra el archivo docker-compose.yml, que contiene instrucciones para levantar dos containers
zookeeper: el motor de manejo de nodos en un sistema distribuido. Kafka lo utiliza para orquestar el envío de mensajes entre las réplicas y particiones
kafka versión 2.11-2.0.0: el servidor kafka
Este comando levanta un docker con el servido kafka en la máquina host, en el puerto 9092

Crear un topic, que es una entidad de kafka que identifica un repositorio de mensajes, para que los clientes del servidor produzcan (escriban) y consuman (lean)
Desde la máquina host, correr
kafka-topics.sh --create --bootstrap-server localhost:9092 --replication-factor 1 --partitions 1 --topic test
Esto crea el topic "test" en el servido localizado en localhost:9092

Para lista los topics
kafka-topics.sh --list --bootstrap-server localhost:9092

Se puede escribir al topic con el comando
kafka-console-producer.sh --broker-list localhost:9092 --topic test
que abre una consola para ingresar strings. Se sale con Ctrl+c

Para leer los mensajes
kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic test --from-beginning
inicia un consumidor (lector) del topic "test" en el servidor levantado en la máquina host en el puerto 9092
