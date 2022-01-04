import 'dart:developer';

import 'package:chatme/core/controllers/auth_controller.dart';
import 'package:chatme/core/extensions/auth_validator.dart';
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
  final _authController = Get.find<AuthController>();
  final _nameController = TextEditingController();
  final _userNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _bottomSheetHeight = 56.0;

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();

    _nameController.dispose();
    _userNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              MyTextField(
                controller: _nameController,
                validator: (name) {
                  if (name == null || name.isEmpty) {
                    return 'This field is required.';
                  } else if (!name.isValidName()) {
                    return 'Your name is invalid.';
                  }
                },
                hintText: 'Full Name',
                prefixIcon: const Icon(FontAwesomeIcons.solidUser),
              ),
              const SizedBox(height: 16),
              MyTextField(
                controller: _userNameController,
                validator: (userName) {
                  if (userName == null || userName.isEmpty) {
                    return 'This field is required.';
                  } else if (!userName.isValidUserName()) {
                    return 'Username is invalid.';
                  }
                },
                hintText: 'Username',
                prefixIcon: const Icon(FontAwesomeIcons.idCardAlt),
              ),
              const SizedBox(height: 16),
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
              MyTextField(
                controller: _confirmPasswordController,
                validator: (confirmPassword) {
                  final _password = _passwordController.text.trim();

                  if (_password.isEmpty) {
                    return 'Please fill in the password field first.';
                  }
                  else if (confirmPassword == null || confirmPassword.isEmpty) {
                    return 'This field is required.';
                  } else if (confirmPassword != _password) {
                    return 'Confirmation password is not the same.';
                  }
                },
                isPasswordField: true,
                hintText: 'Re-type Password',
                prefixIcon: const Icon(FontAwesomeIcons.lock),
              ),
              const SizedBox(height: 16),
              MyButton(
                onTap: _registerUser,
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
      ),
      bottomSheet: AuthBottomSheet(
        bottomSheetHeight: _bottomSheetHeight,
        labelText: 'Already have an account? ',
        actionText: 'Sign in',
        actionCallback: () => Get.close(0),
      ),
    );
  }

  void _registerUser() {
    if (!_formKey.currentState!.validate()) return;

    final _fullName = _nameController.text.trim();
    final _userName = _userNameController.text.trim();
    final _email = _emailController.text.trim();
    final _password = _passwordController.text.trim();

    _authController.register(
      fullName: _fullName,
      userName: _userName,
      email: _email,
      password: _password,
    );
  }
}
