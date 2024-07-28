# Define the name of the Kafka container
KAFKA_CONTAINER_NAME := kafka-container

# Docker Compose file
DOCKER_COMPOSE_FILE := docker-compose.yaml

# Command to bring up Docker Compose
up:
	docker-compose -f $(DOCKER_COMPOSE_FILE) up -d --build

# Command to create a Kafka topic
create-topic:
	docker exec -it $(KAFKA_CONTAINER_NAME) kafka-topics.sh --create --topic testing-topic --bootstrap-server localhost:9092 --partitions 1 --replication-factor 1 --config cleanup.policy=delete

# Command to describe Kafka topic configurations
describe-topic:
	docker exec -it $(KAFKA_CONTAINER_NAME) kafka-configs.sh --describe --entity-type topics --entity-name testing-topic --bootstrap-server localhost:9092

# Command to produce messages to a Kafka topic
produce-messages:
	docker exec -it $(KAFKA_CONTAINER_NAME) kafka-console-producer.sh --topic testing-topic --bootstrap-server localhost:9092

# Command to consume messages from a Kafka topic
consume-messages:
	docker exec -it $(KAFKA_CONTAINER_NAME) kafka-console-consumer.sh --topic testing-topic --bootstrap-server localhost:9092 --from-beginning

# Command to run all tasks
all: create-topic describe-topic produce-messages consume-messages

# Help target to list all available commands
help:
	@echo "Available commands:"
	@echo "  make up              Start Docker containers with Docker Compose"
	@echo "  make create-topic    Create a Kafka topic"
	@echo "  make describe-topic  Describe Kafka topic configurations"
	@echo "  make produce-messages Produce messages to Kafka topic"
	@echo "  make consume-messages Consume messages from Kafka topic"
	@echo "  make all             Run all commands sequentially"
