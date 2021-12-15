import 'package:chatme/ui/pages/login_page.dart';
import 'package:chatme/ui/pages/register_page.dart';
import 'package:chatme/ui/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const ChatMe());
}

class ChatMe extends StatelessWidget {
  const ChatMe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'ChatMe',
      theme: ThemeData(
        primaryColor: const Color(0xFF4060D2),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xFFFF8D8D),
        ),
        scaffoldBackgroundColor: Colors.white,
        textTheme: myTextTheme,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF4060D2),
          elevation: 0,
          centerTitle: true,
        )
      ),
      initialRoute: LoginPage.routeName,
      routes: {
        LoginPage.routeName: (_) => const LoginPage(),
        RegisterPage.routeName: (_) => const RegisterPage(),
      },
    );
  }
}
