# Smart Tree Server

### Stack

* Ruby 2.6.3
* Rails 5.2.3
* Postgresql 11.3
* Influxdb 1.5.4
* Grafana 6.2.5
* Docker
* Docker compose
* Kubernetes [futuro]

### Sobre o projeto

O projeto visa aumentar o controle sobre as árvores em grandes centros urbanos, previnindo acidentes, e melhorando a manutenção. O sistema segue a arquitetura fog networking e micro serviços, visando criar uma arquitetura escalável.

As árvores são divididas em regiões chamadas jardins, cada `jardim` é uma área monitorada por um [client](https://github.com/matheusam/smart_tree_client)(Um raspberry pi com sensores). No sistema é possível cadastrar um novo jardim, com o nome do host, latitude e longitude. Ao ser criado, ele gera um QR code para que possa ser identificado mais rapidamente.
No client serão coletadas métricas de sensores, que após serem filtradas serão enviadas para o server.

Dentro desse jardim, é possível criar uma `árvore`, fora os atributos da árvore, como número de registro, nome da espécie, entre outros, temos também a latitude e longitude, a qual jardim pertence, que também gera outro QR code usando essas informaçõoes para idetificar uma árvore de maneira única.

Também é possível cadastrar `pódas` efetuadas em uma árvore, onde se escaneia o QR code da árvore, e preenche um formulário informando o tipo da poda e anotações gerais.

Na tela inicial é mostrado o monitoramento, que é um gráfico do tipo WordMap do `Grafana`, essas informações serão carregados do `Influxdb` do lado do servidor, na qual armazenará apenas métricas filtradas.
O `Influxdb` é utilizado para armazenar métricas temporais, enquanto o `Postgresql` armazena informações de localização e histórico das árvores.

As informações cadastrais serão fechadas ao público, porém haverá um endpoint público na API para a consulta de árvores.

### Projeto

[Projeto no Trello](https://trello.com/b/OMZl5d5Q/smart-tree)

### Instalação

* `git clone https://github.com/matheusam/smart_tree_server`
* `cd smart_tree_server`
* Para iniciar
* `docker-compose build && docker-compose up`
* Abra outro terminal para acessar o container e digite o comando
* `docker-compose exec web bash`
* `bin/setup`

O servidor web estará disponível na porta `80`, e o granafa na porta `3000`


### TODO

* API - endpoint de métricas
* API - endpoint de busca de árvores
* GRAFANA - Mostrar wordmap na página inicial
* JOBS - Notificar árvores sem poda
* JOBS - Notificar árvores com indicadores de más condições
