import 'package:mydeardiary/app/data/usecases/diaries/local_get_diaries.dart';
import 'package:mydeardiary/app/domain/usecases/diaries/get-diaries.dart';
import 'package:mydeardiary/app/main/factories/cache/shared_preferences_adapter_factory.dart';

GetDiaries makeGetDiaries() => LocalGetDiaries(
      fetchSharedPreferences: makeSharedPreferencesAdapter(),
    );
