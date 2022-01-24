import 'package:chatme/core/di/injection.dart';
import 'package:chatme/ui/pages/chat_room_page.dart';
import 'package:chatme/ui/pages/home_page.dart';
import 'package:chatme/ui/pages/login_page.dart';
import 'package:chatme/ui/pages/register_page.dart';
import 'package:chatme/ui/utils/styles.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Injection.provideInjection();
  runApp(const ChatMe());
}

class ChatMe extends StatelessWidget {
  const ChatMe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'ChatMe',
      debugShowCheckedModeBanner: false,
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
        ),
      ),
      builder: EasyLoading.init(),
      initialRoute: LoginPage.routeName,
      routes: {
        LoginPage.routeName: (_) => const LoginPage(),
        RegisterPage.routeName: (_) => const RegisterPage(),
        HomePage.routeName: (_) => const HomePage(),
        ChatRoomPage.routeName: (_) => const ChatRoomPage(),
      },
    );
  }
}
