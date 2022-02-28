import 'package:flutter/material.dart';
import 'package:weight_tracker/constants/constants.dart';
import 'package:weight_tracker/models/weight_model.dart';

import '../../../constants/ui_helpers.dart';

class WeightDataGrid extends StatelessWidget {
  final double _crossAxisSpacing = 8;
  final double _mainAxisSpacing = 16;
  final double _aspectRatio = 2;
  final int _crossAxisCount = 2;

  final List<WeightModel> list;
  final ValueChanged<WeightModel> onEditTap;
  final ValueChanged<WeightModel> onDeleteTap;

  const WeightDataGrid({
    Key? key,
    required this.list,
    required this.onEditTap,
    required this.onDeleteTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: _crossAxisSpacing,
          childAspectRatio: _aspectRatio,
          mainAxisExtent: 200,
          mainAxisSpacing: _mainAxisSpacing,
          crossAxisCount: _crossAxisCount),
      physics: const BouncingScrollPhysics(),
      itemCount: list.length,
      itemBuilder: (context, index) {
        var currentItem = list[index];
        return GestureDetector(
          child: Card(
            color: kOrange,
            elevation: 2,
            shape: const RoundedRectangleBorder(borderRadius: kBorderRadius),
            child: Container(
              decoration: const BoxDecoration(borderRadius: kBorderRadius),
              height: 100,
              width:
                  (size.width - ((_crossAxisCount - 1) * _crossAxisSpacing)) /
                      _crossAxisCount,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          child: const Icon(Icons.edit,
                              size: 20, color: Colors.white),
                          onTap: () => onEditTap(currentItem),
                        ),
                        GestureDetector(
                          child: const Icon(Icons.delete,
                              size: 20, color: Colors.white),
                          onTap: () => onDeleteTap(currentItem),
                        ),
                      ],
                    ),
                    Text('${currentItem.weight}KG',
                        style: kHomeTitleTextStyle.copyWith(
                            fontSize: 20, color: Colors.white)),
                    Text(
                      dateFormatter.format(DateTime.parse(currentItem.date)),
                      style: kRegularTextStyle.copyWith(
                        color: Colors.grey[50],
                        fontSize: 12,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
