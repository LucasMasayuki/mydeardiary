import 'package:equatable/equatable.dart';

abstract class EditSetting {
  Future<void> editSetting(EditSettingParams params);
}

class EditSettingParams extends Equatable {
  final String pageColor;
  final String fontColor;
  final double fontSize;
  final String fontFamily;
  final String primaryColor;

  List get props => [
        pageColor,
        fontColor,
        fontSize,
        fontFamily,
        primaryColor,
      ];

  EditSettingParams({
    required this.fontSize,
    required this.pageColor,
    required this.fontColor,
    required this.fontFamily,
    required this.primaryColor,
  });
}
