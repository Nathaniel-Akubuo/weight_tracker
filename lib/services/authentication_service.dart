import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:weight_tracker/app/app.router.dart';
import 'package:weight_tracker/services/custom_snack_bar_service.dart';
import 'package:weight_tracker/services/dialog_service.dart';

import '../app/app.locator.dart';
import '../constants/ui_helpers.dart';

class AuthenticationService {
  final _auth = FirebaseAuth.instance;
  final _navigationService = locator<NavigationService>();
  final _dialogService = locator<CustomDialogService>();
  final _snackBarService = locator<CustomSnackBarService>();

  Future<void> signIn(context) async {
    try {
      final result = await _auth.signInAnonymously();
      if (result.user != null) {
        _navigationService.clearStackAndShow(Routes.homeView);
      }
    } on FirebaseAuthException catch (e) {
      _snackBarService.showErrorSnackBar(
          context: context, message: e.message ?? '');
    }
  }

  void logout(context) {
    _dialogService.showAlertDialog(
        context, 'LOGOUT', 'Are you sure you want to logout?', [
      TextButton(
        onPressed: () async {
          await _auth.signOut();
          _navigationService.clearStackAndShow(Routes.authView);
        },
        child: Text(
          'LOGOUT',
          style: kButtonTextStyle.copyWith(color: kRed),
        ),
      ),
      TextButton(
        onPressed: () => _navigationService.back(),
        child: Text('CANCEL', style: kButtonTextStyle),
      ),
    ]);
  }
}
