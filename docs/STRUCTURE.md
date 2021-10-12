# Struktur
Kelola Produk
    Produk
    Kategori
    Kategori Berat
    Merk
    Satuan

Pesan Barang (purchasing)
    Supplier

Transaksi (sales)
    Pelanggan (customer)
    forwarder (pengiriman)
    Stok (gudang)

Administrasi
    Kas
    User
    Outlet

# Flutter
config
    assets\cfg\app_settings.json

/main.dart
    main -> MyApp -> router.dart

/router.dart
    /       app/home/landing_page.dart
    /login  app/user/login_page.dart
    /home   app/home/home_page.dart

/app/home/landing_page.dart
    userProvider.getAuth ? home_page : login_page

/app/user/login_page.dart
    get token, user, redirect to home if auth

/app/home/home_page.dart
    mobile: mobile_page.dart
    tablet: null
    desktop: desktop_page.dart


Row 1       | Row 2
SideMenu    | HomeDashboard
 /app/home/side_menu.dart

 HomeDashboard
 Column 1   -> HomeHeader
 Column 2   -> Row 1  Expanded 
                Column 1 -> MyFiles
                Column 2 -> RecentFiles
                Column 3 -> StarageDetails


kelola_produk_page.dart -> DashboardScaffold(dashboard: KelolaProdukContent());
kelola_produk_content.dart -> 