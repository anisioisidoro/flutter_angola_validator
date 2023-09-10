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


# Usage

## validateBI

O método validateBI é uma função que realiza uma validação do número do Bilhete de Identidade (BI) por meio de uma requisição a uma API externa. O objetivo principal deste método é verificar a validade do número do BI, consultando uma fonte de dados externa.

Exemplo:

```dart
try {
  String biNumber = "1234567890"; // Substitua pelo número de BI que deseja validar.
  String validationState = await validateBI(biNumber);
  print("Estado de validação do BI: $validationState");
} catch (e) {
  print("Ocorreu um erro durante a validação do BI: $e");
}
```

## Extensão AngolaValidatorExtension

A extensão AngolaValidatorExtension  fornece dois métodos de validação: validateVehicleRegistration e validateIBAN.

## validateVehicleRegistration

Este método verifica se o valor fornecido representa uma placa de veículo válida em Angola. Ele usa uma expressão regular para fazer essa verificação. A placa de veículo válida deve seguir um dos seguintes padrões:

1.Formato "AA-99-99-AA"
2.Formato "AAA-99-99"

Exemplo:

```dart
String vehiclePlate = "AB-12-34-CD"; // Substitua pela placa de veículo que deseja validar.
bool isValid = vehiclePlate.validateVehicleRegistration();
print("A placa de veículo é válida: $isValid");
```

## validateIBAN

Este método verifica se o valor fornecido representa um número de Identificação Bancária Internacional (IBAN) válido. Ele executa várias verificações para garantir que o IBAN seja válido de acordo com as regras específicas de validação.

Exempolo: 

```dart
String iban = "000600000005291010176"; // Substitua pelo IBAN que deseja validar.
String validationMessage = iban.validateIBAN();
if (validationMessage.isEmpty) {
  print("O IBAN é válido.");
} else {
  print("Erro de validação do IBAN: $validationMessage");
}
```

