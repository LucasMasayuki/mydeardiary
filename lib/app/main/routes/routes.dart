import 'package:mydeardiary/app/main/bindings/add_diary_bindings.dart';
import 'package:mydeardiary/app/main/factories/pages/add-diary/add_diary_page_factory.dart';
import 'package:mydeardiary/app/main/factories/pages/home/home_page_factory.dart';
import 'package:mydeardiary/app/main/factories/pages/login/login_page_factory.dart';
import 'package:mydeardiary/app/main/factories/pages/signup/signup_page_factory.dart';
import 'package:mydeardiary/app/main/factories/pages/splash/splash_page_factory.dart';
import 'package:get/get_navigation/get_navigation.dart';

final routes = [
  GetPage(
    name: '/',
    page: makeSplashPage,
    transition: Transition.fade,
  ),
  GetPage(
    name: '/login',
    page: makeLoginPage,
    transition: Transition.fadeIn,
  ),
  GetPage(
    name: '/signup',
    page: makeSignUpPage,
  ),
  GetPage(
    name: '/home',
    page: makeHomePage,
    transition: Transition.fadeIn,
  ),
  GetPage(
    name: '/add-diary',
    page: makeAddDiaryPage,
    transition: Transition.zoom,
    binding: AddDiaryBindings(),
  ),
];
