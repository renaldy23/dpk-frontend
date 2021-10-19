# How to create module
## Directory
module_name
  data
    module_name_model.dart
    module_name_service.dart
  page
    module_name_list.dart -> Home / List
    module_name_create.dart -> Create
    module_name_update.dart -> Update
    module_name_read.dart -> Read / Single
    modle_name_delete.dart -> Delete confirm
  widget
    module_name_widget.dart
## Tasks
- Create folder & file above
- Update module list with stateful ModuleNameList
- Register ModuleNameList in /router.dart
  - Define variable global UserService, token, in AppModel
  - InitState with AppModel
  - buildList / table
- Create page (ModuleCreatePage) & register /module-create in route.dart
  - Update page (ModuleUpdatePage) & register /module-update 

# App
- Switch theme dark mode

# Dashboard
- Page dashboard with widget role

# Kategori
- CRUD

# Produk
Page:
- Dashboard / List
  - Table with paging
  - Display link Kategori, Kategori Berat, Merk, Satuan
  - Search connect with table
- Create produk
  - TODO: Add other fields 
- Read single produk
- Update produk
  - TODO: Add other fields 
- Delete produk

Feature:

- 
