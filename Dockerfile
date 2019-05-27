FROM codercom/code-server
RUN apt-get update && apt-get -y upgrade

RUN apt update \
    && apt upgrade -y \
    && apt install -y wget curl gnupg2 software-properties-common \ 
    && curl -sL https://deb.nodesource.com/setup_8.x | bash - \ 
    && apt install -y nodejs apt-transport-https lsb-release ca-certificates \ 
    && apt update \ 
    && apt install -y nginx composer zip unzip bsdtar curl wget golang-go git \ 
    php7.2-xml php7.2-fpm php7.2-cli php7.2-curl php7.2-bcmath php7.2-mbstring \
    python python-dev python-all python-all-dev \
    python-numpy python-scipy python-matplotlib python-cycler \
    python-dateutil python-decorator python-joblib python-matplotlib-data \
    python-tz \
    python2.7 python2.7-dev \
    python3 python3-dev python3-numpy python3.5

RUN npm install -g eslint

CMD ["code-server", "--allow-http", "--no-auth"]
