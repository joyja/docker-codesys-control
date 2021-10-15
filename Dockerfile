#
# Install CODESYS on a plain Debian container
#
FROM debian:buster

RUN apt-get update && \
    apt-get install -y wget unzip

#
# Add CODESYS package
#
# download package and extract it
RUN wget --output-document=codesys.package 'https://store.codesys.com/ftp_download/3S/LinuxSL/2302000005/4.2.0.0/CODESYS%20Control%20for%20Linux%20SL%204.2.0.0.package' && \
    unzip -p codesys.package '*codemeter*.deb' > codemeter.deb && \
    unzip -p codesys.package '*codesys*.deb' > codesys.deb

# install
RUN dpkg -i codemeter.deb
RUN dpkg -i codesys.deb

WORKDIR /var/opt/codesys/
CMD [ "/opt/codesys/bin/codesyscontrol.bin", "/etc/CODESYSControl.cfg" ]