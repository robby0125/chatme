import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyRoundedBodyContainer extends StatelessWidget {
  final Widget _child;

  const MyRoundedBodyContainer({
    Key? key,
    required Widget child,
  })  : _child = child,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16),
        ),
      ),
      clipBehavior: Clip.hardEdge,
      child: _child,
    );
  }
}
