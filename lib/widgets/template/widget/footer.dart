import 'package:flutter/material.dart';
import '/style.dart';
import 'package:nb_utils/nb_utils.dart';

class TemplateFooter extends StatelessWidget {
  const TemplateFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: EdgeInsets.only(left: 15, right: 15),
      width: MediaQuery.of(context).copyWith().size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Bottom Button
          Text('Tidak punya akun?', style: secondaryTextStyle()),
          TextButton(
            onPressed: () {
              // SignUpPage().launch(context);
            },
            child: Text('DAFTAR',
                style: boldTextStyle(size: 14, color: stylePrimaryColor)),
          ),
        ],
      ),
    );
  }
}
