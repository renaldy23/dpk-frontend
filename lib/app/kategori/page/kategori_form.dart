import '/app/kategori/data/kategori_model.dart';
import '/app/kategori/widget/kategori_widget.dart';
import '/utils/api_model.dart';
import '/utils/api_service.dart';
import '/utils/app_model.dart';
import '/utils/app_service.dart';
import '/utils/app_widget.dart';
import 'package:flutter/material.dart';

class KategoriFormPage extends StatefulWidget {
  final bool isUpdate;
  const KategoriFormPage({Key? key, required this.isUpdate}) : super(key: key);

  @override
  _KategoriFormPageState createState() => _KategoriFormPageState();
}

class _KategoriFormPageState extends State<KategoriFormPage> {
  // Global variable & initialize
  final _apiService = ApiService();
  final _appService = AppService<KategoriModel>();
  AppModel _appModel = AppModel();

  KategoriModel _kategoriModel = KategoriModel();

  // Controller
  final _formKey = GlobalKey<FormState>();
  final _namaKategori = TextEditingController();

  @override
  void initState() {
    super.initState();
    _initState();
  }

  @override
  void dispose() {
    super.dispose();
    _namaKategori.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Update data
    if (widget.isUpdate) {
      final args = ModalRoute.of(context)!.settings.arguments as Map;
      _updateForm(args);
    }

    return BuildCreateLayout(
      formKey: _formKey,
      headerTitle: _appModel.title!,
      onPressedSave: () async => widget.isUpdate ? _update() : _save(),
      child: buildForm(),
    );
  }

  // Fuction & widgets
  void _initState() {
    _appModel = _appService.initState(
      context: context,
      title: (widget.isUpdate ? 'Update' : 'Tambah') + ' Kategori',
      apiEndPoint: 'kategori',
      updateForm: false,
    );
  }

  void _updateForm(args) {
    if (!_appModel.updateForm!) {
      _kategoriModel = args['data'];

      // Update controls
      _namaKategori.text = _kategoriModel.namaKategori!;

      _appModel.updateForm = true;
    }
  }

  Widget buildForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        namaKategori(_namaKategori),
      ],
    );
  }

  Future _save() async {
    if (_formKey.currentState!.validate()) {
      // Cleanup
      _kategoriModel = KategoriModel(
        namaKategori: _namaKategori.text,
        // Optional fields
        createdById: _appModel.userModel!.id,
        createdAt: DateTime.now().toIso8601String(),
      );

      ApiResponseModel response;

      try {
        response = await _apiService.create(
          token: _appModel.token!,
          endPoint: _appModel.apiEndPoint!,
          data: _kategoriModel.toJson(),
        );
        if (response.statusCode == 201) Navigator.pop(context, true);
      } catch (e) {
        showSnackBarCustom(context, e.toString());
      }
    }
  }

  Future _update() async {
    if (_formKey.currentState!.validate()) {
      // Cleanup
      _kategoriModel.namaKategori = _namaKategori.text;

      ApiResponseModel response;

      try {
        response = await _apiService.update(
          token: _appModel.token!,
          endPoint: _appModel.apiEndPoint!,
          data: _kategoriModel.toJson(),
          param: _kategoriModel.id.toString(),
        );
        if (response.statusCode == 200) Navigator.pop(context, true);
      } catch (e) {
        showSnackBarCustom(context, e.toString());
      }

     
    }
  }

  // EOF
}
