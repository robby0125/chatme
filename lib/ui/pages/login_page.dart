import 'package:chatme/core/controllers/auth_controller.dart';
import 'package:chatme/core/extensions/auth_validator.dart';
import 'package:chatme/ui/pages/register_page.dart';
import 'package:chatme/ui/widgets/auth_bottom_sheet.dart';
import 'package:chatme/ui/widgets/my_button.dart';
import 'package:chatme/ui/widgets/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/login';

  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final _authController = Get.find<AuthController>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _bottomSheetHeight = 56.0;

  @override
  void dispose() {
    super.dispose();

    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          padding: EdgeInsets.only(bottom: _bottomSheetHeight + 8),
          child: Column(
            children: [
              Container(
                width: Get.size.width,
                height: Get.size.height * 0.25,
                padding: const EdgeInsets.symmetric(horizontal: 64),
                child: SvgPicture.asset('assets/chatme_title.svg'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      MyTextField(
                        controller: _emailController,
                        validator: (email) {
                          if (email == null || email.isEmpty) {
                            return 'This field is required.';
                          } else if (!email.isValidEmail()) {
                            return 'Email is invalid.';
                          }
                        },
                        hintText: 'Email',
                        prefixIcon: const Icon(FontAwesomeIcons.solidEnvelope),
                      ),
                      const SizedBox(height: 16),
                      MyTextField(
                        controller: _passwordController,
                        validator: (password) {
                          if (password == null || password.isEmpty) {
                            return 'This field is required.';
                          } else if (!password.isValidPassLength()) {
                            return 'Password at least 6 characters.';
                          }
                        },
                        isPasswordField: true,
                        hintText: 'Password',
                        prefixIcon: const Icon(FontAwesomeIcons.lock),
                      ),
                      const SizedBox(height: 16),
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                            // TODO: Implement forgot password feature
                          },
                          child: Text(
                            'Forgot Password?',
                            style: Get.textTheme.bodyText2!.copyWith(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      MyButton(
                        onTap: _login,
                        child: Center(
                          child: Text(
                            'LOGIN',
                            style: Get.theme.textTheme.caption!.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      MyButton(
                        onTap: () {
                          if (EasyLoading.isShow) return;
                        },
                        color: Colors.white,
                        borderSide: BorderSide(
                          color: Get.theme.colorScheme.primary,
                          width: 1,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/google_logo.svg',
                              height: 22,
                            ),
                            const SizedBox(width: 16),
                            Text(
                              'SIGN IN WITH GOOGLE',
                              style: Get.textTheme.caption!.copyWith(
                                color: Get.theme.primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: AuthBottomSheet(
        bottomSheetHeight: _bottomSheetHeight,
        labelText: 'Don\'t have an account? ',
        actionText: 'Register here',
        actionCallback: () {
          if (EasyLoading.isShow) return;

          Get.toNamed(RegisterPage.routeName);
        },
      ),
    );
  }

  void _login() {
    if (!_formKey.currentState!.validate() || EasyLoading.isShow) return;

    final _email = _emailController.text.trim();
    final _password = _passwordController.text.trim();

    _authController.login(email: _email, password: _password);
  }
}
