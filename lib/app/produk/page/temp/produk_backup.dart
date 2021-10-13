// import 'package:flutter/material.dart';

// import '/style.dart';
// import '../../../widgets/responsive.dart';

// import '../../dashboard/xdashboard_layout.dart';
// import '/app/dashboard/dashboard_layout_content.dart';
// import 'produk_list.dart';


// class ProdukPage extends StatelessWidget {
//   const ProdukPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return DashboardLayout(
//       dashboard: KelolaProdukContent(),
//     );
//   }
// }

// class KelolaProdukContent extends StatelessWidget {
//   const KelolaProdukContent({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return DashboardLayoutContent(
//       title: 'Kelola Produk',
//       subHeading: KelolaProdukSubHeading(
//         title: 'Produk',
//         addNew: '/produk-create',
//       ),
//       table: ProdukList(),
//       // detail: Container(),
//       // detail: KelolaProdukDetail(
//       //   title: "Data lainnya",
//       // ),
//     );
//   }
// }

// class KelolaProdukSubHeading extends StatelessWidget {
//   const KelolaProdukSubHeading({
//     Key? key,
//     required this.title,
//     required this.addNew,
//   }) : super(key: key);

//   final String title, addNew;

//   @override
//   Widget build(BuildContext context) {
//     // final Size _size = MediaQuery.of(context).size;
//     return Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               this.title,
//               style: Theme.of(context).textTheme.subtitle1,
//             ),
//             ElevatedButton.icon(
//               style: TextButton.styleFrom(
//                 padding: EdgeInsets.symmetric(
//                   horizontal: styleDefaultPadding * 1.5,
//                   vertical: styleDefaultPadding /
//                       (Responsive.isMobile(context) ? 2 : 1),
//                 ),
//               ),
//               icon: Icon(Icons.add),
//               label: Text("Tambah $title"),
//               onPressed: () => Navigator.pushNamed(context, this.addNew),
//             ),
//           ],
//         ),
//         SizedBox(height: styleDefaultPadding),

//         // Responsive(
//         //   mobile: FileInfoCardGridView(
//         //     crossAxisCount: _size.width < 650 ? 2 : 4,
//         //     childAspectRatio: _size.width < 650 && _size.width > 350 ? 1.3 : 1,
//         //   ),
//         //   tablet: FileInfoCardGridView(),
//         //   desktop: FileInfoCardGridView(
//         //     childAspectRatio: _size.width < 1400 ? 1.1 : 1.4,
//         //   ),
//         // ),
//       ],
//     );
//   }
// }
