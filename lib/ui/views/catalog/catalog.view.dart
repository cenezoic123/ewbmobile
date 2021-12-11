import 'package:bridal_project/ui/shared/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lucide_icons/lucide_icons.dart';



class CatalogView extends StatefulWidget {
  final Function showOptionsMenu;
  const CatalogView({Key? key, required this.showOptionsMenu}) : super(key: key);

  @override
  _CatalogViewState createState() => _CatalogViewState();
}

class _CatalogViewState extends State<CatalogView> {

  final _formKey = GlobalKey<FormBuilderState>();


  //Sample Data
  List firstFilter = ['Long Sleeves', 'Long Sleeves 1', 'Long Sleeves 2'];
  List secondFilter = ['ABC BRIDAL SHOP','XYZ BRIDAL SHOP', 'RST BRIDAL SHOP'];
  List bridalImages = [
    {
      'id': 1,
      'image': 'bride_image1.jpg',
      'title': 'Rivine & Alaine',
      'subtitle': 'iconic gowns made everlasting',
      'price': '2,500',
      'isFavorite': true,
      'likes': 250,
    },
    {
      'id': 2,
      'image': 'bride_image2.jpg',
      'title': 'Rivine & Alaine 2',
      'subtitle': 'iconic gowns made everlasting 2',
      'price': '2,500',
      'isFavorite': true,
      'likes': 200,
    },
    {
      'id': 3,
      'image': 'bride_image3.jpg',
      'title': 'Rivine & Alaine 3',
      'subtitle': 'iconic gowns made everlasting 3',
      'price': '2,500',
      'isFavorite': true,
      'likes': 200,
    }
  ];

  dynamic selectedBridalInfo;

  bool _isFavorite = true;
  int _likes = 213;
  bool _showZoom = false;


