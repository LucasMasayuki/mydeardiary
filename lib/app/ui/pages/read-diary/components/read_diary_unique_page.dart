import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mydeardiary/app/domain/entities/setting_entity.dart';
import 'package:mydeardiary/app/ui/pages/read-diary/read_diary_view_model.dart';
import 'package:mydeardiary/app/utils/color_helper.dart';

import 'lines-of-diary.dart';

class ReadDiaryUniquePage extends StatelessWidget {
  final bool withHeaders;
  final int page;
  final ReadDiaryViewModel viewModel;
  final SettingEntity? setting;

  const ReadDiaryUniquePage({
    Key? key,
    required this.page,
    required this.viewModel,
    this.withHeaders = false,
    this.setting,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            child: TextFormField(
              initialValue: DateFormat.yMMMMd('en_US').format(
                viewModel.date,
              ),
              style: TextStyle(
                color: createColorFromHex(setting?.fontColor ?? ''),
                fontFamily: setting?.fontFamily,
                fontSize: setting?.fontSize,
              ),
              decoration: InputDecoration(
                labelStyle: TextStyle(
                  color: createColorFromHex(setting?.fontColor ?? ''),
                  fontFamily: setting?.fontFamily,
                  fontSize: setting?.fontSize,
                ),
                helperStyle: TextStyle(
                  color: createColorFromHex(setting?.fontColor ?? ''),
                  fontFamily: setting?.fontFamily,
                  fontSize: setting?.fontSize,
                ),
                border: const UnderlineInputBorder(),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                prefixIcon: Icon(
                  Icons.calendar_today,
                  color: Theme.of(context).primaryColorLight,
                ),
              ),
            ),
          ),
        if (withHeaders)
          Padding(
            padding: padding,
            child: TextFormField(
              initialValue: viewModel.title,
              style: TextStyle(
                color: createColorFromHex(setting?.fontColor ?? ''),
                fontFamily: setting?.fontFamily,
                fontSize: setting?.fontSize,
              ),
              decoration: InputDecoration(
                labelStyle: TextStyle(
                  color: createColorFromHex(setting?.fontColor ?? ''),
                  fontFamily: setting?.fontFamily,
                  fontSize: setting?.fontSize,
                ),
                helperStyle: TextStyle(
                  color: createColorFromHex(setting?.fontColor ?? ''),
                  fontFamily: setting?.fontFamily,
                  fontSize: setting?.fontSize,
                ),
                border: const UnderlineInputBorder(),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                prefixIcon: Icon(
                  Icons.text_fields,
                  color: Theme.of(context).primaryColorLight,
                ),
              ),
            ),
          ),
        Padding(
          padding: const EdgeInsets.only(
            left: 28,
            right: 28,
          ),
          child: LinesOfDiary(
            text: viewModel.pages[page],
            fontSize: setting?.fontSize ?? 12,
            fontColor: setting?.fontColor ?? '',
            fontFamily: setting?.fontFamily ?? '',
          ),
        ),
      ],
    );
  }
}
