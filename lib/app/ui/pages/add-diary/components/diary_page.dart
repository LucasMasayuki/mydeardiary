import 'package:get/get.dart';
import 'package:mydeardiary/app/ui/components/inputs/date_input.dart';
import 'package:mydeardiary/app/ui/components/inputs/title_input.dart';
import 'package:flutter/material.dart';
import 'package:mydeardiary/app/ui/pages/add-diary/add_diary_presenter.dart';
import 'package:mydeardiary/app/ui/components/inputs/diary-input.dart';

class DiaryPage extends StatelessWidget {
  final bool withHeaders;
  final int numberOfLines;
  final AddDiaryPresenter presenter = Get.find<AddDiaryPresenter>();

  DiaryPage({
    Key? key,
    this.withHeaders = false,
    this.numberOfLines = 16,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    const padding = EdgeInsets.only(
      left: 28,
      right: 28,
      top: 4,
      bottom: 4,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        if (withHeaders)
          Padding(
            padding: padding,
            child: DateInput(
              initialValue: DateTime.now(),
              dateErrorStream: presenter.dateErrorStream,
              onChangeDate: presenter.onChangeDate,
            ),
          ),
        if (withHeaders)
          Padding(
            padding: padding,
            child: TitleInput(
              title: '',
              titleErrorStream: presenter.titleErrorStream,
              validateTitle: presenter.onChangeTitle,
            ),
          ),
        Padding(
          padding: padding,
          child: DiaryInput(
            initialText: 'test',
            controller: controller,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(
            bottom: 24,
          ),
        )
      ],
    );
  }
}
