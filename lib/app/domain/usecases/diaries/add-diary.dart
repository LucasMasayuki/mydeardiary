import 'package:equatable/equatable.dart';

abstract class AddDiary {
  Future<void> addDiary(AddDiaryParams params);
}

class AddDiaryParams extends Equatable {
  late final String title;
  late final DateTime date;
  late final String text;

  List get props => [
        title,
        date,
        text,
      ];

  AddDiaryParams({
    required this.title,
    required this.date,
    required this.text,
  });
}
