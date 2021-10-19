import 'package:dpkfrontend/app/supplier/data/supplier_model.dart';
import 'package:dpkfrontend/app/supplier/widget/supplier_widget.dart';
import 'package:dpkfrontend/app/user/user_service.dart';
import 'package:dpkfrontend/utils/api_model.dart';
import 'package:dpkfrontend/utils/api_service.dart';
import 'package:dpkfrontend/widgets/base/container.dart';
import 'package:dpkfrontend/widgets/base/padding.dart';
import 'package:dpkfrontend/widgets/base/responsive.dart';
import 'package:dpkfrontend/widgets/base/text.dart';
import 'package:dpkfrontend/widgets/base/textformfield.dart';
import 'package:dpkfrontend/widgets/template/layout/base.dart';
import 'package:dpkfrontend/widgets/template/widget/drawer.dart';
import 'package:dpkfrontend/widgets/template/widget/subheader.dart';
import 'package:flutter/material.dart';

import '../../../style.dart';

class SupplierEdit extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  late SupplierModel supplierModel;

  SupplierEdit({required this.supplierModel});

  late TextEditingController _kodeSupplier =
      TextEditingController(text: supplierModel.kodeSupplier);
  late TextEditingController _namaSupplier =
      TextEditingController(text: supplierModel.namaSupplier);
  late TextEditingController _noTelephone =
      TextEditingController(text: supplierModel.telephone);
  late TextEditingController _alamat =
      TextEditingController(text: supplierModel.alamat);
  late TextEditingController _email =
      TextEditingController(text: supplierModel.email);
  late TextEditingController _namaSales =
      TextEditingController(text: supplierModel.namaSales);
  late TextEditingController _noHandphone =
      TextEditingController(text: supplierModel.noHandphone);
  late TextEditingController _noRekening =
      TextEditingController(text: supplierModel.noRekening);

  String token = "";
  UserService _userService = UserService();
  SupplierModel _supplierModel = SupplierModel();

  @override
  Widget build(BuildContext context) {
    return TemplateBase(
      drawer: TemplateWidgetDrawer(),
      header: TemplateWidgetSubHeader(
        title: 'Edit Supplier',
        widget: headerButton(context),
      ),
      content: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.only(
                  left: styleDefaultPadding, right: styleDefaultPadding),
              child: buildContent(context),
            ),
          ),
        ),
      ),
    );
  }

  Widget headerButton(context) => Wrap(
        alignment: WrapAlignment.end,
        children: [
          if (Responsive.isDesktop(context))
            PaddingDesktop(width: styleDefaultPadding),

          ElevatedButton.icon(
            style: TextButton.styleFrom(
              padding: EdgeInsets.symmetric(
                horizontal: styleDefaultPadding * 1.5,
                vertical: styleDefaultPadding /
                    (Responsive.isMobile(context) ? 2 : 1),
              ),
            ),
            icon: Icon(Icons.save),
            label: Text("Simpan"),
            onPressed: () async => save(context),
          ),

          //
        ],
      );
  Widget buildContent(context) => Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [detailSection(context)],
            ),
          ),
          if (Responsive.isDesktop(context))
            SizedBox(width: styleDefaultPadding),
        ],
      );

  Widget detailSection(BuildContext context) => Column(
        children: [
          ContainerHeader(child: textSubTitle(context, 'Details')),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                  child: TextFormFieldCustom(
                controller: _kodeSupplier,
                padding: EdgeInsets.all(styleDefaultPadding),
                labelText: 'Kode Supplier',
                hintText: 'Masukkan kode supplier',
                validator: true,
              )),
              Expanded(
                  child: TextFormFieldCustom(
                controller: _namaSupplier,
                padding: EdgeInsets.all(styleDefaultPadding),
                labelText: 'Nama Supplier',
                hintText: 'Masukkan nama supplier',
                validator: true,
              )),
              Expanded(
                  child: TextFormFieldCustom(
                controller: _noTelephone,
                padding: EdgeInsets.all(styleDefaultPadding),
                labelText: 'No Telephone',
                hintText: 'Masukkan no telephone',
                validator: true,
              )),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                  child: TextFormFieldCustom(
                controller: _alamat,
                padding: EdgeInsets.all(styleDefaultPadding),
                labelText: 'Alamat Supplier',
                hintText: 'Masukkan alamat supplier',
                validator: true,
              )),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                  child: TextFormFieldCustom(
                controller: _email,
                padding: EdgeInsets.all(styleDefaultPadding),
                labelText: 'Email Supplier',
                hintText: 'Masukkan email supplier',
                validator: true,
              )),
              Expanded(
                  child: TextFormFieldCustom(
                controller: _namaSales,
                padding: EdgeInsets.all(styleDefaultPadding),
                labelText: 'Nama Sales',
                hintText: 'Masukkan nama sales',
                validator: true,
              )),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                  child: TextFormFieldCustom(
                controller: _noHandphone,
                padding: EdgeInsets.all(styleDefaultPadding),
                labelText: 'No Handphone Supplier',
                hintText: 'Masukkan no handphone supplier',
                validator: true,
              )),
              Expanded(
                  child: TextFormFieldCustom(
                controller: _noRekening,
                padding: EdgeInsets.all(styleDefaultPadding),
                labelText: 'No Rekening',
                hintText: 'Masukkan no rekening',
                validator: true,
              )),
            ],
          ),
        ],
      );

  Future save(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      token = _userService.getTokenString(context);
      _supplierModel
        ..kodeSupplier = _kodeSupplier.text
        ..namaSupplier = _namaSupplier.text
        ..telephone = _noTelephone.text
        ..alamat = _alamat.text
        ..email = _email.text
        ..namaSales = _namaSales.text
        ..noHandphone = _noHandphone.text
        ..noRekening = _noRekening.text;

      final api = ApiService();
      try {
        ApiResponseModel response = await api.update(
            token: token,
            endPoint: 'supplier',
            param: supplierModel.id.toString(),
            data: _supplierModel.toJson());

        print(response);

        Navigator.pushNamed(context, "/supplier");
      } catch (e) {
        print(e.toString());
      }
    }
  }
}
