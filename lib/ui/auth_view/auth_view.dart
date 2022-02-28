import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:weight_tracker/constants/ui_helpers.dart';
import 'package:weight_tracker/ui/auth_view/auth_viewmodel.dart';
import 'package:weight_tracker/ui/home_view/widgets/blue_widget_custom_paint.dart';
import 'package:weight_tracker/ui/home_view/widgets/second_blue_widget_custom_paint.dart';
import 'package:weight_tracker/widgets/buttons/rounded_button.dart';

import '../home_view/widgets/red_widget_custom_paint.dart';

class AuthView extends StatelessWidget {
  const AuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        backgroundColor: kOrange,
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            CustomPaint(
              child: Container(),
              painter: BlueWidgetCustomPaint(),
            ),
            CustomPaint(
              child: Container(),
              painter: RedWidgetCustomPaint(),
            ),
            CustomPaint(
              child: Container(),
              painter: SecondBlueWidgetCustomPaint(),
            ),
            Padding(
              padding: kMainPadding,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 200,
                    child: Center(
                        child: Text('Weight\nTracker',
                            style: kHomeTitleTextStyle)),
                    decoration: const BoxDecoration(
                      color: kWhite,
                      shape: BoxShape.circle,
                    ),
                  ),
                  RoundedButton(
                    color: Colors.white,
                    isLoading: model.isBusy,
                    onPressed: () => model.signIn(context),
                    text: 'Sign in',
                  )
                ],
              ),
            )
          ],
        ),
      ),
      viewModelBuilder: () => AuthViewModel(),
    );
  }
}
