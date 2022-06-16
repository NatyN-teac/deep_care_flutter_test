import 'package:deep_care_test/src/constants/app_constants.dart';
import 'package:deep_care_test/src/screen/components/bar_item.dart';
import 'package:flutter/material.dart';

class BarComponent extends StatelessWidget {
  final int green;
  final int pink;
  final int blue;

  const BarComponent({
    Key? key,
    required this.green,
    required this.pink,
    required this.blue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (AppConstants.BAR_ITEM_WIDTH * 4) - 4,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          BarItem(
            barHeight: green,
            gradientColors: AppConstants.GREEN_GRADIENT_COLOR,
          ),
          BarItem(
            barHeight: pink,
            gradientColors: AppConstants.PINK_GRADIENT_COLOR,
          ),
          BarItem(
            barHeight: blue,
            gradientColors: AppConstants.BLUE_GRADIENT_COLOR,
          ),
        ],
      ),
    );
  }
}
