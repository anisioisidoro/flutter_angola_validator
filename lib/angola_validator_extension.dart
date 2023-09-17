library angola_validator;

extension AngolaValidatorExtension on String {
  bool validateVehicleRegistration() {
    const regex = r'^[A-Z]{2}-\d{2}-\d{2}-[A-Z]{2}$|^[A-Z]{3}-\d{2}-\d{2}$';
    RegExp(regex).hasMatch(this);
    return RegExp(regex).hasMatch(this);
  }

  String validateIBAN() {
    String iban = replaceAll(".", "").replaceAll(" ", "");

    if (isEmpty) {
      return "IBAN inválido, por favor insira um IBAN válido";
    }

    if (iban.length != 25) {
      return "IBAN inválido. O tamanho deve ser de 25 caracteres";
    }

    if (!iban.startsWith("AO06")) {
      return "IBAN inválido. Adicione o código AO06";
    }

    if (_parseIBAN(iban) != 1) {
      return "IBAN inválido, por favor insira um IBAN válido";
    }
    return '';
  }

  int _parseIBAN(String iban) {
    return int.parse(iban) % 97;
  }
}
