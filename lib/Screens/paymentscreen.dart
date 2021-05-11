import 'dart:developer';

import 'package:farmtech/Services/sizeConfig.dart';
import 'package:farmtech/Widgets/loadingDialog.dart';
import 'package:flutter/material.dart';
import 'package:farmtech/global.dart' as global;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:line_icons/line_icons.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  Razorpay _razorpay;
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  bool upi = false;
  bool card = false;
  bool paytm = false;
  bool netbanking = false;
  String payment;

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(
      msg: "SUCCESS: Payment done ",
    );
    Navigator.pop(context);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    log(response.message.toString());
    Fluttertoast.showToast(
        msg: "ERROR: Payment Failed, Please Retry", timeInSecForIosWeb: 3);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: " + response.walletName, timeInSecForIosWeb: 3);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  void openCheckoutRazorpay(String method) async {
    double amt = 100.0 * 100;
    var options = {
      'key': 'rzp_test_3tLQHIWIJrioiZ', //'rzp_test_3tLQHIWIJrioiZ',
      'amount': amt,
      'name': 'Farmer Tech\'s',
      'description': 'Payment for item id : ft_232_rent',
      'prefill': {
        'contact': "9810910960",
        'email': 'sidhant702@gmail.com',
        'method': method
      },
      //'order_id': 'order_H0KrL8O0X61PEN',
    };
    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint(e);
    }
  }

  void intiatePayment(String method, String gateway) async {
    Dialogs.showLoadingDialog(context, _keyLoader);
    String temp = "success";
    if (temp == "success") {
      if (gateway == "RAZORPAY") {
        Navigator.pop(context);
        openCheckoutRazorpay(method);
      } else if (gateway == "PAYTM") {
        Navigator.pop(context);
        //openCheckoutPaytm();
      }
    } else {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Some erro occured. Please retry'),
          actions: <Widget>[
            FlatButton(
              child: Text('Retry'),
              onPressed: () {
                int count = 0;
                Navigator.popUntil(context, (route) {
                  return count++ == 2;
                });
              },
            )
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: Color(0xffDEF9EF),
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 70,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
          ),
        ),
        elevation: 10,
        title: Row(
          children: [
            Icon(
              LineIcons.store,
              size: 30,
              color: global.mainColor,
            ),
            SizedBox(width: 20),
            Text("Shop")
          ],
        ),
        actions: [
          Icon(
            Icons.search,
            color: Colors.grey[700],
            size: 30,
          ),
          SizedBox(width: 40),
        ],
      ),
      body: ListView(
        children: [
          Card(
            child: ListTile(
              title: Text(
                "BILL TOTAL",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: SizeConfig.safeBlockHorizontal * 4,
                  fontFamily: 'Circular Std',
                ),
              ),
              trailing: Text(
                '\u{20B9}' + "100",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: SizeConfig.safeBlockHorizontal * 4,
                  fontFamily: 'Circular Std',
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "SELECT PAYMENT METHOD",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey[600],
                fontSize: SizeConfig.safeBlockHorizontal * 4,
                fontFamily: 'Circular Std',
              ),
            ),
          ),
          Card(
            shape: upi
                ? RoundedRectangleBorder(
                    side: BorderSide(color: global.mainColor, width: 1.0),
                    borderRadius: BorderRadius.circular(4.0))
                : RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white, width: 1.0),
                    borderRadius: BorderRadius.circular(4.0)),
            child: Column(
              children: [
                ListTile(
                  leading: Image.asset("assets/upi.png", height: 20),
                  title: Text(
                    "UPI",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: SizeConfig.safeBlockHorizontal * 4,
                      fontFamily: 'Circular Std',
                    ),
                  ),
                  trailing: Radio(
                    value: "upi",
                    groupValue: payment,
                    onChanged: (String value) {
                      setState(() {
                        payment = value;
                        upi = true;
                        card = false;
                        netbanking = false;
                        paytm = false;
                      });
                    },
                  ),
                ),
                upi
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: double.infinity,
                          child: RaisedButton(
                            onPressed: () {
                              intiatePayment("upi", "RAZORPAY");
                            },
                            color: global.mainColor,
                            child: Text(
                              "Pay Via UPI",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: SizeConfig.safeBlockHorizontal * 4,
                                fontFamily: 'Circular Std',
                              ),
                            ),
                          ),
                        ),
                      )
                    : Container()
              ],
            ),
          ),
          Card(
            shape: card
                ? RoundedRectangleBorder(
                    side: BorderSide(color: global.mainColor, width: 1.0),
                    borderRadius: BorderRadius.circular(4.0))
                : RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white, width: 1.0),
                    borderRadius: BorderRadius.circular(4.0)),
            child: Column(
              children: [
                ListTile(
                  leading: Icon(LineIcons.creditCard),
                  title: Text(
                    "Card",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: SizeConfig.safeBlockHorizontal * 4,
                      fontFamily: 'Circular Std',
                    ),
                  ),
                  trailing: Radio(
                    value: "card",
                    groupValue: payment,
                    onChanged: (value) {
                      setState(() {
                        payment = value;
                        upi = false;
                        card = true;
                        netbanking = false;
                        paytm = false;
                      });
                    },
                  ),
                ),
                card
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: double.infinity,
                          child: RaisedButton(
                            onPressed: () {
                              intiatePayment("card", "RAZORPAY");
                            },
                            color: global.mainColor,
                            child: Text(
                              "Pay Via Card",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: SizeConfig.safeBlockHorizontal * 4,
                                fontFamily: 'Circular Std',
                              ),
                            ),
                          ),
                        ),
                      )
                    : Container()
              ],
            ),
          ),
          Card(
            shape: paytm
                ? RoundedRectangleBorder(
                    side: BorderSide(color: global.mainColor, width: 1.0),
                    borderRadius: BorderRadius.circular(4.0))
                : RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white, width: 1.0),
                    borderRadius: BorderRadius.circular(4.0)),
            child: Column(
              children: [
                ListTile(
                  leading: Image.asset("assets/paytm.png", height: 15),
                  title: Text(
                    "Paytm",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: SizeConfig.safeBlockHorizontal * 4,
                      fontFamily: 'Circular Std',
                    ),
                  ),
                  trailing: Radio(
                    value: "paytm",
                    groupValue: payment,
                    onChanged: (value) {
                      setState(() {
                        payment = value;
                        upi = false;
                        card = false;
                        netbanking = false;
                        paytm = true;
                      });
                    },
                  ),
                ),
                paytm
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: double.infinity,
                          child: RaisedButton(
                            onPressed: () {
                              //intiatePayment("paytm", "PAYTM");
                            },
                            color: global.mainColor,
                            child: Text(
                              "Pay Via Paytm",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: SizeConfig.safeBlockHorizontal * 4,
                                fontFamily: 'Circular Std',
                              ),
                            ),
                          ),
                        ),
                      )
                    : Container()
              ],
            ),
          ),
          Card(
            shape: netbanking
                ? RoundedRectangleBorder(
                    side: BorderSide(color: global.mainColor, width: 1.0),
                    borderRadius: BorderRadius.circular(4.0))
                : RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white, width: 1.0),
                    borderRadius: BorderRadius.circular(4.0)),
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.payments),
                  title: Text(
                    "NetBanking",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: SizeConfig.safeBlockHorizontal * 4,
                      fontFamily: 'Circular Std',
                    ),
                  ),
                  trailing: Radio(
                    value: "netbanking",
                    groupValue: payment,
                    onChanged: (value) {
                      setState(() {
                        payment = value;
                        upi = false;
                        card = false;
                        netbanking = true;
                        paytm = false;
                      });
                    },
                  ),
                ),
                netbanking
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: double.infinity,
                          child: RaisedButton(
                            onPressed: () {
                              intiatePayment("netbanking", "RAZORPAY");
                            },
                            color: global.mainColor,
                            child: Text(
                              "Pay Via NetBanking",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: SizeConfig.safeBlockHorizontal * 4,
                                fontFamily: 'Circular Std',
                              ),
                            ),
                          ),
                        ),
                      )
                    : Container()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
