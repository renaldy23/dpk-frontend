import 'package:flutter/material.dart';

import 'responsive.dart';

class PaddingDesktop extends StatelessWidget {
  const PaddingDesktop({Key? key, this.width, this.height}) : super(key: key);

  final double? width, height;


  @override
  Widget build(BuildContext context) {
    return (Responsive.isDesktop(context) ? SizedBox(width: width, height: height) : Container());
  }
}
