import 'package:doc_template/Core/Validator/string_validators.dart';
import 'package:flutter/material.dart';

class TextFieldDocx extends StatelessWidget {
  final String name;
  final ValueChanged<String> onChanged;
  final bool obscureText;
  final bool validation;
  final String errorText;
  final TextEditingController textEditingController;
  final int maxText;

  TextFieldDocx.tajuk({
    this.name = 'Tajuk',
    this.obscureText = false,
    this.maxText = 60,
    @required this.validation,
    @required this.onChanged,
    @required this.errorText,
    @required this.textEditingController,
  });

  TextFieldDocx.subTajuk({
    this.name = 'Sub Tajuk',
    this.obscureText = false,
    this.maxText = 60,
    @required this.validation,
    @required this.onChanged,
    @required this.errorText,
    @required this.textEditingController,
  });

  TextFieldDocx.list({
    this.name = 'list mungkin',
    this.obscureText = false,
    this.maxText = 60,
    @required this.validation,
    @required this.onChanged,
    @required this.errorText,
    @required this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        inputFormatters: [
          ValidatorInputFormatter(
            editingValidator: MaxLengthStringValidator(maxText),
          ),
        ],
        controller: textEditingController,
        obscureText: obscureText,
        decoration: InputDecoration(
          errorText: validation ? null : errorText,
          border: OutlineInputBorder(),
          labelText: name,
        ),
        onChanged: onChanged,
      ),
    );
  }
}
