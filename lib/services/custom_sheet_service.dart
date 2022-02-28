import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

import '../constants/ui_helpers.dart';

class CustomSheetService {
  void showBottomSheet({required Widget sheet}) => Get.bottomSheet(
        sheet,
        backgroundColor: kWhite,
        isScrollControlled: false,
        shape: const RoundedRectangleBorder(borderRadius: kRoundedTopBorder),
      );
}
