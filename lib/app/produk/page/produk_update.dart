import 'package:dpkfrontend/app/kategori/kategori_model.dart';
import 'package:dpkfrontend/app/kategori/kategori_service.dart';
import 'package:dpkfrontend/app/kategori_berat/kategori_berat_model.dart';
import 'package:dpkfrontend/app/kategori_berat/kategori_berat_service.dart';
import 'package:dpkfrontend/app/merk/merk_model.dart';
import 'package:dpkfrontend/app/merk/merk_service.dart';
import 'package:dpkfrontend/app/produk/data/produk_model.dart';
import 'package:dpkfrontend/app/produk/widget/produk_widget.dart';
import 'package:dpkfrontend/app/satuan/satuan_model.dart';
import 'package:dpkfrontend/app/satuan/satuan_service.dart';
import 'package:dpkfrontend/app/user/user_service.dart';
import 'package:dpkfrontend/style.dart';
import 'package:dpkfrontend/utils/api_service.dart';
import 'package:dpkfrontend/utils/utils.dart';
import 'package:dpkfrontend/widgets/base/container.dart';
import 'package:dpkfrontend/widgets/base/responsive.dart';
import 'package:dpkfrontend/widgets/base/text.dart';
import 'package:dpkfrontend/widgets/template/layout/base.dart';
import 'package:dpkfrontend/widgets/template/widget/drawer.dart';
import 'package:dpkfrontend/widgets/template/widget/subheader.dart';
import 'package:flutter/material.dart';

class ProdukUpdate extends StatefulWidget {
  const ProdukUpdate({Key? key}) : super(key: key);

  @override
  _ProdukUpdateState createState() => _ProdukUpdateState();
}

class _ProdukUpdateState extends State<ProdukUpdate> {
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
  bool _isLoaded = false;

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
    try {
      final args = ModalRoute.of(context)!.settings.arguments as Map;
      _getData(args);
    } catch (e) {}

    return TemplateBase(
      drawer: TemplateWidgetDrawer(),
      header: TemplateWidgetSubHeader(
        title: 'Edit Produk',
        widget: headerButton(),
      ),
      content: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.only(
                  left: styleDefaultPadding, right: styleDefaultPadding),
              child: buildContent(),
            ),
          ),
        ),
      ),
    );
  }

  // Widgets
  Widget buildContent() => Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (!Responsive.isDesktop(context)) fotoProduk(),
                detailSection(),
                hargaSection(),
                stokSection(),
              ],
            ),
          ),
          if (Responsive.isDesktop(context))
            SizedBox(width: styleDefaultPadding),
          if (Responsive.isDesktop(context)) Expanded(child: fotoProduk()),
        ],
      );

  Widget headerButton() => Wrap(
        // mainAxisAlignment: MainAxisAlignment.end,
        alignment: WrapAlignment.end,
        children: [
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
              Expanded(child: namaProduk(_namaProduk)),
              Expanded(child: kodeProduk(_kodeProduk)),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: DropDownSearchUtils(
                  items: _listKategoriModel,
                  labelText: 'Kategori',
                  hintText: 'Pilih kategori',
                  onChanged: (val) => _produkModel.kategoriId = val.id,
                  selectedItem: _produkModel.namaKategori,
                ),
              ),
              Expanded(
                child: DropDownSearchUtils(
                  items: _listKategoriBeratModel,
                  labelText: 'Kategori Berat',
                  hintText: 'Pilih kategori berat',
                  onChanged: (val) => _produkModel.kategoriBeratId = val.id,
                  selectedItem: _produkModel.namaKategoriBerat,
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: DropDownSearchUtils(
                  items: _listSatuanModel,
                  labelText: 'Satuan unit',
                  hintText: 'Pilih satuan unit',
                  onChanged: (val) => _produkModel.satuanId = val.id,
                  selectedItem: _produkModel.namaSatuan,
                ),
              ),
              Expanded(
                child: DropDownSearchUtils(
                  items: _listMerkModel,
                  labelText: 'Merk',
                  hintText: 'Pilih merk',
                  onChanged: (val) => _produkModel.merkId = val.id,
                  selectedItem: _produkModel.namaMerk,
                ),
              ),
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
                Expanded(child: hargaJual(_hargaJual)),
                Expanded(child: hargaBeli(_hargaBeli)),
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
                Expanded(child: jumlahStok(_jumlahStok)),
                Expanded(child: minimumStok(_minimumStok)),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // Expanded(
                //   child: DropDownSearchUtils(
                //     items: _listSatuanModel,
                //     labelText: 'Satuan Unit',
                //     hintText: 'Pilih satuan unit',
                //     onChanged: (val) => _produkModel.satuanId = val.id,
                //   ),
                // ),
                Expanded(
                  child: CheckboxListTileUtils(
                    title: Text(
                        "Kirim notifikasi saat stok mencapai batas minimum"),
                    value: _isRemainStok,
                    onChanged: (val) => setState(() {
                      _isRemainStok = val!;
                    }),
                  ),
                ),
              ],
            ),
          ],
        ),
      );

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

  void _getData(args) {
    if (!_isLoaded) {
      _produkModel = args['data'];
      _namaProduk.text = _produkModel.namaProduk!;
      _kodeProduk.text = _produkModel.kodeProduk!;
      _hargaJual.text = _produkModel.hargaJual!.toString();
      _hargaBeli.text = _produkModel.hargaBeli!.toString();

      _jumlahStok.text = _produkModel.jumlahStok!.toString();
      _minimumStok.text = _produkModel.minimumStok!.toString();

      _isRemainStok = _produkModel.isRemainStok!;
      _isLoaded = true;
    }
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
        // TODO: Add in form optional
        ..beratProduk = 0
        ..ukuran = '' // Besar, Kecil
        ..isSpecial = false
        ..keterangan = ''
        ..isFavorite = false
        ..outletId = 1 // Default 1 = Pusat
        ..createdById = user['id'] // Default admin
        ..createdAt = DateTime.now().toIso8601String();

      print(_produkModel.toJson());

      final api = ApiService();
      int? response = await api.update(
          token: _token, endPoint: 'produk', param: _produkModel.id.toString(), data: _produkModel.toJson());

      if (response == 200) Navigator.pop(context, true);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Validasi data belum lengkap, cek kembali.')),
      );
    }
  }

  // EOF
}
