import 'package:mydeardiary/app/domain/entities/setting_entity.dart';
import 'package:mydeardiary/app/ui/components/buttons/add_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mydeardiary/app/utils/color_helper.dart';

class EmptyView extends StatelessWidget {
  final String text;
  final String buttonText;
  final SettingEntity? setting;
  final void Function() onPressButton;

  const EmptyView(this.text, this.buttonText, this.onPressButton, this.setting,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(
      createColorFromHex(
        setting?.fontColor ?? '',
      ),
    );
    return Center(
      child: Column(
        children: [
          Icon(
            Icons.history_edu_outlined,
            color: createColorFromHex(
              setting?.fontColor ?? '',
            ),
            size: 40,
          ),
          const Padding(padding: EdgeInsets.only(bottom: 24)),
          Text(
            text.tr,
            style: TextStyle(
              fontSize: 24,
              fontFamily: setting?.fontFamily,
              color: createColorFromHex(
                setting?.fontColor ?? '',
              ),
            ),
          ),
          const Padding(padding: EdgeInsets.only(bottom: 24)),
          AddButton(
            text: buttonText,
            onPressed: onPressButton,
            setting: setting,
          )
        ],
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
  }
}
