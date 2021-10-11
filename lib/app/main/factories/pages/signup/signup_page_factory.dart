import 'package:flutter/material.dart';
import 'package:mydeardiary/app/main/factories/pages/signup/signup_presenter_factory.dart';
import 'package:mydeardiary/app/ui/pages/signup/signup_page.dart';

Widget makeSignUpPage() => SignUpPage(makeGetxSignUpPresenter());