  showCatalogFilterModal(){
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    AwesomeDialog(
      context: context,
      headerAnimationLoop: false,
      padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 30.0),
      dialogType: DialogType.NO_HEADER,
      body: FormBuilder(
        key: _formKey,
        child: Column(
          children: [
            const Text('Catalog Filter', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
            const SizedBox(height: 30.0),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text("Select category or vendor you want to filter",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey)),
            ),
            const SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: FormBuilderDropdown(
                name: 'filter1',
                decoration: const InputDecoration(
                  // labelText: 'Gender',
                  hintText: "Select",
                ),
                initialValue: firstFilter[0],
                allowClear: false,
                hint: const Text('Select'),
                items: firstFilter
                    .map((filter) => DropdownMenuItem(
                  value: filter,
                  child: Text('$filter'),
                ))
                    .toList(),
              ),
            ),
            const SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: FormBuilderDropdown(
                name: 'filter2',
                decoration: const InputDecoration(
                  // labelText: 'Gender',
                  hintText: "Select",
                ),
                initialValue: secondFilter[0],
                allowClear: false,
                hint: const Text('Select'),
                items: secondFilter
                    .map((filter) => DropdownMenuItem(
                  value: filter,
                  child: Text('$filter'),
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
                    horizontal: 25.0,
                  ),
                  child: Text(
                    "Filter View",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: screenHeight < 550 ? 10.0 : 30.0),
            const Text('CLEAR FILTER', style: TextStyle(fontWeight: FontWeight.w600)),
          ],
        ),
      ),
      // btnOkOnPress: () {
      //   debugPrint('OnClcik');
      // },
      btnOkIcon: Icons.check_circle,
    ).show();
  }



  @override
  Widget build(BuildContext context) {
    return _showZoom == false ? _buildCatalog() :  _buildDisplayZoom();
  }

  Widget _buildCatalog(){
    return Container(
      padding:const EdgeInsets.symmetric(vertical: kScreenPadding + 5, horizontal: kScreenPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Container(
                  alignment: Alignment.centerLeft,
                  child:  Row(
                    children: [
                      GestureDetector(
                        onTap: (){
                          },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(50.0)),
                            // color: Color(0xFFC6C4C5),
                            color: kAppIconBackground
                          ),
                          child: const FaIcon(FontAwesomeIcons.solidBell, size: 16.0),
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      GestureDetector(
                        onTap: (){
                          showCatalogFilterModal();
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(Radius.circular(50.0)),
                              // color: Color(0xFFC6C4C5),
                              color: kAppIconBackground
                            ),
                          child: Row(
                            children: const [
                              FaIcon(FontAwesomeIcons.filter, size: 14.0),
                              SizedBox(width: 10.0),
                              Text('FILTER')
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
              ),
              Expanded(
                child: Container(
                    alignment: Alignment.centerRight,
                    child:  IconButton(
                        onPressed: () {
                          widget.showOptionsMenu();
                        },
                        icon: const Icon(Icons.more_vert, size: kMoreVertIconSize)
                    )
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: kScreenPadding),
              itemCount: bridalImages.length,
              itemBuilder: (context, i) {
                return _buildCatalogItem(i);
              },
            )
          ),
        ],
      ),
    );
  }


  Widget _buildDisplayZoom(){
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/${selectedBridalInfo['image']}'),
                      fit: BoxFit.cover
                  )
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    padding:const EdgeInsets.symmetric(vertical: kScreenPadding + 5.0, horizontal: kScreenPadding),
                    child: Row(
                      children: [
                        Container(
                            alignment: Alignment.centerRight,
                            child:  IconButton(
                                onPressed: () {
                                  setState(() {
                                    _showZoom = false;
                                  });
                                },
                                icon: const Icon(Icons.close, size: 40.0, color: Colors.white)
                            )
                        ),
                        Expanded(
                          child: Container(
                              alignment: Alignment.centerRight,
                              child:  IconButton(
                                  onPressed: () {
                                    widget.showOptionsMenu();
                                  },
                                  icon: const Icon(Icons.more_vert, size: kMoreVertIconSize, color: Colors.white)
                              )
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: screenHeight < 550 ? -0.0 : screenHeight < 650 ? -10.0 : -20.0,
              child: Container(
                  width: screenWidth,
                  height: screenHeight * .43,
                  // padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 40.0),
                  decoration: BoxDecoration(
                    // color: const Color(0xFFF1FAF1).withOpacity(0.6),
                    color: const Color(0xFFFFFFFF).withOpacity(0.6),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0)
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 40.0,
                        top: 40.0,
                        child: SizedBox(
                          width: screenWidth  * 0.60,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(selectedBridalInfo['title'],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: kAppPrimaryColor,
                                    fontSize: 20.0,
                                  )
                              ),
                              const SizedBox(height: 5.0),
                              Text(selectedBridalInfo['subtitle']),
                              const SizedBox(height: 20.0),
                              Text("\$ ${selectedBridalInfo['price']}", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top:40.0,
                        right: 0.0,
                        child: Container(
                            width: 75,
                            height: 75,
                            // padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 40.0),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.9),
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(50.0),
                                  bottomLeft: Radius.circular(50.0)
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                GestureDetector(
                                    onTap: (){
                                      setState((){
                                        selectedBridalInfo["isFavorite"] = !selectedBridalInfo["isFavorite"];
                                        selectedBridalInfo["likes"] = selectedBridalInfo["isFavorite"] ? selectedBridalInfo["likes"] + 1 : selectedBridalInfo["likes"] - 1;
                                      });
                                    },
                                    child: Icon(Icons.favorite, color: selectedBridalInfo["isFavorite"] ? Colors.red : Colors.white, size: 30.0)),
                                const SizedBox(height: 5.0),
                                Text('${selectedBridalInfo["likes"]}', style: const TextStyle(fontSize: 12.0, color: Colors.white))
                              ],
                            )
                        ),
                      ),
                    ],
                  )
              ),
            ),
          ],
        ),
      ],
    );
  }


  Widget _buildCatalogItem(int bridalIndex){

    return Column(
      children: [
        Stack(
          children: [
            GestureDetector(
              onDoubleTap: (){
                setState(() {
                  _showZoom = true;
                  selectedBridalInfo = bridalImages[bridalIndex];
                });
              },
              child: AspectRatio(
                aspectRatio: 8/10,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                      boxShadow: [
                        BoxShadow(
                            color: kAppBoxShadowColor, offset: const Offset(0, 4), blurRadius: 5.0)
                      ],
                      image: DecorationImage(
                          image: AssetImage('assets/images/${bridalImages[bridalIndex]['image']}'),
                          fit: BoxFit.cover
                        // fit: BoxFit.cover
                      )
                  )
                ),
              ),
            ),
            Positioned(
              bottom: 10.0,
              left: 15.0,
              child: GestureDetector(
                  onTap: (){
                    setState(() {
                      _showZoom = true;
                      selectedBridalInfo = bridalImages[bridalIndex];
                    });
                  },
                  child: const Icon(LucideIcons.zoomIn, color: Colors.white)),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(bridalImages[bridalIndex]["title"], style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                  Container(alignment: Alignment.topRight,
                      child: GestureDetector(
                          onTap: (){
                            print("Is Favorite ${bridalImages[bridalIndex]["isFavorite"]}");
                            setState(() {
                              bridalImages[bridalIndex]["isFavorite"] = !bridalImages[bridalIndex]["isFavorite"];
                            });
                          },
                          child: Icon(Icons.favorite, color: bridalImages[bridalIndex]["isFavorite"] ? Colors.red : kAppIconBackground, size: 25.0)))
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(bridalImages[bridalIndex]["subtitle"]),
                      ],
                    ),
                  ),
                  const SizedBox(width: 60),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 40.0),
      ],
    );
  }
}
