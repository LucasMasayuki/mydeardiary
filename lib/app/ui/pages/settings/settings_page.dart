import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:mydeardiary/app/domain/entities/setting_entity.dart';
import 'package:mydeardiary/app/domain/usecases/settings/edit_setting.dart';
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

// ignore: must_be_immutable
class SettingsPage extends StatelessWidget
    with LoadingManager, UIErrorManager, NavigationManager {
  SettingPresenter presenter = Get.find<SettingPresenter>();

  Future<void> onClickEditSetting(EditSettingParams params) async {
    try {
      await presenter.editSetting(params);
      presenter.getSetting();
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      handleLoading(context, presenter.isLoadingStream);
      presenter.getSetting();

      return StreamBuilder<SettingEntity?>(
        stream: presenter.settingStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting &&
              snapshot.data == null) {
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }

          final setting = snapshot.data;

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
                      'Cor primária do app',
                      style: TextStyle(
                        color: colorFromHex(setting?.fontColor ?? ''),
                        fontFamily: setting?.fontFamily,
                      ),
                    ),
                    Row(
                      children: [
                        ColorSelectorRange(
                          onClickColor: (Color color) {
                            var params = new EditSettingParams(
                              fontColor: setting?.fontColor,
                              fontFamily: setting?.fontFamily,
                              fontSize: setting?.fontSize,
                              pageColor: setting?.pageColor,
                              primaryColor: colorToHex(color),
                            );

                            onClickEditSetting(params);
                          },
                        ),
                        ColorSelector(
                          pickerColor: Colors.black,
                          onColorChanged: (color) {
                            var params = new EditSettingParams(
                              fontColor: setting?.fontColor,
                              fontFamily: setting?.fontFamily,
                              fontSize: setting?.fontSize,
                              pageColor: setting?.pageColor,
                              primaryColor: colorToHex(color),
                            );

                            onClickEditSetting(params);
                          },
                        ),
                      ],
                    ),
                    Text(
                      'Cor da página',
                      style: TextStyle(
                        color: colorFromHex(setting?.fontColor ?? ''),
                        fontFamily: setting?.fontFamily,
                      ),
                    ),
                    Row(
                      children: [
                        ColorSelectorRange(
                          onClickColor: (Color color) {
                            var params = new EditSettingParams(
                              fontColor: setting?.fontColor,
                              fontFamily: setting?.fontFamily,
                              fontSize: setting?.fontSize,
                              pageColor: colorToHex(color),
                              primaryColor: setting?.primaryColor,
                            );

                            onClickEditSetting(params);
                          },
                        ),
                        ColorSelector(
                          pickerColor: Colors.black,
                          onColorChanged: (Color color) {
                            var params = new EditSettingParams(
                              fontColor: setting?.fontColor,
                              fontFamily: setting?.fontFamily,
                              fontSize: setting?.fontSize,
                              pageColor: colorToHex(color),
                              primaryColor: setting?.primaryColor,
                            );

                            onClickEditSetting(params);
                          },
                        ),
                      ],
                    ),
                    Text(
                      'Cor do texto',
                      style: TextStyle(
                        color: colorFromHex(setting?.fontColor ?? ''),
                        fontFamily: setting?.fontFamily,
                      ),
                    ),
                    Row(
                      children: [
                        ColorSelectorRange(
                          onClickColor: (Color color) {
                            var params = new EditSettingParams(
                              fontColor: colorToHex(color),
                              fontFamily: setting?.fontFamily,
                              fontSize: setting?.fontSize,
                              pageColor: setting?.pageColor,
                              primaryColor: setting?.primaryColor,
                            );

                            onClickEditSetting(params);
                          },
                        ),
                        ColorSelector(
                          pickerColor: Colors.black,
                          onColorChanged: (Color color) {
                            var params = new EditSettingParams(
                              fontColor: colorToHex(color),
                              fontFamily: setting?.fontFamily,
                              fontSize: setting?.fontSize,
                              pageColor: setting?.pageColor,
                              primaryColor: setting?.primaryColor,
                            );

                            onClickEditSetting(params);
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Estilo da texto: ',
                          style: TextStyle(
                            color: colorFromHex(setting?.fontColor ?? ''),
                            fontFamily: setting?.fontFamily,
                          ),
                        ),
                        FontSelector(
                          onClickFont: (String fontFamily) {
                            var params = new EditSettingParams(
                              fontColor: setting?.fontColor,
                              fontFamily: fontFamily,
                              fontSize: setting?.fontSize,
                              pageColor: setting?.pageColor,
                              primaryColor: setting?.primaryColor,
                            );

                            onClickEditSetting(params);
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Tamanho do texto: ',
                          style: TextStyle(
                            color: colorFromHex(setting?.fontColor ?? ''),
                            fontFamily: setting?.fontFamily,
                          ),
                        ),
                        Slider(
                          min: 12,
                          max: 32,
                          value: setting?.fontSize ?? 12,
                          onChanged: (double size) {
                            print(size);
                            var params = new EditSettingParams(
                              fontColor: setting?.fontColor,
                              fontFamily: setting?.fontFamily,
                              fontSize: size,
                              pageColor: setting?.pageColor,
                              primaryColor: setting?.primaryColor,
                            );

                            onClickEditSetting(params);
                          },
                        ),
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 30)),
                    PreviewDiary(
                      setting: setting,
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
