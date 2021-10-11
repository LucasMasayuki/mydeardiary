import 'package:flutter/material.dart';
import 'package:mydeardiary/app/ui/mixins/navigation_manager.dart';
import 'package:mydeardiary/app/ui/pages/splash/splash_presenter.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget with NavigationManager {
  final SplashPresenter presenter;

  SplashPage({required this.presenter});

  @override
  Widget build(BuildContext context) {
    presenter.checkAccount();

    return Scaffold(
      body: Builder(
        builder: (context) {
          handleNavigation(
            presenter.navigateToStream,
            clear: true,
          );

          return Container(
            color: Colors.pinkAccent,
            child: Center(
              child: Column(
                children: [
                  Text(
                    'My dear diary'.tr,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'IndieFlower',
                      fontSize: 52,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 32)),
                  CircularProgressIndicator(
                    color: Colors.white,
                  )
                ],
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ),
          );
        },
      ),
    );
  }
}
