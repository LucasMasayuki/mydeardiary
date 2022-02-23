import 'package:equatable/equatable.dart';

import 'package:mydeardiary/app/presentation/protocols/validation.dart';
import 'package:mydeardiary/app/validation/protocols/field_validation.dart';

class MinLengthValidation extends Equatable implements FieldValidation {
  @override
  final String field;
  final int size;

  @override
  List get props => [field, size];

  const MinLengthValidation({
    required this.field,
    required this.size,
  });

  @override
  ValidationError validate(Map input) =>
      input[field] != null && input[field].length >= size
          ? ValidationError.nothing
          : ValidationError.invalidField;
}
