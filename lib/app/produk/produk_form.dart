import 'package:dpkfrontend/app/api/api_service.dart';
import 'package:dpkfrontend/app/kategori/kategori_model.dart';
import 'package:dpkfrontend/app/kategori/kategori_service.dart';
import 'package:dpkfrontend/app/kategori_berat/kategori_berat_model.dart';
import 'package:dpkfrontend/app/kategori_berat/kategori_berat_service.dart';
import 'package:dpkfrontend/app/merk/merk_model.dart';
import 'package:dpkfrontend/app/merk/merk_service.dart';
import 'package:dpkfrontend/app/produk/produk_model.dart';
import 'package:dpkfrontend/app/satuan/satuan_model.dart';
import 'package:dpkfrontend/app/satuan/satuan_service.dart';
import 'package:dpkfrontend/app/user/user_service.dart';
import 'package:dpkfrontend/style.dart';
import 'package:dpkfrontend/utils/box/box.dart';
import 'package:dpkfrontend/utils/input/dropdownsearch_custom.dart';
// import 'package:dpkfrontend/utils/input/textformfield.dart';
import 'package:dpkfrontend/utils/input/textformfield_custom.dart';
// import 'package:dpkfrontend/utils/input/textformfield.dart';
import 'package:dpkfrontend/utils/responsive/responsive.dart';
import 'package:dpkfrontend/widgets/basic.dart';
// import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class ProdukForm extends StatefulWidget {
  const ProdukForm({Key? key}) : super(key: key);

  @override
  State<ProdukForm> createState() => _ProdukFormState();
}

class _ProdukFormState extends State<ProdukForm> {
  final _formKey = GlobalKey<FormState>();

  // Controller
  final _kodeProduk = TextEditingController();
  final _namaProduk = TextEditingController();
  final _jumlahStok = TextEditingController();
  final _minimumStok = TextEditingController();
  final _hargaBeli = TextEditingController();
  final _hargaJual = TextEditingController();

  // Service
  final _userService = UserService();

  // Local variable
  List<KategoriModel> _listKategoriModel = [];
  List<KategoriBeratModel> _listKategoriBeratModel = [];
  List<MerkModel> _listMerkModel = [];
  List<SatuanModel> _listSatuanModel = [];
  bool _isRemainStok = false;
  String _token = '';

  ProdukModel _produkModel = ProdukModel();

  @override
  void initState() {
    super.initState();
    _hargaJual.text = '0';
    _hargaBeli.text = '0';
    _jumlahStok.text = '0';
    _minimumStok.text = '0';
    _token = _userService.getTokenString(context);
    _getData();
  }

