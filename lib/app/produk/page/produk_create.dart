import 'package:dpkfrontend/app/kategori/kategori_model.dart';
import 'package:dpkfrontend/app/kategori/kategori_service.dart';
import 'package:dpkfrontend/app/merk/merk_model.dart';
import 'package:dpkfrontend/app/merk/merk_service.dart';
import 'package:dpkfrontend/app/produk/data/produk_model.dart';
import 'package:dpkfrontend/app/satuan/satuan_model.dart';
import 'package:dpkfrontend/app/satuan/satuan_service.dart';
import 'package:dpkfrontend/app/user/user_service.dart';
import 'package:dpkfrontend/pub/dropdown_search/dropdown_search.dart';
import 'package:dpkfrontend/style.dart';
import 'package:dpkfrontend/widgets/base/container.dart';
import 'package:dpkfrontend/widgets/base/padding.dart';
import 'package:dpkfrontend/widgets/base/responsive.dart';
import 'package:dpkfrontend/widgets/base/text.dart';
import 'package:dpkfrontend/widgets/base/textformfield.dart';
import 'package:flutter/material.dart';
import 'package:dpkfrontend/widgets/template/widget/drawer.dart';
import 'package:dpkfrontend/widgets/template/layout/base.dart';
import 'package:dpkfrontend/widgets/template/widget/subheader.dart';

class ProdukCreate extends StatefulWidget {
  const ProdukCreate({Key? key}) : super(key: key);

  @override
  _ProdukCreateState createState() => _ProdukCreateState();
}

class _ProdukCreateState extends State<ProdukCreate> {
  // Initialize
  final _formKey = GlobalKey<FormState>();
  // Controller
  final _namaProduk = TextEditingController();
  final _kodeProduk = TextEditingController();
  final _hargaJual = TextEditingController();
  final _hargaBeli = TextEditingController();
  final _jumlahStok = TextEditingController();
  final _minimumStok = TextEditingController();
  bool _isRemainStok = false;

  // Variable
  String _token = '';
  ProdukModel _produkModel = ProdukModel();
  List<KategoriModel> _listKategoriModel = [];
  List<MerkModel> _listMerkModel = [];
  List<SatuanModel> _listSatuanModel = [];

  @override
  void initState() {
    super.initState();
    _initState();
  }

