import 'dart:async';

import 'package:bridal_project/ui/shared/constants.dart';
import 'package:bridal_project/ui/views/splash/splash.viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  void startTimer() {
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, "/login");
    });
  }


  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashScreenModel>.reactive(
        viewModelBuilder: () => SplashScreenModel(),
        builder: (context, model, child) => Scaffold(
          body: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
            width:double.infinity,
            // color: Colors.black,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: Image.asset(kAppLogo, width: 50, height: 30))),
                const SizedBox(height: 5),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: const Text(
                    'Stop waking up in the middle of the night wondering if some detail is forgotten',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey)
                  )
                ),

                const SizedBox(height: 40.0),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.15),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: kAppBoxShadowColor, offset: const Offset(0, 4), blurRadius: 5.0)
                      ],
                      gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        stops: const [0.0, 1.0],
                        colors: [
                          kAppGradientColor,
                          kAppPrimaryColor,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        minimumSize: MaterialStateProperty.all(Size(50.0, 20.0)),
                        backgroundColor:
                        MaterialStateProperty.all(Colors.transparent),
                        // elevation: MaterialStateProperty.all(3),
                        shadowColor:
                        MaterialStateProperty.all(Colors.transparent),
                      ),
                      onPressed: () {
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(
                          top: 15.0,
                          bottom: 15.0,
                        ),
                        child: Text(
                          "Getting Started",
                          style: TextStyle(
                            // fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 50.0),
                SpinKitThreeBounce(
                  color: kLoadingIndicatorColor,
                  size: 25.0,
                  duration: const Duration(milliseconds: 2000)
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        )
    );
  }
}
