import 'package:get/get.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {'en_US': enUs, 'pt_BR': ptBR};
}

final Map<String, String> enUs = {
  'hello': 'Hello World',
};

final Map<String, String> ptBR = {
  'hello': 'Hello World',
};
