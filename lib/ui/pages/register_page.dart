import 'package:chatme/ui/utils/styles.dart';
import 'package:chatme/ui/widgets/auth_bottom_sheet.dart';
import 'package:chatme/ui/widgets/my_button.dart';
import 'package:chatme/ui/widgets/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  static const routeName = '/register';

  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _bottomSheetHeight = 56.0;

  @override
  void dispose() {
    super.dispose();

    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Get.theme.scaffoldBackgroundColor,
        title: Text(
          'Create New Account',
          style: Get.textTheme.headline6!.copyWith(
            color: Get.theme.primaryColor,
            fontFamily: GoogleFonts.lato(
              fontWeight: FontWeight.w600,
            ).fontFamily,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        padding: appMargin.copyWith(
          bottom: _bottomSheetHeight + 8,
        ),
        clipBehavior: Clip.none,
        child: Column(
          children: [
            MyTextField(
              controller: _nameController,
              hintText: 'Full Name',
              prefixIcon: const Icon(FontAwesomeIcons.solidUser),
            ),
            const SizedBox(height: 16),
            MyTextField(
              controller: _emailController,
              hintText: 'Email',
              prefixIcon: const Icon(FontAwesomeIcons.solidEnvelope),
            ),
            const SizedBox(height: 16),
            MyTextField(
              controller: _emailController,
              isPasswordField: true,
              hintText: 'Password',
              prefixIcon: const Icon(FontAwesomeIcons.lock),
            ),
            const SizedBox(height: 16),
            MyTextField(
              controller: _emailController,
              isPasswordField: true,
              hintText: 'Re-type Password',
              prefixIcon: const Icon(FontAwesomeIcons.lock),
            ),
            const SizedBox(height: 16),
            MyButton(
              onTap: () {},
              child: Center(
                child: Text(
                  'REGISTER',
                  style: Get.theme.textTheme.caption!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: AuthBottomSheet(
        bottomSheetHeight: _bottomSheetHeight,
        labelText: 'Already have an account? ',
        actionText: 'Sign in',
        actionCallback: () => Get.close(0),
      ),
    );
  }
}
