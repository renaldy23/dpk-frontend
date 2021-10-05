import 'package:dpkfrontend/style.dart';
import 'package:dpkfrontend/utils/responsive/responsive.dart';
import 'package:flutter/material.dart';
import 'package:websafe_svg/websafe_svg.dart';



class EmailHeader extends StatelessWidget {
  const EmailHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: Row(
        children: [
          // We need this back button on mobile only
          if (Responsive.isMobile(context)) BackButton(),
          IconButton(
            icon: WebsafeSvg.asset(
              "assets/images/icons/trash.svg",
              width: 24,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: WebsafeSvg.asset(
              "images/icons/reply.svg",
              width: 24,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: WebsafeSvg.asset(
              "images/icons/reply-all.svg",
              width: 24,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: WebsafeSvg.asset(
              "images/icons/transfer.svg",
              width: 24,
            ),
            onPressed: () {},
          ),
          Spacer(),
          // We don't need print option on mobile
          if (Responsive.isDesktop(context))
            IconButton(
              icon: WebsafeSvg.asset(
                "images/icons/printer.svg",
                width: 24,
              ),
              onPressed: () {},
            ),
          IconButton(
            icon: WebsafeSvg.asset(
              "images/icons/markup.svg",
              width: 24,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: WebsafeSvg.asset(
              "images/icons/more-vertical.svg",
              width: 24,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
