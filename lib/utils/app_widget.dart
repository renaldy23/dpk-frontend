// Imports
import '/widgets/template/layout/base.dart';
import '/widgets/template/widget/drawer.dart';
import '/widgets/template/widget/subheader.dart';
import 'package:flutter/material.dart';
import '/style.dart';
import '/utils/api_service.dart';
import '/widgets/base/responsive.dart';

class BuildListLayout extends StatelessWidget {
  final List<Widget> children;
  const BuildListLayout({Key? key, required this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(styleDefaultPadding),
      decoration: BoxDecoration(
        color: styleSecondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }
}

class SubHeadingListSection extends StatelessWidget {
  final String title;
  final Function()? onPressed;
  const SubHeadingListSection({
    Key? key,
    required this.title,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: Theme.of(context).textTheme.subtitle1),
        ElevatedButton.icon(
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(
              horizontal: styleDefaultPadding * 1.5,
              vertical:
                  styleDefaultPadding / (Responsive.isMobile(context) ? 2 : 1),
            ),
          ),
          icon: Icon(Icons.add),
          label: Text("Tambah"),
          onPressed: onPressed,
        ),
      ],
    );
  }
}

List<DataColumn> dataColumnCustom(List<String> data) {
  List<DataColumn> results = [];
  data.forEach((element) {
    results.add(DataColumn(label: Text(element)));
  });
  return results;
}

class PopupMenuCustom extends StatelessWidget {
  final data;
  final Function(Map<String, dynamic>)? onSelected;
  const PopupMenuCustom(
      {Key? key, required this.data, required this.onSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: PopupMenuButton<Map<String, dynamic>>(
        onSelected: onSelected,
        itemBuilder: (context) => [
          PopupMenuItem<Map<String, dynamic>>(
              value: {'action': 'edit', 'data': data}, child: Text('Edit')),
          PopupMenuItem<Map<String, dynamic>>(
              value: {'action': 'delete', 'data': data}, child: Text('Delete')),
        ],
      ),
    );
  }
}

Future<bool> showDeleteDialog(
    {required BuildContext context,
    required String token,
    required String apiEndPoint,
    required String item,
    required int id}) async {
  // Init
  bool result = false;
  final api = ApiService();

  await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Text('Konfirmasi Penghapusan'),
          content: Text('Yakin mau menghapus "$item"?'),
          actions: <Widget>[
            TextButton(
              child: Text('Hapus'),
              onPressed: () async {
                String endPoint = "$apiEndPoint/$id";
                result = true;
                await api
                    .delete(token: token, endPoint: endPoint)
                    .then((value) => Navigator.pop(context, true));
              },
            ),
            TextButton(
              child: Text('Batal'),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      });
  return result;
}

class BuildCreateLayout extends StatelessWidget {
  final String headerTitle;
  final Key formKey;
  final Function()? onPressedSave;
  final Widget child;

  const BuildCreateLayout({
    Key? key,
    required this.headerTitle,
    required this.formKey,
    required this.child,
    required this.onPressedSave,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TemplateBase(
      drawer: TemplateWidgetDrawer(),
      header: TemplateWidgetSubHeader(
        title: headerTitle,
        widget: BuildCreateLayoutButton(onPressed: onPressedSave),
      ),
      content: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.only(
                  left: styleDefaultPadding, right: styleDefaultPadding),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}

class BuildCreateLayoutButton extends StatelessWidget {
  final Function()? onPressed;
  const BuildCreateLayoutButton({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(
          horizontal: styleDefaultPadding * 1.5,
          vertical:
              styleDefaultPadding / (Responsive.isMobile(context) ? 2 : 1),
        ),
      ),
      icon: Icon(Icons.save),
      label: Text("Simpan"),
      onPressed: onPressed,
    );
  }
}

showSnackBarCustom(BuildContext context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(content)),
  );
}
// EOF
