import 'package:get/get.dart';
import 'package:mydeardiary/app/domain/entities/diary_entity.dart';
import 'package:mydeardiary/app/domain/entities/setting_entity.dart';
import 'package:mydeardiary/app/ui/components/inputs/date_input.dart';
import 'package:mydeardiary/app/ui/components/inputs/title_input.dart';
import 'package:mydeardiary/app/ui/components/layout.dart';
import 'package:flutter/material.dart';
import 'package:mydeardiary/app/ui/mixins/loading_manager.dart';
import 'package:mydeardiary/app/ui/mixins/navigation_manager.dart';
import 'package:mydeardiary/app/ui/mixins/ui_error_manager.dart';
import 'package:mydeardiary/app/ui/pages/edit-diary/edit_diary_presenter.dart';
import 'package:mydeardiary/app/ui/pages/settings/settings_presenter.dart';

import '../../components/inputs/diary-input.dart';

class EditDiaryPage extends StatelessWidget
    with LoadingManager, UIErrorManager, NavigationManager {
  const EditDiaryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EditDiaryPresenter presenter = Get.find<EditDiaryPresenter>();
    SettingPresenter settingPresenter = Get.find<SettingPresenter>();

    final index = Get.parameters['index'];

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

            return Builder(
              builder: (context) {
                handleMainError(context, presenter.mainErrorStream);
                handleLoading(context, presenter.isLoadingStream);
                handleNavigation(presenter.navigateToStream, clear: true);
                presenter.getDiary(int.parse(index!));

                return StreamBuilder<DiaryEntity?>(
                  stream: presenter.diaryStream,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Layout(
                        setting: setting,
                        title: 'Carregando...',
                        withBackButton: true,
                        body: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }

                    final diary = snapshot.data;

                    return Layout(
                      setting: setting,
                      actions: [
                        IconButton(
                          onPressed: () {
                            presenter.editDiary(
                                controller.text, int.parse(index));
                          },
                          icon: const Icon(Icons.check),
                        ),
                      ],
                      title: 'Edit ${diary?.title}',
                      withBackButton: true,
                      body: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Padding(
                              padding: padding,
                              child: DateInput(
                                initialValue: diary?.created,
                                dateErrorStream: presenter.dateErrorStream,
                                onChangeDate: presenter.onChangeDate,
                              ),
                            ),
                            Padding(
                              padding: padding,
                              child: TitleInput(
                                title: diary?.title ?? '',
                                titleErrorStream: presenter.titleErrorStream,
                                validateTitle: presenter.onChangeTitle,
                              ),
                            ),
                            Padding(
                              padding: padding,
                              child: DiaryInput(
                                initialText: diary?.text ?? '',
                                controller: controller,
                                fontSize: 18,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(
                                bottom: 24,
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            );
          },
        );
      },
    );
  }
}
