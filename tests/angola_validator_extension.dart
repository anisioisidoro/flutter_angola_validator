import 'package:test/test.dart';
import 'package:angola_validator/angola_validator_extension.dart';

void main() {
  group('Angola Validator Tests', () {
    test(
        'validateVehicleRegistration should return true for valid registrations',
        () {
      expect('AA-12-34-AA'.validateVehicleRegistration(), isTrue);
      expect('AAA-12-34'.validateVehicleRegistration(), isTrue);
    });

    test(
        'validateVehicleRegistration should return false for invalid registrations',
        () {
      expect('A-12-34-AA'.validateVehicleRegistration(), isFalse);
      expect('AAA-12-34-A'.validateVehicleRegistration(), isFalse);
      expect('AAA-123-45'.validateVehicleRegistration(), isFalse);
      expect('AA-12-34-A1'.validateVehicleRegistration(), isFalse);
    });

    test('validateIBAN should return an error message for invalid IBANs', () {
      expect(''.validateIBAN(),
          contains('IBAN inválido, por favor insira um IBAN válido'));
      expect('AO060040000010894244101757'.validateIBAN(),
          contains('IBAN inválido. O tamanho deve ser de 25 caracteres'));
      expect('AO05ABC123456789012345675'.validateIBAN(),
          contains('IBAN inválido. Adicione o código AO06'));
      expect('AO060ABC12345678901234567'.validateIBAN(),
          contains('IBAN inválido. Não deve conter letras após AO06'));
      expect('AO06009912345678901234567'.validateIBAN(),
          contains('IBAN inválido. O código desse banco é inválido'));
      expect('AO06004312345678901234566'.validateIBAN(),
          contains('IBAN inválido, por favor insira um IBAN válido'));
    });

    test('validateIBAN should return an empty string for valid IBANs', () {
      expect('AO06004000001089424410175'.validateIBAN(), isEmpty);
    });
  });
}
