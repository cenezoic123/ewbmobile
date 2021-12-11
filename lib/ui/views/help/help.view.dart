import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bridal_project/ui/shared/constants.dart';
import 'package:bridal_project/ui/shared/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HelpView extends StatefulWidget {
  final Function showOptionsMenu;
  const HelpView({Key? key, required this.showOptionsMenu}) : super(key: key);

  @override
  _HelpViewState createState() => _HelpViewState();
}

class _HelpViewState extends State<HelpView> {
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
    return  Container(
            padding:const EdgeInsets.symmetric(vertical: kScreenPadding + 5, horizontal: kScreenPadding),
            // color: const Color(0xFF595a5c),
            // color: Colors.black,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                    alignment: Alignment.centerRight,
                    child:  IconButton(
                        onPressed: () {
                          widget.showOptionsMenu();
                        },
                        icon: const Icon(Icons.more_vert, size: kMoreVertIconSize)
                    )
                ),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.all(0.0),
                    children: [
                      const SizedBox(height: 10.0),
                      Center(
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
                              const Text('Mobile Help', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
                              const SizedBox(height: 20.0),
                              const Text('Having trouble using the app?',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.grey)
                              ),
                              const Text('Read our user guide for better access',
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
                                  decoration: kMainTextFieldStyle.copyWith(
                                    hintText: 'Search Keywords',
                                  ),
                                  validator: (String? value) {
                                    return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
                                  },
                                ),
                              ),
                              const SizedBox(height: 30),
                              const Text('Navigation', style: TextStyle(fontWeight: FontWeight.w600)),
                              const SizedBox(height: 10),
                              const Text('This is sample text only for demo purposes and has no meaning',style: TextStyle(color: Colors.grey)),
                              const SizedBox(height: 30),
                              const Text('Account Access', style: TextStyle(fontWeight: FontWeight.w600)),
                              const SizedBox(height: 10),
                              const Text('This is sample text only for demo purposes and has no meaning', style: TextStyle(color: Colors.grey)),
                              const SizedBox(height: 50.0),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
  }
}
