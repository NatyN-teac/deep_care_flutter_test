import 'package:deep_care_test/src/screen/components/shared_text_widget.dart';
import 'package:flutter/material.dart';

class OverlayZielTextComponent extends StatelessWidget {
  const OverlayZielTextComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 45,
      bottom: 120,
      child: IgnorePointer(
        ignoring: true,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            SharedTextWidget("Ziel"),
          ],
        ),
      ),
    );
  }
}
