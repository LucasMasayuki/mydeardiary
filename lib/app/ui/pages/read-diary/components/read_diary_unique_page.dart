import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mydeardiary/app/ui/pages/read-diary/read_diary_view_model.dart';

import 'lines-of-diary.dart';

class ReadDiaryUniquePage extends StatelessWidget {
  final bool withHeaders;
  final int page;
  final ReadDiaryViewModel viewModel;

  ReadDiaryUniquePage({
    required this.page,
    required this.viewModel,
    this.withHeaders = false,
  });

  @override
  Widget build(BuildContext context) {
    final padding = EdgeInsets.only(
      left: 28,
      right: 28,
      top: 4,
      bottom: 4,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        if (this.withHeaders)
          Padding(
            padding: padding,
            child: TextFormField(
              initialValue: DateFormat.yMMMMd('en_US').format(
                viewModel.date,
              ),
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                prefixIcon: Icon(
                  Icons.calendar_today,
                  color: Theme.of(context).primaryColorLight,
                ),
              ),
            ),
          ),
        if (this.withHeaders)
          Padding(
            padding: padding,
            child: TextFormField(
              initialValue: viewModel.title,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: UnderlineInputBorder(
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
          padding: EdgeInsets.only(
            left: 28,
            right: 28,
          ),
          child: LinesOfDiary(
            text: viewModel.pages[page],
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
