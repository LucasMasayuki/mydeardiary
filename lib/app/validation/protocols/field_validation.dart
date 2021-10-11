import 'package:mydeardiary/app/presentation/protocols/validation.dart';

abstract class FieldValidation {
  String get field;
  ValidationError validate(Map input);
}
