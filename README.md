# challenge_channels

A new Flutter project.

## Getting Started
 Estructura de carpetas en arquitectura Limpia. Version de flutter 3.38.5

lib/
|__ pigeons
|__ services
├── src/
├   |── aplications/
|   |   |── logs/
|   |   |── routes/
|   |   |── theme/
|   |── core/
|   |   |── db/
|   |   |── di/
|   |   |── failures/
|   |   |── network/
|   |   |── utils/
|   |── data/
|   |   |── datasources/
|   |   |── db_models/
|   |   |── dtos/
|   |   |── mappers/
|   |   |── repository_impl/
|   |── domain/
|   |   |── entities/
|   |   |── repositories/
|   |   |── use_cases/
|   |── presentation/
|   |   |── pages/
|   |   |── state_manager/
|   |── shareds/
|   |   |── widgets/
|── main.dart
│
├── pigeons/
      └── notification_api.dart


Comando para ejecucion del proyecto.

- Contruccion de la DB Local.
  flutter pub run build_runner build

- Levantamiento de pigeon
  dart run pigeon --input pigeons/notification_api.dart

Video demostrativo.

https://drive.google.com/file/d/1AYVYiXwowsRgFU1c4eyFwYFhLTq3jP0F/view?usp=sharing