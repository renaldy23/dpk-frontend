import 'package:dpkfrontend/style.dart';
import 'package:flutter/material.dart';

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
    final _validator = TextFormFieldValidator();
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
        validator: (val) => validator ? _validator.isEmpty(val) : null,
      ),
    );
  }
}

class TextFormFieldValidator {
  isEmpty(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some value';
    }
    return null;
  }
}

