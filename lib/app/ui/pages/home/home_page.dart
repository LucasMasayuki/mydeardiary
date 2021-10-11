import 'package:mydeardiary/app/ui/components/layout.dart';
import 'package:mydeardiary/app/ui/pages/home/components/diary-list.dart';
import 'package:mydeardiary/app/ui/pages/home/home_presenter.dart';
import 'package:flutter/material.dart';
import 'package:mydeardiary/app/ui/mixins/keyboard_manager.dart';
import 'package:mydeardiary/app/ui/mixins/loading_manager.dart';
import 'package:mydeardiary/app/ui/mixins/navigation_manager.dart';
import 'package:mydeardiary/app/ui/mixins/ui_error_manager.dart';

class HomePage extends StatelessWidget
    with KeyboardManager, LoadingManager, UIErrorManager, NavigationManager {
  final HomePresenter presenter;

  HomePage(this.presenter);

  @override
  Widget build(BuildContext context) {
    return Layout(
      body: Builder(
        builder: (context) {
          handleMainError(context, presenter.mainErrorStream);
          presenter.getDiaries();

          return DiaryList(getDiaryStream: presenter.diariesStream);
        },
      ),
    );
  }
}
