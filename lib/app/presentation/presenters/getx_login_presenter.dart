import 'package:get/get.dart';

import 'package:mydeardiary/app/domain/helpers/domain_errors.dart';
import 'package:mydeardiary/app/domain/usecases/authentication.dart';
import 'package:mydeardiary/app/domain/usecases/save_current_user.dart';
import 'package:mydeardiary/app/presentation/mixins/form_manager.dart';
import 'package:mydeardiary/app/presentation/mixins/loading_manager.dart';
import 'package:mydeardiary/app/presentation/mixins/navigation_manager.dart';
import 'package:mydeardiary/app/presentation/mixins/ui_error_manager.dart';
import 'package:mydeardiary/app/presentation/protocols/validation.dart';
import 'package:mydeardiary/app/ui/helpers/ui_error.dart';
import 'package:mydeardiary/app/ui/pages/login/login_presenter.dart';

class GetxLoginPresenter extends GetxController
    with LoadingManager, NavigationManager, FormManager, UIErrorManager
    implements LoginPresenter {
  final Validation validation;
  final Authentication authentication;
  final SaveCurrentUser saveCurrentUser;

  final _emailError = Rx<UIError>(UIError.unexpected);
  final _passwordError = Rx<UIError>(UIError.unexpected);

  String _email = '';
  String _password = '';

  @override
  Stream<UIError?> get emailErrorStream => _emailError.stream;
  @override
  Stream<UIError?> get passwordErrorStream => _passwordError.stream;

  GetxLoginPresenter({
    required this.validation,
    required this.authentication,
    required this.saveCurrentUser,
  });

  @override
  void validateEmail(String email) {
    _email = email;
    _emailError.value = _validateField('email');
    _validateForm();
  }

  @override
  void validatePassword(String password) {
    _password = password;
    _passwordError.value = _validateField('password');
    _validateForm();
  }

  UIError _validateField(String field) {
    final formData = {
      'email': _email,
      'password': _password,
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
        _passwordError.value == UIError.nothing &&
        _email != '' &&
        _password != '';
  }

  @override
  Future<void> auth() async {
    try {
      mainError = UIError.nothing;
      isLoading = true;
      final account = await authentication.auth(
        AuthenticationParams(email: _email, password: _password),
      );

      await saveCurrentUser.save(account);
      navigateTo = '/surveys';
    } on DomainError catch (error) {
      switch (error) {
        case DomainError.invalidCredentials:
          mainError = UIError.invalidCredentials;
          break;
        default:
          mainError = UIError.unexpected;
          break;
      }

      isLoading = false;
    }
  }

  @override
  void goToSignUp() {
    navigateTo = '/signup';
  }
}
