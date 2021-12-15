import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthBottomSheet extends StatelessWidget {
  const AuthBottomSheet({
    Key? key,
    required double bottomSheetHeight,
    required String labelText,
    required String actionText,
    required Function actionCallback,
  })  : _bottomSheetHeight = bottomSheetHeight,
        _labelText = labelText,
        _actionText = actionText,
        _actionCallback = actionCallback,
        super(key: key);

  final double _bottomSheetHeight;
  final String _labelText;
  final String _actionText;
  final Function _actionCallback;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: _bottomSheetHeight,
      color: Get.theme.primaryColor,
      alignment: Alignment.center,
      child: RichText(
        text: TextSpan(
          text: _labelText,
          style: Get.textTheme.caption!.copyWith(
            color: Colors.white,
            fontFamily: GoogleFonts.poppins(
              fontWeight: FontWeight.w200,
            ).fontFamily,
          ),
          children: [
            TextSpan(
              text: _actionText,
              style: Get.textTheme.caption!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = _actionCallback as GestureTapCallback?,
            ),
          ],
        ),
      ),
    );
  }
}
