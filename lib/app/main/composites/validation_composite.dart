import 'package:mydeardiary/app/presentation/protocols/validation.dart';
import 'package:mydeardiary/app/validation/protocols/field_validation.dart';

class ValidationComposite implements Validation {
  final List<FieldValidation> validations;

  ValidationComposite(this.validations);

  @override
  ValidationError? validate({required String field, required Map input}) {
    ValidationError? error;
    for (final validation in validations.where((v) => v.field == field)) {
      error = validation.validate(input);
      if (error != ValidationError.nothing) {
        return error;
      }
    }
    return error;
  }
}
