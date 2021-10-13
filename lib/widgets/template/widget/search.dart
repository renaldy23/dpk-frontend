import 'package:dpkfrontend/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TemplateWidgetSearch extends StatelessWidget {
  const TemplateWidgetSearch({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search",
        fillColor: styleSecondaryColor,
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        suffixIcon: InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.all(styleDefaultPadding * 0.75),
            margin: EdgeInsets.symmetric(horizontal: styleDefaultPadding / 2),
            decoration: BoxDecoration(
              color: stylePrimaryColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: SvgPicture.asset("assets/icons/search.svg"),
          ),
        ),
      ),
    );
  }
}