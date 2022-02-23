import 'package:flutter/material.dart';
import 'package:mydeardiary/app/ui/helpers/i18n/resources.dart';
import 'package:mydeardiary/app/ui/helpers/ui_error.dart';

class PasswordInput extends StatelessWidget {
  final Stream<UIError?> passwordErrorStream;
  final void Function(String) validatePassword;

  const PasswordInput({
    Key? key,
    required this.passwordErrorStream,
    required this.validatePassword,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UIError?>(
      stream: passwordErrorStream,
      builder: (context, snapshot) {
        return TextFormField(
          decoration: InputDecoration(
            labelText: R.string.password,
            icon: Icon(Icons.lock, color: Theme.of(context).primaryColorLight),
            errorText: snapshot.hasData ? snapshot.data!.description : null,
          ),
          obscureText: true,
          onChanged: validatePassword,
        );
      },
    );
  }
}
