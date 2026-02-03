# Challenge_Pigeon!

Proyecto flutter creado mediante arquitectura limpia para el consumo de endpoints, integracion de **PIGEON** para generar notificaciones locales de manera nativa y orientado a un enfoque **Offline-first** para trabajar con almacenamiento local mediante una base de datos no relacional con **Objectbox** para manejar la reactividad de cambios realizados en el app.

# Estructura de carpetas

    lib/
    ├── main.dart
    ├── objectbox.g.dart
    ├── objectbox-model.json
    │
    ├── pigeons/
    │   ├── notification_api.dart
    │   └── notification_api.g.dart
    ├── services/
    │   └── notification_service.dart
    ├── src/
    │   ├── application/
    │   │   ├── logs/
    │   │   │   └── logdev.dart
    │   │   ├── routes/
    │   │   │   ├── app_routes.dart
    │   │   │   └── my_navigator_observer.dart
    │   │   └── theme/
    │   │       ├── colors_app.dart
    │   │       └── themes_app.dart
    │   ├── core/
    │   │   ├── di/
    │   │   │   └── di.dart
    │   │   ├── db/
    │   │   │   ├── db_helper.dart
    │   │   │   └── objectbox_app.dart
    │   │   ├── failures/
    │   │   │   ├── exceptions.dart
    │   │   │   └── failure.dart
    │   │   ├── network/
    │   │   │   ├── dio_client.dart
    │   │   │   └── network_info.dart
    │   │   └── utils/
    │   │       ├── global_vars.dart
    │   │       └── responsive.dart
    │   ├── data/
    │   │   ├── datasources/
    │   │   │   ├── posts_local_datasource.dart
    │   │   │   └── posts_remote_datasource.dart
    │   │   ├── db_models/
    │   │   │   ├── post_db_model.dart
    │   │   │   └── comment_db_model.dart
    │   │   ├── dtos/
    │   │   │   ├── post_dto.dart
    │   │   │   └── comment_dto.dart
    │   │   ├── mappers/
    │   │   │   ├── post_mapper.dart
    │   │   │   └── comment_mapper.dart
    │   │   └── repository_impl/
    │   │       └── posts_repository_impl.dart
    │   ├── domain/
    │   │   ├── entities/
    │   │   │   ├── post_entity.dart
    │   │   │   ├── comment_entity.dart
    │   │   │   └── notification_entity.dart
    │   │   ├── repositories/
    │   │   │   └── posts_repository.dart
    │   │   └── use_cases/
    │   │       ├── sync_posts_usecase.dart
    │   │       ├── sync_comments_usecase.dart
    │   │       └── toggle_post_usecase.dart
    │   ├── presentation/
    │   │   ├── pages/
    │   │   │   ├── home/
    │   │   │   │   ├── home_page.dart
    │   │   │   │   ├── posts_view.dart
    │   │   │   │   ├── favorites_view.dart
    │   │   │   │   └── details_post_page.dart
    │   │   │   └── splash_page.dart
    │   │   └── state_manager/
    │   │       ├── general_provider.dart
    │   │       ├── posts_provider.dart
    │   │       └── search_provider.dart
    │   └── shared/
    │       └── widgets/
    │           ├── custom_text.dart
    │           ├── custom_widgets.dart
    │           ├── drawer_app.dart
    │           ├── navbar_widget.dart
    │           └── search_appbar.dart
    └── test/

## Comandos para levantar el proyecto.

**Limpieza de proyecto**
flutter clean

**Construccion de la DB Local Objectbox.**

    flutter pub run build_runner build

**Creacion de archivos pigeon**

El archivo **notification_api.dart** contiene las direcciones y los nombres de los archivos que crea **Pigeon** para la comunicacion entre **Flutter** y el código nativo **Kotlin y Swift**
    
    dart run pigeon --input pigeons/notification_api.dart

## Video de funcionalidades
[Funcionalidades del aplicativo](https://drive.google.com/file/d/1AYVYiXwowsRgFU1c4eyFwYFhLTq3jP0F/view?usp=sharing)


      
      