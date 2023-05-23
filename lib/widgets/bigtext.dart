import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  final double screenWidth;
  final TextStyle bigTxtStyle;
  final String title;
  final void Function() func;

  const BigText({
    super.key,
    required this.screenWidth,
    required this.bigTxtStyle,
    required this.title,
    required this.func,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: func,
      child: Container(
        width: screenWidth,
        padding: const EdgeInsets.only(left: 12.5),
        child: Row(
          children: [
            Text(title, style: bigTxtStyle),
            Icon(Icons.navigate_next_outlined, size: 30.0)
          ],
        ),
      ),
    );
  }
}
