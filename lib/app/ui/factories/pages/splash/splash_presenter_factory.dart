import 'package:mydeardiary/app/main/factories/usecases/load_current_user_factory.dart';
import 'package:mydeardiary/app/main/factories/usecases/lock-authentication/get_lock_authentication_factory.dart';
import 'package:mydeardiary/app/main/factories/usecases/setting/get_settings_factory.dart';
import 'package:mydeardiary/app/presentation/presenters/getx_splash_presenter.dart';
import 'package:mydeardiary/app/ui/pages/splash/splash_presenter.dart';

SplashPresenter makeGetxSplashPresenter() => GetxSplashPresenter(
      loadCurrentUserCase: makeLocalLoadCurrentUser(),
      getLockAuthenticationCase: makeGetLockAuthentication(),
      getSettingCase: makeGetSettings(),
    );
