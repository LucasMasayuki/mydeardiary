import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mydeardiary/app/domain/entities/setting_entity.dart';
import 'package:mydeardiary/app/utils/color_helper.dart';

class AddButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  final SettingEntity? setting;

  const AddButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.setting,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          createColorFromHex(
            setting?.primaryColor ?? '',
          ),
        ),
        elevation: MaterialStateProperty.all(2.0),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
      ),
      onPressed: onPressed,
      child: Row(
        children: [
          Icon(
            Icons.add,
            color: createColorFromHex(
              setting?.fontColor ?? '',
            ),
          ),
          Text(
            text.tr.toUpperCase(),
            style: TextStyle(
              fontFamily: setting?.fontFamily,
              fontWeight: FontWeight.bold,
              color: createColorFromHex(
                setting?.fontColor ?? '',
              ),
            ),
          ),
        ],
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
      ),
    );
  }
}
