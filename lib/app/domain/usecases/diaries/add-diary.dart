import 'package:equatable/equatable.dart';

abstract class AddDiary {
  Future<void> addDiary(AddDiaryParams params);
}

class AddDiaryParams extends Equatable {
  final String title;
  final DateTime date;
  final String text;

  @override
  List get props => [
        title,
        date,
        text,
      ];

  const AddDiaryParams({
    required this.title,
    required this.date,
    required this.text,
  });
}
