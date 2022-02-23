import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class SettingEntity extends Equatable {
  String? fontColor;
  String? pageColor;
  String? primaryColor;
  double? fontSize;
  String? fontFamily;

  @override
  List get props => [fontColor, pageColor, primaryColor, fontSize, fontFamily];

  SettingEntity({
    required this.fontColor,
    required this.pageColor,
    required this.primaryColor,
    required this.fontSize,
    required this.fontFamily,
  });

  Map<String, dynamic> toJson() => {
        'fontColor': fontColor,
        'pageColor': pageColor,
        'primaryColor': primaryColor,
        'fontSize': fontSize,
        'fontFamily': fontFamily,
      };

  SettingEntity.fromJson(Map<String, dynamic> json) {
    fontColor = json['fontColor'];
    pageColor = json['pageColor'];
    primaryColor = json['primaryColor'];
    fontSize = json['fontSize'];
    fontFamily = json['fontFamily'];
  }
}
