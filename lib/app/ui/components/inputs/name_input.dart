import 'package:flutter/material.dart';
import 'package:mydeardiary/app/ui/helpers/i18n/resources.dart';
import 'package:mydeardiary/app/ui/helpers/ui_error.dart';

class NameInput extends StatelessWidget {
  final Stream<UIError?> nameErrorStream;
  final void Function(String) validateName;

  const NameInput({
    Key? key,
    required this.nameErrorStream,
    required this.validateName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UIError?>(
      stream: nameErrorStream,
      builder: (context, snapshot) {
        return TextFormField(
          decoration: InputDecoration(
            labelText: R.string.name,
            icon: Icon(
              Icons.person,
              color: Theme.of(context).primaryColorLight,
            ),
            errorText: snapshot.hasData ? snapshot.data!.description : null,
          ),
          keyboardType: TextInputType.name,
          onChanged: validateName,
        );
      },
    );
  }
}
