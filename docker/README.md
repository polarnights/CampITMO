# Контейнеризация приложения docker
#### Используем облачные сервисы [yandex.cloud](https://yandex.cloud/ru/)

## Сначала необходимо убедиться, что все собирается в локальном docker

#### В проекте необходимо создать файл ***Dockerfile*** и вставить следущее:

``` FROM python:3.10-bullseye
WORKDIR /usr/src/app
COPY . .
RUN apt-get update -y
RUN apt-get install -y python3-pipRUN apt-get install -y python3
RUN pip3 install -r requirements.txtRUN pip3 install -r requirements-server.txt
RUN python3 seed.py
CMD ["gunicorn", "app:app", "-b", "0.0.0.0:8000"] 
```


### Далее необходимо создать реестр в облаке(см. [документацию](https://yandex.cloud/ru/docs/container-registry/operations/registry/registry-create)), для этого необходимо перейти по [ссылке](https://yandex.cloud/ru/docs/cli/quickstart#install)

### Далее необходимо аутентифицироваться в [реестре](https://yandex.cloud/ru/docs/container-registry/operations/authentication)

### Выполняем следущие шаги в консоли:
```
docker tag ubuntu \

cr.yandex/<идентификатор_реестра>/<имя_Docker-образа>:<тег>
```

#### Предварительно изменить имя докера на cr.yandex/<идентификатор_реестра>/
```
<имя_Docker-образа>:<тег>

docker push cr.yandex/<идентификатор_реестра>/<имя_Docker-образа>:<тег>
```