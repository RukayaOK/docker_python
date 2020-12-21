FROM centos:latest
LABEL rukaya@test.com
ENV ENV_VAR="development"
ENV PORT 5000
ARG SRC_DIR=/src/usr/app

RUN yum update -y && \
	yum install -y python3 && \
	yum -y install python-setuptools && \
	yum install -y git

RUN mkdir -p $SRC_DIR && \
	cd $SRC_DIR && \
	git clone https://github.com/RukayaOK/docker.git &&\
	python3 -m venv docker/venv && \
	cd docker && \
	source venv/bin/activate && \
	pip3 install -r requirements.txt && \
	deactivate

EXPOSE $PORT

ENTRYPOINT /usr/src/app/docker/venv/bin/gunicorn -w 3 --bind 0.0.0.0:5000 run:app