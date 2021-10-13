import 'package:dpkfrontend/style.dart';
import 'package:dpkfrontend/widgets/base/responsive.dart';
// import 'package:dpkfrontend/widgets/drawer.dart';
import 'package:flutter/material.dart';

class TemplateBase extends StatefulWidget {
  const TemplateBase({
    Key? key,
    required this.content,
    required this.drawer,
    required this.header,
  }) : super(key: key);

  final Widget content, drawer, header;

  @override
  State<TemplateBase> createState() => _TemplateBaseState();
}

class _TemplateBaseState extends State<TemplateBase> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      drawer: widget.drawer,
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              Expanded(
                // default flex = 1
                // and it takes 1/6 part of the screen
                child: widget.drawer,
              ),
            Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child: SingleChildScrollView(
                padding: EdgeInsets.all(styleDefaultPadding),
                child: Column(
                  children: [
                    // Header
                    widget.header,

                    SizedBox(height: styleDefaultPadding),

                    // Content
                    widget.content,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
