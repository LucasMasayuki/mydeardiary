import 'package:equatable/equatable.dart';

abstract class EditDiary {
  Future<void> editDiary(EditDiaryParams params);
}

class EditDiaryParams extends Equatable {
  final int index;
  final String title;
  final DateTime date;
  final String text;

  @override
  List get props => [
        index,
        title,
        date,
        text,
      ];

  const EditDiaryParams({
    required this.index,
    required this.title,
    required this.date,
    required this.text,
  });
}
