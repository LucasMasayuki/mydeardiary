import 'package:flutter_test/flutter_test.dart';
import 'package:mydeardiary/app/main/factories/pages/login/login_validation_factory.dart';
import 'package:mydeardiary/app/validation/validators/email_validation.dart';
import 'package:mydeardiary/app/validation/validators/min_length_validation.dart';
import 'package:mydeardiary/app/validation/validators/required_field_validation.dart';

void main() {
  test('Should return the correct validations', () {
    final validations = makeLoginValidations();

    expect(validations, [
      const RequiredFieldValidation('email'),
      const EmailValidation('email'),
      const RequiredFieldValidation('password'),
      const MinLengthValidation(field: 'password', size: 3)
    ]);
  });
}
