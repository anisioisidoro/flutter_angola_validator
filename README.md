<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

Package para validação  de Bilhete de Identidade(BI), matrícula e IBAN angolano

## Features

1. Validar BI
2. Validar Matrícula
3. Validar IBAN

## Getting started

Adicionar o package no seu projecto

```dart
angola_validator: ˆ0.0.1
```


## Usage

# validateBI

O método validateBI é uma função que realiza uma validação do número do Bilhete de Identidade (BI) por meio de uma requisição a uma API externa. O objetivo principal deste método é verificar a validade do número do BI, consultando uma fonte de dados externa.

```dart
try {
  String biNumber = "1234567890"; // Substitua pelo número de BI que deseja validar.
  String validationState = await validateBI(biNumber);
  print("Estado de validação do BI: $validationState");
} catch (e) {
  print("Ocorreu um erro durante a validação do BI: $e");
}
```

## Additional information

TODO: Tell users more about the package: where to find more information, how to
contribute to the package, how to file issues, what response they can expect
from the package authors, and more.
