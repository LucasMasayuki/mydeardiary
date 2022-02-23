import 'package:intl/intl.dart';
import 'package:mydeardiary/app/domain/entities/diary_entity.dart';
import 'package:mydeardiary/app/domain/entities/setting_entity.dart';
import 'package:mydeardiary/app/ui/components/layout.dart';
import 'package:mydeardiary/app/ui/pages/home/home_presenter.dart';
import 'package:flutter/material.dart';
import 'package:mydeardiary/app/ui/mixins/loading_manager.dart';
import 'package:mydeardiary/app/ui/mixins/navigation_manager.dart';
import 'package:mydeardiary/app/ui/mixins/ui_error_manager.dart';
import 'package:mydeardiary/app/ui/pages/settings/settings_presenter.dart';
import 'package:mydeardiary/app/utils/color_helper.dart';

import 'components/empty-view.dart';
import 'components/shimmer-loading-list.dart';

Map<String, IconData> iconMapping = {
  'ac_unit': Icons.ac_unit,
};

class HomePage extends StatelessWidget
    with LoadingManager, UIErrorManager, NavigationManager {
  final HomePresenter presenter;
  final SettingPresenter settingPresenter;

  HomePage(this.presenter, this.settingPresenter, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              body: Builder(
                builder: (context) {
                  handleMainError(context, presenter.mainErrorStream);
                  handleLoading(context, presenter.isLoadingStream);
                  handleNavigation(presenter.navigateToStream, clear: true);
                  presenter.getDiaries();

                  return StreamBuilder<List<DiaryEntity>?>(
                    stream: presenter.diariesStream,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const ShimmerLoadingList();
                      }

                      final diaries = snapshot.data;

                      if (diaries == null || diaries.isEmpty) {
                        return EmptyView(
                          'No pages found',
                          'Add page',
                          () => presenter.addDiary(),
                          setting,
                        );
                      }

                      final formatter = DateFormat('dd/MM/yy');

                      return ListView.builder(
                        itemCount: diaries.length,
                        padding: const EdgeInsets.all(16),
                        itemBuilder: (_, index) {
                          return Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: createColorFromHex(
                                  setting?.fontColor ?? '',
                                ),
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(8),
                              ),
                            ),
                            margin: const EdgeInsets.only(top: 8, bottom: 8),
                            child: ListTile(
                              leading: SizedBox(
                                height: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.calendar_today,
                                      color: createColorFromHex(
                                        setting?.fontColor ?? '',
                                      ),
                                    ),
                                    const Spacer(),
                                    Text(
                                      formatter.format(diaries[index].date),
                                      style: TextStyle(
                                        fontFamily: setting?.fontFamily,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: createColorFromHex(
                                          setting?.fontColor ?? '',
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              title: Text(
                                diaries[index].title ?? diaries[index].text,
                                style: TextStyle(
                                  fontFamily: setting?.fontFamily,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: createColorFromHex(
                                    setting?.fontColor ?? '',
                                  ),
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              onTap: () => presenter.readDiary(index),
                              visualDensity: VisualDensity.comfortable,
                              subtitle: Text(
                                diaries[index].text,
                                maxLines: 4,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontFamily: setting?.fontFamily,
                                  fontSize: setting?.fontSize,
                                  color: createColorFromHex(
                                    setting?.fontColor ?? '',
                                  ),
                                ),
                              ),
                              trailing: Icon(iconMapping[diaries[index].humor]),
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              ),
              floatingActionButton: FloatingActionButton(
                child: Icon(
                  Icons.edit,
                  color: createColorFromHex(
                    setting?.fontColor ?? '',
                  ),
                ),
                onPressed: presenter.addDiary,
                backgroundColor: createColorFromHex(
                  setting?.primaryColor ?? '',
                ),
                focusColor: createColorFromHex(
                  setting?.primaryColor ?? '',
                ).withOpacity(0.5),
              ),
            );
          },
        );
      },
    );
  }
}
