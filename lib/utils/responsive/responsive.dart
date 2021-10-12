import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  const Responsive({
    Key? key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
  }) : super(key: key);

  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

// This size work fine on my design, maybe you need some customization depends on your design

  // This isMobile, isTablet, isDesktop helep us later
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 650;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1100 &&
      MediaQuery.of(context).size.width >= 650;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      // If our width is more than 1100 then we consider it a desktop
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1100) {
          return desktop;
        }
        // If width it less then 1100 and more then 650 we consider it as tablet
        else if (constraints.maxWidth >= 650) {
          return tablet;
        }
        // Or less then that we called it mobile
        else {
          return mobile;
        }
      },
    );
  }
}

// class ResponsiveDesktop extends StatelessWidget {
//   const ResponsiveDesktop(
//       {Key? key, required this.size, required this.menu, required this.content})
//       : super(key: key);

//   final Size size;
//   final Widget menu, content;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         // Once our width is less then 1300 then it start showing errors
//         // Now there is no error if our width is less then 1340
//         Expanded(
//           flex: size.width > 1340 ? 2 : 4,
//           child: menu,
//         ),
//         // Expanded(
//         //   flex: size.width > 1340 ? 3 : 5,
//         //   child: Container(),
//         // ),
//         Expanded(
//           flex: size.width > 1340 ? 11 : 15,
//           child: content,
//         ),
//       ],
//     );
//   }
// }
