import 'package:flutter/material.dart';
import '/style.dart';
import '../../base/responsive.dart';

class TemplateWidgetAccount extends StatelessWidget {
  const TemplateWidgetAccount({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: styleDefaultPadding),
      padding: EdgeInsets.symmetric(
        horizontal: styleDefaultPadding,
        vertical: styleDefaultPadding / 2,
      ),
      decoration: BoxDecoration(
        color: styleSecondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: Colors.white10),
      ),
      child: Row(
        children: [
          Image.asset(
            "images/profile_pic.png",
            height: 38,
          ),
          if (!Responsive.isMobile(context))
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: styleDefaultPadding / 2),
              child: Text("Angelina Jolie"),
            ),
          Icon(Icons.keyboard_arrow_down),
        ],
      ),
    );
  }
}