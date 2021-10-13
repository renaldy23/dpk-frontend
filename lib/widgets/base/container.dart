import 'package:dpkfrontend/style.dart';
import 'package:flutter/material.dart';

class ContainerBox extends StatelessWidget {
  const ContainerBox({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: styleDefaultPadding),
      padding: EdgeInsets.all(styleDefaultPadding),
      decoration: BoxDecoration(
        border:
            Border.all(width: 2, color: stylePrimaryColor.withOpacity(0.15)),
        borderRadius: const BorderRadius.all(
          Radius.circular(styleDefaultPadding),
        ),
      ),
      child: child,
    );
  }
}
