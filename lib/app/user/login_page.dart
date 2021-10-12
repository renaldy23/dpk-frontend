import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';

import '/app/user/user_model.dart';
import '/app/user/user_service.dart';
import '/app/user/user_view_model.dart';
import '/utils/button/button_box.dart';

import '/style.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Local variable
  final _globalKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    setStatusBarColor(styleAppBackground);
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      backgroundColor: styleAppBackground,
      body: _buildBody(),
      persistentFooterButtons: _buildFooterButtons(),
    );
  }

  // Widget
  Widget _buildBody() {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(left: 25, right: 25),
            width: 500,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Slogan & description
                Text('Belanja murah, lengkap \ndan mudah',
                    style: boldTextStyle(size: 25)),
                SizedBox(height: 25),
                Text('Masuk ke akun kamu', style: secondaryTextStyle(size: 16)),
                SizedBox(height: 25),

                // Form Container
                Container(
                  width: size.width,
                  decoration: styleBoxDecoration(showShadow: true),
                  child: Column(
                    children: <Widget>[
                      // Input user
                      _buildInputUsername(),
                      Divider(height: 1, thickness: 1),
                      _buildInputPassword(),
                    ],
                  ),
                ),

                // Button Sign in
                SizedBox(height: 45),
                ButtonBox(
                  title: "MASUK",
                  onPressed: () async => _login(),
                ),
                // SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputUsername() {
    return TextFormField(
      controller: _usernameController,
      cursorColor: styleTextSecondaryColor.withOpacity(0.2),
      cursorWidth: 1,
      autocorrect: true,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Email atau username',
        hintStyle:
            secondaryTextStyle(color: styleTextSecondaryColor.withOpacity(0.6)),
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        contentPadding:
            EdgeInsets.only(left: 16, bottom: 16, top: 16, right: 16),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Masukkan email atau username';
        }
        return null;
      },
    );
  }

  Widget _buildInputPassword() {
    return Row(
      children: <Widget>[
        Flexible(
          child: TextFormField(
              controller: _passwordController,
              textInputAction: TextInputAction.go,
              obscureText: true,
              cursorColor: styleTextSecondaryColor.withOpacity(0.2),
              cursorWidth: 1,
              onFieldSubmitted: (val) async => _login,
              decoration: InputDecoration(
                hintText: 'Password',
                hintStyle: secondaryTextStyle(
                    color: styleTextSecondaryColor.withOpacity(0.6)),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                contentPadding:
                    EdgeInsets.only(left: 16, bottom: 16, top: 16, right: 16),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Masukkan password';
                }
                return null;
              }),
              
        ),
        GestureDetector(
          child: Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Text('Lupa?',
                style: boldTextStyle(size: 14, color: stylePrimaryColor)),
          ),
          onTap: () {
            // SDForgotPwdScreen().launch(context);
          },
        ),
      ],
    );
  }

  List<Widget> _buildFooterButtons() {
    return <Widget>[
      Container(
        height: 40,
        padding: EdgeInsets.only(left: 15, right: 15),
        width: MediaQuery.of(context).copyWith().size.width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Bottom Button
            Text('Tidak punya akun?', style: secondaryTextStyle()),
            TextButton(
              onPressed: () {
                // SignUpPage().launch(context);
              },
              child: Text('DAFTAR',
                  style: boldTextStyle(size: 14, color: stylePrimaryColor)),
            ),
          ],
        ),
      ),
    ];
  }

  // Function
  Future _login() async {
    final userService = UserService();

    if (_formKey.currentState!.validate()) {
      bool showUnauthorize = false;

      hideKeyboard(context);

      // Format username & email
      String username = _usernameController.text;
      String password = _passwordController.text;
      // String email = username;

      // Check is email
      if (username.contains("@")) {
        // Get username by email
        String usernameRes = await userService.getEmail(username);
        // print('Username: ' + usernameRes);
        if (!usernameRes.isEmptyOrNull) {
          username = usernameRes;
        }
      } 
      
      // else {
      //   // Get email by username
      //   String emailRes = await userService.getUsername(username);
      //   // print('Email: ' + emailRes);
      //   if (!emailRes.isEmptyOrNull) {
      //     email = emailRes;
      //   }
      // }

      // print('Username: ' + username);
      // print('Email: ' + email);

      // Try login to Database
      try {
        String token =
            await userService.getToken(username: username, password: password);
        // print(token);

        if (token.isEmptyOrNull) {
          print('Token tidak ditemukan di database...');
          showUnauthorize = true;
        } else {
          final userViewModel = context.read(userViewModelProvider.notifier);

          // Token
          userViewModel.setToken(token);
          
          // Get current user
          UserModel user = await userService.getUserMe(token);
          userViewModel.setUser(user);

          // Role
          String role = await userService.getRole(username);
          userViewModel.setRole(role);

          // Auth
          userViewModel.setAuth(true);

          // Goto Home
          Navigator.of(context).pushNamedAndRemoveUntil(
              "/home", (Route<dynamic> route) => false);
        }
      } catch (e) {
        print('_signIn: ' + e.toString());
        showUnauthorize = true;
      }

      if (showUnauthorize) {
        // print('HERE');
        snackBar(context,
            title: "Error", content: Text("Username atau password salah..."));
      }

      // IF form.validate
    }
  }
}
