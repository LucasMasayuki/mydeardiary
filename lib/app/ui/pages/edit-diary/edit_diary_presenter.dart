import 'package:mydeardiary/app/domain/entities/diary_entity.dart';
import 'package:mydeardiary/app/ui/helpers/ui_error.dart';

abstract class EditDiaryPresenter {
  Stream<UIError?> get mainErrorStream;
  Stream<String?> get navigateToStream;
  Stream<bool?> get isLoadingStream;
  Stream<UIError?> get titleErrorStream;
  Stream<DiaryEntity?> get diaryStream;
  Stream<UIError?> get dateErrorStream;

  void onChangeDate(DateTime date);
  void onChangeTitle(String title);

  Future<void> editDiary(String text, int index);
  Future<void> getDiary(int index);
}
