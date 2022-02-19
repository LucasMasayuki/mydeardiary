import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class SettingEntity extends Equatable {
  String? fontColor;
  String? pageColor;
  String? primaryColor;
  double? fontSize;
  String? fontFamily;

  List get props => [fontColor, pageColor, primaryColor, fontSize, fontFamily];

  SettingEntity({
    required this.fontColor,
    required this.pageColor,
    required this.primaryColor,
    required this.fontSize,
    required this.fontFamily,
  });

  Map<String, dynamic> toJson() => {
        'fontColor': this.fontColor,
        'pageColor': this.pageColor,
        'primaryColor': this.primaryColor,
        'fontSize': this.fontSize,
        'fontFamily': this.fontFamily,
      };

  SettingEntity.fromJson(Map<String, dynamic> json) {
    this.fontColor = json['fontColor'];
    this.pageColor = json['pageColor'];
    this.primaryColor = json['primaryColor'];
    this.fontSize = json['fontSize'];
    this.fontFamily = json['fontFamily'];
  }
}
