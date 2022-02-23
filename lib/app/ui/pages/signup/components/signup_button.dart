import 'package:flutter/material.dart';
import 'package:mydeardiary/app/ui/helpers/i18n/resources.dart';

class SignUpButton extends StatelessWidget {
  final Stream<bool?> isFormValidStream;
  final void Function() signUp;

  const SignUpButton({
    Key? key,
    required this.isFormValidStream,
    required this.signUp,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool?>(
      stream: isFormValidStream,
      builder: (context, snapshot) {
        return ElevatedButton(
          onPressed: snapshot.data == true ? signUp : null,
          child: Text(R.string.addAccount.toUpperCase()),
        );
      },
    );
  }
}
