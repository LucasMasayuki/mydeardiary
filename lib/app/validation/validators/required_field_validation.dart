import 'package:equatable/equatable.dart';
import 'package:mydeardiary/app/presentation/protocols/validation.dart';
import 'package:mydeardiary/app/validation/protocols/field_validation.dart';

class RequiredFieldValidation extends Equatable implements FieldValidation {
  @override
  final String field;

  @override
  List get props => [field];

  const RequiredFieldValidation(this.field);

  @override
  ValidationError validate(Map input) =>
      input[field] != null && (input[field] as String).isNotEmpty
          ? ValidationError.nothing
          : ValidationError.requiredField;
}
