import 'package:mydeardiary/app/domain/entities/diary_entity.dart';
import 'package:equatable/equatable.dart';

abstract class GetDiary {
  Future<DiaryEntity?> getDiary(GetDiaryParams params);
}

class GetDiaryParams extends Equatable {
  final int userId;
  final int diaryId;

  @override
  List get props => [
        userId,
        diaryId,
      ];

  const GetDiaryParams({
    required this.userId,
    required this.diaryId,
  });
}
