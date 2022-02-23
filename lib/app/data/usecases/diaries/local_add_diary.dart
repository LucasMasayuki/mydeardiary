import 'dart:convert';

import 'package:mydeardiary/app/data/cache/fetch_shared_preferences.dart';
import 'package:mydeardiary/app/data/cache/save_shared_preferences.dart';
import 'package:mydeardiary/app/domain/entities/diary_entity.dart';
import 'package:mydeardiary/app/domain/helpers/domain_errors.dart';
import 'package:mydeardiary/app/domain/usecases/diaries/add-diary.dart';

class LocalAddDiary implements AddDiary {
  final FetchSharedPreferences fetchSharedPreferences;
  final SaveSharedPreferences saveSharedPreferences;

  LocalAddDiary({
    required this.fetchSharedPreferences,
    required this.saveSharedPreferences,
  });

  @override
  Future<void> addDiary(AddDiaryParams params) async {
    try {
      final entity = DiaryEntity(
        text: params.text,
        title: params.title,
        date: params.date,
      );

      var diariesJson = await fetchSharedPreferences.fetch('diaries');

      var currentJson = [];

      if (diariesJson != null) {
        currentJson = json.decode(diariesJson);
      }

      currentJson.add(entity.toJson());

      await saveSharedPreferences.save(
        key: 'diaries',
        value: json.encode(currentJson),
      );
    } catch (error) {
      throw DomainError.unexpected;
    }
  }
}
