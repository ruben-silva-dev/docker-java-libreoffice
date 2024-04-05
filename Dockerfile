# Use a imagem base do Amazon Corretto 17
FROM amazoncorretto:17

# Atualiza a lista de pacotes e instala o LibreOffice
RUN yum update -y && \
    yum install wget tar libXinerama dbus cairo cups-libs -y && \
    wget https://downloadarchive.documentfoundation.org/libreoffice/old/7.6.5.2/rpm/x86_64/LibreOffice_7.6.5.2_Linux_x86-64_rpm.tar.gz && \
    tar -xvf LibreOffice_*.tar.gz && \
    cd LibreOffice_* && \
    yum localinstall RPMS/*.rpm -y && \
    rm -rf /LibreOffice_*

RUN mv /usr/bin/libreoffice7.6 /usr/bin/libreoffice