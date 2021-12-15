import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class MyTextField extends StatefulWidget {
  final TextEditingController _controller;
  final bool _isPasswordField;
  final String? _hintText;
  final Widget? _prefixIcon;
  final Widget? _suffixIcon;

  const MyTextField({
    Key? key,
    required TextEditingController controller,
    bool isPasswordField = false,
    String? hintText,
    Widget? prefixIcon,
    Widget? suffixIcon,
  })  : _controller = controller,
        _isPasswordField = isPasswordField,
        _hintText = hintText,
        _prefixIcon = prefixIcon,
        _suffixIcon = suffixIcon,
        super(key: key);

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  bool _hidePassword = true;

  @override
  Widget build(BuildContext context) {
    if (widget._isPasswordField && widget._suffixIcon != null) {
      throw Exception(
        'isPasswordField and suffixIcon cannot be used at the same time. Because the suffixIcon will be filled with an IconButton for the hide/show password feature',
      );
    }

    return TextFormField(
      controller: widget._controller,
      obscureText: widget._isPasswordField ? _hidePassword : false,
      style: Get.textTheme.bodyText1,
      decoration: InputDecoration(
        hintText: widget._hintText,
        hintStyle: Get.textTheme.bodyText1!.copyWith(
          color: Colors.grey,
        ),
        prefixIcon: widget._prefixIcon,
        suffixIcon: Builder(
          builder: (context) {
            if (widget._isPasswordField) {
              return IconButton(
                onPressed: () => setState(() {
                  _hidePassword = !_hidePassword;
                }),
                icon: Icon(
                  _hidePassword
                      ? FontAwesomeIcons.eye
                      : FontAwesomeIcons.eyeSlash,
                ),
              );
            }

            return widget._suffixIcon ?? const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
