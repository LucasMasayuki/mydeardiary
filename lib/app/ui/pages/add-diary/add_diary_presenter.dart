import 'package:mydeardiary/app/ui/helpers/ui_error.dart';

abstract class AddDiaryPresenter {
  Stream<UIError?> get mainErrorStream;
  Stream<String?> get navigateToStream;
  Stream<bool?> get isLoadingStream;
  Stream<UIError?> get titleErrorStream;
  Stream<UIError?> get dateErrorStream;

  void onChangeDate(DateTime date);
  void onChangeTitle(String title);

  Future<void> addDiary(String text);
}
