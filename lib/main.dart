import 'package:bridal_project/locator.dart';
import 'package:flutter/material.dart';
import 'package:bridal_project/router.dart' as AppRouter;
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  setupLocator();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Every Where Bridal',
      theme: ThemeData(fontFamily: 'Poppins'),
      // theme: ThemeData(
      //   scaffoldBackgroundColor: Colors.white, colorScheme: ColorScheme.fromSwatch().copyWith(
      //     secondary: kAppPrimaryColor),
      // ),
      initialRoute: '/',
      onGenerateRoute: AppRouter.Router.generateRoute,
    );
  }
}

