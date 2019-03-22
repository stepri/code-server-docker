FROM codercom/code-server
RUN apt-get update && apt-get -y upgrade

# VSCode extensions
RUN apt-get install -y bsdtar curl
RUN mkdir -p /root/.code-server/extensions
RUN curl -JL https://marketplace.visualstudio.com/_apis/public/gallery/publishers/MS-vsliveshare/vsextensions/vsliveshare-pack/0.2.10/vspackage | bsdtar -xvf - extension
RUN mv extension /root/.code-server/extensions/ms-vsliveshare.vsliveshare-0.3.1326

CMD ["code-server", "--allow-http", "--no-auth"]
