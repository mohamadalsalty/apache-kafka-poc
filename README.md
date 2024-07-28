# Apache Kafka PoC

This project uses Docker Compose to set up a Kafka container and provides commands to manage Kafka topics and messages.

## Requirements

- Docker
- Docker Compose

## Commands

### Start Docker Containers

To start the Kafka container, run:

```bash
make up
```

### Create Kafka Topic

To create a Kafka topic named `testing-topic`, run:

```bash
make create-topic
```

### Describe Kafka Topic

To describe the configurations of the Kafka topic `testing-topic`, run:

```bash
make describe-topic
```

### Produce Messages

To produce messages to the Kafka topic `testing-topic`, run:

```bash
make produce-messages
```

### Consume Messages

To consume messages from the Kafka topic `testing-topic`, run:

```bash
make consume-messages
```

### Run All Commands

To run all commands sequentially (create topic, describe topic, produce messages, consume messages), run:

```bash
make all
```

### Help

To list all available commands, run:

```bash
make help
```

## Docker Compose File

The `docker-compose.yaml` file defines the Kafka container configuration. Ensure it is properly configured to match your Kafka setup needs.

