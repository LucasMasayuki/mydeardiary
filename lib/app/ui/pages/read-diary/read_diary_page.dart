import 'package:get/get.dart';
import 'package:mydeardiary/app/ui/components/layout.dart';
import 'package:flutter/material.dart';
import 'package:mydeardiary/app/ui/mixins/loading_manager.dart';
import 'package:mydeardiary/app/ui/mixins/navigation_manager.dart';
import 'package:mydeardiary/app/ui/mixins/ui_error_manager.dart';
import 'package:mydeardiary/app/ui/pages/home/components/empty-view.dart';
import 'package:mydeardiary/app/ui/pages/read-diary/read_diary_presenter.dart';
import 'package:mydeardiary/app/ui/pages/read-diary/read_diary_view_model.dart';
import 'package:page_turn/page_turn.dart';

import 'components/read_diary_unique_page.dart';

class ReadDiaryPage extends StatefulWidget {
  const ReadDiaryPage({
    Key? key,
  }) : super(key: key);

  @override
  _ReadDiaryPageState createState() => _ReadDiaryPageState();
}

class _ReadDiaryPageState extends State<ReadDiaryPage>
    with LoadingManager, UIErrorManager, NavigationManager {
  final _controller = GlobalKey<PageTurnState>();
  ReadDiaryPresenter presenter = Get.find<ReadDiaryPresenter>();
  final index = Get.parameters['index'];
  int totalPages = 1;

  @override
  void initState() {
    _controller.currentState?.initState();
    super.initState();
  }

  @override
  void dispose() {
    _controller.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      handleMainError(context, presenter.mainErrorStream);
      handleLoading(context, presenter.isLoadingStream);
      handleNavigation(presenter.navigateToStream, clear: true);
      presenter.getDiary(int.parse(index!));

      return StreamBuilder<ReadDiaryViewModel?>(
        stream: presenter.diaryStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Layout(
              title: 'Carregando...',
              withBackButton: true,
              body: Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          }

          final viewModel = snapshot.data;

          if (viewModel == null || viewModel.pages.length == 0) {
            return EmptyView('No pages found', 'Add page', () => {});
          }

          var i = -1;
          List<Widget> pages = viewModel.pages.map<Widget>((page) {
            i++;

            return ReadDiaryUniquePage(
              withHeaders: i == 0,
              page: i,
              viewModel: viewModel,
            );
          }).toList();

          return Layout(
            actions: [
              DropdownButton<int>(
                items: List.generate(
                  totalPages,
                  (i) => DropdownMenuItem<int>(
                    value: i,
                    child: Text(i.toString()),
                  ),
                ),
                onChanged: (int? page) =>
                    {_controller.currentState?.goToPage(page!)},
                value: _controller.currentState?.pageNumber,
              ),
              IconButton(
                onPressed: () {
                  presenter.goToEditDiary(int.parse(index!));
                },
                icon: Icon(Icons.edit),
              ),
            ],
            title: viewModel.title,
            withBackButton: true,
            body: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: PageTurn(
                  key: _controller,
                  backgroundColor: Theme.of(context).primaryColor,
                  children: pages,
                ),
              ),
            ),
          );
        },
      );
    });
  }
}
