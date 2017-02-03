FROM centos:centos7
MAINTAINER milechainsaw (milechainsaw@gmail.com)

RUN yum -y update; yum clean all
RUN yum -y install epel-release
RUN yum -y install python-pip python-dev git sqlite;yum clean all
RUN pip install --upgrade pip

RUN pip install Flask
RUN git clone https://github.com/pallets/flask.git
RUN mv flask/examples/flaskr/ .
RUN rm -rf flask
WORKDIR flaskr
RUN pip install --editable .
ENV FLASK_APP flaskr
RUN flask initdb

EXPOSE 5000

ENTRYPOINT [ "flask" ]
CMD ["run", "--host=0.0.0.0"]
