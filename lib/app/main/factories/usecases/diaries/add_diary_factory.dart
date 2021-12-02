import 'package:mydeardiary/app/data/usecases/diaries/local_add_diary.dart';
import 'package:mydeardiary/app/domain/usecases/diaries/add-diary.dart';
import 'package:mydeardiary/app/main/factories/cache/shared_preferences_adapter_factory.dart';

AddDiary makeAddDiary() => LocalAddDiary(
      fetchSharedPreferences: makeSharedPreferencesAdapter(),
      saveSharedPreferences: makeSharedPreferencesAdapter(),
    );
