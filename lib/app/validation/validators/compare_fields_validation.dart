import 'package:equatable/equatable.dart';

import 'package:mydeardiary/app/presentation/protocols/validation.dart';
import 'package:mydeardiary/app/validation/protocols/field_validation.dart';

class CompareFieldsValidation extends Equatable implements FieldValidation {
  @override
  final String field;
  final String fieldToCompare;

  @override
  List get props => [field, fieldToCompare];

  const CompareFieldsValidation({
    required this.field,
    required this.fieldToCompare,
  });

  @override
  ValidationError validate(Map input) => input[field] != null &&
          input[fieldToCompare] != null &&
          input[field] != input[fieldToCompare]
      ? ValidationError.invalidField
      : ValidationError.nothing;
}
