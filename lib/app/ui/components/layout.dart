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

  const Layout({
    Key? key,
    required this.body,
    required this.setting,
    this.floatingActionButton,
    this.withBackButton = false,
    this.title = 'My dear diary',
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorFromHex(setting?.pageColor ?? ''),
      appBar: AppBar(
        backgroundColor: colorFromHex(setting?.primaryColor ?? ''),
        actions: actions,
        iconTheme: IconThemeData(color: colorFromHex(setting?.fontColor ?? '')),
        leading: withBackButton
            ? IconButton(
                onPressed: () {
                  Get.offNamed('/home');
                },
                icon: Icon(
                  Icons.chevron_left,
                  color: colorFromHex(setting?.fontColor ?? ''),
                ),
              )
            : null,
        automaticallyImplyLeading: true,
        title: InkWell(
          child: Text(
            title.tr,
            style: TextStyle(
              color: colorFromHex(setting?.fontColor ?? ''),
              fontFamily: setting?.fontFamily,
              fontWeight: FontWeight.bold,
            ),
          ),
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
                  DrawerHeader(
                    decoration: BoxDecoration(
                      color: colorFromHex(setting?.primaryColor ?? ''),
                    ),
                    child: Text(
                      'My dear diary',
                      style: TextStyle(
                        color: colorFromHex(setting?.fontColor ?? ''),
                        fontFamily: setting?.fontFamily,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.lock_outline),
                    title: Text(
                      'Lock'.tr,
                      style: TextStyle(
                        fontFamily: setting?.fontFamily,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {
                      Get.offNamed('/lock');
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: Text(
                      'Settings'.tr,
                      style: TextStyle(
                        fontFamily: setting?.fontFamily,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {
                      Get.offNamed('/settings');
                    },
                  ),
                  ListTile(
                    title: Text(
                      'login'.tr,
                      style: TextStyle(
                        fontFamily: setting?.fontFamily,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
