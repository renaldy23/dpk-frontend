// import 'package:dpkfrontend/style.dart';
// import 'package:dpkfrontend/widgets/base/padding.dart';
import 'package:dpkfrontend/widgets/base/responsive.dart';
import 'package:flutter/material.dart';

class TemplateWidgetHeader extends StatelessWidget {
  const TemplateWidgetHeader({
    Key? key,
    required this.title,
    required this.searchWidget,
    required this.accountWidget,
    // this.backButton = false,
  }) : super(key: key);

  final String title;
  final Widget searchWidget, accountWidget;
  // final bool backButton;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Back button
        // if (backButton)
        //   IconButton(
        //     icon: Icon(Icons.arrow_back),
        //     onPressed: () => Navigator.pop(context),
        //   ),
        // PaddingDesktop(width: styleDefaultPadding),

        // Menu on mobile
        if (!Responsive.isDesktop(context))
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        if (!Responsive.isMobile(context))
          Text(title, style: Theme.of(context).textTheme.headline6),
        if (!Responsive.isMobile(context))
          Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),

        // Search
        Expanded(child: this.searchWidget),

        // Account
        this.accountWidget
      ],
    );
  }
}
