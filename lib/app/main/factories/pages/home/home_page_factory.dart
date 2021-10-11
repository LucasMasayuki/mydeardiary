import 'package:mydeardiary/app/main/factories/pages/home/home_presenter_factory.dart';
import 'package:mydeardiary/app/ui/pages/home/home_page.dart';
import 'package:flutter/material.dart';

Widget makeHomePage() => HomePage(makeGetxHomePresenter());
