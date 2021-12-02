import 'package:equatable/equatable.dart';

class DiaryViewModel extends Equatable {
  final String title;
  final DateTime date;
  final String lines;

  List get props => [title, date, lines];

  DiaryViewModel({
    required this.title,
    required this.date,
    required this.lines,
  });
}
