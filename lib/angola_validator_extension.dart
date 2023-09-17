library angola_validator;


extension AngolaValidatorExtension on String {
  bool validateVehicleRegistration() {
    const regex = r'^[A-Z]{2}-\d{2}-\d{2}-[A-Z]{2}$|^[A-Z]{3}-\d{2}-\d{2}$';
    RegExp(regex).hasMatch(this);
    return RegExp(regex).hasMatch(this);
  }

  String validateIBAN() {
    if (isEmpty) {
      return "IBAN inválido, por favor insira um IBAN válido";
    }
    String iban = replaceAll(".", "").replaceAll(" ", "");

    if (iban.length < 21) {
      return "IBAN inválido, por favor insira um IBAN válido";
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
