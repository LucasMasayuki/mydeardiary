import 'package:mydeardiary/app/domain/entities/diary_entity.dart';
import 'package:mydeardiary/app/ui/components/layout.dart';
import 'package:mydeardiary/app/ui/pages/home/components/diary-list.dart';
import 'package:mydeardiary/app/ui/pages/home/home_presenter.dart';
import 'package:flutter/material.dart';
import 'package:mydeardiary/app/ui/mixins/loading_manager.dart';
import 'package:mydeardiary/app/ui/mixins/navigation_manager.dart';
import 'package:mydeardiary/app/ui/mixins/ui_error_manager.dart';

import 'components/empty-view.dart';
import 'components/shimmer-loading-list.dart';

class HomePage extends StatelessWidget
    with LoadingManager, UIErrorManager, NavigationManager {
  final HomePresenter presenter;

  HomePage(this.presenter);

  @override
  Widget build(BuildContext context) {
    return Layout(
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
                return ShimmerLoadingList();
              }

              final diaries = snapshot.data;

              if (diaries == null || diaries.length == 0) {
                return EmptyView(
                  'No pages found',
                  'Add page',
                  () => presenter.addDiary(),
                );
              }

              return ListView.builder(
                itemCount: diaries.length,
                padding: EdgeInsets.all(16),
                itemBuilder: (_, index) {
                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blueAccent,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    margin: EdgeInsets.only(top: 8, bottom: 8),
                    child: ListTile(
                      leading: Icon(Icons.calendar_today),
                      title: Text(
                        diaries[index].title ?? diaries[index].text,
                        style: TextStyle(
                          fontFamily: 'IndieFlower',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () => presenter.readDiary(index),
                      visualDensity: VisualDensity.comfortable,
                      subtitle: Text(diaries[index].text),
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
        child: Icon(Icons.edit),
        onPressed: presenter.addDiary,
      ),
    );
  }
}
