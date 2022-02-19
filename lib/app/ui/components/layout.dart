import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:mydeardiary/app/domain/entities/setting_entity.dart';

class Layout extends StatelessWidget {
  final Widget body;
  final FloatingActionButton? floatingActionButton;
  final bool withBackButton;
  final String title;
  final SettingEntity? setting;
  final List<Widget>? actions;

  Layout({
    required this.body,
    required this.setting,
    this.floatingActionButton,
    this.withBackButton = false,
    this.title = 'My dear diary',
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorFromHex(setting?.primaryColor ?? ''),
      appBar: AppBar(
        actions: this.actions,
        leading: withBackButton
            ? IconButton(
                onPressed: () {
                  Get.offNamed('/home');
                },
                icon: Icon(Icons.chevron_left),
              )
            : null,
        automaticallyImplyLeading: true,
        title: InkWell(
          child: Text(title.tr),
          onTap: () {
            Get.offNamed('/home');
          },
        ),
      ),
      drawer: withBackButton
          ? null
          : Drawer(
              child: ListView(
                // Important: Remove any padding from the ListView.
                padding: EdgeInsets.zero,
                children: [
                  const DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                    child: Text('My dear diary'),
                  ),
                  ListTile(
                    title: Text('Settings'.tr),
                    onTap: () {
                      Get.offNamed('/settings');
                    },
                  ),
                  ListTile(
                    title: Text('login'.tr),
                    onTap: () {
                      // Update the state of the app.
                      // ...
                    },
                  ),
                ],
              ),
            ),
      floatingActionButton: floatingActionButton,
      body: body,
    );
  }
}
