import 'package:dpkfrontend/widgets/base/responsive.dart';
import 'package:flutter/material.dart';

class TemplateHeader extends StatelessWidget {
  const TemplateHeader({
    Key? key,
    required this.title,
    required this.searchWidget,
    required this.accountWidget,
  }) : super(key: key);

  final String title;
  final Widget searchWidget, accountWidget;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

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
