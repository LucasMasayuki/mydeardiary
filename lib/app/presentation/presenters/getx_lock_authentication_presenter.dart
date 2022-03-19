import 'package:mydeardiary/app/domain/entities/lock_authentication_entity.dart';
import 'package:mydeardiary/app/domain/usecases/load_current_user.dart';
import 'package:get/get.dart';

import 'package:mydeardiary/app/domain/helpers/domain_errors.dart';
import 'package:mydeardiary/app/domain/usecases/lock-authentication/edit_lock_authentication.dart';
import 'package:mydeardiary/app/domain/usecases/lock-authentication/get_lock_authentication.dart';
import 'package:mydeardiary/app/presentation/mixins/loading_manager.dart';
import 'package:mydeardiary/app/presentation/mixins/navigation_manager.dart';
import 'package:mydeardiary/app/presentation/mixins/ui_error_manager.dart';
import 'package:mydeardiary/app/ui/helpers/ui_error.dart';
import 'package:mydeardiary/app/ui/pages/lock-authentication/lock_authentication_presenter.dart';

class GetxLockAuthenticationPresenter extends GetxController
    with LoadingManager, NavigationManager, UIErrorManager
    implements LockAuthenticationPresenter {
  final GetLockAuthentication getLockAuthenticationCase;
  final LoadCurrentUser loadCurrentUserCase;
  final EditLockAuthentication editLockAuthenticationCase;

  final _getLockAuthenticationError = Rx<UIError>(UIError.unexpected);
  final _lockAuthentication = Rx<LockAuthenticationEntity?>(null);

  Stream<UIError?> get getLockAuthenticationErrorStream =>
      _getLockAuthenticationError.stream;

  @override
  Stream<LockAuthenticationEntity?> get lockAuthenticationStream =>
      _lockAuthentication.stream;

  GetxLockAuthenticationPresenter({
    required this.getLockAuthenticationCase,
    required this.loadCurrentUserCase,
    required this.editLockAuthenticationCase,
  });

  @override
  Future<void> getLockAuthentication() async {
    try {
      final user = await loadCurrentUserCase.load();
      mainError = UIError.nothing;

      _lockAuthentication.value =
          await getLockAuthenticationCase.getLockAuthentication(
        GetLockAuthenticationParams(userId: user.id ?? 0),
      );
    } on DomainError catch (error) {
      switch (error) {
        case DomainError.invalidCredentials:
          mainError = UIError.invalidCredentials;
          break;
        default:
          mainError = UIError.unexpected;
          break;
      }
    }
  }

  @override
  Future<void> setAuthenticationType(LockAuthenticationType type) async {
    try {
      final user = await loadCurrentUserCase.load();
      mainError = UIError.nothing;

      _lockAuthentication.value =
          await editLockAuthenticationCase.editLockAuthentication(
        EditLockAuthenticationParams(
          userId: user.id ?? 0,
          lockAuthenticationEntity:
              _lockAuthentication.value ?? LockAuthenticationEntity(type: type),
        ),
      );
    } on DomainError catch (error) {
      switch (error) {
        case DomainError.invalidCredentials:
          mainError = UIError.invalidCredentials;
          break;
        default:
          mainError = UIError.unexpected;
          break;
      }
    }
  }
}
