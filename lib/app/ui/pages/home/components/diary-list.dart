import 'package:get/get.dart';
import 'package:mydeardiary/app/domain/entities/diary_entity.dart';
import 'package:mydeardiary/app/ui/pages/home/components/empty-view.dart';
import 'package:mydeardiary/app/ui/pages/home/components/shimmer-loading-list.dart';
import 'package:flutter/material.dart';
import 'package:mydeardiary/app/ui/pages/home/home_presenter.dart';

Map<String, IconData> iconMapping = {
  'ac_unit': Icons.ac_unit,
};

class DiaryList extends StatelessWidget {
  final Stream<List<DiaryEntity>?> getDiaryStream;
  HomePresenter presenter = Get.find<HomePresenter>();

  DiaryList({
    required this.getDiaryStream,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<DiaryEntity>?>(
      stream: getDiaryStream,
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
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                onTap: () => presenter.readDiary(index),
                visualDensity: VisualDensity.comfortable,
                subtitle: Text(
                  diaries[index].text,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: Icon(iconMapping[diaries[index].humor]),
              ),
            );
          },
        );
      },
    );
  }
}
