import 'package:mydeardiary/app/domain/entities/lock_authentication_entity.dart';
import 'package:mydeardiary/app/ui/helpers/ui_error.dart';

abstract class LockAuthenticationPresenter {
  Stream<UIError?> get mainErrorStream;
  Stream<bool?> get isLoadingStream;
  Stream<LockAuthenticationEntity?> get lockAuthenticationStream;

  Future<void> setAuthenticationType(LockAuthenticationType type);
  Future<void> getLockAuthentication();
}
