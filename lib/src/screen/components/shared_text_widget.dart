import 'package:flutter/material.dart';

class SharedTextWidget extends StatelessWidget {
  final String text;
  final double size;
  const SharedTextWidget(this.text, {this.size = 15});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: TextStyle(
          fontSize: size,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
    );
  }
}
