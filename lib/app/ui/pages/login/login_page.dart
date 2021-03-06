import 'package:flutter/material.dart';
import 'package:mydeardiary/app/ui/components/headline1.dart';
import 'package:mydeardiary/app/ui/components/inputs/email_input.dart';
import 'package:mydeardiary/app/ui/components/inputs/password_input.dart';
import 'package:mydeardiary/app/ui/components/login_header.dart';
import 'package:mydeardiary/app/ui/helpers/i18n/resources.dart';
import 'package:mydeardiary/app/ui/mixins/keyboard_manager.dart';
import 'package:mydeardiary/app/ui/mixins/loading_manager.dart';
import 'package:mydeardiary/app/ui/mixins/navigation_manager.dart';
import 'package:mydeardiary/app/ui/mixins/ui_error_manager.dart';
import 'package:mydeardiary/app/ui/pages/login/components/login_button.dart';
import 'package:mydeardiary/app/ui/pages/login/login_presenter.dart';

class LoginPage extends StatelessWidget
    with KeyboardManager, LoadingManager, UIErrorManager, NavigationManager {
  final LoginPresenter presenter;

  LoginPage(this.presenter, {Key? key}) : super(key: key);

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
                  Headline1(text: R.string.login),
                  Padding(
                    padding: const EdgeInsets.all(32),
                    child: Form(
                      child: Column(
                        children: <Widget>[
                          EmailInput(
                            emailErrorStream: presenter.emailErrorStream,
                            validateEmail: presenter.validateEmail,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8, bottom: 32),
                            child: PasswordInput(
                              passwordErrorStream:
                                  presenter.passwordErrorStream,
                              validatePassword: presenter.validatePassword,
                            ),
                          ),
                          LoginButton(
                            isFormValidStream: presenter.isFormValidStream,
                            auth: presenter.auth,
                          ),
                          TextButton.icon(
                            onPressed: presenter.goToSignUp,
                            icon: const Icon(Icons.person),
                            label: Text(
                              R.string.addAccount,
                            ),
                          )
                        ],
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
