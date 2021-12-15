import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyButton extends StatelessWidget {
  final VoidCallback _onTap;
  final Widget _child;
  final Color? _color;
  final double _radius;
  final BorderSide _borderSide;

  const MyButton({
    Key? key,
    required VoidCallback onTap,
    required Widget child,
    Color? color,
    double radius = 50,
    BorderSide borderSide = BorderSide.none,
  })  : _onTap = onTap,
        _child = child,
        _color = color,
        _radius = radius,
        _borderSide = borderSide,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: _color ?? Get.theme.colorScheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(_radius),
        ),
        side: _borderSide,
      ),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        splashColor: Colors.white12,
        onTap: _onTap,
        child: SizedBox(
          width: double.infinity,
          height: 36,
          child: _child,
        ),
      ),
    );
  }
}
