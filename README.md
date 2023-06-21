## DESARROLLO LOCAL

El siguiente demo es un exportador de contactos dinamico con el cual un usuario puede cargar diferentes tipos de CSV, definir el esquemay hacer match contra los campos necesarios y se procede a importar los datos.

Setup:
  - rails db:create
  - rails db:migrate

Run
  - Run aplication: rails s 
  - Run test: rails rspec

Files to test:

- Case 1: 
  - header: name,birthdate,phone,address,credit_card_number,email
  - path: /csv_files/same_order_to_columns.csv


- Case 2:
    - header: birthdate,name ,last_name,cellphone,age,sex,card_number,email,approved,address
    - path: /csv_files/same_order_to_columns.csv

## CI/CD

### Docker

Dentro de la raiz del proyecto se encuentran los archivos Dockerfile y docker-compose.yml.

Setup: 
- docker-compose built
- docker-compose up

### Github Workflows

1.- Merge/Push on Main
  - Docker image test
  - Rspec Test

2.- Publish on release (tag)
  - Publish docker image to docker hub

## Deploy

- You need create a new release and tag from main branch and this trigger and workflow to publish the docker image to docker hub.
- In any cloud you need create an *app* and listen when a new image is publish in the registry
- When you listen that there is a new image you have to run the docker-compose-up and docker-compose-build

### TODO:
- Encrypt
- Sidekiq
- Add ENV or Secrets in docker-compose