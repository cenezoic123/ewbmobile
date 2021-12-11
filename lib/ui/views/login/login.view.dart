import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bridal_project/ui/shared/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'login.viewmodel.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final phoneController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
        viewModelBuilder: () => LoginViewModel(),
        builder: (context, homeModel, child) => Scaffold(
          body: Container(
            padding:const EdgeInsets.symmetric(vertical: kScreenPadding, horizontal: kScreenPadding),
            // color: const Color(0xFF595a5c),
            // color: Colors.black,
            child: Form(
              key: formKey,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                          child: Image.asset(kAppLogo, width: 100, height: 80)
                      ),
                      const SizedBox(height: 50.0),
                      const Text('Hi there!', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
                      const SizedBox(height: 20.0),
                      const Text('To start working with the app',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.grey)
                      ),
                      const Text('we need to verify your phone number.',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.grey)
                      ),
                      // const SizedBox(height: 30.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50.0,vertical: 20.0),
                        child: TextFormField(
                          controller: phoneController,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                            hintText: 'Your phone',
                            // labelText: 'Your phone',
                          ),
                          validator: (String? value) {
                            return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
                          },
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 70.0),
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
                              if (formKey.currentState!.validate()){
                                print(phoneController.text);
                                if(phoneController.text.toString() == '123456'){
                                  phoneController.clear();
                                  Navigator.pushNamed(context, '/main', arguments: {
                                    'isNew': true
                                  });
                                }
                                else{
                                  AwesomeDialog(
                                    context: context,
                                    headerAnimationLoop: false,
                                    padding: const EdgeInsets.symmetric(vertical: 60.0, horizontal: 30.0),
                                    dialogType: DialogType.NO_HEADER,
                                    // title: 'Opps!',
                                    body: Column(
                                      children: [
                                        const Text('Opps!', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
                                        const SizedBox(height: 30.0),
                                        const Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                                          child: Text("Sorry we can't verify your account to our system.",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(color: Colors.grey)),
                                        ),
                                        const Text('It seems you are not registered',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(color: Colors.grey)
                                        ),
                                        const SizedBox(height: 40.0),
                                        Container(
                                          decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                  color: kAppBoxShadowColor, offset: const Offset(0, 4), blurRadius: 5.0)
                                            ],
                                            // gradient: const LinearGradient(
                                            //   begin: Alignment.topLeft,
                                            //   end: Alignment.bottomRight,
                                            //   stops: [0.0, 1.0],
                                            //   colors: [
                                            //     Color(0xFFE36A01),
                                            //     Color(0xFFB05201)
                                            //   ],
                                            // ),
                                            // color: Colors.deepPurple.shade300,
                                            color: Colors.black,
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
                                              Navigator.pop(context);
                                            },
                                            child: const Padding(
                                              padding: EdgeInsets.symmetric(vertical: 10.0,
                                                horizontal: 18.0,
                                              ),
                                              child: Text(
                                                "Register on Web",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 15.0),
                                        Container(
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
                                              Navigator.pop(context);
                                            },
                                            child: const Padding(
                                              padding: EdgeInsets.symmetric(vertical: 10.0,
                                                horizontal: 23.0,
                                              ),
                                              child: Text(
                                                "Contact Store",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),

                                      ],
                                    ),
                                    // btnOkOnPress: () {
                                    //   debugPrint('OnClcik');
                                    // },
                                    btnOkIcon: Icons.check_circle,
                                  ).show();
                                }
                              }
                            },
                            child: const Padding(
                              padding: EdgeInsets.only(
                                top: 15.0,
                                bottom: 15.0,
                              ),
                              child: Text(
                                "VERIFY",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
    );
  }
}
