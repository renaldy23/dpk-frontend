import '/style.dart';
import 'package:flutter/material.dart';
import '/widgets/base/textformfield.dart';

Widget namaKategori(TextEditingController controller) => TextFormFieldCustom(
      controller: controller,
      padding: EdgeInsets.all(styleDefaultPadding),
      labelText: 'Nama kategori',
      hintText: 'Masukkan nama kategori',
      validator: true,
    );
