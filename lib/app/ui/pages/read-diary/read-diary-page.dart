import 'package:mydeardiary/app/ui/components/layout.dart';
import 'package:flutter/material.dart';
import 'package:mydeardiary/app/ui/pages/add-diary/components/diary_page.dart';
import 'package:page_turn/page_turn.dart';

class ReadDiaryPage extends StatefulWidget {
  const ReadDiaryPage({
    Key? key,
  }) : super(key: key);

  @override
  _ReadDiaryPageState createState() => _ReadDiaryPageState();
}

class _ReadDiaryPageState extends State<ReadDiaryPage> {
  final _controller = GlobalKey<PageTurnState>();

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
    print(_controller.currentState?.pageNumber);
    return Layout(
      actions: [
        DropdownButton<int>(
          items: List.generate(
            6,
            (i) => DropdownMenuItem<int>(
              value: i,
              child: Text(i.toString()),
            ),
          ),
          onChanged: (int? page) => {_controller.currentState?.goToPage(page!)},
          value: _controller.currentState?.pageNumber,
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.check),
        ),
      ],
      title: 'Write',
      withBackButton: true,
      body: PageTurn(
        key: _controller,
        backgroundColor: Theme.of(context).primaryColor,
        children: [
          DiaryPage(
            withHeaders: true,
          ),
          DiaryPage(),
          DiaryPage(),
          DiaryPage(),
          DiaryPage(),
          DiaryPage(),
          DiaryPage(),
          DiaryPage(),
          DiaryPage(),
        ],
      ),
    );
  }
}
