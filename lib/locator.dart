import 'package:bridal_project/ui/views/login/login.viewmodel.dart';
import 'package:bridal_project/ui/views/main/main.viewmodel.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator(){
  locator.registerFactory(() => LoginViewModel());
  locator.registerFactory(() => MainViewModel());
}
