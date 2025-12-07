FROM mcr.microsoft.com/windows/nanoserver:ltsc2025
WORKDIR /install
COPY install_*.cmd ./
USER ContainerAdministrator
RUN install_iis.cmd
RUN install_ssh_client.cmd
USER ContainerUser
CMD ["ping", "-t", "localhost"]
