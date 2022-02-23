import 'package:equatable/equatable.dart';

class ReadDiaryViewModel extends Equatable {
  final String title;
  final DateTime date;
  final List<String> pages;

  @override
  List get props => [title, date, pages];

  const ReadDiaryViewModel({
    required this.title,
    required this.date,
    required this.pages,
  });
}
