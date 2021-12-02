import 'package:get/get.dart';
import 'package:mydeardiary/app/ui/components/inputs/date_input.dart';
import 'package:mydeardiary/app/ui/components/inputs/title_input.dart';
import 'package:flutter/material.dart';
import 'package:mydeardiary/app/ui/pages/add-diary/add_diary_presenter.dart';
import 'package:mydeardiary/app/ui/pages/add-diary/components/diary-input.dart';

class DiaryPage extends StatelessWidget {
  final bool withHeaders;
  final int numberOfLines;
  AddDiaryPresenter presenter = Get.find<AddDiaryPresenter>();

  DiaryPage({
    this.withHeaders = false,
    this.numberOfLines = 16,
  });

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    final padding = EdgeInsets.only(
      left: 28,
      right: 28,
      top: 4,
      bottom: 4,
    );

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          if (this.withHeaders)
            Padding(
              padding: padding,
              child: DateInput(
                initialValue: DateTime.now(),
                dateErrorStream: this.presenter.dateErrorStream,
                onChangeDate: this.presenter.onChangeDate,
              ),
            ),
          if (this.withHeaders)
            Padding(
              padding: padding,
              child: TitleInput(
                titleErrorStream: this.presenter.titleErrorStream,
                validateTitle: this.presenter.onChangeTitle,
              ),
            ),
          Padding(
            padding: padding,
            child: DiaryInput(
              initialText: 'test',
              controller: controller,
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
  }
}
