import 'package:equatable/equatable.dart';
import 'package:mydeardiary/app/presentation/protocols/validation.dart';
import 'package:mydeardiary/app/validation/protocols/field_validation.dart';

class EmailValidation extends Equatable implements FieldValidation {
  final String field;

  List get props => [field];

  EmailValidation(this.field);

  ValidationError validate(Map input) {
    final regex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );

    if (input[field] == null) {
      return ValidationError.nothing;
    }

    final isValid =
        input[field].isNotEmpty != true || regex.hasMatch(input[field]!);

    return isValid ? ValidationError.nothing : ValidationError.invalidField;
  }
}
