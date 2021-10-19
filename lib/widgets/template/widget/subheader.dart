import 'package:flutter/material.dart';
import '/style.dart';
import '/widgets/base/padding.dart';
import '/widgets/base/responsive.dart';

class TemplateWidgetSubHeader extends StatelessWidget {
  const TemplateWidgetSubHeader({
    Key? key,
    required this.title,
    this.showBackButton = true,
    this.widget,
  }) : super(key: key);
  final String title;
  final bool showBackButton;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: styleDefaultPadding),
      // decoration: BoxDecoration(
      //     border: Border(
      //         bottom:
      //             BorderSide(width: 1, color: Theme.of(context).dividerColor))),
      child: Row(
        children: [
          // Drawer
          if (!Responsive.isDesktop(context))
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),

          // Back button
          if (showBackButton)
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
          if (showBackButton) PaddingDesktop(width: styleDefaultPadding),

          // title
          Text(title, style: Theme.of(context).textTheme.headline6),

          Expanded(child: Container()),

          // Widgets
          if (this.widget != null)
            Align(
              alignment: Alignment.centerRight,
              child: this.widget!,
            ),
        ],
      ),
    );
  }
}
