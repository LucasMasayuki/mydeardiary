import 'dart:convert';

import 'package:mydeardiary/app/data/cache/fetch_shared_preferences.dart';
import 'package:mydeardiary/app/domain/entities/diary_entity.dart';
import 'package:mydeardiary/app/domain/helpers/domain_errors.dart';
import 'package:mydeardiary/app/domain/usecases/diaries/get-diaries.dart';

class LocalGetDiaries implements GetDiaries {
  final FetchSharedPreferences fetchSharedPreferences;

  LocalGetDiaries({
    required this.fetchSharedPreferences,
  });

  Future<List<DiaryEntity>> getDiaries(GetDiariesParams params) async {
    try {
      final diaries = await fetchSharedPreferences.fetch('diaries');
      if (diaries == null) {
        return [];
      }

      final diariesRaw = json.decode(diaries) as List<dynamic>;

      print(
          diariesRaw.map((element) => DiaryEntity.fromJson(element)).toList());

      return diariesRaw
          .map((element) => DiaryEntity.fromJson(element))
          .toList();
    } catch (error) {
      print(error);
      throw DomainError.unexpected;
    }
  }
}
