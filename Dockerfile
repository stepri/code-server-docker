FROM codercom/code-server
RUN apt-get update && apt-get -y upgrade

RUN apt update \
    && apt upgrade -y \
    && apt install -y wget curl gnupg2 software-properties-common \ 
    && curl -sL https://deb.nodesource.com/setup_8.x | bash - \ 
    && apt install -y nodejs apt-transport-https lsb-release ca-certificates \ 
    && wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg \ 
    && sh -c 'echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list' \ 
    && add-apt-repository ppa:deadsnakes/ppa \
    && apt update \ 
    && apt install -y nginx composer zip unzip install -y bsdtar curl wget golang-go python3.7 git \ 
    php7.2-xml php7.2-fpm php7.2-cli php7.2-curl php7.2-bcmath php7.2-mbstring

RUN npm install -g eslint

RUN mkdir -p /root/.code-server/extensions
RUN curl -JL https://marketplace.visualstudio.com/_apis/public/gallery/publishers/MS-vsliveshare/vsextensions/vsliveshare/0.3.1326/vspackage | bsdtar -xvf - extension
RUN mv extension /root/.code-server/extensions/ms-vsliveshare.vsliveshare-0.3.1326
RUN rm -rf extension
RUN curl -JL https://marketplace.visualstudio.com/_apis/public/gallery/publishers/MS-vsliveshare/vsextensions/vsliveshare-pack/0.2.10/vspackage | bsdtar -xvf - extension
RUN mv extension /root/.code-server/extensions/ms-vsliveshare.vsliveshare-pack-0.2.10

RUN wget -O ~/vsls-reqs https://aka.ms/vsls-linux-prereq-script && chmod +x ~/vsls-reqs && ~/vsls-reqs

CMD ["code-server", "--allow-http", "--no-auth"]