  @override
  void dispose() {
    _namaProduk.dispose();
    _kodeProduk.dispose();
    _hargaJual.dispose();
    _hargaBeli.dispose();
    _jumlahStok.dispose();
    _minimumStok.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TemplateBase(
      drawer: TemplateWidgetDrawer(),
      header: TemplateWidgetSubHeader(
        title: 'Tambah Produk',
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

  // Widgets
  Widget headerButton(context) => Wrap(
        // mainAxisAlignment: MainAxisAlignment.end,
        alignment: WrapAlignment.end,
        children: [
          if (Responsive.isDesktop(context))
            OutlinedButton(
              style: styleButtonStyle(context),
              child: Text('Simpan dan Buat Lagi'),
              onPressed: () {},
            ),

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
            onPressed: () async => _save(),
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
              children: [
                if (!Responsive.isDesktop(context))
                  photo(),

                detailSection(),
                hargaSection(),
                stokSection(),
              ],
            ),
      ),

      if (Responsive.isDesktop(context))
        SizedBox(width: styleDefaultPadding),

      if (Responsive.isDesktop(context))
        Expanded(child: photo()),
    ],
  );

  Widget detailSection() => Column(
        children: [
          ContainerHeader(child: textSubTitle(context, 'Details')),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(child: namaProduk()),
              Expanded(child: kodeProduk()),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(child: kategori()),
              Expanded(child: merk()),
            ],
          ),
        ],
      );

  Widget hargaSection() => Padding(
        padding: const EdgeInsets.only(top: styleDefaultPadding),
        child: Column(
          children: [
            ContainerHeader(child: textSubTitle(context, 'Harga')),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(child: hargaJual()),
                Expanded(child: hargaBeli()),
              ],
            ),
          ],
        ),
      );

  Widget stokSection() => Padding(
        padding: const EdgeInsets.only(top: styleDefaultPadding),
        child: Column(
          children: [
            ContainerHeader(child: textSubTitle(context, 'Stok')),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(child: jumlahStok()),
                Expanded(child: minimumStok()),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(child: satuan()),
                Expanded(child: isRemainStok()),
              ],
            ),
          ],
        ),
      );

  // Controls
  Widget namaProduk() => TextFormFieldCustom(
        controller: _namaProduk,
        padding: EdgeInsets.all(styleDefaultPadding),
        labelText: 'Nama produk',
        hintText: 'Masukkan nama produk',
      );

  Widget kodeProduk() => TextFormFieldCustom(
        controller: _kodeProduk,
        padding: EdgeInsets.all(styleDefaultPadding),
        labelText: 'Kode produk',
        hintText: 'Masukkan kode produk (SKU)',
      );

  Widget kategori() => DropDownSearchCustom(
        items: _listKategoriModel,
        padding: EdgeInsets.all(styleDefaultPadding),
        labelText: 'Kategori',
        hintText: 'Pilih kategori',
        onChanged: (val) => _produkModel.kategoriId = val.id,
      );

  Widget merk() => DropDownSearchCustom(
        items: _listMerkModel,
        padding: EdgeInsets.all(styleDefaultPadding),
        labelText: 'Merk',
        hintText: 'Pilih merk',
        onChanged: (val) => _produkModel.merkId = val.id,
      );

  Widget hargaJual() => TextFormFieldCustom(
        controller: _hargaJual,
        padding: EdgeInsets.all(styleDefaultPadding),
        labelText: 'Harga Jual',
        hintText: 'Masukkan harga jual',
      );

  Widget hargaBeli() => TextFormFieldCustom(
        controller: _hargaBeli,
        padding: EdgeInsets.all(styleDefaultPadding),
        labelText: 'Harga Beli',
        hintText: 'Masukkan harga beli',
      );

  Widget jumlahStok() => TextFormFieldCustom(
        controller: _jumlahStok,
        padding: EdgeInsets.all(styleDefaultPadding),
        labelText: 'Jumlah Stok',
        hintText: 'Masukkan jumlah stok',
      );

  Widget minimumStok() => TextFormFieldCustom(
        controller: _minimumStok,
        padding: EdgeInsets.all(styleDefaultPadding),
        labelText: 'Minimum Stok',
        hintText: 'Masukkan minimum stok',
      );

  Widget satuan() => DropDownSearchCustom(
        items: _listSatuanModel,
        padding: EdgeInsets.all(styleDefaultPadding),
        labelText: 'Satuan Unit',
        hintText: 'Pilih satuan unit',
        onChanged: (val) => _produkModel.satuanId = val.id,
      );

  Widget isRemainStok() => SizedBox(
        // width: width * 2,
        child: CheckboxListTile(
          controlAffinity: ListTileControlAffinity.leading,
          title: Text("Kirim notifikasi saat stok mencapai batas minimum"),
          value: _isRemainStok,
          onChanged: (val) => setState(() {
            _isRemainStok = val!;
          }),
        ),
      );

  Widget photo() => ContainerBoxSecondary(child: Image.network('https://lh3.googleusercontent.com/proxy/cAFNu_3oRHGWh8gH3KTJP0Vh5l8lz4BWg08HLKmKnooRPIhQamqA846YVYhE_qAIlj0wVOazaSqQp4DuCXtvmdlbtfbxWcNv0I3SF2kA9BspcrX_w-FIKQ'));

  // Function
  Future _initState() async {
    final _userService = UserService();
    final _kategoriService = KategoriService();
    final _merkService = MerkService();
    final _satuanService = SatuanService();

    _token = _userService.getTokenString(context);
    // Get data
    await _kategoriService
        .getListData(token: _token)
        .then((data) => data.forEach((val) => _listKategoriModel.add(val)));
    await _merkService
        .getListData(token: _token)
        .then((data) => data.forEach((val) => _listMerkModel.add(val)));
    await _satuanService
        .getListData(token: _token)
        .then((data) => data.forEach((val) => _listSatuanModel.add(val)));
  }

  Future _save() async {}
}
