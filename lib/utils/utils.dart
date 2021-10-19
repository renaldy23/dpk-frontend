import 'package:flutter/material.dart';

import '/style.dart';
import '/pub/dropdown_search/dropdown_search.dart';

// Functions
bool isNumeric(String? s) {
  if (s == null) {
    return false;
  }
  return double.tryParse(s) != null;
}

String isNumericOrZero(String? s) => isNumeric(s!) ? s : '0';

// Widgets
class DropDownSearchUtils extends StatelessWidget {
  const DropDownSearchUtils({
    Key? key,
    required this.items,
    required this.labelText,
    this.hintText = '',
    required this.onChanged,
    this.selectedItem,
  }) : super(key: key);

  final List<dynamic> items;
  final Function onChanged;
  final String labelText;
  final String hintText;
  final selectedItem;

  @override
  Widget build(BuildContext context) {
    return DropDownSearchCustom(
      items: items,
      padding: EdgeInsets.all(styleDefaultPadding),
      labelText: labelText,
      hintText: hintText,
      onChanged: onChanged,
      selectedItem: selectedItem,
    );
  }
}

class CheckboxListTileUtils extends StatelessWidget {
  const CheckboxListTileUtils({
    Key? key,
    required this.title,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  final Widget title;
  final bool value;
  final Function(bool?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      controlAffinity: ListTileControlAffinity.leading,
      title: title,
      value: value,
      onChanged: onChanged,
    );
  }
}
