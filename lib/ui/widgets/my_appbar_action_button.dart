import 'package:flutter/material.dart';

class MyAppBarActionButton extends StatelessWidget {
  final VoidCallback _onPressed;
  final IconData _icon;

  const MyAppBarActionButton({
    Key? key,
    required VoidCallback onPressed,
    required IconData icon,
  })  : _onPressed = onPressed,
        _icon = icon,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: _onPressed,
      icon: Container(
        width: 24,
        height: 24,
        decoration: const BoxDecoration(
          color: Color(0xFF5676E7),
          borderRadius: BorderRadius.all(
            Radius.circular(4),
          ),
        ),
        alignment: Alignment.center,
        child: Icon(
          _icon,
          size: 16,
        ),
      ),
    );
  }
}
