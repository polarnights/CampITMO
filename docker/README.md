# Контейнеризация приложения docker
#### Используем облачные сервисы [yandex.cloud](https://yandex.cloud/ru/)

## Сначала необходимо убедиться, что все собирается в локальном docker

#### В проекте необходимо создать файл ***Dockerfile*** и вставить следущее:

```dockerfile
FROM python:3.10-bullseye
WORKDIR /usr/src/app
COPY . .
RUN apt-get update -y
RUN apt-get install -y python3-pipRUN apt-get install -y python3
RUN pip3 install -r requirements.txtRUN pip3 install -r requirements-server.txt
RUN python3 seed.py
CMD ["gunicorn", "app:app", "-b", "0.0.0.0:8000"] 
```


### Далее необходимо создать реестр в облаке(см. [документацию](https://yandex.cloud/ru/docs/container-registry/operations/registry/registry-create)), для этого необходимо перейти по [ссылке](https://yandex.cloud/ru/docs/cli/quickstart#install)

--- 

### Потом необходимо аутентифицироваться в [реестре](https://yandex.cloud/ru/docs/container-registry/operations/authentication)

### Выполняем следущие шаги в консоли:

1. `docker tag ubuntu cr.yandex/<идентификатор_реестра>/<имя_Docker-образа>:<тег>` \
   ubuntu - имя существующего образа, который мы хотим перетегировать \
   `<идентификатор_реестра>` — уникальный идентификатор вашего реестра в Yandex. \
   `<тег>` — версия или метка для образа, например latest или v1.0. 

2. Предварительно изменить `<имя_докера>` на `cr.yandex/<идентификатор_реестра>/` \
   Перед загрузкой образа в [Yandex Container Registry](https://yandex.cloud/ru/docs/container-registry/), необходимо убедиться, что имя образа соответствует формату, используемому в реестре Yandex. Это достигается с помощью команды `docker tag`.
3. Загрузка образа в реестр([Yandex Container Registry](https://yandex.cloud/ru/docs/container-registry/)) 
   
   `docker push cr.yandex/<идентификатор_реестра>/<имя_Docker-образа>:<тег>`

--- 

## Тестирование с помощью [docker-compose](docker-compose.yml)
- Запуск всех сервисов
	`docker-compose up -d`
- Остановка всех сервисов
	`docker-compose down`
- Построение образов
	`docker-compose build`
- Просмотр логов
	`docker-compose logs`

---

### Команды, которые возможно понадобятся:
1. Построение Docker-образа
`docker build -t <имя_докера>:<тег> <путь_к_Dockerfile>`

2. Запуск контейнера
`docker run -d -p <порт_хоста>:<порт_контейнера> <имя_докера>:<тег>`

3. Просмотр работающих контейнеров
`docker ps` + здесь будет возможно узнать `id_контейнера` контейнера

4. Остановка контейнера
`docker stop <id_контейнера>`

5. Удаление контейнера
`docker rm <ид_контейнера>`

6. Удаление образа
`docker rmi <имя_докера>:<тег>`