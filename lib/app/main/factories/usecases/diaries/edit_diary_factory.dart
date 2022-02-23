import 'package:mydeardiary/app/data/usecases/diaries/local_edit_diary.dart';
import 'package:mydeardiary/app/main/factories/cache/shared_preferences_adapter_factory.dart';

LocalEditDiary makeEditDiary() => LocalEditDiary(
      fetchSharedPreferences: makeSharedPreferencesAdapter(),
      saveSharedPreferences: makeSharedPreferencesAdapter(),
    );
