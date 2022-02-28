import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:weight_tracker/constants/ui_helpers.dart';
import 'package:weight_tracker/ui/home_view/home_viewmodel.dart';
import 'package:weight_tracker/ui/home_view/widgets/weight_data_grid.dart';
import 'package:weight_tracker/widgets/progress_indicators/orange_circular_progress_indicator.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 100,
          backgroundColor: Colors.white,
          elevation: 0,
          flexibleSpace: Container(
            padding: kMainPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpaceMedium,
                verticalSpaceRegular,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Weight\nTracker',
                      style: kHomeTitleTextStyle.copyWith(fontSize: 24),
                    ),
                    GestureDetector(
                        onTap: () => model.logout(context),
                        child: Text(
                          'LOGOUT',
                          style: kRegularTextStyle.copyWith(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          backgroundColor: kOrange,
          child: const Icon(Icons.add),
          onPressed: () => model.showSheet(),
        ),
        body: Padding(
          padding: kMainPadding,
          child: StreamBuilder(
            stream: model.weightStream,
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                var list = model.convertToWeightModel(snapshot.data!.docs);
                if (list.isEmpty) {
                  return Center(
                      child: Text('No data yet.',
                          style:
                              kRegularTextStyle.copyWith(color: Colors.grey)));
                } else {
                  return WeightDataGrid(
                    list: list,
                    onEditTap: (item) => model.showSheet(weightModel: item),
                    onDeleteTap: (item) => model.deleteEntry(context, item),
                  );
                }
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const OrangeCircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(
                    'Something went wrong',
                    style: kRegularTextStyle.copyWith(color: Colors.grey),
                  ),
                );
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
