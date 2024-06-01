import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'dart:math' as math;
import 'package:flutter_stripe/flutter_stripe.dart';

import 'package:uber_ride/domain/app_constants.dart';
import 'package:http/http.dart' as http;
import 'package:uber_ride/screens/map.dart';

class DashBoardScreen extends StatefulWidget {
  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  bool isSelected = false;

  TextEditingController latController = TextEditingController();
  TextEditingController lngController = TextEditingController();
  TextEditingController fromController = TextEditingController();
  TextEditingController toController = TextEditingController();
  TextEditingController fareController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 229, 121, 85),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset('assets/icons/ic_location.png'),
          const Text(
            'Uber Ride',
            style: TextStyle(fontSize: 40, color: Colors.white),
          ),
          const SizedBox(height: 30),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 5),
          //   child: Container(
          //     decoration: BoxDecoration(
          //         border: Border.all(color: Colors.black26),
          //         color: Colors.white,
          //         borderRadius: BorderRadius.circular(20)),
          //     child: Padding(
          //       padding: const EdgeInsets.symmetric(horizontal: 24),
          //       child: TextField(
          //         cursorColor: Color.fromARGB(255, 213, 129, 3),
          //         //*************** */
          //         decoration: InputDecoration(
          //           border: InputBorder.none,
          //           fillColor: Colors.white,
          //           labelText: 'Latitude',
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          //SizedBox(height: 20),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 5),
          //   child: Container(
          //     decoration: BoxDecoration(
          //         border: Border.all(color: Colors.black26),
          //         color: Colors.white,
          //         borderRadius: BorderRadius.circular(20)),
          //     child: Padding(
          //       padding: const EdgeInsets.symmetric(horizontal: 24),
          //       child: TextField(
          //         cursorColor: Color.fromARGB(255, 213, 129, 3),
          //         //************ */
          //         decoration: InputDecoration(
          //           border: InputBorder.none,
          //           fillColor: Colors.white,
          //           labelText: 'Longitude',
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          const SizedBox(height: 40),
          Container(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30))),
              onPressed: () {
                showModalBottomSheet(
                  backgroundColor: const Color.fromARGB(255, 40, 35, 35),
                  shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(10))),
                  context: context,
                  builder: (_) {
                    return Column(
                      children: [
                        Expanded(
                          child: Container(
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: AppConstants.rideCategory.length,
                                itemBuilder: ((_, index) {
                                  Map<String, dynamic> currItem =
                                      AppConstants.rideCategory[index];
                                  return Container(
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 78, 77, 77),
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 50),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 18.0, right: 18.0),
                                              child: ClipRRect(
                                                child: Image.asset(
                                                  currItem['imgPath'],
                                                  width: 100,
                                                  height: 60,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 7),
                                        Row(
                                          children: [
                                            Text(
                                              currItem["title"],
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                })),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black26),
                                  color: const Color.fromARGB(255, 99, 95, 95),
                                  borderRadius: BorderRadius.circular(20)),
                              child: // 'From' TextField
                                  Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => MapPage()
                                            //    LocationInputScreen(),
                                            ));
                                  },
                                  child: AbsorbPointer(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black26),
                                          color: const Color.fromARGB(
                                              255, 99, 95, 95),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        child: TextField(
                                          cursorColor: const Color.fromARGB(
                                              255, 213, 129, 3),
                                          controller: latController,
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            fillColor: Colors.white,
                                            labelText: 'From',
                                            labelStyle: TextStyle(
                                              color: Colors.white60,
                                              fontSize: 22,
                                            ),
                                            prefixIcon: Icon(
                                              Icons.location_on,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 17),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black26),
                                color: const Color.fromARGB(255, 99, 95, 95),
                                borderRadius: BorderRadius.circular(20)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: TextField(
                                cursorColor:
                                    const Color.fromARGB(255, 213, 129, 3),
                                controller: fareController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  fillColor: Colors.white,
                                  labelText: 'Offer your fare',
                                  labelStyle: const TextStyle(
                                    color: Colors.white60,
                                    fontSize: 22,
                                  ),
                                  prefixIcon: Image.asset(
                                    'assets/icons/ic_pkr.png',
                                    width: 40,
                                    color: Colors.white,
                                  ),
                                  suffixIcon: const Icon(
                                    Icons.money,
                                    color: Colors.green,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(22, 0, 0, 0),
                          child: Row(
                            children: [
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color.fromARGB(
                                          255, 213, 129, 3),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  onPressed: () {
                                    // Navigator.of(context).push(
                                    //     MaterialPageRoute(
                                    //         builder: (context) =>
                                    //             // NavigationScreen(
                                    //             //     latController.text,
                                    //             //     lngController.text

                                    //             //     )

                                    //                 ));
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 80, vertical: 18),
                                    child: Text(
                                      'Find a driver',
                                      style: TextStyle(fontSize: 22),
                                    ),
                                  )),
                              const SizedBox(width: 20),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color.fromARGB(
                                          255, 213, 129, 3),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  onPressed: () {},
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 18),
                                    child: Icon(
                                      Icons.route,
                                      size: 25,
                                    ),
                                  )),
                            ],
                          ),
                        ),
                        const SizedBox(height: 25)
                      ],
                    );
                  },
                );
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 120, vertical: 20),
                child: Text(
                  "Book your Ride",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),

          const SizedBox(
            height: 20,
          ),

          // Payment Method

          Container(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30))),
              onPressed: () {
                showModalBottomSheet(
                  backgroundColor: const Color.fromARGB(255, 40, 35, 35),
                  shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(10))),
                  context: context,
                  builder: (_) {
                    return Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'Payment Methods',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Expanded(
                          child: ListView(
                            children: [
                              ListTile(
                                leading: Container(
                                  width: 60,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0),
                                      color: Colors.white),
                                  child: Image.asset(
                                    'assets/icons/ic_easypaisa.png',
                                    width: 50,
                                    height: 50,
                                  ),
                                ),
                                title: const Text(
                                  'EasyPaisa',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                                subtitle: const Text(
                                  'Payment by Easypaisa after the ride',
                                  style: TextStyle(
                                      fontSize: 17, color: Colors.white38),
                                ),
                                trailing: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isSelected = !isSelected;
                                      print('isSelected: $isSelected');
                                    });
                                  },
                                  child: Container(
                                    width: 45.0,
                                    height: 45.0,
                                    decoration: BoxDecoration(
                                      color: isSelected
                                          ? const Color.fromARGB(
                                              255, 213, 129, 3)
                                          : Colors.white12,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  // Handle tap
                                },
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Divider(
                                color: Colors.white24,
                                thickness: 1.0,
                                indent: 16.0,
                                endIndent: 16.0,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              ListTile(
                                leading: Container(
                                  width: 60,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0),
                                      color: Colors.white),
                                  child: Image.asset(
                                    'assets/icons/ic_jazzcash.png',
                                    width: 50,
                                    height: 50,
                                  ),
                                ),
                                title: const Text(
                                  'JazzCash',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                                subtitle: const Text(
                                  'Payment by Jazzcash after the ride',
                                  style: TextStyle(
                                      fontSize: 17, color: Colors.white38),
                                ),
                                trailing: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isSelected = !isSelected;
                                      print('isSelected: $isSelected');
                                    });
                                  },
                                  child: Container(
                                    width: 45.0,
                                    height: 45.0,
                                    decoration: BoxDecoration(
                                      color: isSelected
                                          ? const Color.fromARGB(
                                              255, 213, 129, 3)
                                          : Colors.white12,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  // Handle tap
                                },
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Divider(
                                color: Colors.white24,
                                thickness: 1.0,
                                indent: 16.0,
                                endIndent: 16.0,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              ListTile(
                                leading: Container(
                                  width: 60,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0),
                                      color: Colors.white),
                                  child: Image.asset(
                                    'assets/icons/ic_rupees.png',
                                    width: 50,
                                    height: 50,
                                  ),
                                ),
                                title: const Text(
                                  'Cash',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                                trailing: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isSelected = !isSelected;
                                      print('isSelected: $isSelected');
                                    });
                                  },
                                  child: Container(
                                    width: 45.0,
                                    height: 45.0,
                                    decoration: BoxDecoration(
                                      color: isSelected
                                          ? const Color.fromARGB(
                                              255, 213, 129, 3)
                                          : Colors.white12,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  // Handle tap
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(22, 0, 0, 0),
                          child: Row(
                            children: [
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color.fromARGB(
                                          255, 213, 129, 3),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  onPressed: () {
                                    // Navigator.of(context).push(
                                    //     MaterialPageRoute(
                                    //         builder: (context) =>
                                    //             NavigationScreen(
                                    //                 latController.text,
                                    //                 lngController.text

                                    //                 )));
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 160, vertical: 18),
                                    child: Text(
                                      'Done',
                                      style: TextStyle(fontSize: 22),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                        const SizedBox(height: 105)
                      ],
                    );
                  },
                );
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 70, vertical: 20),
                child: Text(
                  "Select your Payment Method",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map<String, dynamic>? paymentIntent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 229, 121, 85),
        title: const Text('Stripe Payment'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 40, 35, 35),
                onPrimary: Colors.white,
                textStyle: TextStyle(fontSize: 20),
              ),
              child: const Text('Confirm Now'),
              onPressed: () async {
                await makePayment();
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> makePayment() async {
    try {
      paymentIntent = await createPaymentIntent('10000', 'USD');

      var gpay = PaymentSheetGooglePay(
          merchantCountryCode: "US", currencyCode: "USD", testEnv: true);

      //STEP 2: Initialize Payment Sheet
      await Stripe.instance
          .initPaymentSheet(
              paymentSheetParameters: SetupPaymentSheetParameters(
                  paymentIntentClientSecret: paymentIntent![
                      'client_secret'], //Gotten from payment intent
                  style: ThemeMode.light,
                  merchantDisplayName: 'Ammad',
                  googlePay: gpay))
          .then((value) {});

      //STEP 3: Display Payment sheet
      displayPaymentSheet();
    } catch (err) {
      print(err);
    }
  }

  displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet().then((value) {
        print("Payment Successfully");
      });
    } catch (e) {
      print('$e');
    }
  }

  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': amount,
        'currency': currency,
      };

      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization':
              'Bearer sk_test_51PMAmX06N6gtIqVLfpzHWB8uHUdTuN8gxxVrfBwOhKimZmVcd39Yh4T26HQFsNOImQp9kyV8ghpQOXROHSufdsK900tikEjkr1',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: body,
      );
      return json.decode(response.body);
    } catch (err) {
      throw Exception(err.toString());
    }
  }
}

class PaymentMethodScreen extends StatefulWidget {
  @override
  _PaymentMethodScreenState createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose Payment Method"),
        backgroundColor: Color.fromARGB(255, 229, 121, 85),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 40, 35, 35),
                onPrimary: Colors.white,
                textStyle: TextStyle(fontSize: 20),
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text("Cash Payment Selected"),
                    content: Text("You have chosen to pay with cash."),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text("OK"),
                      ),
                    ],
                  ),
                );
              },
              child: Text("Pay with Cash"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 213, 129, 3),
                onPrimary: Colors.white,
                textStyle: TextStyle(fontSize: 20),
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
              child: Text("Pay with Card"),
            ),
          ],
        ),
      ),
    );
  }
}