  @override
  void dispose() {
    _kodeProduk.dispose();
    _namaProduk.dispose();
    _jumlahStok.dispose();
    _minimumStok.dispose();
    _hargaBeli.dispose();
    _hargaJual.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(styleDefaultPadding),
          child: Column(
            children: [
              // Subheading
              _buildSubHeading(
                title: 'Tambah Produk',
              ),
              _buildForm(),
            ],
          ),
        ),
      ),
    );
  }

  // Widget
  Widget _buildSubHeading({required String title}) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextButton.icon(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.arrow_back),
              label: Container(),
            ),
            // Expanded(child: Container()),
            // ElevatedButton.icon(
            //   style: TextButton.styleFrom(
            //     padding: EdgeInsets.symmetric(
            //       horizontal: styleDefaultPadding * 1.5,
            //       vertical: styleDefaultPadding /
            //           (Responsive.isMobile(context) ? 2 : 1),
            //     ),
            //   ),
            //   icon: Icon(Icons.save),
            //   label: Text("Simpan"),
            //   onPressed: () async => _save(),
            // ),
          ],
        ),
        SizedBox(height: styleDefaultPadding),
      ],
    );
  }

  Widget _buildForm() {
    double padding =
        (Responsive.isDesktop(context) ? 300 : styleDefaultPadding);
    double width = (Responsive.isDesktop(context) ? 270 : 350);

    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.only(
          left: padding,
          right: padding,
        ),
        child: Box(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Heading
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.inbox, size: 50),
                  ),
                  Text(
                    'Tambah Produk',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ],
              ),

              // Kode & Nama Produk
              PaddingDesktop(height: styleDefaultPadding),
              Wrap(
                alignment: WrapAlignment.spaceEvenly,
                children: [
                  // Nama produk
                  TextFormFieldCustom(
                    controller: _namaProduk,
                    width: width,
                    labelText: 'Nama produk',
                    hintText: 'Masukkan nama produk',
                    validator: true,
                  ),

                  PaddingDesktop(width: styleDefaultPadding),

                  // Kode produk
                  TextFormFieldCustom(
                    controller: _kodeProduk,
                    width: width,
                    labelText: 'Kode produk (SKU)',
                    hintText: 'Masukkan kode produk',
                    validator: true,
                  ),
                ],
              ),

              // Kategori & kategori berat
              PaddingDesktop(height: styleDefaultPadding),
              Wrap(
                alignment: WrapAlignment.spaceEvenly,
                children: [
                  // Kategori
                  DropDownSearchCustom(
                    width: width,
                    items: _listKategoriModel,
                    itemAsString: (KategoriModel? d) => d!.toString(),
                    labelText: 'Kategori',
                    hintText: 'Pilih kategori',
                    onChanged: (val) => _produkModel.kategoriId = val.id,
                    validator: true,
                  ),

                  PaddingDesktop(width: styleDefaultPadding),

                  // Kategori berat
                  DropDownSearchCustom(
                    width: width,
                    items: _listKategoriBeratModel,
                    itemAsString: (KategoriBeratModel? d) => d!.toString(),
                    labelText: 'Kategori berat',
                    hintText: 'Pilih kategori berat',
                    onChanged: (val) => _produkModel.kategoriBeratId = val.id,
                  ),
                ],
              ),

              // Merek & satian
              PaddingDesktop(height: styleDefaultPadding),
              Wrap(
                alignment: WrapAlignment.spaceEvenly,
                children: [
                  // Merk
                  DropDownSearchCustom(
                    width: width,
                    items: _listMerkModel,
                    itemAsString: (MerkModel? d) => d!.toString(),
                    labelText: 'Merk',
                    hintText: 'Pilih merk',
                    onChanged: (val) => _produkModel.merkId = val.id,
                  ),

                  PaddingDesktop(width: styleDefaultPadding),

                  // Satuan
                  DropDownSearchCustom(
                    width: width,
                    items: _listSatuanModel,
                    itemAsString: (SatuanModel? d) => d!.toString(),
                    labelText: 'Satuan',
                    hintText: 'Pilih satuan',
                    onChanged: (val) => _produkModel.satuanId = val.id,
                  ),
                ],
              ),

              // Harga jual & modal
              PaddingDesktop(height: styleDefaultPadding),
              Container(
                padding: EdgeInsets.all(styleDefaultPadding),
                decoration: BoxDecoration(
                  // color: styleSecondaryColor,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Text(
                  'Harga dan stok',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              Wrap(
                alignment: WrapAlignment.spaceEvenly,
                children: [
                  // Nama produk
                  TextFormFieldCustom(
                    controller: _hargaJual,
                    width: width,
                    labelText: 'Harga jual',
                    hintText: 'Masukkan harga jual',
                    // initialValue: '0',
                  ),

                  PaddingDesktop(width: styleDefaultPadding),

                  // Harga beli
                  TextFormFieldCustom(
                    controller: _hargaBeli,
                    width: width,
                    labelText: 'Harga beli',
                    hintText: 'Masukkan harga beli',
                    // initialValue: '0',
                  ),
                ],
              ),

              // Jumlah Stok & minimum
              PaddingDesktop(height: styleDefaultPadding),
              Wrap(
                alignment: WrapAlignment.spaceEvenly,
                children: [
                  // Jumlah stok
                  TextFormFieldCustom(
                    controller: _jumlahStok,
                    width: width,
                    labelText: 'Jumlah stok',
                    hintText: 'Masukkan jumlah stok',
                    // initialValue: '0',
                  ),

                  PaddingDesktop(width: styleDefaultPadding),

                  // Minimum stok
                  TextFormFieldCustom(
                    controller: _minimumStok,
                    width: width,
                    labelText: 'Minimum stok',
                    hintText: 'Masukkan minimum stok',
                    // initialValue: '0',
                  ),
                ],
              ),
              Wrap(
                children: [
                  SizedBox(
                    width: width * 2,
                    child: CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      title: Text(
                          "Kirim notifikasi saat stok mencapai batas minimum"),
                      value: _isRemainStok,
                      onChanged: (val) => setState(() {
                        _isRemainStok = val!;
                      }),
                    ),
                  )
                ],
              ),

              // Tombol simpan & reset
              PaddingDesktop(height: styleDefaultPadding),
              Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton.icon(
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Function
  Future _getData() async {
    final _kategoriService = KategoriService();
    final _kategoriBeratService = KategoriBeratService();
    final _merkService = MerkService();
    final _satuanService = SatuanService();

    // String token = _userService.getTokenString(context);

    await _kategoriService.getListData(token: _token).then((data) {
      data.forEach((val) => _listKategoriModel.add(val));
    });

    await _kategoriBeratService.getListData(token: _token).then((value) =>
        value.forEach((element) => _listKategoriBeratModel.add(element)));

    await _merkService.getListData(token: _token).then(
        (value) => value.forEach((element) => _listMerkModel.add(element)));

    await _satuanService.getListData(token: _token).then(
        (value) => value.forEach((element) => _listSatuanModel.add(element)));
  }

  Future _save() async {
    if (_formKey.currentState!.validate()) {
      _produkModel
        ..kodeProduk = _kodeProduk.text
        ..namaProduk = _namaProduk.text
        ..jumlahStok = int.parse(_jumlahStok.text)
        ..minimumStok = int.parse(_minimumStok.text)
        ..isRemainStok = _isRemainStok
        ..hargaJual = double.parse(_hargaJual.text)
        ..hargaBeli = double.parse(_hargaBeli.text)
        // optional
        ..beratProduk = 0
        ..ukuran = '' // Besar, Kecil
        ..isSpecial = false
        ..keterangan = ''
        ..isFavorite = false
        ..outletId = 1 // Default 1 = Pusat
        ..createdById = 1 // Default admin
        ..createdAt = DateTime.now().toIso8601String();

      // print(_produkModel.toJson());
      final api = ApiService();
      api.create(
          token: _token, endPoint: 'produk', data: _produkModel.toJson());

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Processing Data')),
      );
    }
  }

  // EOF
}
