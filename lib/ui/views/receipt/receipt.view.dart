import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bridal_project/ui/shared/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';



class ReceiptView extends StatefulWidget {
  final Function showOptionsMenu;
  final Function showSwitchTicketModal;
  final String selectedTicketNo;

  const ReceiptView({Key? key, required this.showOptionsMenu, required this.showSwitchTicketModal, required this.selectedTicketNo})
      : super(key: key);

  @override
  _ReceiptViewState createState() => _ReceiptViewState();
}

class _ReceiptViewState extends State<ReceiptView> {

  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  bool useGlassMorphism = false;
  bool useBackgroundImage = false;
  OutlineInputBorder? border;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool showPayment = false;


  @override
  void initState() {
    border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey.withOpacity(0.7),
        width: 2.0,
      ),
    );
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return showPayment == false ? Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding:const EdgeInsets.only(top: kScreenPadding + 5, left: kScreenPadding, right: kScreenPadding, bottom: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Container(
                      alignment: Alignment.centerLeft,
                      child:  GestureDetector(
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
                      )
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                          padding: const EdgeInsets.all(0.0),
                          onPressed: () {
                            widget.showOptionsMenu();
                          },
                          icon: const Icon(Icons.more_vert, size: kMoreVertIconSize)
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5.0),
              const Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text('Ticket Details', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
              ),
              const SizedBox(height: 45.0),
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(25)),
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
                      // color: kAppPrimaryColor,
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 20.0),
                        const Text('Eddie Allen', style: TextStyle(fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.w600)),
                        // const SizedBox(height: 2.0),
                        RichText(text: const TextSpan(
                            style: TextStyle(color: Colors.white),
                            children: <TextSpan>[
                              TextSpan(text: 'Event Date: ', style: TextStyle(fontFamily: 'Poppins', fontSize: 12.0)),
                              TextSpan(text: '11.04.2021', style: TextStyle(fontFamily: 'Poppins', fontSize: 12.0, fontWeight: FontWeight.bold))
                            ]
                        )
                        ),
                        const SizedBox(height: 20.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                const Text('Ticket Number', style: TextStyle(color: Colors.white, fontSize: 11.0)),
                                GestureDetector(
                                    onTap: (){
                                      widget.showSwitchTicketModal(true);
                                    },
                                    child: Text(widget.selectedTicketNo, style: const TextStyle(fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.w600)))
                              ],
                            ),
                            Column(
                              children: [
                                const Text('Available Balance', style: TextStyle(color: Colors.white, fontSize: 11.0)),
                                Row(
                                  children: const [
                                    Text('USD', style: TextStyle(color: Colors.white, fontSize: 11.0)),
                                    SizedBox(width: 5.0),
                                    Text('3, 260.00', style: TextStyle(fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.w600))
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                      top: -45.0,
                      child: Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(50.0)),
                          border: Border.all(width: 5.0, color: Colors.white),
                          color: Colors.green,
                            image: const DecorationImage(image: AssetImage(kBridalLorenImage),
                                fit: BoxFit.cover
                            )
                        ),
                      )),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: kScreenPadding),
            children: [
              const SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text('Sales', style: TextStyle(color: kAppPrimaryColor, fontSize: 16.0, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 15.0),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 25.0),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(25)),
                  boxShadow: [
                    BoxShadow(
                        color: kAppBoxShadowColor, offset: const Offset(0, 4), blurRadius: 5.0)
                  ],
                  color: Colors.white,
                ),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildSalesDetails(
                        style: "Amanda",
                        description: "Rivini 324 Long Dress",
                        isCancelled: true,
                        isLastItem: false
                    ),
                    _buildSalesDetails(
                        style: "Alteration Services",
                        description: "Long Chiffon Gown",
                        isCancelled: false,
                        isLastItem: true
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15.0),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text('Event Member List', style: TextStyle(color: kAppPrimaryColor, fontSize: 16.0, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 15.0),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 25.0),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(25)),
                  boxShadow: [
                    BoxShadow(
                        color: kAppBoxShadowColor, offset: const Offset(0, 4), blurRadius: 5.0)
                  ],
                  color: Colors.white,
                ),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildEventMemberList()
                  ],
                ),
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
                      setState(() {
                        showPayment = true;
                      });
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(
                        top: 15.0,
                        bottom: 15.0,
                      ),
                      child: Text(
                        "Payment",
                        style: TextStyle(
                          // fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 100.0),
            ],
          ),
        ),
      ],
    ) : _buildPaymentGateWay();
  }


  Widget _buildPaymentGateWay(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding:const EdgeInsets.only(top: kScreenPadding + 5, left: 10.0, right: 10.0, bottom: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Container(
                      padding: const EdgeInsets.only(left: 10.0),
                      alignment: Alignment.centerLeft,
                      child:  GestureDetector(
                        onTap: (){
                          setState(() {
                            showPayment = false;
                          });
                        },
                        child: const Icon(Icons.close, size: 30.0, color: Colors.black),
                      )
                  ),
                ],
              ),
              CreditCardWidget(
                glassmorphismConfig:
                useGlassMorphism ? Glassmorphism.defaultConfig() : null,
                cardNumber: cardNumber,
                expiryDate: expiryDate,
                cardHolderName: cardHolderName,
                cvvCode: cvvCode,
                showBackView: isCvvFocused,
                obscureCardNumber: true,
                obscureCardCvv: true,
                isHolderNameVisible: true,
                cardBgColor: kAppPrimaryColor,
                backgroundImage:
                useBackgroundImage ? 'assets/card_bg.png' : null,
                isSwipeGestureEnabled: true,
                onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {},
                customCardTypeIcons: <CustomCardTypeIcon>[
                  CustomCardTypeIcon(
                    cardType: CardType.mastercard,
                    cardImage: Image.asset(
                      'assets/mastercard.png',
                      height: 48,
                      width: 48,
                    ),
                  ),
                ],
              ),
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CreditCardForm(
                      formKey: formKey,
                      obscureCvv: true,
                      obscureNumber: true,
                      cardNumber: cardNumber,
                      cvvCode: cvvCode,
                      isHolderNameVisible: true,
                      isCardNumberVisible: true,
                      isExpiryDateVisible: true,
                      cardHolderName: cardHolderName,
                      expiryDate: expiryDate,
                      themeColor: Colors.blue,
                      textColor: Colors.black,
                      cardNumberDecoration: InputDecoration(
                        labelText: 'Number',
                        hintText: 'XXXX XXXX XXXX XXXX',
                        hintStyle: const TextStyle(color: Colors.black),
                        labelStyle: const TextStyle(color: Colors.black),
                        focusedBorder: border,
                        enabledBorder: border,
                      ),
                      expiryDateDecoration: InputDecoration(
                        hintStyle: const TextStyle(color: Colors.black),
                        labelStyle: const TextStyle(color: Colors.black),
                        focusedBorder: border,
                        enabledBorder: border,
                        labelText: 'Expired Date',
                        hintText: 'XX/XX',
                      ),
                      cvvCodeDecoration: InputDecoration(
                        hintStyle: const TextStyle(color: Colors.black),
                        labelStyle: const TextStyle(color: Colors.black),
                        focusedBorder: border,
                        enabledBorder: border,
                        labelText: 'CVV',
                        hintText: 'XXX',
                      ),
                      cardHolderDecoration: InputDecoration(
                        hintStyle: const TextStyle(color: Colors.black),
                        labelStyle: const TextStyle(color: Colors.black),
                        focusedBorder: border,
                        enabledBorder: border,
                        labelText: 'Card Holder',
                      ),
                      onCreditCardModelChange: onCreditCardModelChange,
                    ),
                    const SizedBox(height: 10.0),
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
                            setState(() {
                              showPayment = false;
                              cardNumber = '';
                              expiryDate = '';
                              cardHolderName = '';
                              cvvCode = '';
                            });
                          },
                          child: const Padding(
                            padding: EdgeInsets.only(
                              top: 15.0,
                              bottom: 15.0,
                            ),
                            child: Text(
                              "Pay Now",
                              style: TextStyle(
                                // fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 60.0),
                  ],
                ),
              ),


            ],
          ),
        ),
      ],
    );
  }

  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    setState(() {
      cardNumber = creditCardModel!.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName.toUpperCase();
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}


Widget _buildSalesDetails({required String style, required String description,
  required bool isCancelled, required bool isLastItem}){
  return Column(
    children: [
      Row(
        children: [
          const Text('Store Style',
              style: TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(width:17.0),
          const Text(":", style: TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(width: 10.0),
          Flexible(child: Text(style, style: const TextStyle(fontWeight: FontWeight.w600)))
        ],
      ),
      Row(
        children: [
          const Text('Description',
              style: TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(width:  12.0),
          const Text(":", style: TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(width: 10.0),
          Flexible(child: Text(description))
        ],
      ),
      const SizedBox(height: 10.0),
      Row(
        children: [
          Container(
            padding: EdgeInsets.only(top: 1.0, bottom: 1.0, left: 1.0, right: isCancelled ? 25.0 : 35.0),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              color: Color(0xFFEFEDEE),
            ),
            child: Row(
              children: [
                Icon(isCancelled ? Icons.cancel : Icons.check_circle,
                    color: isCancelled ? Colors.red : Colors.green, size: 30.0),
                const SizedBox(width: 12.0),
                Text(isCancelled ? 'Cancelled' : 'Ordered',
                    style: TextStyle(color: isCancelled ? Colors.red : Colors.green, fontWeight: FontWeight.w600))
              ],
            ),
          ),
        ],
      ),
      SizedBox(height: !isLastItem ? 20.0 : 0.0),
    ],
  );
}

Widget _buildEventMemberList(){
  List sampleData = [
    {
      'role': 'Maid of Honor',
      'name': 'Susi Smith',
      'spent': '1,091.00',
      'balance': '1,040.00'
    },
    {
      'role': 'Father Bride',
      'name': 'Justin Rom Smith',
      'spent': '891.00',
      'balance': '1,340.00'
    },
    {
      'role': 'Bridesmaids',
      'name': 'Betty Holland Joey',
      'spent': '248.00',
      'balance': '830.00'
    }
  ];

  return ListView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    padding: const EdgeInsets.all(0.0),
    itemCount: sampleData.length,
    itemBuilder: (context, i) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
           children: [
             Icon(Icons.circle, color: kAppPrimaryColor, size: 12.0),
             const SizedBox(width: 5.0),
             Text(sampleData[i]["role"]),
             const SizedBox(width: 5),
             const Text(":"),
             const SizedBox(width: 5),
             Flexible(child: Text(sampleData[i]["name"], style: const TextStyle(fontWeight: FontWeight.w600))),
           ],
          ),

          Container(
            padding: const EdgeInsets.only(left: 10.0, top: 15.0, bottom: 15.0),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 10.0),
                      decoration: const BoxDecoration(
                       borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        color: Color(0xFFEFEDEE),
                      ),
                      child: Text('*  ' + sampleData[i]["spent"].toString(), style: const TextStyle(fontWeight: FontWeight.w600))
                    ),
                    const Text('SPENT', style: TextStyle(fontSize: 10.0))
                  ],
                ),
                const SizedBox(width: 20.0),
                Column(
                  children: [
                    Container(
                        padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 10.0),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          color: Color(0xFFFFDFD2),
                        ),
                        child: Text('*  ' + sampleData[i]["balance"].toString(), style: const TextStyle(color: Colors.red, fontWeight: FontWeight.w600))
                    ),
                    const Text('BALANCE', style: TextStyle(fontSize: 10.0))
                  ],
                ),
              ],
            ),
          ),
        ],
      );
    },
  );
}




class EventDetails{






}