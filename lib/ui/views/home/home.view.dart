import 'package:bridal_project/ui/shared/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class HomeView extends StatefulWidget {
  final Function showOptionsMenu;
  final Function showSwitchStoreModal;
  final String selectedStore;
  const HomeView({Key? key, required this.showOptionsMenu, required this.showSwitchStoreModal, required this.selectedStore}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
         Stack(
           clipBehavior: Clip.none,
          alignment: Alignment.center,
           children: [
             Container(
               height: MediaQuery.of(context).size.height * 0.4,
               decoration: const BoxDecoration(
                   borderRadius: BorderRadius.only(
                       bottomLeft: Radius.circular(70.0),
                       bottomRight: Radius.circular(70.0)
                   ),
                   image: DecorationImage(
                       image: AssetImage(kBridalLorenImage2),
                       fit: BoxFit.cover
                   )
               ),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.stretch,
                 children: [
                   Container(
                       padding:const EdgeInsets.symmetric(vertical: kScreenPadding + 5, horizontal: kScreenPadding),
                       alignment: Alignment.centerRight,
                       child:  IconButton(
                           onPressed: () {
                             widget.showOptionsMenu();
                           },
                           icon: const Icon(Icons.more_vert, size: kMoreVertIconSize, color: Colors.white)
                       )
                   ),
                 ],
               ),
             ),
             Positioned(
               bottom: -30.0,
               child: Container(
                   padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 38.0),
                   decoration: BoxDecoration(
                     borderRadius: const BorderRadius.all(Radius.circular(50.0)),
                     color: kAppPrimaryColor,
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
                   ),
                   child: const Text('STORE DETAILS',
                       style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 17.0,
                       )
                   )
               ),
             ),
           ],
         ),
         Expanded(
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               GestureDetector(
                   onTap: () {
                     widget.showSwitchStoreModal(true);
                   },
                   child: Text(widget.selectedStore.toUpperCase(), style: TextStyle(color: kAppPrimaryColor, fontSize: 28.0, fontWeight: FontWeight.w900))),
               const Text('NY, United States', style: TextStyle(fontSize: 16.0, color: Colors.grey)),
               const SizedBox(height: 15.0),
               const Text('+163-2456-7890', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0)),
               const SizedBox(height: 35.0),
               Container(
                   padding: const EdgeInsets.symmetric(horizontal: 80.0),
                   child: const Text('largest full service bridal salon in the nation',
                       textAlign: TextAlign.center,
                       style: TextStyle(color: Colors.grey)
                   )
               ),
               const SizedBox(height: 35.0),
             ],
           ),
         ),
      ],
    );
  }
}
