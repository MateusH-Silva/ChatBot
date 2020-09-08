FROM ruby:2.5.1-slim
#instala as nossas dependências
RUN apt-get update && apt-get install -qq -y --no-install-recommends \
    build-essential libpq-dev

#seta nosso path
ENV INSTALL_PATH /onebitbot
#cria nosso diretório
RUN mkdir -p $INSTALL_PATH
#seta nosso path como diretório principal
WORKDIR $INSTALL_PATH
#copia o nosso gemfile pra dentro do container
COPY Gemfile ./
#instala as gems
RUN bundle install
#copia nosso código para dentro do container
COPY . .
#roda nosso servidor
CMD rackup config.ru -o 0.0.0.0
