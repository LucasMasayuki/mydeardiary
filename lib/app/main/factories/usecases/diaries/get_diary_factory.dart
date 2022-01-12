import 'package:mydeardiary/app/data/usecases/diaries/local_get_diary.dart';
import 'package:mydeardiary/app/domain/usecases/diaries/get-diary.dart';
import 'package:mydeardiary/app/main/factories/cache/shared_preferences_adapter_factory.dart';

GetDiary makeGetDiary() => LocalGetDiary(
      fetchSharedPreferences: makeSharedPreferencesAdapter(),
    );
