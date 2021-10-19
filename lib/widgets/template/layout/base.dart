import '/style.dart';
import '/widgets/base/responsive.dart';
import 'package:flutter/material.dart';

class TemplateBase extends StatefulWidget {
  const TemplateBase({
    Key? key,
    required this.content,
    required this.drawer,
    this.header,
    this.persistentFooterButtons,
  }) : super(key: key);

  final Widget content, drawer;
  final Widget? header;
  final List<Widget>? persistentFooterButtons;

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
      persistentFooterButtons: widget.persistentFooterButtons,
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
                    if (widget.header != null) widget.header!,
                    if (widget.header != null)
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
