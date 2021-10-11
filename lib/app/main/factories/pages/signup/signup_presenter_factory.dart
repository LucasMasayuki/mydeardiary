import 'package:mydeardiary/app/main/factories/pages/signup/signup_validation_factory.dart';
import 'package:mydeardiary/app/main/factories/usecases/add_user_factory.dart';
import 'package:mydeardiary/app/main/factories/usecases/save_current_user_factory.dart';
import 'package:mydeardiary/app/presentation/presenters/getx_signup_presenter.dart';
import 'package:mydeardiary/app/ui/pages/signup/signup_presenter.dart';

SignUpPresenter makeGetxSignUpPresenter() => GetxSignUpPresenter(
      addUser: makeRemoteAddUser(),
      validation: makeSignUpValidation(),
      saveCurrentUser: makeLocalSaveCurrentUser(),
    );
