import 'package:bridal_project/ui/shared/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';



class ProfileView extends StatefulWidget {
  final Function showOptionsMenu;
  const ProfileView({Key? key, required this.showOptionsMenu}) : super(key: key);

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.4,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(70.0),
                  bottomRight: Radius.circular(70.0)
              ),
              image: DecorationImage(
                  image: AssetImage(kBridalLorenImage),
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
                      icon: const Icon(Icons.more_vert, size: kMoreVertIconSize)
                  )
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(FontAwesomeIcons.solidUserCircle, size: 55.0, color: kAppSecondaryIconColor),
              // const Icon(Icons.account_circle, size: 60.0, color: Colors.grey),
              const SizedBox(height: 20.0),
              Text('Thomas Rhett', style: TextStyle(color: kAppPrimaryColor, fontSize: 28.0, fontWeight: FontWeight.w900)),
              const SizedBox(height: 5.0),
              const Text('thomasrett@gmail.com', style: TextStyle(color: Colors.grey)),
              const Text('+163-200-3848', style: TextStyle(color: Colors.grey)),
              const SizedBox(height: 50.0),
            ],
          ),
        ),
      ],
    );
  }
}
