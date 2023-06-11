## About Izam App

Izam app is a simple app that allow user to login with valid email and password and store them in a local database also can reset app by entering his mail in forgot password screen and the generates a new valid password to enable it to login again.

## About App Architecture

Izam app is written with clean code architecture

In clean code architecture, there are three main layers

- core
- Data
- Domain
- Presentation

##### More insight of layers

![image](https://miro.medium.com/max/772/0*sfCDEb571WD-7EfP.jpg)

## Domain

This is innermost layer and will contain the core business logic i.e. usecases and business object also called as entities, the usecase depends on the contract of repository

## Data

The data layers contains the repository implementation and this layer is closest to actual data sources and is responsible for communication with data sources.

## Presentation

This layer contains all the information about the UI and everything to show to the end user customer. The presentation layer also contains the bloc which is the state management and often termed as brain of UI.

The presentation layer interact via domain layer, i.e entities and use cases.

# Folder structure

```
├── lib
│   ├── src
│   │   ├── core
│   │   │   ├── config
│   │   │   │   ├── routes
│   │   │   │   │   └── routes.dart
│   │   │   │   └── themes
│   │   │   │       └── theme.dart
│   │   │   └── utils
│   │   │   │   ├── constants
│   │   │   │   │   ├── app_strings.dart
│   │   │   │   │   └── constants.dart
│   │   │   │   └── extensions
│   │   │   │       └── extensions.dart
│   │   ├── features
│   │   │   ├── data
│   │   │   │   ├── database
│   │   │   │   │   └── app_database.dart
│   │   │   │   │   │
│   │   │   │   └── repositories
│   │   │   │       └── user_repository_impl.dart
│   │   │   ├── domain
│   │   │   │   ├── entity
│   │   │   │   │   ├── login_result.dart
│   │   │   │   │   │
│   │   │   │   │   └── user.dart
│   │   │   │   ├── repository
│   │   │   │   │   └── user_repository.dart.dart
│   │   │   │   └── usecases
│   │   │   │       ├── login_usecase.dart
│   │   │   │       └── reset_usecase.dart
│   │   │   └── presentation
│   │   │       ├── controller
│   │   │       │   ├── forgot_pass_controller.dart
│   │   │       │   └── login.dart
│   │   │       ├── pages
│   │   │       │   ├── auth
│   │   │       │   │   ├── forgot password.dart
│   │   │       │   │   │   ├── components.dart
│   │   │       │   │   │   │   └── body.dart
│   │   │       │   │   │   └── intro_screen.dart
│   │   │       │   │   └── login.dart
│   │   │       │   │       ├── components.dart
│   │   │       │   │       │   └── body.dart
│   │   │       │   │       └── login_screen.dart
│   │   │       │   └── intro
│   │   │       │       ├── components.dart
│   │   │       │       │   └── body.dart
│   │   │       │       └── intro_screen.dart
│   │   │       └── widgets
│   │   │           ├── button
│   │   │           │   └── custom_button.dart
│   │   │           ├── dialogs
│   │   │           │   ├── custom_dialog.dart
│   │   │           │   ├── custom_snackbar.dart
│   │   │           │   └── loading_widget.dart
│   │   │           └── text
│   │   │               ├── custom_action_text.dart
│   │   │               ├── custom_mail_field.dart
│   │   │               └── custom_password_field.dart
│   │   └── main.dart
│   ├── pubspec.lock
│   ├── pubspec.yaml
│   └── test
│       └── data
│           │   ├── database
│           │   │   └── database_test.dart
│           │   │
│           │   └── repositories
│           │       └── user_repo_test.dart
│           └── domain
│               └── entity
│                   ├── login_result_test.dart
│                   │
│                   └── user_model_test.dart

```

# How to run

`flutter run`

Dart Version : 3:0:3

Flutter Version: 3:10:3 stable

## How to test

`flutter test --coverage`
