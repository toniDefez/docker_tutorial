FROM ubuntu:latest

# Actualizar lista de paquetes e instalar Python
RUN apt-get update && apt-get install -y python3

# Actualizar nuevamente para evitar errores y luego instalar los paquetes necesarios
RUN apt-get update && \
    apt-get install -y --fix-missing git iputils-ping && \
    echo "1.0" >> /etc/version && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

##WORKDIR ##
RUN mkdir /datos
WORKDIR /datos
RUN touch f1.txt
RUN mkdir /datos2
WORKDIR /datos2
RUN touch f2.txt

#ENV 
ENV dir=/data dir1=/data1D
RUN mkdir $dir && mkdir $dir1
ENV TEXTO="Esto es un ejemplo de texto"

CMD echo $TEXTO

#COPY
COPY index.html . 
COPY app.log /datos

#ADD
ADD docs docs
ADD f* /datos/
ADD f.tar . 

