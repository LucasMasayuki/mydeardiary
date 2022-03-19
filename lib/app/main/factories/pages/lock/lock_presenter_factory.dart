import 'package:mydeardiary/app/main/factories/usecases/load_current_user_factory.dart';
import 'package:mydeardiary/app/main/factories/usecases/lock-authentication/edit_local_authentication_factory.dart';
import 'package:mydeardiary/app/main/factories/usecases/lock-authentication/get_lock_authentication_factory.dart';
import 'package:mydeardiary/app/presentation/presenters/getx_lock_authentication_presenter.dart';
import 'package:mydeardiary/app/ui/pages/lock-authentication/lock_authentication_presenter.dart';

LockAuthenticationPresenter makeLockAuthenticationPresenter() =>
    GetxLockAuthenticationPresenter(
      loadCurrentUserCase: makeLocalLoadCurrentUser(),
      getLockAuthenticationCase: makeGetLockAuthentication(),
      editLockAuthenticationCase: makeEditLockAuthentication(),
    );
