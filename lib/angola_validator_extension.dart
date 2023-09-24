library angola_validator;

extension AngolaValidatorExtension on String {
  bool validateVehicleRegistration() {
    const regex = r'^[A-Z]{2}-\d{2}-\d{2}-[A-Z]{2}$|^[A-Z]{3}-\d{2}-\d{2}$';
    return RegExp(regex).hasMatch(this);
  }

  bool isAngolanBankCode(String bankCode) {
    Map<String, String> angolanBanks = {
      "BAI": "0040",
      "BCA": "0043",
      "BCI": "0005",
      "BCGA": "0004",
      "BCS": "0070",
      "BDA": "0054",
      "BE": "0045",
      "BFA": "0006",
      "BCH": "0059",
      "BIC": "0051",
      "BIR": "0067",
      "BMA": "0055",
      "BMF": "0048",
      "BNI": "0052",
      "BOCLB": "0071",
      "BPC": "0010",
      "BPG": "0064",
      "BSOL": "0044",
      "BVB": "0062",
      "FNB": "0058",
      "KEVE": "0047",
      "SBA": "0060",
      "SCBA": "0063",
      "VTB": "0056",
      "YETU": "0066"
    };

    return angolanBanks.containsValue(bankCode);
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

    if (!iban.substring(4).contains(RegExp(r'^[0-9]+$'))) {
      return "IBAN inválido. Não deve conter letras após AO06";
    }

    String bankCode = iban.substring(4, 8);

    if (!isAngolanBankCode(bankCode)) {
      return "IBAN inválido. O código desse banco é inválido";
    }

    if (_calculateIBANChecksum(iban) != 1) {
      return "IBAN inválido, por favor insira um IBAN válido";
    }
    return '';
  }

  int _calculateIBANChecksum(String iban) {
    String ibanWithoutPrefix = iban.substring(4);
    String numericIban = ibanWithoutPrefix.replaceAll(RegExp(r'[^0-9]'), '');

    return int.parse(numericIban) % 97;
  }
}
