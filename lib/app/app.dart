import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:weight_tracker/services/authentication_service.dart';
import 'package:weight_tracker/services/custom_sheet_service.dart';
import 'package:weight_tracker/services/custom_snack_bar_service.dart';
import 'package:weight_tracker/services/dialog_service.dart';
import 'package:weight_tracker/services/firestore_service.dart';
import 'package:weight_tracker/ui/auth_view/auth_view.dart';
import 'package:weight_tracker/ui/home_view/home_view.dart';

@StackedApp(routes: [
  MaterialRoute(page: AuthView),
  MaterialRoute(page: HomeView),
], dependencies: [
  LazySingleton(classType: NavigationService),
  LazySingleton(classType: AuthenticationService),
  LazySingleton(classType: FireStoreService),
  LazySingleton(classType: CustomDialogService),
  LazySingleton(classType: CustomSheetService),
  LazySingleton(classType: CustomSnackBarService),
])
class AppSetup {}
