import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class DiaryEntity extends Equatable {
  String? humor;
  late String? title;
  late String text;
  late DateTime date;
  DateTime? created;
  DateTime? modified;

  @override
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
        'text': text,
        'title': title,
        'date': date.toString(),
      };

  DiaryEntity.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    title = json['title'];
    date = DateTime.parse(json['date']);
  }
}
