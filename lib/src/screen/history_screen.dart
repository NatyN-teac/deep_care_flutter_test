import 'package:deep_care_test/src/constants/app_constants.dart';
import 'package:deep_care_test/src/model/item_model.dart';
import 'package:deep_care_test/src/screen/components/bar_component.dart';
import 'package:deep_care_test/src/screen/components/dotted_overlay_line.dart';
import 'package:deep_care_test/src/screen/components/overlay_ziel_text_component.dart';
import 'package:deep_care_test/src/screen/components/shared_text_widget.dart';
import 'package:deep_care_test/src/screen/components/underline_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  late ScrollController _scrollController;
  List<ItemModel> items = [];
  bool isLoadingOlder = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_scrollListener);
    items.addAll(ItemModel.items);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  void _fetchOlderData() {
    // The logic here is just for testing purpose, on real network requesting application it will be pagiated and etc.
    if (isLoadingOlder && items.length <= 20) {
      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          items.addAll(ItemModel.mockOlderDateItems);
          isLoadingOlder = false;
        });
      });
    }
  }

  void _scrollListener() {
    if (_scrollController.position.extentBefore <= 30) {
      setState(() {
        isLoadingOlder = true;
      });
      _fetchOlderData();
      setState(() {
        isLoadingOlder = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final double containerHeight = screenHeight * 0.33;
    final double containerWidth = screenWidth - 8;
    final double firstContainerWidgth = containerWidth * 0.75;
    final double secondContainerWidth = containerWidth * 0.2;
    return Scaffold(
      backgroundColor: AppConstants.WHITE_BG_COLOR,
      appBar: _buildAppBar(),
      body: Column(
        children: [
          _topHeaderTitle(),
          Stack(
            children: [
              SizedBox(
                width: containerWidth,
                child: Container(
                  margin: const EdgeInsets.only(left: 4, right: 4),
                  width: containerWidth,
                  height: containerHeight,
                  decoration: BoxDecoration(
                    color: AppConstants.CONTAINER_BG_COLOR,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: firstContainerWidgth,
                        child: Container(
                          padding: const EdgeInsets.only(right: 25, left: 25),
                          child: ListView.separated(
                            controller: _scrollController,
                            reverse: true,
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return _buildSingleHistoryComponent(
                                  screenHeight, items[index]);
                            },
                            separatorBuilder: (context, index) {
                              return const SizedBox(width: 25);
                            },
                            itemCount: items.length,
                          ),
                        ),
                      ),
                      _containerRightSideViewWidget(secondContainerWidth)
                    ],
                  ),
                ),
              ),
              const DottedOverlayLine(),
              const OverlayZielTextComponent(),
              UnderlineBar(width: secondContainerWidth)
            ],
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: AppConstants.WHITE_BG_COLOR,
      elevation: 0,
    );
  }

  Widget _topHeaderTitle() {
    return Column(
      children: [
        const SizedBox(
          height: 25,
        ),
        Container(
          padding: const EdgeInsets.only(left: 15, right: 15),
          alignment: Alignment.centerLeft,
          child: const Text(
            "History",
            style: TextStyle(
              fontSize: 20,
              color: Color.fromRGBO(105, 206, 198, 1),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }

  Widget _containerRightSideViewWidget(double secondContainerWidth) {
    return Container(
      alignment: Alignment.centerLeft,
      width: secondContainerWidth,
      child: Column(
        children: const [
          Spacer(),
          SharedTextWidget("MET"),
          SizedBox(height: 20),
          SharedTextWidget("Km Joggen", size: 12),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildSingleHistoryComponent(double screenHeight, ItemModel item) {
    final parseDateFromString = DateTime.parse(item.date);
    final date = DateFormat('dd').format(parseDateFromString).toString();
    final dayName = DateFormat('E').format(parseDateFromString).toString();
    return Container(
      height: screenHeight * 0.33,
      padding: const EdgeInsets.only(top: 25),
      child: Column(
        children: [
          SharedTextWidget(dayName),
          SharedTextWidget("14.$date"),
          const SizedBox(
            height: 60,
          ),
          SizedBox(
            height: AppConstants.BAR_MAX_HEIGHT,
            child: BarComponent(
              green: item.greenValue,
              pink: item.pinkValue,
              blue: item.blueValue,
            ),
          ),
          const Spacer(),
          SharedTextWidget("${item.met}"),
          const SizedBox(height: 20),
          SharedTextWidget("${item.jogging}"),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
