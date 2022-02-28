import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:weight_tracker/app/app.locator.dart';
import 'package:weight_tracker/models/weight_model.dart';
import 'package:weight_tracker/services/authentication_service.dart';
import 'package:weight_tracker/services/custom_sheet_service.dart';
import 'package:weight_tracker/services/dialog_service.dart';
import 'package:weight_tracker/services/firestore_service.dart';
import 'package:weight_tracker/ui/home_view/widgets/bottom_sheet.dart';

import '../../constants/ui_helpers.dart';

class HomeViewModel extends BaseViewModel {
  final _fireStoreService = locator<FireStoreService>();
  final _sheetService = locator<CustomSheetService>();
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthenticationService>();
  final _dialogService = locator<CustomDialogService>();

  String weight = '';

  Stream<QuerySnapshot> get weightStream => _fireStoreService.weightStream;

  List<WeightModel> convertToWeightModel(List<QueryDocumentSnapshot> list) {
    List<WeightModel> weightList = [];
    for (var item in list) {
      var value = WeightModel.fromMap(item.data() as Map<String, dynamic>);
      weightList.add(value);
    }
    return weightList;
  }

  void showSheet({WeightModel? weightModel}) => _sheetService.showBottomSheet(
      sheet: AddWeightEntrySheet(weightModel: weightModel));

  void addEntry() {
    var weightModel = WeightModel(
      weight: weight,
      date: DateTime.now().toString(),
      id: '',
    );
    _fireStoreService.addWeightEntry(weightModel);
    _navigationService.back();
  }

  void deleteEntry(context, WeightModel weightModel) {
    _dialogService.showAlertDialog(
        context, 'DELETE?', 'Do you want to delete this entry?', [
      TextButton(
        onPressed: () {
          _fireStoreService.deleteEntry(weightModel);
          _navigationService.back();
        },
        child: Text(
          'OK',
          style: kButtonTextStyle.copyWith(color: kRed),
        ),
      ),
      TextButton(
        onPressed: () => _navigationService.back(),
        child: Text('CANCEL', style: kButtonTextStyle),
      ),
    ]);
  }

  void editEntry(WeightModel weightModel) {
    var newWeightModel = WeightModel(
      weight: weight,
      date: weightModel.date,
      id: weightModel.id,
    );
    _fireStoreService.editEntry(newWeightModel);
    _navigationService.back();
  }

  Future<void> logout(context) async => _authService.logout(context);
}
