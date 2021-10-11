import 'package:flutter/material.dart';
import 'package:mydeardiary/app/main/factories/pages/login/login_presenter_factory.dart';
import 'package:mydeardiary/app/ui/pages/login/login_page.dart';

Widget makeLoginPage() => LoginPage(makeGetxLoginPresenter());
