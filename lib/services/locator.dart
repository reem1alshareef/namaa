import 'package:get_it/get_it.dart';
import 'package:stacked_services/stacked_services.dart';
//import 'package:gdsc_app/core/services/supabase_service.dart';
import 'supabase_service.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => SnackbarService());
  //locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => SupabaseService());
}