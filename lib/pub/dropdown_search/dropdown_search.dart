import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';

// typedef String DropdownSearchItemAsString<T>(T? item);

class DropDownSearchCustom<T> extends StatelessWidget {
  const DropDownSearchCustom({
    Key? key,
    required this.width,
    required this.hintText,
    required this.labelText,
    required this.items,
    required this.onChanged,
    this.itemAsString,
    this.validator = true,
  }) : super(key: key);

  final double width;
  final String hintText, labelText;
  final List<T> items;
  final Function onChanged;
  final DropdownSearchItemAsString<T>? itemAsString;
  final bool validator;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: DropdownSearch<T>(
        // maxHeight: 100,/ 
        validator: (v) => validator ? v == null ? "required field" : null : null,
        dropdownSearchDecoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
        ),
        mode: Mode.MENU,
        // showSelectedItems: true,
        items: items,
        itemAsString: itemAsString,
        onChanged: (val) => onChanged(val),
      ),
    );
  }
}
