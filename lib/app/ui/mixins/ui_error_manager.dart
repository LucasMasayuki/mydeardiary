import 'package:flutter/material.dart';
import 'package:mydeardiary/app/ui/components/error_message.dart';
import 'package:mydeardiary/app/ui/helpers/ui_error.dart';

mixin UIErrorManager {
  void handleMainError(BuildContext context, Stream<UIError?> stream) {
    stream.listen((error) {
      if (error != null && error != UIError.nothing) {
        showErrorMessage(
          context,
          error.description!,
        );
      }
    });
  }
}
