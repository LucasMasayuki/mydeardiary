import 'dart:convert';

import 'package:mydeardiary/app/data/cache/fetch_shared_preferences.dart';
import 'package:mydeardiary/app/data/cache/save_shared_preferences.dart';
import 'package:mydeardiary/app/domain/entities/diary_entity.dart';
import 'package:mydeardiary/app/domain/helpers/domain_errors.dart';
import 'package:mydeardiary/app/domain/usecases/diaries/edit-diary.dart';

class LocalEditDiary implements EditDiary {
  final FetchSharedPreferences fetchSharedPreferences;
  final SaveSharedPreferences saveSharedPreferences;

  LocalEditDiary({
    required this.fetchSharedPreferences,
    required this.saveSharedPreferences,
  });

  Future<void> editDiary(EditDiaryParams params) async {
    try {
      final entity = new DiaryEntity(
        text: params.text,
        title: params.title,
        date: params.date,
      );

      var diariesJson = await fetchSharedPreferences.fetch('diaries');

      var currentJson = [];

      if (diariesJson != null) {
        currentJson = json.decode(diariesJson);
      }

      currentJson[params.index] = entity.toJson();

      await saveSharedPreferences.save(
        key: 'diaries',
        value: json.encode(currentJson),
      );
    } catch (error) {
      print(error);
      throw DomainError.unexpected;
    }
  }
}
