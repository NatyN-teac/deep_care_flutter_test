import 'package:deep_care_test/src/constants/app_constants.dart';
import 'package:flutter/material.dart';

class BarItem extends StatelessWidget {
  final int barHeight;
  final List<Color> gradientColors;

  const BarItem({
    Key? key,
    required this.barHeight,
    required this.gradientColors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final calculateBarHeight = (barHeight * AppConstants.BAR_MAX_HEIGHT) / 100;
    final _height = Future<double>.value(calculateBarHeight);
    return FutureBuilder<double>(
      future: _height,
      initialData: 0.0,
      builder: (context, snapshot) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          width: AppConstants.BAR_ITEM_WIDTH,
          height: snapshot.data,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: gradientColors,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: const [0.4, 0.99],
            ),
          ),
        );
      },
    );
  }
}
