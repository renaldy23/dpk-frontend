import 'package:flutter/material.dart';
import '/style.dart';
import '/utils/input/textformfield.dart';

class TextFormFieldCustom extends StatelessWidget {
  const TextFormFieldCustom(
      {Key? key,
      required this.controller,
      required this.labelText,
      required this.hintText,
      this.width = 300,
      this.validator=false,
      // this.initialValue='',
      })
      : super(key: key);

  final TextEditingController controller;
  final String labelText, hintText;
  // final String? initialValue;
  final double width;
  final bool validator;

  @override
  Widget build(BuildContext context) {
    final _utilTextFormField = UtilInputTextFormField();
    return SizedBox(
      width: width,
      child: TextFormField(
        // initialValue: initialValue != null ? initialValue : null,
        controller: controller,
        // maxLines: 1,
        style: styleTextStylePrimary(),
        decoration: InputDecoration(
          labelText: labelText,
          hintStyle: styleTextStyleSecondary(),
          labelStyle: styleTextStyleSecondary(),
          hintText: hintText,
          // icon: Icon(Icons.pages_rounded),
        ),
        validator: (val) => validator ? _utilTextFormField.validatorEmpty(val) : null,
      ),
    );
  }
}
