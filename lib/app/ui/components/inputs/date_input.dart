import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mydeardiary/app/ui/helpers/ui_error.dart';

class DateInput extends StatelessWidget {
  final Stream<UIError?> dateErrorStream;
  final void Function(DateTime) onChangeDate;
  final DateTime? initialValue;

  const DateInput({
    required this.dateErrorStream,
    required this.onChangeDate,
    this.initialValue,
  });

  Future<void> _selectDate(BuildContext context) async {
    final now = DateTime.now();

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(1900, 1),
      lastDate: now,
    );

    if (picked != null) {
      onChangeDate(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UIError?>(
      stream: dateErrorStream,
      builder: (context, snapshot) {
        return Container(
          padding: EdgeInsets.only(bottom: 2, top: 2),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.white,
                width: 1,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.calendar_today),
                color: Theme.of(context).primaryColorLight,
                onPressed: () {
                  _selectDate(context);
                },
              ),
              Text(
                DateFormat.yMMMMd('en_US').format(
                  initialValue ?? DateTime.now(),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
        // return TextFormField(
        //   decoration: InputDecoration(
        //     prefixIcon: IconButton(
        //       icon: Icon(Icons.calendar_today),
        //       color: Theme.of(context).primaryColorLight,
        //       onPressed: () {
        //         _selectDate(context);
        //       },
        //     ),
        //     errorText: snapshot.hasData ? snapshot.data!.description : null,
        //     border: UnderlineInputBorder(),
        //     enabledBorder: UnderlineInputBorder(
        //       borderSide: BorderSide(color: Colors.white),
        //     ),
        //     disabledBorder: UnderlineInputBorder(
        //       borderSide: BorderSide(color: Colors.white),
        //     ),
        //     focusedBorder: UnderlineInputBorder(
        //       borderSide: BorderSide(color: Colors.white),
        //     ),
        //   ),
        //   initialValue: DateFormat.yMMMMd('en_US').format(
        //     initialValue ?? DateTime.now(),
        //   ),
        // );
      },
    );
  }
}
