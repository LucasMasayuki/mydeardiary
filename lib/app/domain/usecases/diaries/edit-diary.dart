import 'package:equatable/equatable.dart';

abstract class EditDiary {
  Future<void> editDiary(EditDiaryParams params);
}

class EditDiaryParams extends Equatable {
  late final int index;
  late final String title;
  late final DateTime date;
  late final String text;

  List get props => [
        index,
        title,
        date,
        text,
      ];

  EditDiaryParams({
    required this.index,
    required this.title,
    required this.date,
    required this.text,
  });
}
