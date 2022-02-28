import 'package:flutter/material.dart';

import '../../constants/ui_helpers.dart';

class OrangeCircularProgressIndicator extends StatelessWidget {
  const OrangeCircularProgressIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation(kOrange),
      ),
    );
  }
}
