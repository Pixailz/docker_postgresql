ARG					TAG=edge

FROM				alpine:${TAG} AS base

RUN					apk add --upgrade --progress --virtual dependencies \
						postgresql \
						dumb-init \
					&& rm -f /var/cache/apk/*

#=#=#

FROM				base AS packed

COPY				--chown=root:root --chmod=755 entrypoint /run

# https://www.postgresql.org/docs/current/server-shutdown.html
## Smart Shutdown
STOPSIGNAL	SIGTERM
## Fast Shutdown
# STOPSIGNAL	SIGINT
## Immediate Shutdown
# STOPSIGNAL	SIGQUIT

ENV					PGDATA="/var/lib/postgresql"
ENV					PGDB="db"
ENV					PGPORT="5432"
ENV					PGUSER="postgres"
ENV					PGPASS="pass"
ENV					PGLADDR="*"
ENV					PGHBA="host all all all md5"
ENV					DOCKER_DEBUG=""

ENTRYPOINT	[ "dumb-init", "/run/entrypoint" ]
