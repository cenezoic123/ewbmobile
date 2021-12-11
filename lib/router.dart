import 'package:bridal_project/ui/views/login/login.view.dart';
import 'package:bridal_project/ui/views/main/main.view.dart';
import 'package:bridal_project/ui/views/splash/splash.view.dart';
import 'package:flutter/material.dart';

class Router{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case '/':
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginView());
      case '/main':
        dynamic data = settings.arguments;
        bool isNew = data['isNew'];
        return MaterialPageRoute(builder: (_) => MainView(isNew: isNew));
      default:
        return MaterialPageRoute(builder: (_) =>
            Scaffold(
                body: Center(
                    child: Text('Error 404: ${settings.name} not found!')
                )
            )
        );
    }
  }
}