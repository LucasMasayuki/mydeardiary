import 'package:get/get.dart';

import 'package:mydeardiary/app/domain/helpers/domain_errors.dart';
import 'package:mydeardiary/app/domain/usecases/add_user.dart';
import 'package:mydeardiary/app/domain/usecases/save_current_user.dart';
import 'package:mydeardiary/app/presentation/mixins/form_manager.dart';
import 'package:mydeardiary/app/presentation/mixins/loading_manager.dart';
import 'package:mydeardiary/app/presentation/mixins/navigation_manager.dart';
import 'package:mydeardiary/app/presentation/mixins/ui_error_manager.dart';
import 'package:mydeardiary/app/presentation/protocols/validation.dart';
import 'package:mydeardiary/app/ui/helpers/ui_error.dart';
import 'package:mydeardiary/app/ui/pages/signup/signup_presenter.dart';

class GetxSignUpPresenter extends GetxController
    with LoadingManager, NavigationManager, FormManager, UIErrorManager
    implements SignUpPresenter {
  final Validation validation;
  final AddUser addUser;
  final SaveCurrentUser saveCurrentUser;

  final _emailError = Rx<UIError>(UIError.unexpected);
  final _nameError = Rx<UIError>(UIError.unexpected);
  final _passwordError = Rx<UIError>(UIError.unexpected);
  final _passwordConfirmationError = Rx<UIError>(UIError.unexpected);

  String _name = '';
  String _email = '';
  String _password = '';
  String _passwordConfirmation = '';

  @override
  Stream<UIError?> get emailErrorStream => _emailError.stream;
  @override
  Stream<UIError?> get nameErrorStream => _nameError.stream;
  @override
  Stream<UIError?> get passwordErrorStream => _passwordError.stream;
  @override
  Stream<UIError?> get passwordConfirmationErrorStream =>
      _passwordConfirmationError.stream;

  GetxSignUpPresenter({
    required this.validation,
    required this.addUser,
    required this.saveCurrentUser,
  });

  @override
  void validateEmail(String email) {
    _email = email;
    _emailError.value = _validateField('email');
    _validateForm();
  }

  @override
  void validateName(String name) {
    _name = name;
    _nameError.value = _validateField('name');
    _validateForm();
  }

  @override
  void validatePassword(String password) {
    _password = password;
    _passwordError.value = _validateField('password');
    _validateForm();
  }

  @override
  void validatePasswordConfirmation(String passwordConfirmation) {
    _passwordConfirmation = passwordConfirmation;
    _passwordConfirmationError.value = _validateField('passwordConfirmation');
    _validateForm();
  }

  UIError _validateField(String field) {
    final formData = {
      'name': _name,
      'email': _email,
      'password': _password,
      'passwordConfirmation': _passwordConfirmation
    };
    final error = validation.validate(field: field, input: formData);
    switch (error) {
      case ValidationError.invalidField:
        return UIError.invalidField;
      case ValidationError.requiredField:
        return UIError.requiredField;
      default:
        return UIError.nothing;
    }
  }

  void _validateForm() {
    isFormValid = _emailError.value == UIError.nothing &&
        _nameError.value == UIError.nothing &&
        _passwordError.value == UIError.nothing &&
        _passwordConfirmationError.value == UIError.nothing &&
        _name != '' &&
        _email != '' &&
        _password != '' &&
        _passwordConfirmation != '';
  }

  @override
  Future<void> signUp() async {
    try {
      mainError = UIError.nothing;
      isLoading = true;
      final user = await addUser.add(
        AddUserParams(
          name: _name,
          email: _email,
          password: _password,
          passwordConfirmation: _passwordConfirmation,
        ),
      );

      await saveCurrentUser.save(user);
      navigateTo = '/surveys';
    } on DomainError catch (error) {
      switch (error) {
        case DomainError.emailInUse:
          mainError = UIError.emailInUse;
          break;
        default:
          mainError = UIError.unexpected;
          break;
      }

      isLoading = false;
    }
  }

  @override
  void goToLogin() {
    navigateTo = '/login';
  }
}
