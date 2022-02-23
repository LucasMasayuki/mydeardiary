import 'package:mydeardiary/app/data/cache/delete_shared_preferences.dart';
import 'package:mydeardiary/app/data/cache/fetch_shared_preferences.dart';
import 'package:mydeardiary/app/data/cache/save_shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesAdapter
    implements
        SaveSharedPreferences,
        FetchSharedPreferences,
        DeleteSharedPreferences {
  SharedPreferences? preferences;

  SharedPreferencesAdapter({this.preferences});

  Future<SharedPreferences?> _getInstance() async {
    preferences ??= await SharedPreferences.getInstance();

    return preferences;
  }

  @override
  Future<void> save({required String key, required String value}) async {
    await _getInstance();
    await preferences!.setString(key, value);
  }

  @override
  Future<String?> fetch(String key) async {
    await _getInstance();

    return preferences!.getString(key);
  }

  @override
  Future<void> delete(String key) async {
    await _getInstance();
    await preferences!.remove(key);
  }
}
