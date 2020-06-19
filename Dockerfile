FROM ubuntu
RUN apt-get update  
RUN  apt-get -y install apache2
ADD index.html /var/wwww/html
CMD apachectl - D  FOREGROUND
ENTRYPOINT apachectl - D  FOREGROUND
ENV name Devops intellipaat
EXPOSE 80

