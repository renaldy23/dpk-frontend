import '/style.dart';
import 'package:flutter/material.dart';

class ButtonBox extends StatelessWidget {
  const ButtonBox({
    Key? key,
    required this.title,
    required this.onPressed,
    this.height = 40.0,
    this.isStroked = false,
  }) : super(key: key);

  final VoidCallback onPressed;
  final double height;
  final String title;
  final bool isStroked;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        padding: EdgeInsets.fromLTRB(16, 4, 16, 4),
        alignment: Alignment.center,
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: styleTextStyleBold(
              size: 16, color: Colors.white, letterSpacing: 2),
        ),
        decoration: isStroked
            ? styleBoxDecoration(
                bgColor: Colors.transparent, color: stylePrimaryColor)
            : styleBoxDecoration(bgColor: stylePrimaryColor, radius: 6),
      ),
    );
  }
}
