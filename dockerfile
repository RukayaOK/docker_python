FROM python:3.7
LABEL maintainer="Rukaya Ogazi-Khan, rukaya@test.com"
ENV ENV_VAR=development
ENV PORT 5000
ARG VERSION=1.1
ARG SRC_DIR=/src/usr/app

WORKDIR $SRC_DIR
COPY . .
RUN pip3 install -r requirements.txt
EXPOSE $PORT

ENTRYPOINT gunicorn v1.run:app -w 3 -b 0.0.0.0:$PORT