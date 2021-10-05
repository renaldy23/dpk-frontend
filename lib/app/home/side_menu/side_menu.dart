import 'package:dpkfrontend/app/home/side_menu/side_menu_item.dart';
import 'package:dpkfrontend/app/home/side_menu/side_menu_tags.dart';
// import 'package:dpkfrontend/utils/extensions/extensions.dart';
import 'package:dpkfrontend/utils/responsive/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:websafe_svg/websafe_svg.dart';

import '/config.dart';
import '/style.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  String _assetsImage = "";

  @override
  void initState() {
    super.initState();
    _assetsImage = Config().assetImage;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      padding: EdgeInsets.only(top: kIsWeb ? kDefaultPadding : 0),
      color: kBgLightColor,
      child: SafeArea(
        child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Column(
              children: [
                // Logo
                _logo(),
                SizedBox(height: kDefaultPadding),
                // Button
                _buttonDownload(),
                SizedBox(height: kDefaultPadding),

                // FlatButton.icon(
                //   minWidth: double.infinity,
                //   padding: EdgeInsets.symmetric(
                //     vertical: kDefaultPadding,
                //   ),
                //   shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(10),
                //   ),
                //   color: kPrimaryColor,
                //   onPressed: () {},
                //   icon: WebsafeSvg.asset(_assetsImage + "icons/Edit.svg",
                //       width: 16),
                //   label: Text(
                //     "New message",
                //     style: TextStyle(color: Colors.white),
                //   ),
                // ).addNeumorphism(
                //   topShadowColor: Colors.white,
                //   bottomShadowColor: Color(0xFF234395).withOpacity(0.2),
                // ),

                SizedBox(height: kDefaultPadding * 2),

                SideMenuItem(
                  press: () {},
                  title: "Inbox",
                  iconSrc: _assetsImage + "icons/Inbox.svg",
                  isActive: true,
                  itemCount: 3,
                ),

                SideMenuItem(
                  press: () {},
                  title: "Sent",
                  iconSrc: _assetsImage + "icons/Send.svg",
                  isActive: false,
                ),

                SideMenuItem(
                  press: () {},
                  title: "Drafts",
                  iconSrc: _assetsImage + "icons/File.svg",
                  isActive: false,
                ),

                SideMenuItem(
                  press: () {},
                  title: "Deleted",
                  iconSrc: _assetsImage + "icons/Trash.svg",
                  isActive: false,
                  showBorder: false,
                ),

                SizedBox(height: kDefaultPadding * 2),

                SideMenuTags(),

                // Button New Message
              ],
            )),
      ),
    );
  }

  Widget _logo() => Row(
        children: [
          Image.asset(
            _assetsImage + 'logo.png',
            width: 46,
          ),
          Spacer(),
          if (!Responsive.isDesktop(context)) CloseButton(),
        ],
      );

  Widget _buttonDownload() => TextButton.icon(
        icon: WebsafeSvg.asset(_assetsImage + "icons/download.svg",
            width: 16),
        label: Text(
          "Get messages",
          style: TextStyle(color: kTextColor),
        ),
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(
              Size(MediaQuery.of(context).size.width, 60)),
          padding: MaterialStateProperty.all(EdgeInsets.symmetric(
            vertical: kDefaultPadding,
          )),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          )),
          // foregroundColor: MaterialStateProperty.all(kBgDarkColor),
        ),
        onPressed: () {},
      ); //.addNeumorphism();
}
