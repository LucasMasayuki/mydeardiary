import 'package:flutter/material.dart';
import 'package:mydeardiary/app/ui/helpers/ui_error.dart';

class TitleInput extends StatelessWidget {
  final Stream<UIError?> titleErrorStream;
  final void Function(String) validateTitle;
  final String title;

  const TitleInput({
    required this.titleErrorStream,
    required this.validateTitle,
    this.title = '',
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UIError?>(
      stream: titleErrorStream,
      builder: (context, snapshot) {
        return TextFormField(
          initialValue: this.title,
          decoration: InputDecoration(
            // filled: true,
            // fillColor: Theme.of(context).primaryColor,
            labelText: 'Coloque um titulo',
            border: UnderlineInputBorder(),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            prefixIcon: Icon(
              Icons.text_fields,
              color: Theme.of(context).primaryColorLight,
            ),
            errorText: snapshot.hasData ? snapshot.data!.description : null,
          ),
          keyboardType: TextInputType.name,
          onChanged: validateTitle,
        );
      },
    );
  }
}
