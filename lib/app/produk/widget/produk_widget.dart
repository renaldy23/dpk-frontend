import '/widgets/base/container.dart';
import 'package:flutter/material.dart';

import '/style.dart';
import '/widgets/base/textformfield.dart';

Widget namaProduk(TextEditingController controller) => TextFormFieldCustom(
      controller: controller,
      padding: EdgeInsets.all(styleDefaultPadding),
      labelText: 'Nama produk',
      hintText: 'Masukkan nama produk',
      validator: true,
    );

Widget kodeProduk(TextEditingController controller) => TextFormFieldCustom(
      controller: controller,
      padding: EdgeInsets.all(styleDefaultPadding),
      labelText: 'Kode produk (SKU)',
      hintText: 'Masukkan kode produk (SKU)',
      validator: true,
    );

Widget fotoProduk() => ContainerBoxSecondary(
      child: Image.asset('images/empty-image.jpg'),
    );

Widget hargaJual(TextEditingController controller) => TextFormFieldCustom(
      controller: controller,
      padding: EdgeInsets.all(styleDefaultPadding),
      labelText: 'Harga Jual',
      hintText: 'Masukkan harga jual',
      validator: true,
    );

Widget hargaBeli(TextEditingController controller) => TextFormFieldCustom(
      controller: controller,
      padding: EdgeInsets.all(styleDefaultPadding),
      labelText: 'Harga Beli',
      hintText: 'Masukkan harga beli',
    );

Widget jumlahStok(TextEditingController controller) => TextFormFieldCustom(
      controller: controller,
      padding: EdgeInsets.all(styleDefaultPadding),
      labelText: 'Jumlah Stok',
      hintText: 'Masukkan jumlah stok',
    );

Widget minimumStok(TextEditingController controller) => TextFormFieldCustom(
      controller: controller,
      padding: EdgeInsets.all(styleDefaultPadding),
      labelText: 'Minimum Stok',
      hintText: 'Masukkan minimum stok',
    );
