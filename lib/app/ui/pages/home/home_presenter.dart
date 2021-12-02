import 'package:mydeardiary/app/domain/entities/diary_entity.dart';
import 'package:mydeardiary/app/ui/helpers/ui_error.dart';

abstract class HomePresenter {
  Stream<UIError?> get getDiariesErrorStream;
  Stream<List<DiaryEntity>?> get diariesStream;
  Stream<UIError?> get mainErrorStream;
  Stream<String?> get navigateToStream;
  Stream<bool?> get isLoadingStream;

  Future<void> getDiaries();
  void addDiary();
}
