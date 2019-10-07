# Run docker container with kafka client: docker-compose up before running

# Create topic named test
kafka-topics.sh --create --bootstrap-server localhost:9092 --replication-factor 1 --partitions 1 --topic test

# List topis
echo "Topic are"
kafka-topics.sh --list --bootstrap-server localhost:9092

# Write test message
echo "Writing a test message"
echo "this is a test message" | kafka-console-producer.sh --broker-list localhost:9092 --topic $1 test

# Listen to messages (init a consumer)
echo "Start listener/consumer"
kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic test --from-beginning

