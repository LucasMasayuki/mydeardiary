import 'package:mydeardiary/app/ui/helpers/ui_error.dart';
import 'package:mydeardiary/app/ui/pages/read-diary/read_diary_view_model.dart';

abstract class ReadDiaryPresenter {
  Stream<UIError?> get mainErrorStream;
  Stream<String?> get navigateToStream;
  Stream<bool?> get isLoadingStream;
  Stream<ReadDiaryViewModel?> get diaryStream;
  int get totalPages;

  Future<void> getDiary(int index);
  void goToEditDiary(int index);
}
