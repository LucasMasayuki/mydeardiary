import 'package:flutter/material.dart';
import 'package:mydeardiary/app/ui/components/headline1.dart';
import 'package:mydeardiary/app/ui/components/inputs/email_input.dart';
import 'package:mydeardiary/app/ui/components/inputs/name_input.dart';
import 'package:mydeardiary/app/ui/components/inputs/password_input.dart';
import 'package:mydeardiary/app/ui/components/login_header.dart';
import 'package:mydeardiary/app/ui/helpers/i18n/resources.dart';
import 'package:mydeardiary/app/ui/mixins/keyboard_manager.dart';
import 'package:mydeardiary/app/ui/mixins/loading_manager.dart';
import 'package:mydeardiary/app/ui/mixins/navigation_manager.dart';
import 'package:mydeardiary/app/ui/mixins/ui_error_manager.dart';
import 'package:mydeardiary/app/ui/pages/signup/components/password_confirmation_input.dart';
import 'package:mydeardiary/app/ui/pages/signup/components/signup_button.dart';
import 'package:mydeardiary/app/ui/pages/signup/signup_presenter.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget
    with KeyboardManager, LoadingManager, UIErrorManager, NavigationManager {
  final SignUpPresenter presenter;

  SignUpPage(this.presenter, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) {
          handleLoading(context, presenter.isLoadingStream);
          handleMainError(context, presenter.mainErrorStream);
          handleNavigation(presenter.navigateToStream, clear: true);

          return GestureDetector(
            onTap: () => hideKeyboard(context),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const LoginHeader(),
                  Headline1(text: R.string.addAccount),
                  Padding(
                    padding: const EdgeInsets.all(32),
                    child: Obx(
                      () => Form(
                        child: Column(
                          children: <Widget>[
                            NameInput(
                              nameErrorStream: presenter.nameErrorStream,
                              validateName: presenter.validateName,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: EmailInput(
                                emailErrorStream: presenter.emailErrorStream,
                                validateEmail: presenter.validateEmail,
                              ),
                            ),
                            PasswordInput(
                              passwordErrorStream:
                                  presenter.passwordErrorStream,
                              validatePassword: presenter.validatePassword,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 8, bottom: 32),
                              child: PasswordConfirmationInput(
                                passwordConfirmationErrorStream:
                                    presenter.passwordConfirmationErrorStream,
                                validatePasswordConfirmation:
                                    presenter.validatePasswordConfirmation,
                              ),
                            ),
                            SignUpButton(
                              isFormValidStream: presenter.isFormValidStream,
                              signUp: presenter.signUp,
                            ),
                            TextButton.icon(
                              onPressed: presenter.goToLogin,
                              icon: const Icon(Icons.exit_to_app),
                              label: Text(R.string.login),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
