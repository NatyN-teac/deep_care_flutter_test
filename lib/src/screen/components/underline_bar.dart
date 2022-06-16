import 'package:deep_care_test/src/constants/app_constants.dart';
import 'package:flutter/material.dart';

class UnderlineBar extends StatelessWidget {
  final double width;
  const UnderlineBar({Key? key,required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: AppConstants.SOLID_LINE_STARTING_POSITION,
      right: (width + 38),
      bottom: AppConstants.SOLID_LINE_BOTTOM_POSITION,
      child: IgnorePointer(
        ignoring: true,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 15,
              height: 4,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(208, 208, 208, 1),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            Expanded(
              child: Container(
                height: 1.5,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
