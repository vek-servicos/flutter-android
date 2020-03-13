# Flutter-Android
## Docker image to build flutter apps (via Gitlab)

### Building 

```
docker build . -t docker.io/vekservicos/flutter-android:$version
```

> É necessário trocar a url docker.io/vekservicos pela url da vek-servicos ou então 
> alguma url privada de imagens docker. As permissões do pipeline também 
> precisam ser atualizadas para a conta correspondente.


### Gitlab pipeline example

Para utilizar a imagem em um pipeline do Gitlab é bem simples, depois de 
indicar com a propriedade `image` o caminho e a versão que irá utilizar.
As versões disponíveis estão listadas na página 
https://hub.docker.com/repository/docker/vekservicos/flutter-android 
porém elas seguem a mesma nomenclatura do flutter.
No caso da web é preciso utilizar a versão beta por enquanto.

Mobile:

```
image: vekservicos/flutter-android:v1.12.13-hotfix.7

mobile:
  stage: build
  script:
    - flutter pub get && flutter build apk
  artifacts:
    expire_in: 7 days
    paths:
      - build/app/outputs/apk/release/app-release.apk
```

Web: 

```
web:
  image: vekservicos/flutter-android:beta-web
  script:
    - flutter channel beta
    - flutter pub get && flutter build web
  artifacts:
    expire_in: 7 days
    paths:
      - build/web/
```
