import 'package:flutter/material.dart';

import '../../constants/ui_helpers.dart';

class BlueCircularProgressIndicator extends StatelessWidget {
  const BlueCircularProgressIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation(kBlue),
      ),
    );
  }
}
