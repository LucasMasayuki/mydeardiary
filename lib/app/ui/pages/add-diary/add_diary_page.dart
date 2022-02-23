import 'package:get/get.dart';
import 'package:mydeardiary/app/domain/entities/setting_entity.dart';
import 'package:mydeardiary/app/ui/components/inputs/date_input.dart';
import 'package:mydeardiary/app/ui/components/inputs/title_input.dart';
import 'package:mydeardiary/app/ui/components/layout.dart';
import 'package:flutter/material.dart';
import 'package:mydeardiary/app/ui/mixins/loading_manager.dart';
import 'package:mydeardiary/app/ui/mixins/navigation_manager.dart';
import 'package:mydeardiary/app/ui/mixins/ui_error_manager.dart';
import 'package:mydeardiary/app/ui/pages/add-diary/add_diary_presenter.dart';
import 'package:mydeardiary/app/ui/pages/settings/settings_presenter.dart';

import '../../components/inputs/diary-input.dart';

class AddDiaryPage extends StatelessWidget
    with LoadingManager, UIErrorManager, NavigationManager {
  const AddDiaryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AddDiaryPresenter presenter = Get.find<AddDiaryPresenter>();
    SettingPresenter settingPresenter = Get.find<SettingPresenter>();

    final controller = TextEditingController();
    const padding = EdgeInsets.only(
      left: 28,
      right: 28,
      top: 4,
      bottom: 4,
    );

    return Builder(
      builder: (context) {
        settingPresenter.getSetting();

        return StreamBuilder<SettingEntity?>(
          stream: settingPresenter.settingStream,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Container();
            }

            final setting = snapshot.data;

            return Layout(
              setting: setting,
              actions: [
                IconButton(
                  onPressed: () {
                    presenter.addDiary(controller.text);
                  },
                  icon: const Icon(Icons.check),
                ),
              ],
              title: 'Write',
              withBackButton: true,
              body: Builder(builder: (context) {
                handleMainError(context, presenter.mainErrorStream);
                handleNavigation(presenter.navigateToStream, clear: true);

                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Padding(
                        padding: padding,
                        child: DateInput(
                          initialValue: DateTime.now(),
                          dateErrorStream: presenter.dateErrorStream,
                          onChangeDate: presenter.onChangeDate,
                          setting: setting,
                        ),
                      ),
                      Padding(
                        padding: padding,
                        child: TitleInput(
                          title: '',
                          titleErrorStream: presenter.titleErrorStream,
                          validateTitle: presenter.onChangeTitle,
                          setting: setting,
                        ),
                      ),
                      Padding(
                        padding: padding,
                        child: DiaryInput(
                          initialText: '',
                          controller: controller,
                          fontSize: setting?.fontSize ?? 12,
                          setting: setting,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                          bottom: 24,
                        ),
                      )
                    ],
                  ),
                );
              }),
            );
          },
        );
      },
    );
  }
}
