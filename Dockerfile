FROM ubuntu:latest

# Actualizar lista de paquetes e instalar Python
RUN apt-get update && apt-get install -y python3

# Actualizar nuevamente para evitar errores y luego instalar los paquetes necesarios
RUN apt-get update && \
    apt-get install -y --fix-missing git iputils-ping && \
    echo "1.0" >> /etc/version && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

ENTRYPOINT [ "/bin/bash" ]