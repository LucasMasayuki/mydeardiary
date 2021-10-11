import 'package:equatable/equatable.dart';

class DiaryEntity extends Equatable {
  final String? humor;
  final String? title;
  final String text;
  final DateTime date;
  final DateTime? created;
  final DateTime? modified;

  List get props => [text];

  DiaryEntity({
    required this.text,
    required this.title,
    required this.date,
    this.created,
    this.modified,
    this.humor,
  });
}
