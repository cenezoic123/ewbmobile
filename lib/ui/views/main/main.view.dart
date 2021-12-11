import 'package:after_layout/after_layout.dart';
import 'package:bridal_project/ui/shared/constants.dart';
import 'package:bridal_project/ui/views/main/main.viewmodel.dart';
import 'package:bridal_project/ui/views/catalog/catalog.view.dart';
import 'package:bridal_project/ui/views/help/help.view.dart';
import 'package:bridal_project/ui/views/home/home.view.dart';
import 'package:bridal_project/ui/views/profile/profile.view.dart';
import 'package:bridal_project/ui/views/receipt/receipt.view.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:stacked/stacked.dart';




class MainView extends StatefulWidget {
  final bool isNew;
  const MainView({Key? key, required this.isNew}) : super(key: key);

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> with AfterLayoutMixin<MainView>  {
  final _formKey = GlobalKey<FormBuilderState>();
  final _formKey2 = GlobalKey<FormBuilderState>();


  int _currentIndex = 0;
  late PageController _pageController;

  List storeOptions = ["ABC Bridal Shop", "Bridals by Lori", "AAA Bridal Shop"];
  List ticketOptions = ["TK-20-32-245", "TK-245-456-02", "TK-123-111-03"];
  String selectedTicketNo = 'TK-20-32-245';
  String selectedStore = "Bridals by Lori";


  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }


  showSwitchTicketModal(bool isDismissable){
    AwesomeDialog(
      context: context,
      headerAnimationLoop: false,
      dismissOnBackKeyPress: isDismissable,
      dismissOnTouchOutside: isDismissable,
      padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 30.0),
      dialogType: DialogType.NO_HEADER,
      body: FormBuilder(
        key: _formKey2,
        child: Column(
          children: [
            const Text('Ticket Number', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
            const SizedBox(height: 30.0),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text("Select ticket number you want to view",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey)),
            ),
            const SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: FormBuilderDropdown(
                name: 'ticket',
                decoration: const InputDecoration(
                  // labelText: 'Gender',
                  hintText: "Select Ticket",
                ),
                initialValue: selectedTicketNo,
                allowClear: false,
                hint: const Text('Select Ticket'),
                onChanged: (value){
                  setState(() {
                    selectedTicketNo = value.toString();
                  });
                },
                items: ticketOptions
                    .map((ticket) => DropdownMenuItem(
                  value: ticket,
                  child: Text('$ticket'),
                ))
                    .toList(),
              ),
            ),
            const SizedBox(height: 40.0),
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
                    "Submit",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
      // btnOkOnPress: () {
      //   debugPrint('OnClcik');
      // },
      btnOkIcon: Icons.check_circle,
    ).show();
  }


  showSwitchStoreModal(bool isDismissable){
    AwesomeDialog(
      context: context,
      dismissOnBackKeyPress: isDismissable,
      dismissOnTouchOutside: isDismissable,
      headerAnimationLoop: false,
      padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 30.0),
      dialogType: DialogType.NO_HEADER,
      // title: 'Opps!',
      body: FormBuilder(
        key: _formKey,
        child: Column(
          children: [
            const Text('Store Selector', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
            const SizedBox(height: 30.0),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text("Select bridal shop or store you want to view",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey)),
            ),
            const SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: FormBuilderDropdown(
                name: 'store',
                decoration: const InputDecoration(
                  // labelText: 'Gender',
                  hintText: "Select Store",
                ),
                initialValue: selectedStore,
                allowClear: false,
                onChanged: (value){
                  setState(() {
                    selectedStore = value.toString();
                  });
                },
                hint: const Text('Select Store'),
                items: storeOptions
                    .map((store) => DropdownMenuItem(
                  value: store,
                  child: Text('$store'),
                ))
                    .toList(),
              ),
            ),
            const SizedBox(height: 40.0),
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
                  showSwitchTicketModal(isDismissable);
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0,
                    horizontal: 23.0,
                  ),
                  child: Text(
                    "Continue",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
      // btnOkOnPress: () {
      //   debugPrint('OnClcik');
      // },
      btnOkIcon: Icons.check_circle,
    ).show();
  }



