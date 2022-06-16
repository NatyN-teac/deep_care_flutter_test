import 'package:deep_care_test/src/constants/app_constants.dart';
import 'package:flutter/material.dart';

class DottedOverlayLine extends StatelessWidget {
  const DottedOverlayLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var calculate70Percent = (AppConstants.BAR_MAX_HEIGHT) * 0.7;
    return Positioned(
      left: AppConstants.DOTTED_LINE_STARTING_POSITION,
      right: AppConstants.DOTTED_LINE_RIGHT_POSITION,
      bottom: AppConstants.SOLID_LINE_BOTTOM_POSITION + calculate70Percent,
      child: IgnorePointer(
        ignoring: true,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 15,
              height: 2,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(208, 208, 208, 1),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            Expanded(
              child: Row(
                children: List.generate(
                  45,
                  (index) {
                    return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 2.0),
                        child: Container(
                          height: 1,
                          width: 0.5,
                          color: Colors.white,
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
