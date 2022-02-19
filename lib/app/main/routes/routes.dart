import 'package:mydeardiary/app/main/bindings/add_diary_bindings.dart';
import 'package:mydeardiary/app/main/bindings/edit_diary_bindings.dart';
import 'package:mydeardiary/app/main/bindings/home_bindings.dart';
import 'package:mydeardiary/app/main/bindings/read_diary_bindings.dart';
import 'package:mydeardiary/app/main/bindings/settings_bindings.dart';
import 'package:mydeardiary/app/main/bindings/splash_page_bindings.dart';
import 'package:mydeardiary/app/main/factories/pages/add-diary/add_diary_page_factory.dart';
import 'package:mydeardiary/app/main/factories/pages/edit-diary/edit_diary_page_factory.dart';
import 'package:mydeardiary/app/main/factories/pages/home/home_page_factory.dart';
import 'package:mydeardiary/app/main/factories/pages/login/login_page_factory.dart';
import 'package:mydeardiary/app/main/factories/pages/read-diary/read_diary_page_factory.dart';
import 'package:mydeardiary/app/main/factories/pages/setting/setting_page_factory.dart';
import 'package:mydeardiary/app/main/factories/pages/signup/signup_page_factory.dart';
import 'package:mydeardiary/app/main/factories/pages/splash/splash_page_factory.dart';
import 'package:get/get_navigation/get_navigation.dart';

final routes = [
  GetPage(
    name: '/',
    page: makeSplashPage,
    transition: Transition.fade,
    binding: SplashPageBindings(),
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
    binding: HomeBindings(),
  ),
  GetPage(
    name: '/add-diary',
    page: makeAddDiaryPage,
    transition: Transition.zoom,
    binding: AddDiaryBindings(),
  ),
  GetPage(
    name: '/read-diary/:index',
    page: makeReadDiaryPage,
    transition: Transition.rightToLeft,
    binding: ReadDiaryBindings(),
  ),
  GetPage(
    name: '/edit-diary/:index',
    page: makeEditDiaryPage,
    transition: Transition.rightToLeft,
    binding: EditDiaryBindings(),
  ),
  GetPage(
    name: '/settings',
    page: makeSettingPage,
    transition: Transition.rightToLeft,
    binding: SettingBindings(),
  ),
];
