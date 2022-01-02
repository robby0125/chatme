import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class MyTextField extends StatefulWidget {
  final TextEditingController _controller;
  final String? Function(String? value)? _validator;
  final bool _isPasswordField;
  final String? _hintText;
  final Widget? _prefixIcon;
  final Widget? _suffixIcon;
  final InputBorder? _border;
  final Color? _fillColor;
  final EdgeInsetsGeometry? _contentPadding;

  const MyTextField({
    Key? key,
    required TextEditingController controller,
    String? Function(String? value)? validator,
    bool isPasswordField = false,
    String? hintText,
    Widget? prefixIcon,
    Widget? suffixIcon,
    InputBorder? border,
    Color? fillColor,
    EdgeInsetsGeometry? contentPadding,
  })  : _controller = controller,
        _validator = validator,
        _isPasswordField = isPasswordField,
        _hintText = hintText,
        _prefixIcon = prefixIcon,
        _suffixIcon = suffixIcon,
        _border = border,
        _fillColor = fillColor,
        _contentPadding = contentPadding,
        super(key: key);

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  bool _hidePassword = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget._isPasswordField && widget._suffixIcon != null) {
      throw Exception(
        'isPasswordField and suffixIcon cannot be used at the same time. Because the suffixIcon will be filled with an IconButton for the hide/show password feature',
      );
    }

    return TextFormField(
      controller: widget._controller,
      validator: widget._validator,
      obscureText: widget._isPasswordField ? _hidePassword : false,
      style: Get.textTheme.bodyText1,
      decoration: InputDecoration(
        hintText: widget._hintText,
        hintStyle: Get.textTheme.bodyText1!.copyWith(
          color: Colors.grey,
        ),
        errorStyle: Get.textTheme.caption!.copyWith(
          color: Colors.red,
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
        border: widget._border,
        fillColor: widget._fillColor,
        filled: widget._fillColor != null,
        contentPadding: widget._contentPadding,
      ),
    );
  }
}
