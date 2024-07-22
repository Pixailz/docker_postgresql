# PostgreSQL Docker Image

This Docker image provides a simple and configurable PostgreSQL server, based on
Alpine Linux. It is designed to be lightweight and easy to use, with support for
custom configurations through environment variables.

## Tags

The default name for the image is `postgresql`, but it is also available under
the following tags

[![CI for a PostgreSQL Docker image](https://github.com/Pixailz/docker_postgresql/actions/workflows/CI.yaml/badge.svg)](https://github.com/Pixailz/docker_postgresql/actions/workflows/CI.yaml)

Tag|Description|
|:-|:-|
|`edge`|This tag is based on `alpine:edge`. It is suitable for users who want the latest features and are willing to accept the risk of edge releases.|
|`latest`|This tag is based on `alpine:latest`. It offers a more stable environment compared to the edge version.|

## Quick Start

### Building the Image

To build the image yourself, you can use the provided [Makefile](Makefile):

```bash
make TARGET=latest
```

### Running the Image

Replace *latest* with *edge* to build the edge version.

To run the PostgreSQL server:

```bash
docker run --rm -e PGUSER=myuser -e PGPASS=mypass -e PGDB=mydb postgresql:latest
```

This command starts a PostgreSQL server a database named mydb, a user myuser, and a password mypass.

## Environment Variables

|Name|Description|Default|
|:-|:-|:-|
|`PGDATA`|The root directory for PostgreSQL data.|`/var/lib/postgresql`|
|`PGDB`|The default database name.|`db`|
|`PGUSER`|The default user name.|`postgres`|
|`PGPASS`|The password for the default user.|`pass`|
|`PGPORT`|The port PostgreSQL listens on.|`5432`|
|`PGLADDR`|The listen addresses for PostgreSQL.|`*`|
|`PGHBA`|The host-based authentication configuration.|`host all all all md5`|
|`DOCKER_DEBUG`|Set to any value to enable debugging output.||

## Customization

You can customize the PostgreSQL configuration by modifying the [entrypoint](entrypoint) script or by providing your own configuration files and mounting them into the container.

For more advanced usage and customization, refer to the official PostgreSQL documentation.
