import '/utils/api_model.dart';
import '/app/kategori/data/kategori_model.dart';
import '/app/kategori/data/kategori_service.dart';
import '/app/kategori_berat/kategori_berat_model.dart';
import '/app/kategori_berat/kategori_berat_service.dart';
import '/app/merk/merk_model.dart';
import '/app/merk/merk_service.dart';
import '/app/produk/data/produk_model.dart';
import '/app/satuan/satuan_model.dart';
import '/app/satuan/satuan_service.dart';
import '/app/user/user_service.dart';
import '/pub/dropdown_search/dropdown_search.dart';
import '/style.dart';
import '/utils/api_service.dart';
import '/utils/utils.dart';
import '/widgets/base/container.dart';
import '/widgets/base/padding.dart';
import '/widgets/base/responsive.dart';
import '/widgets/base/text.dart';
import '/widgets/base/textformfield.dart';
import 'package:flutter/material.dart';
import '/widgets/template/widget/drawer.dart';
import '/widgets/template/layout/base.dart';
import '/widgets/template/widget/subheader.dart';

class ProdukCreate extends StatefulWidget {
  const ProdukCreate({Key? key}) : super(key: key);

  @override
  _ProdukCreateState createState() => _ProdukCreateState();
}

class _ProdukCreateState extends State<ProdukCreate> {
  // Initialize
  final _formKey = GlobalKey<FormState>();
  final _userService = UserService();

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
  List<KategoriBeratModel> _listKategoriBeratModel = [];
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
  Widget buildContent(context) => Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (!Responsive.isDesktop(context)) photo(),
                detailSection(),
                hargaSection(),
                stokSection(),
              ],
            ),
          ),
          if (Responsive.isDesktop(context))
            SizedBox(width: styleDefaultPadding),
          if (Responsive.isDesktop(context)) Expanded(child: photo()),
        ],
      );

  Widget headerButton(context) => Wrap(
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
              Expanded(child: kategoriBerat()),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(child: satuan()),
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
                // Expanded(child: satuan()),
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
        validator: true,
      );

  Widget kodeProduk() => TextFormFieldCustom(
        controller: _kodeProduk,
        padding: EdgeInsets.all(styleDefaultPadding),
        labelText: 'Kode produk (SKU)',
        hintText: 'Masukkan kode produk (SKU)',
        validator: true,
      );

  Widget kategori() => DropDownSearchCustom(
        items: _listKategoriModel,
        padding: EdgeInsets.all(styleDefaultPadding),
        labelText: 'Kategori',
        hintText: 'Pilih kategori',
        onChanged: (val) => _produkModel.kategoriId = val.id,
      );

  Widget kategoriBerat() => DropDownSearchCustom(
        items: _listKategoriBeratModel,
        padding: EdgeInsets.all(styleDefaultPadding),
        labelText: 'Kategori Berat',
        hintText: 'Pilih kategori Berat',
        onChanged: (val) => _produkModel.kategoriBeratId = val.id,
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
        validator: true,
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

  Widget photo() =>
      ContainerBoxSecondary(child: Image.asset('images/empty-image.jpg'));

  // Function
  Future _initState() async {
    final _kategoriService = KategoriService();
    final _kategoriBeratService = KategoriBeratService();
    final _merkService = MerkService();
    final _satuanService = SatuanService();

    _token = _userService.getTokenString(context);
    // Get data
    await _kategoriService
        .getListData(token: _token)
        .then((data) => data.forEach((val) => _listKategoriModel.add(val)));
    await _kategoriBeratService.getListData(token: _token).then(
        (data) => data.forEach((val) => _listKategoriBeratModel.add(val)));

    await _merkService
        .getListData(token: _token)
        .then((data) => data.forEach((val) => _listMerkModel.add(val)));
    await _satuanService
        .getListData(token: _token)
        .then((data) => data.forEach((val) => _listSatuanModel.add(val)));
  }

  Future _save() async {
    if (_formKey.currentState!.validate()) {
      // Get user info
      var user = _userService.getCurrentUser(context);

      // Produk
      _produkModel
        ..kodeProduk = _kodeProduk.text
        ..namaProduk = _namaProduk.text
        ..jumlahStok = int.tryParse(isNumericOrZero(_jumlahStok.text))
        ..minimumStok = int.tryParse(isNumericOrZero(_minimumStok.text))
        ..isRemainStok = _isRemainStok
        ..hargaJual = double.tryParse(isNumericOrZero(_hargaJual.text))
        ..hargaBeli = double.tryParse(isNumericOrZero(_hargaBeli.text))
        ..beratProduk = 0
        ..ukuran = '' // Besar, Kecil
        ..isSpecial = false
        ..keterangan = ''
        ..isFavorite = false
        ..outletId = 1 // Default 1 = Pusat
        ..foto = ''
        ..createdById = user['id'] // Default admin
        ..createdAt = DateTime.now().toIso8601String();

      // print(_produkModel.toJson());

      // var data = _produkModel;
      // data.

      final api = ApiService();
      ApiResponseModel response = await api.create(
          token: _token, endPoint: 'produk', data: _produkModel.toJson());

      if (response.statusCode == 201) Navigator.pop(context, true);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Validasi data belum lengkap, cek kembali.')),
      );
    }
  }

  // EOF
}
