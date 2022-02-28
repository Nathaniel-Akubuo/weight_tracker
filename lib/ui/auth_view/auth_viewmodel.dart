import 'package:stacked/stacked.dart';

import '../../app/app.locator.dart';
import '../../services/authentication_service.dart';

class AuthViewModel extends BaseViewModel {
  final _authService = locator<AuthenticationService>();

  Future<void> signIn(context) async {
    setBusy(true);
    await _authService.signIn(context);
    setBusy(false);
  }
}
