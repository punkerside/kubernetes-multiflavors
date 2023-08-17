ARG IMG
FROM ${IMG} as build
RUN apk add --no-cache go bash
COPY docker/init.sh /usr/bin/init.sh
CMD [ "/usr/bin/init.sh" ]

FROM ${IMG} as latest
RUN apk add --no-cache go
COPY app/music/run-app run-app
CMD [ "./run-app" ]