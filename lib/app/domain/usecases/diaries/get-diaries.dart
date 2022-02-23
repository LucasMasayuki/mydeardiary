import 'package:mydeardiary/app/domain/entities/diary_entity.dart';
import 'package:equatable/equatable.dart';

abstract class GetDiaries {
  Future<List<DiaryEntity>> getDiaries(GetDiariesParams params);
}

class GetDiariesParams extends Equatable {
  final int? userId;

  @override
  List get props => [
        userId,
      ];

  const GetDiariesParams({
    required this.userId,
  });
}
