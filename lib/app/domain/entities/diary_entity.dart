import 'package:equatable/equatable.dart';

class DiaryEntity extends Equatable {
  String? humor;
  late String? title;
  late String text;
  late DateTime date;
  DateTime? created;
  DateTime? modified;

  List get props => [text];

  DiaryEntity({
    required this.text,
    required this.title,
    required this.date,
    this.created,
    this.modified,
    this.humor,
  });

  Map<String, dynamic> toJson() => {
        'text': this.text,
        'title': this.title,
        'date': this.date.toString(),
      };

  DiaryEntity.fromJson(Map<String, dynamic> json) {
    this.text = json['text'];
    this.title = json['title'];
    this.date = DateTime.parse(json['date']);
  }
}
