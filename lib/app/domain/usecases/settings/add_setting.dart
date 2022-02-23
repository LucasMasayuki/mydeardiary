import 'package:equatable/equatable.dart';
import 'package:mydeardiary/app/domain/entities/setting_entity.dart';

abstract class AddSetting {
  Future<SettingEntity> addSetting(AddSettingParams params);
}

class AddSettingParams extends Equatable {
  final String pageColor;
  final String fontColor;
  final double fontSize;
  final String fontFamily;
  final String primaryColor;

  @override
  List get props => [
        pageColor,
        fontColor,
        fontSize,
        fontFamily,
        primaryColor,
      ];

  const AddSettingParams({
    required this.fontSize,
    required this.pageColor,
    required this.fontColor,
    required this.fontFamily,
    required this.primaryColor,
  });
}
