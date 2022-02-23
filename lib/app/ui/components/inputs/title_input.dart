import 'package:flutter/material.dart';
import 'package:mydeardiary/app/domain/entities/setting_entity.dart';
import 'package:mydeardiary/app/ui/helpers/ui_error.dart';
import 'package:mydeardiary/app/utils/color_helper.dart';

class TitleInput extends StatelessWidget {
  final Stream<UIError?> titleErrorStream;
  final void Function(String) validateTitle;
  final String title;
  final SettingEntity? setting;

  const TitleInput({
    Key? key,
    required this.titleErrorStream,
    required this.validateTitle,
    this.title = '',
    this.setting,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UIError?>(
      stream: titleErrorStream,
      builder: (context, snapshot) {
        return TextFormField(
          initialValue: title,
          style: TextStyle(
            color: createColorFromHex(setting?.fontColor ?? ''),
            fontFamily: setting?.fontFamily,
            fontSize: setting?.fontSize,
          ),
          decoration: InputDecoration(
            fillColor: createColorFromHex(setting?.fontColor ?? ''),
            focusColor: createColorFromHex(setting?.primaryColor ?? ''),
            labelStyle: TextStyle(
              color: createColorFromHex(setting?.fontColor ?? ''),
              fontFamily: setting?.fontFamily,
              fontSize: setting?.fontSize,
            ),
            // filled: true,
            // fillColor: Theme.of(context).primaryColor,
            labelText: 'Coloque um titulo',
            border: const UnderlineInputBorder(),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            prefixIcon: Icon(
              Icons.text_fields,
              color: createColorFromHex(setting?.primaryColor ?? ''),
            ),
            errorText: snapshot.hasData ? snapshot.data!.description : null,
          ),
          keyboardType: TextInputType.name,
          onChanged: validateTitle,
        );
      },
    );
  }
}
