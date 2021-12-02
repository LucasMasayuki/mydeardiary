import 'package:get/get.dart';
import 'package:mydeardiary/app/ui/components/inputs/date_input.dart';
import 'package:mydeardiary/app/ui/components/inputs/title_input.dart';
import 'package:mydeardiary/app/ui/components/layout.dart';
import 'package:flutter/material.dart';
import 'package:mydeardiary/app/ui/mixins/loading_manager.dart';
import 'package:mydeardiary/app/ui/mixins/navigation_manager.dart';
import 'package:mydeardiary/app/ui/mixins/ui_error_manager.dart';
import 'package:mydeardiary/app/ui/pages/add-diary/add_diary_presenter.dart';

import 'components/diary-input.dart';

class AddDiaryPage extends StatelessWidget
    with LoadingManager, UIErrorManager, NavigationManager {
  @override
  Widget build(BuildContext context) {
    AddDiaryPresenter presenter = Get.find<AddDiaryPresenter>();

    final controller = TextEditingController();
    final padding = EdgeInsets.only(
      left: 28,
      right: 28,
      top: 4,
      bottom: 4,
    );

    return Layout(
      actions: [
        IconButton(
          onPressed: () {
            presenter.addDiary(controller.text);
          },
          icon: Icon(Icons.check),
        ),
      ],
      title: 'Write',
      withBackButton: true,
      body: Builder(builder: (context) {
        handleMainError(context, presenter.mainErrorStream);
        handleNavigation(presenter.navigateToStream, clear: true);

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: padding,
                child: DateInput(
                  initialValue: DateTime.now(),
                  dateErrorStream: presenter.dateErrorStream,
                  onChangeDate: presenter.onChangeDate,
                ),
              ),
              Padding(
                padding: padding,
                child: TitleInput(
                  titleErrorStream: presenter.titleErrorStream,
                  validateTitle: presenter.onChangeTitle,
                ),
              ),
              Padding(
                padding: padding,
                child: DiaryInput(
                  initialText: '',
                  controller: controller,
                  fontSize: 18,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: 24,
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
