# Vault Helm Chart

Этот репозиторий содержит значения по умолчанию для развертывания ***HashiCorp Vault*** с использованием *Helm*. Предоставленный файл `values.yaml` отформатирован в `YAML` и содержит переменные, которые передаются в ваши шаблоны.

## Параметры конфигурации
- Конфигурация сервера
`server:
  affinity: false`
- Конфигурация образа
```v
image:
  repository: hashicorp/vault
  pullPolicy: IfNotPresent
  tag: "1.16.1"
  ```
- Конфигурация сервиса
```
service:
  http: <port>
  httpTargetPort: <port>
  httpInternal: <internal_port>
  httpRep: <httepRep_port>
```
- Ресурсы
- Service Account
- Аннотации и метки пода

## Запуск
`helm install my-vault . -f values.yaml`

Следует сначала настроить параметры в соответствии с вашей средой и требованиями. Для получения дополнительной информации обратитесь к [документации по Helm-чарту Vault](https://developer.hashicorp.com/vault/docs/platform/k8s/helm).
