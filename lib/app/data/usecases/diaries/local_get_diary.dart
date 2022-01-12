import 'dart:convert';

import 'package:mydeardiary/app/data/cache/fetch_shared_preferences.dart';
import 'package:mydeardiary/app/domain/entities/diary_entity.dart';
import 'package:mydeardiary/app/domain/helpers/domain_errors.dart';
import 'package:mydeardiary/app/domain/usecases/diaries/get-diary.dart';

class LocalGetDiary implements GetDiary {
  final FetchSharedPreferences fetchSharedPreferences;

  LocalGetDiary({
    required this.fetchSharedPreferences,
  });

  Future<DiaryEntity?> getDiary(GetDiaryParams params) async {
    try {
      final diaries = await fetchSharedPreferences.fetch('diaries');
      if (diaries == null) {
        return null;
      }

      final diariesRaw = json.decode(diaries) as List<dynamic>;

      return DiaryEntity.fromJson(diariesRaw[params.diaryId]);
    } catch (error) {
      print(error);
      throw DomainError.unexpected;
    }
  }
}
