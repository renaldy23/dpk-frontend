// import 'package:dpkfrontend/app/user/user_view_model.dart';
// import 'package:dpkfrontend/config.dart';
// import 'package:dpkfrontend/utils/page/message_page.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:nb_utils/nb_utils.dart';

// // final authStateChangesProvider = StreamProvider<User?>(
// //     (ref) => ref.watch(firebaseAuthProvider).authStateChanges());

// // final authStateChangesProvider = StreamProvider<bool>( (ref) { 
// //       final auth = ref.watch(userViewModelProvider);
// //       return auth;
// //     });

// class UserAuth extends ConsumerWidget {
//   const UserAuth({Key? key, required this.homeBuilder, required this.landingBuilder}) : super(key: key);
//   final WidgetBuilder homeBuilder;
//   final WidgetBuilder landingBuilder;

  
//   @override
//   Widget build(BuildContext context, ScopedReader watch) {
//     final authStateChanges = watch(userAuthChangesProvider);
    
//     return authStateChanges.when(
//       data: (auth) => _buildData(context, auth),
//       loading: () => Scaffold(
//         body: _buildLogo(),
//       ),
//       error: (_, __) => Scaffold(
//         body: MessagePage(
//           title: 'Terjadi kesalahan',
//           message: 'Saat ini tidak bisa membuka data.',
//         ),
//       ),
//     );
//   }

//    Widget _buildLogo() {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         mainAxisSize: MainAxisSize.max,
//         children: <Widget>[

//           Image.asset(Config.assetImage + 'logo.png', height: 105),
//           Container(
//             margin: EdgeInsets.only(top: 16),
//             child: Text("DPK",
//                 style: secondaryTextStyle(size: 25, color: Colors.white)),
//           ),
        
//         ],
//       ),
//     );
//   }

//   Widget _buildData(BuildContext context, bool auth) {
//     if (auth) {
//       return homeBuilder(context);
//     }
//     return landingBuilder(context);
//   }
// }


