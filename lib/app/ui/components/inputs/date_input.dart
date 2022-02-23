import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mydeardiary/app/domain/entities/setting_entity.dart';
import 'package:mydeardiary/app/ui/helpers/ui_error.dart';
import 'package:mydeardiary/app/utils/color_helper.dart';

class DateInput extends StatelessWidget {
  final Stream<UIError?> dateErrorStream;
  final void Function(DateTime) onChangeDate;
  final DateTime? initialValue;
  final SettingEntity? setting;

  const DateInput({
    Key? key,
    required this.dateErrorStream,
    required this.onChangeDate,
    this.initialValue,
    this.setting,
  }) : super(key: key);

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
          padding: const EdgeInsets.only(bottom: 2, top: 2),
          decoration: const BoxDecoration(
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
                icon: const Icon(Icons.calendar_today),
                color: createColorFromHex(setting?.primaryColor ?? ''),
                onPressed: () {
                  _selectDate(context);
                },
              ),
              Text(
                DateFormat.yMMMMd('en_US').format(
                  initialValue ?? DateTime.now(),
                ),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: createColorFromHex(setting?.fontColor ?? ''),
                  fontFamily: setting?.fontFamily,
                  fontSize: setting?.fontSize,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
