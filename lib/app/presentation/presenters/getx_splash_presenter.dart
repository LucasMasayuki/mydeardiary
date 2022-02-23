import 'package:get/get.dart';

import 'package:mydeardiary/app/domain/usecases/load_current_user.dart';
import 'package:mydeardiary/app/presentation/mixins/navigation_manager.dart';
import 'package:mydeardiary/app/ui/pages/splash/splash_presenter.dart';

class GetxSplashPresenter extends GetxController
    with NavigationManager
    implements SplashPresenter {
  final LoadCurrentUser loadCurrentUser;

  GetxSplashPresenter({required this.loadCurrentUser});

  @override
  Future<void> checkAccount({int durationInSeconds = 10}) async {
    await Future.delayed(Duration(seconds: durationInSeconds));
    try {
      final user = await loadCurrentUser.load();
      navigateTo = user.token == null ? '/home' : '/home';
    } catch (error) {
      navigateTo = '/home';
    }
  }
}
