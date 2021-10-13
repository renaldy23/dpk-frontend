import 'package:dpkfrontend/style.dart';
import 'package:flutter/material.dart';

class ContainerBox extends StatelessWidget {
  const ContainerBox({
    Key? key,
    required this.child,
    this.width,
    this.height,
  }) : super(key: key);
  final Widget child;
  final double? width, height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.width,
      height: this.height,
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

class ContainerBoxSecondary extends StatelessWidget {
  const ContainerBoxSecondary({
    Key? key,
    required this.child,
    this.width,
    this.height,
  }) : super(key: key);
  final Widget child;
  final double? width, height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(styleDefaultPadding),
      decoration: BoxDecoration(
        color: styleSecondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: child,
    );
  }
}

class ContainerHeader extends StatelessWidget {
  const ContainerHeader({Key? key, required this.child}) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(styleDefaultPadding/2),
      color: styleSecondaryColor,
      child: child,
    );
  }
}
