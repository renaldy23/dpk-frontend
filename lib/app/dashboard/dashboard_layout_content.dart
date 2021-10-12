import 'package:dpkfrontend/app/dashboard/dashboard_header.dart';
import 'package:dpkfrontend/style.dart';
import 'package:dpkfrontend/utils/responsive/responsive.dart';
import 'package:flutter/material.dart';

class DashboardLayoutContent extends StatelessWidget {
  const DashboardLayoutContent({
    Key? key,
    required this.title,
    required this.subHeading,
    required this.table,
    required this.detail,
  }) : super(key: key);

  final String title;
  final Widget subHeading, table, detail;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(styleDefaultPadding),
        child: Column(
          children: [
            // Header
            DashboardHeader(title: title),
            SizedBox(height: styleDefaultPadding),

            // Content
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      // Header
                      this.subHeading,
                      SizedBox(height: styleDefaultPadding),

                      // Table 
                      this.table,
                      if (Responsive.isMobile(context))
                        SizedBox(height: styleDefaultPadding),

                      if (Responsive.isMobile(context)) this.detail,
                    ],
                  ),
                ),

                if (!Responsive.isMobile(context))
                  SizedBox(width: styleDefaultPadding),

                // On Mobile means if the screen is less than 850 we dont want to show it
                if (!Responsive.isMobile(context))
                  Expanded(
                    flex: 2,
                    child: this.detail,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
