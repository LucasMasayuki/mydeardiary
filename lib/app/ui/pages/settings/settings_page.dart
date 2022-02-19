import 'package:get/get.dart';
import 'package:mydeardiary/app/domain/entities/setting_entity.dart';
import 'package:mydeardiary/app/ui/components/layout.dart';
import 'package:flutter/material.dart';
import 'package:mydeardiary/app/ui/mixins/loading_manager.dart';
import 'package:mydeardiary/app/ui/mixins/navigation_manager.dart';
import 'package:mydeardiary/app/ui/mixins/ui_error_manager.dart';
import 'package:mydeardiary/app/ui/pages/settings/components/color_selector.dart';
import 'package:mydeardiary/app/ui/pages/settings/components/color_selector_range.dart';
import 'package:mydeardiary/app/ui/pages/settings/components/font_selector.dart';
import 'package:mydeardiary/app/ui/pages/settings/components/preview_diary.dart';
import 'package:mydeardiary/app/ui/pages/settings/settings_presenter.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({
    Key? key,
  }) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage>
    with LoadingManager, UIErrorManager, NavigationManager {
  SettingPresenter presenter = Get.find<SettingPresenter>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      handleLoading(context, presenter.isLoadingStream);
      presenter.getSetting();

      return StreamBuilder<SettingEntity?>(
        stream: presenter.settingStream,
        builder: (context, snapshot) {
          final setting = snapshot.data;

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Layout(
              setting: setting,
              title: 'Carregando...',
              withBackButton: true,
              body: Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          }

          return Layout(
            setting: setting,
            actions: [],
            title: 'Configuração',
            withBackButton: true,
            body: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Cor da página',
                      style: TextStyle(color: Colors.white),
                    ),
                    Row(
                      children: [
                        ColorSelectorRange(onClickColor: () => {}),
                        ColorSelector(
                          pickerColor: Colors.black,
                          onColorChanged: (color) => {},
                        ),
                      ],
                    ),
                    Text(
                      'Cor do texto',
                      style: TextStyle(color: Colors.white),
                    ),
                    Row(
                      children: [
                        ColorSelectorRange(onClickColor: () => {}),
                        ColorSelector(
                            pickerColor: Colors.black,
                            onColorChanged: (color) => {}),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Estilo da texto: ',
                          style: TextStyle(color: Colors.white),
                        ),
                        FontSelector(onClickFont: () => {}),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Tamanho do texto: ',
                          style: TextStyle(color: Colors.white),
                        ),
                        Slider(value: 0, onChanged: (double size) => {}),
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 30)),
                    PreviewDiary(
                      fontSize: 14,
                      text:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                      height: MediaQuery.of(context).size.height * 0.15,
                      width: MediaQuery.of(context).size.width * 1,
                    ),
                  ],
                ),
                padding: EdgeInsets.all(20),
              ),
            ),
          );
        },
      );
    });
  }
}
