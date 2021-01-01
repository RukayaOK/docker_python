FROM python:3.7-alpine as builder
LABEL stage=builder
ARG SRC_DIR=/src/usr/app

WORKDIR /src/usr/app
COPY . .
RUN apk update && \
        apk add build-base && \
        pip3 install -r requirements.txt


FROM python:3.7-alpine
LABEL maintainer="Rukaya Ogazi-Khan, rukaya@test.com"
ENV ENV_VAR=development
ENV PORT 5000
ARG VERSION=1.1
ARG SRC_DIR=/src/usr/app

WORKDIR $SRC_DIR
COPY --from=builder /src/usr/app .
COPY --from=builder /usr/local/lib/python3.7 /usr/local/lib/python3.7
COPY --from=builder /usr/local/bin/gunicorn /usr/local/bin/gunicorn
EXPOSE $PORT

ENTRYPOINT gunicorn v1.run:app -w 3 -b 0.0.0.0:$PORT