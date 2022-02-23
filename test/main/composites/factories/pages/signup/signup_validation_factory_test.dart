import 'package:flutter_test/flutter_test.dart';
import 'package:mydeardiary/app/main/factories/pages/signup/signup_validation_factory.dart';
import 'package:mydeardiary/app/validation/validators/compare_fields_validation.dart';
import 'package:mydeardiary/app/validation/validators/email_validation.dart';
import 'package:mydeardiary/app/validation/validators/min_length_validation.dart';
import 'package:mydeardiary/app/validation/validators/required_field_validation.dart';

void main() {
  test('Should return the correct validations', () {
    final validations = makeSignUpValidations();

    expect(
      validations,
      [
        const RequiredFieldValidation('name'),
        const MinLengthValidation(field: 'name', size: 3),
        const RequiredFieldValidation('email'),
        const EmailValidation('email'),
        const RequiredFieldValidation('password'),
        const MinLengthValidation(field: 'password', size: 3),
        const RequiredFieldValidation('passwordConfirmation'),
        const CompareFieldsValidation(
          field: 'passwordConfirmation',
          fieldToCompare: 'password',
        ),
      ],
    );
  });
}