  showOptionsMenu(){
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(45.0),
                  topRight: Radius.circular(45.0)
              ),
              color: Colors.white,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(height: 20.0),
                const Text('Settings', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
                const SizedBox(height: 20.0),
                ListTile(
                  leading: const FaIcon(FontAwesomeIcons.solidUserCircle, size: 18.0, color: Colors.grey),
                  title: Text('Profile', style: TextStyle(color: kAppPrimaryColor)),
                  onTap: () {
                    setState(() => _currentIndex = 3);
                    _pageController.jumpToPage(3);
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const FaIcon(FontAwesomeIcons.storeAlt, size: 16.0, color: Colors.grey),
                  // leading: const Icon(Icons.store),
                  title: Text('Switch Store', style: TextStyle(color: kAppPrimaryColor)),
                  onTap: () {
                    Navigator.pop(context);
                    showSwitchStoreModal(true);
                  },
                ),
                ListTile(
                  leading: const FaIcon(FontAwesomeIcons.toggleOn, size: 18.0, color: Colors.grey),
                  title: Text('Dark/Light Theme', style: TextStyle(color: kAppPrimaryColor)),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  // leading: const Icon(Icons.help_outline),
                  leading: const FaIcon(FontAwesomeIcons.solidQuestionCircle, size: 18.0, color: Colors.grey),
                  title: Text('Help', style: TextStyle(color: kAppPrimaryColor)),
                  onTap: () {
                    setState(() => _currentIndex = 4);
                    _pageController.jumpToPage(4);
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const FaIcon(FontAwesomeIcons.powerOff, size: 18.0, color: Colors.grey),
                  title: Text('Sign Out', style: TextStyle(color: kAppPrimaryColor)),
                  onTap: () {
                    Navigator.pushNamed(context, "/login");
                  },
                ),
                const SizedBox(height: 20.0),
              ],
            ),
          );
        });
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: ViewModelBuilder<MainViewModel>.reactive(
          viewModelBuilder: () => MainViewModel(),
          builder: (context, homeModel, child) => Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
              color: kAppBackgroundColor,
              child: Stack(
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Container(
                  //   height: 70.0,
                  //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: const [
                  //       Icon(Icons.notifications, size: 28.0),
                  //       Icon(Icons.more_vert, size: 28.0)
                  //     ],
                  //   ),
                  // ),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    child: PageView(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: _pageController,
                      onPageChanged: (index) {
                        setState(() => _currentIndex = index);
                      },
                      children: <Widget>[
                        HomeView(showOptionsMenu: showOptionsMenu, showSwitchStoreModal: showSwitchStoreModal, selectedStore: selectedStore),
                        ReceiptView(showOptionsMenu: showOptionsMenu,
                            showSwitchTicketModal: showSwitchTicketModal,
                            selectedTicketNo: selectedTicketNo),
                        CatalogView(showOptionsMenu: showOptionsMenu),
                        ProfileView(showOptionsMenu: showOptionsMenu),
                        HelpView(showOptionsMenu: showOptionsMenu)
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: -5.0,
                    child: Container(
                      height: 85.0,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(45.0),
                          topRight: Radius.circular(45.0)
                        ),
                        color: Colors.black,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                              onPressed: () {
                                setState(() => _currentIndex = 0);
                                _pageController.jumpToPage(0);
                              },
                              icon: Icon(LucideIcons.home, size: 28.0, color: _currentIndex == 0 ?
                                kAppPrimaryColor : Colors.white
                              )
                          ),
                          IconButton(
                              onPressed: () {
                                setState(() => _currentIndex = 1);
                                _pageController.jumpToPage(1);
                              },
                              // icon: FaIcon(FontAwesomeIcons.clipboardList, size: 28.0,
                              //     color: _currentIndex == 1 ? kAppPrimaryColor : Colors.white
                              // )
                              icon: Icon(LucideIcons.clipboardList, size: 28.0, color: _currentIndex == 1 ?
                              kAppPrimaryColor : Colors.white)
                          ),
                          IconButton(
                              onPressed: () {
                                setState(() => _currentIndex = 2);
                                _pageController.jumpToPage(2);
                              },
                              icon: Icon(LucideIcons.tag, size: 28.0, color: _currentIndex == 2 ?
                              kAppPrimaryColor : Colors.white)
                          ),
                          IconButton(
                              onPressed: () {
                                setState(() => _currentIndex = 3);
                                _pageController.jumpToPage(3);
                              },
                              icon: Icon(LucideIcons.contact, size: 28.0, color: _currentIndex == 3 ?
                              kAppPrimaryColor : Colors.white)
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
      ),
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    if(widget.isNew){
      showSwitchStoreModal(false);
    }
  }
}
